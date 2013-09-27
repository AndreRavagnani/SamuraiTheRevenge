
 
function scene:createScene( event )
        local group = self.view
        print( "scene1: createScene event")
        display.newCircle( group, display.contentCenterX, display.contentCenterY, 200 )
        group[1]:setFillColor( 0, 255, 0 )
end
 
function scene:tap(event)
        local group = self.view
        print("scene1: tap event")
        storyboard.gotoScene("home","fade",1000)
        return true
end
 
function scene:setScene( event )
        local group = self.view
        print("scene1: setScene event")
end
 
function scene:enterScene( event )
        local group = self.view
        print( "scene1: enterScene event" )
        group[1]:addEventListener( "tap", self.tap )
end
 
function scene:exitScene( event )
        local group = self.view
        print( "scene1: exitScene event" )
        group[1]:removeEventListener( "tap", scene.tap )
end
 
function scene:destroyScene( event )
        local group = self.view
        print( "scene1: destroyScene event" )
end
 
scene:addEventListener( "createScene", scene )
 
scene:addEventListener( "setScene", scene )
 
scene:addEventListener( "enterScene", scene )
 
scene:addEventListener( "exitScene", scene )
 
scene:addEventListener( "destroyScene", scene )
 
return scene