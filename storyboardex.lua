
local storyboard = require "storyboard"
 
-- get reference to the storyboard gotoScene function
local gofunc = storyboard.gotoScene
 
-- override the storyboard gotoScene event with our own conditions
local function go(name,trans,time)
        -- attempt to get the destination scene
        local scene = storyboard.getScene(name)
 
        -- if the destination scene exists then call its setup function
        if (scene) then
                scene:dispatchEvent( { name="setScene", target=scene } )
        end
 
        -- continue with normal storyboard.gotoScene
        gofunc(name,trans,time)
end
 
storyboard.gotoScene = go