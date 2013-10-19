local sprite = require "sprite"
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local image, enemy, enemy2, pers, pontuacao

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


function scene:createScene( event )
	local screenGroup = self.view

	 image = display.newImage("bg.png",true)
image.x = display.contentWidth /2
image.y = display.contentHeight / 2
screenGroup:insert( image )

local score = 0 
 pontuacao = display.newText(score, display.contentWidth, 0, native.systemFontBold,36)
pontuacao:setTextColor(255,255,255)
screenGroup:insert( pontuacao )


local sheetData1 = { width=81, height=120, numFrames=3 }
local sheet1 = graphics.newImageSheet( "Ninja.png", sheetData1 )


local sheetData2 = { width=87, height=104, numFrames=3 }
local sheet2 = graphics.newImageSheet( "NinjaPunch.png", sheetData2 )


local sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=3, time=500, loopCount=0 },
                { name="seq2", sheet=sheet2, start=1, count=3, time=500, loopCount=0 }
                }
 pers = display.newSprite(sheet1, sequenceData)
pers.x = display.contentWidth/2 + 128
pers.y = display.contentHeight/2
pers:play()
	screenGroup:insert( pers )

 enemy = display. newImage("enemy.png")
enemy.hp =3
enemy.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
enemy.y = math.random(enemy.height/2, display.contentHeight - enemy.height)
	screenGroup:insert( enemy )
	
	 enemy2 = display. newImage("enemy.png")
enemy2.x =  math.random(enemy2.width/2, display.contentWidth - enemy2.width)
enemy2.y = math.random(enemy2.height/2, display.contentHeight - enemy2.height)
enemy2.hp = 3
screenGroup:insert( enemy2 )

	
end



function scene:enterScene( event )
	local screenGroup = self.view
	local function restartEnemy (event)
	enemy.hp =3
	enemy.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
	enemy.y = math.random(enemy.height/2, display.contentHeight - enemy.height)
	end
	
	local function restartEnemy2 (event)
	enemy2.hp =3
	enemy2.x =  math.random(enemy2.width/2, display.contentWidth - enemy2.width)
	enemy2.y = math.random(enemy2.height/2, display.contentHeight - enemy2.height)
end
local function punch()
        pers:setSequence( "seq2" )
        pers:play()
end
local function walk()
        pers:setSequence( "seq1" )
        pers:play()
end

local function updateScore(event)
 pontuacao.text = tonumber(pontuacao.text) + 100
end

	local soco_mp3 = audio.loadSound("soco.mp3")
local morte_mp3= audio.loadSound("morte.mp3")
	
	function enemy:tap( event)
	transition.to(pers,{time=300, x = enemy.x -40, y = enemy.y, onComplete = punch()})
	audio.play(soco_mp3)
	enemy.hp = enemy.hp - 1
	timer.performWithDelay( 600, walk )
	if( enemy.hp <=0) then
	audio.play(morte_mp3)
	updateScore()
	restartEnemy()
	end

end

function enemy2:tap( event)
	transition.to(pers,{time=300, x = enemy2.x -40, y = enemy2.y, onComplete =punch()}) 
	audio.play(soco_mp3)
	enemy2.hp = enemy2.hp -1
	timer.performWithDelay( 600, walk )
	if (enemy2.hp <=0) then
	audio.play(morte_mp3)
	updateScore()
	restartEnemy2()
	end
end

enemy:addEventListener("tap", enemy)
enemy2:addEventListener("tap", enemy2)

	
end

function scene:exitScene( event )
	local group = self.view
		
end


function scene:destroyScene( event )
	local group = self.view
	
end


scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

scene:addEventListener( "destroyScene", scene )

return scene




	




