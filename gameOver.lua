---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image

-- Touch event listener for background image
local function onSceneTouch( self, event )
	if event.phase == "began" then
		print( "Image Touched ")
		storyboard.gotoScene( "home", "slideLeft", 800  )		
		return true
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	
	image = display.newImage( "splashScreen1.png" )
	screenGroup:insert( image )
	
	image.touch = onSceneTouch
		
	print( "\n1: createScene event")
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
	storyboard.purgeScene("game2")
	print( "1: enterScene event" )
	
	-- Update Lua memory text display
		image:addEventListener( "touch", image )
		
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	
	print( "1: exitScene event" )
	
	-- remove touch listener for image
	image:removeEventListener( "touch", image )
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	
	print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene