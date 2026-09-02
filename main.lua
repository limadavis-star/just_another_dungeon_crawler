local Concord = require("libraries.concord")

-- Components must be registered before entities try to use them.
require("src.components.position")

local ecsWorld

function love.load()
    ecsWorld = Concord.world()
end

function love.draw()
    love.graphics.print("Just Another Dungeon Crawler", 20, 20)
end
