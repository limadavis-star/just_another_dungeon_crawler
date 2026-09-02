local Concord = require("libraries.concord")

-- Components must be registered before entities try to use them.
require("src.components.position")
require("src.components.circle")

local CircleRenderSystem = require("src.systems.circle_render_system")

local ecsWorld


function love.load()
    ecsWorld = Concord.world()
    ecsWorld:addSystem(CircleRenderSystem)

    local testEntity = Concord.entity(ecsWorld)
    testEntity:give("position", 100, 100)
    testEntity:give("circle", 6, 0.35, 0.8, 1, 1)
end

function love.draw()
    ecsWorld:emit("draw")
    love.graphics.print("Just Another Dungeon Crawler", 20, 20)
end
