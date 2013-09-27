local storyboard = require( "storyboard" )
local scene = storyboard.newScene("home")
 
function scene:createScene( event )
        local group = self.view
        print( "home: createScene event")
        background = display.newImage( "splashScreen1.png",true )
		background.x = display.contentWidth /2
		background.y = display.contentHeight / 2
end
 
function scene:tap(event)
        local group = self.view
        print("home: tap event")
        storyboard.gotoScene("game","fade",1000)
        return true
end
 
function scene:setScene( event )
        local group = self.view
        print("home: setScene event")
end
 
function scene:enterScene( event )
        local group = self.view
        print( "home: enterScene event" )
        group:addEventListener( "tap", self.tap )
end
 
function scene:exitScene( event )
        local group = self.view
        print( "home: exitScene event" )
        group:removeEventListener( "tap", self.tap )
end
 
function scene:destroyScene( event )
        local group = self.view
        print( "home: destroyScene event" )
end
 
scene:addEventListener( "createScene", scene )
 
scene:addEventListener( "setScene", scene )
 
scene:addEventListener( "enterScene", scene )
 
scene:addEventListener( "exitScene", scene )
 
scene:addEventListener( "destroyScene", scene )
 
return scene