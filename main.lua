local Concord = require("libraries.concord")

-- Components must be registered before entities try to use them.
require("src.components.position")
require("src.components.circle")
require("src.components.velocity")

local Player = require("src.entities.player")
local CircleRenderSystem = require("src.systems.circle_render_system")

local ecsWorld


function love.load()
    ecsWorld = Concord.world()
    ecsWorld:addSystem(CircleRenderSystem)

    Player.create(ecsWorld, 100, 100)
end

function love.draw()
    ecsWorld:emit("draw")
    love.graphics.print("Just Another Dungeon Crawler", 20, 20)
end
