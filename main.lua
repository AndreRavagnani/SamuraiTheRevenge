local sprite = require "sprite"



local background = display.newImage("ground.png",true)
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
	

--transition.to(enemy,{time=1000, x = pers.x, y = pers.y})
--[[
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
		
		
local sheet1 = sprite.newSpriteSheet("ryu3.png",70,110)
local spriteSet1 = sprite.newSpriteSet(sheet1,1,2)
sprite.add(spriteSet1,"walk",1,2,1000,0)
local pers = sprite.newSprite(spriteSet1)
pers.x = display.contentWidth/2 + 128
pers.y = display.contentHeight/2
pers:prepare("walk")
pers:play()

local sheet2 = sprite.newSpriteSheet("streefighter_a2_ryu.png",70,110)
local spriteSet2 = sprite.newSpriteSet(sheet2,1,2)
sprite.add(spriteSet2,"punch",1,2,1000,1)
pers = sprite.newSprite(spriteSet2)
pers:prepare("punch")
 ]]
 
 local sheetData = { width=90, height=110, numFrames=50, sheetContentWidth=1024, sheetContentHeight=1024 }
 
  local mySheet = graphics.newImageSheet( "streefighter_a2_ryu.png", sheetData )
 
  local sequenceData = {
    { name = "punch", start=1, count=1, time=1000 },
    { name = "walk", start=1, count=6, time=1000 }
  }
  
  local pers = display.newSprite( mySheet, sequenceData )
pers.x = display.contentWidth/2 + 128
pers.y = display.contentHeight/2
pers:setSequence( "walk" )
pers:play()
 
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
	pers.x = enemy.x -40
	pers.y = enemy.y 
	pers:setSequence("punch")
	pers:play()
	audio.play(soco_mp3)
	enemy.hp = enemy.hp - 1
	if( enemy.hp <=0) then
	audio.play(morte_mp3)
	updateScore()
	restartEnemy()
	end

end

function enemy2:tap( event)
	pers.x = enemy2.x -40
	pers.y = enemy2.y 
	audio.play(soco_mp3)
	enemy2.hp = enemy2.hp -1
	if (enemy2.hp <=0) then
	audio.play(morte_mp3)
	updateScore()
	restartEnemy2()
	end
end





enemy:addEventListener("tap", enemy)
enemy2:addEventListener("tap", enemy2)