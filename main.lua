local Concord = require("libraries.concord")

-- Components must be registered before entities try to use them.
require("src.components.position")
require("src.components.circle")

local ecsWorld

function love.load()
    ecsWorld = Concord.world()

    local testEntity = Concord.entity(ecsWorld)
    testEntity:give("position", 100, 100)
    testEntity:give("circle", 6, 0.35, 0.8, 1, 1)
end

function love.draw()
    love.graphics.print("Just Another Dungeon Crawler", 20, 20)
end
