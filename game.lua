local sprite = require "sprite"
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local image, enemy, enemy2, pers, pontuacao, hp, life = 3, stageClear, font, controller
local timestage = 60

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


function scene:createScene( event )
	local screenGroup = self.view
	
	if "Win" == system.getInfo( "platformName" ) then
    font = "Caesar Dressing"
else 
    font = "CaesarDressing-Regular"
	end
	
	storyboard.purgeScene("home")
storyboard.purgeScene("gameOver")



image = display.newImage("bg.png",true)
image.x = display.contentWidth /2
image.y = display.contentHeight / 2
screenGroup:insert( image )

hp = display.newImage("NinjaFull.png")
screenGroup:insert( hp) 
 
local sheetDataEnemy = { width=39, height=119, numFrames=3}
local sheetEnemy1 = graphics.newImageSheet ("Enemy1Sprite.png", sheetDataEnemy)

local sheetDataEnemy2 = { width=70, height=140, numFrames=5}
local sheetEnemy2 = graphics.newImageSheet ("Enemy1Down.png", sheetDataEnemy2)

local sheetDataEnemy1HitLeft = { width= 50, height=120, numFrames=3}
local sheetEnemy1HitLeft = graphics.newImageSheet ("Enemy1HitLeft.png", sheetDataEnemy1HitLeft)

local sheetDataEnemy1HitRight = { width= 50, height=120, numFrames=3}
local sheetEnemy1HitRight = graphics.newImageSheet ("Enemy1HitRight.png", sheetDataEnemy1HitRight)

local sequenceData2 = {
                { name="walk", sheet=sheetEnemy1, start=1, count=3, time=2500, loopCount=0 },
                { name="down", sheet=sheetEnemy2, start=1, count=5, time=500, loopCount=1 },
				{ name="hitleft", sheet= sheetEnemy1HitLeft, start=1, count=3, time=500, loopCount=1 },
				{ name="hitright", sheet= sheetEnemy1HitRight, start=1, count=3, time=500, loopCount=1 }
					  }
				
local sheetDataEnemyStrong = { width=39, height=119, numFrames=3}
local sheetEnemyStrong = graphics.newImageSheet ("Enemy2Sprite.png", sheetDataEnemyStrong)

local sheetDataEnemyStrong1 = { width=70, height=140, numFrames=5}
local sheetEnemyStrong2 = graphics.newImageSheet ("Enemy2Down.png", sheetDataEnemyStrong1)

local sheetDataEnemy2HitLeft = { width= 50, height=120, numFrames=3}
local sheetEnemy2HitLeft = graphics.newImageSheet ("Enemy2HitLeft.png", sheetDataEnemy2HitLeft)

local sheetDataEnemy2HitRight = { width= 50, height=120, numFrames=3}
local sheetEnemy2HitRight = graphics.newImageSheet ("Enemy2HitRight.png", sheetDataEnemy2HitRight)

local sequenceDataStrong = {
                { name="walk", sheet=sheetEnemyStrong, start=1, count=3, time=2500, loopCount=0 },
                { name="down", sheet=sheetEnemyStrong2, start=1, count=5, time=500, loopCount=1 },
				{ name="hitleft", sheet= sheetEnemy2HitLeft, start=1, count=3, time=500, loopCount=1 },
				{ name="hitright", sheet= sheetEnemy2HitRight, start=1, count=3, time=500, loopCount=1 }
                           }



local sheetData1 = { width=81, height=120, numFrames=3 }
local sheet1 = graphics.newImageSheet( "Ninja.png", sheetData1 )


local sheetData2 = { width=87, height=104, numFrames=3 }
local sheet2 = graphics.newImageSheet( "NinjaPunch.png", sheetData2 )

local sheetData3 = { width=78, height=111, numFrames=3 }
local sheet3 = graphics.newImageSheet( "NinjaRight.png", sheetData3 )


local sheetData4 = { width=87, height=104, numFrames=3 }
local sheet4 = graphics.newImageSheet( "NinjaPunchRight.png", sheetData4 )


local sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=3, time=2500, loopCount=0 },
                { name="seq2", sheet=sheet2, start=1, count=3, time=500, loopCount=0 },
				{ name="seq3", sheet=sheet3, start=1, count=3, time=2500, loopCount=0 },
				{ name="seq4", sheet=sheet4, start=1, count=3, time=500, loopCount=0 }
                }
 pers = display.newSprite(sheet1, sequenceData)
 pers.hp = 3
pers.x = display.contentWidth/2 + 128
pers.y = display.contentHeight/2
pers:play()
	screenGroup:insert( pers )

 enemy = display.newSprite(sheetEnemy1,sequenceData2)
enemy.hp =3
enemy.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
enemy.y = math.random(enemy.height/2, display.contentHeight - enemy.height)
enemy.cd = 5
enemy:play()
	screenGroup:insert( enemy )
	
	 enemy2 = display.newSprite(sheetEnemyStrong,sequenceDataStrong)
enemy2.x =  math.random(enemy2.width/2, display.contentWidth - enemy2.width)
enemy2.y = math.random(enemy2.height/2, display.contentHeight - enemy2.height)
enemy2.hp = 4
enemy2.cd = 5
enemy2:play()
screenGroup:insert( enemy2 )

	
end



function scene:enterScene( event )
local screenGroup = self.view

pers.isVisible = true
enemy.isVisible = true
enemy2.isVisible = true
timestage = 60


local score = 0 
 pontuacao = display.newText(score, display.contentWidth-10, 0, font,36)
pontuacao:setTextColor(255,255,255)
screenGroup:insert( pontuacao )

	 stageClear = display.newImage("StageClear.png",true)
stageClear.x = display.contentWidth /2
stageClear.y = display.contentHeight / 2
stageClear.isVisible = false
screenGroup:insert( stageClear )



	
	local function restartEnemy ()
	enemy.hp =3
	enemy.cd = 5
	enemy.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
	enemy.y = math.random(enemy.height/2, display.contentHeight - enemy.height)
	end
	
		local function restartEnemy2 ()
	enemy2.hp =4
	enemy2.cd = 5
	enemy2.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
	enemy2.y = math.random(enemy.height/2, display.contentHeight - enemy.height)
	end
	
local function punch()
        pers:setSequence( "seq2" )
        pers:play()
end
local function walk()
        pers:setSequence( "seq1" )
        pers:play()
end

local function punch2()
        pers:setSequence( "seq4" )
        pers:play()
end
local function walk2()
        pers:setSequence( "seq3" )
        pers:play()
end

local function walkEnemy()
        enemy:setSequence( "walk" )
        enemy:play()
		restartEnemy()
end

local function walkEnemy2()
        enemy2:setSequence( "walk" )
        enemy2:play()
		restartEnemy2()
end

local function walkEnemyHit()
        enemy:setSequence( "walk" )
        enemy:play()
end

local function walkEnemy2Hit()
        enemy2:setSequence( "walk" )
        enemy2:play()
end

local function hitRightEnemy1()
		enemy:setSequence ("hitright")
		enemy:play()
		timer.performWithDelay( 600, walkEnemyHit )
end

local function hitLeftEnemy1()
		enemy:setSequence ("hitleft")
		enemy:play()
		timer.performWithDelay( 600, walkEnemyHit )
end

local function hitRightEnemy2()
		enemy2:setSequence ("hitright")
		enemy2:play()
		timer.performWithDelay( 600, walkEnemy2Hit )
end

local function hitLeftEnemy2()
		enemy2:setSequence ("hitleft")
		enemy2:play()
		timer.performWithDelay( 600, walkEnemy2Hit )
end

local function updateScore(pontos)
 pontuacao.text = tonumber(pontuacao.text) + pontos
end

	local soco_mp3 = audio.loadSound("soco.mp3")
local morte_mp3= audio.loadSound("morte.mp3")
	
	function enemy:tap( event)
	if(enemy.x > pers.x) then
		transition.to(pers,{time=300, x = enemy.x -40, y = enemy.y, onComplete = punch()})
	else
		transition.to(pers,{time=300, x = enemy.x +40, y = enemy.y, onComplete = punch2()})
	end
	enemy.cd = 10
	audio.play(soco_mp3)
	enemy.hp = enemy.hp - 1
	if(enemy.x > pers.x) then
		timer.performWithDelay( 600, walk )
	else
		timer.performWithDelay( 600, walk2 )
	end
	if( enemy.hp ==0) then
	enemy:setSequence("down")
	enemy:play()
	audio.play(morte_mp3)
	timer.performWithDelay(1000, walkEnemy)
	updateScore(100)
	end

end

function enemy2:tap( event)
		if(enemy2.x > pers.x) then
		transition.to(pers,{time=300, x = enemy2.x -40, y = enemy2.y, onComplete = punch()})
	else
		transition.to(pers,{time=300, x = enemy2.x +40, y = enemy2.y, onComplete = punch2()})
	end
	enemy2.cd = 10
	audio.play(soco_mp3)
	enemy2.hp = enemy2.hp -1
	
		if(enemy2.x > pers.x) then
		timer.performWithDelay( 600, walk )
	else
		timer.performWithDelay( 600, walk2 )
	end
	if (enemy2.hp ==0) then
	enemy2:setSequence("down")
	enemy2:play()
	audio.play(morte_mp3)
	timer.performWithDelay(1000, walkEnemy2)
	updateScore(200)
	end
end

function hitNinja()
print("Hitando o ninja, com o life" .. pers.hp)
	if(pers.hp == 1) then
	hp:removeSelf()
	hp = display.newImage("NinjaDied.png")
	print("Trocou a Image" .. pers.hp)
	hp:removeSelf()
	storyboard.gotoScene( "gameOver", "fade", 800  )
	
	end
	
	if (pers.hp == 2) then
	hp:removeSelf()
	pers.hp = pers.hp-1
	hp = display.newImage("NinjaHP1.png")
	print("Trocou a Image" .. pers.hp)
	end
	
	if (pers.hp == 3) then
	hp:removeSelf()
	pers.hp = pers.hp - 1
	hp = display.newImage("NinjaHP2.png")
	print("Trocou a Image" .. pers.hp)
	end
	
screenGroup:insert( hp )
end

 local timestamp = display.newText(timestage, display.contentWidth/2, 0, font,36)
timestamp:setTextColor(255,255,255)
screenGroup:insert( timestamp )


function nextStage()
stageClear.isVisible = false
timestamp.isVisible = false
storyboard.gotoScene( "game2", {
effect = "fade",
time = 800,
params = {
pontos = pontuacao,
vida = pers.hp
}
})
end

function goEnemys()

print(timestage)
timestage = timestage -1
timestamp.text = timestage

enemy.cd = enemy.cd -1
enemy2.cd = enemy2.cd -1

if (enemy.cd <=0) then
print("Enemy Baateu")
enemy.cd = 5
enemy2.cd = 5
 if (enemy.x > pers.x) then
	enemy.x = pers.x + 40
	enemy.y = pers.y
	hitRightEnemy1()
else
	enemy.x = pers.x - 40
	enemy.y = pers.y
	hitLeftEnemy1()
end
hitNinja()
end

if (enemy2.cd <=0) then
print("Enemy2 Baateu")
enemy.cd = 5
enemy2.cd = 5
 if (enemy2.x > pers.x) then
	enemy2.x = pers.x + 40
	enemy2.y = pers.y
	hitRightEnemy2()
else
	enemy2.x = pers.x - 40
	enemy2.y = pers.y
	hitLeftEnemy2()
end
hitNinja()
end

if(timestage <= 0 ) then
stageClear.isVisible = true;
--stageClear:toFront()
pers.isVisible = false
enemy.isVisible = false
enemy2.isVisible = false
timer.performWithDelay(3000,nextStage)
end


end
controller = timer.performWithDelay(1000,goEnemys,60)


enemy:addEventListener("tap", enemy)
enemy2:addEventListener("tap", enemy2)



	
end

function scene:exitScene( event )
timer.cancel(controller)

end


function scene:destroyScene( event )

	
end


scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

scene:addEventListener( "destroyScene", scene )

return scene




	




