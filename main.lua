local sprite = require "sprite"

local background = display.newImage("bg.png",true)
background.x = display.contentWidth /2
background.y = display.contentHeight / 2

local score = 0 
local pontuacao = display.newText(score, display.contentWidth, 0, native.systemFontBold,36)
pontuacao:setTextColor(255,255,255)
--[[
local pers = display.newImage("char2.png")
pers.x = display.contentWidth /2
pers.y = display.contentHeight /2
]]
local soco_mp3 = audio.loadSound("soco.mp3")
local morte_mp3= audio.loadSound("morte.mp3")

local enemy = display. newImage("enemy.png")
enemy.hp =3
enemy.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
enemy.y = math.random(enemy.height/2, display.contentHeight - enemy.height)

local function restartEnemy (event)
	enemy.hp =3
	enemy.x =  math.random(enemy.width/2, display.contentWidth - enemy.width)
	enemy.y = math.random(enemy.height/2, display.contentHeight - enemy.height)
	end
	
--[[
transition.to(enemy,{time=1000, x = pers.x, y = pers.y})

while ( enemy.x ~= pers.x or enemy.y ~= pers.y)
	do
		if( enemy.x > pers.x) then
			enemy.x = enemy.x -1
		elseif (enemy.x < pers.x) then
			enemy.x = enemy.x + 1
		end
		
		if( enemy.y > pers.y) then
			enemy.y = enemy.y -1
		elseif (enemy.y < pers.y) then
			enemy.y = enemy.y + 1
		end
	end	
		
		]]
		--[[
local sheet1 = sprite.newSpriteSheet("Ninja.png",80,112)
local spriteSet1 = sprite.newSpriteSet(sheet1,1,3)
sprite.add(spriteSet1,"walk",1,3,1000,0)
]]

-- 1st image sheet
local sheetData1 = { width=80, height=112, numFrames=3 }
local sheet1 = graphics.newImageSheet( "Ninja.png", sheetData1 )

-- 2nd image sheet
local sheetData2 = { width=85, height=104, numFrames=3 }
local sheet2 = graphics.newImageSheet( "NinjaPunch.png", sheetData2 )

-- In your sequences, add the parameter 'sheet=' referencing which image sheet the sequence should use
local sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=3, time=500, loopCount=0 },
                { name="seq2", sheet=sheet2, start=1, count=3, time=500, loopCount=0 }
                }
local pers = display.newSprite(sheet1, sequenceData)
pers.x = display.contentWidth/2 + 128
pers.y = display.contentHeight/2
pers:play()
local function punch()
        pers:setSequence( "seq2" )
        pers:play()
end
local function walk()
        pers:setSequence( "seq1" )
        pers:play()
end
--[[
local sheet2 = sprite.newSpriteSheet("NinjaPunch.png",100,104)
local spriteSet2 = sprite.newSpriteSet(sheet2,1,3)
sprite.add(spriteSet2,"punch",1,2,1000,1)
pers = sprite.newSprite(spriteSet2)
pers:prepare("punch")
]]
 

  --[[
  local pers = display.newSprite( mySheet, sequenceData )
pers.x = display.contentWidth/2 + 128
pers.y = display.contentHeight/2
pers:setSequence( "walk" )
pers:play()
 ]]
local enemy2 = display. newImage("enemy.png")
enemy2.x =  math.random(enemy2.width/2, display.contentWidth - enemy2.width)
enemy2.y = math.random(enemy2.height/2, display.contentHeight - enemy2.height)
enemy2.hp = 3

local function restartEnemy2 (event)
	enemy2.hp =3
	enemy2.x =  math.random(enemy2.width/2, display.contentWidth - enemy2.width)
	enemy2.y = math.random(enemy2.height/2, display.contentHeight - enemy2.height)
end

local function updateScore(event)
 pontuacao.text = tonumber(pontuacao.text) + 100
end

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