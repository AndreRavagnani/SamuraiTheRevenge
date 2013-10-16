--
-- Abstract: Storyboard Sample
--
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2011 Corona Labs Inc. All Rights Reserved.
--
-- Demonstrates use of the Storyboard API (scene events, transitioning, etc.)
--

-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )

-- require controller module
local storyboard = require "storyboard"


-- load first scene
storyboard.gotoScene( "home", "fade", 400 )

--
-- Display objects added below will not respond to storyboard transitions
--

-- table to setup tabBar buttons


-- create the actual tabBar widget



--[[ Uncomment to monitor app's lua memory/texture memory usage in terminal...

local function garbagePrinting()
	collectgarbage("collect")
    local memUsage_str = string.format( "memUsage = %.3f KB", collectgarbage( "count" ) )
    print( memUsage_str )
    local texMemUsage_str = system.getInfo( "textureMemoryUsed" )
    texMemUsage_str = texMemUsage_str/1000
    texMemUsage_str = string.format( "texMemUsage = %.3f MB", texMemUsage_str )
    print( texMemUsage_str )
end

Runtime:addEventListener( "enterFrame", garbagePrinting )
--]]