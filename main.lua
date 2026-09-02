local Concord = require("libraries.concord")

-- Components must be registered before entities try to use them.
require("src.components.position")
require("src.components.circle")
require("src.components.velocity")
require("src.components.speed")
require("src.components.controllable")


local Player = require("src.entities.player")
local Dungeon = require("src.world.dungeon")
local MovementSystem = require("src.systems.movement_system")
local CircleRenderSystem = require("src.systems.circle_render_system")
local InputSystem = require("src.systems.input_system")
local DungeonRenderSystem = require("src.systems.dungeon_render_system")

local ecsWorld
local dungeon

function love.load()
    -- Preserve hard pixel edges when images are scaled.
    love.graphics.setDefaultFilter("nearest", "nearest")
    ecsWorld = Concord.world()

    -- Input must run before movement so velocity is current for this frame.
    ecsWorld:addSystems(InputSystem, MovementSystem, DungeonRenderSystem, CircleRenderSystem)

    Player.create(ecsWorld, 100, 100)

    dungeon = Dungeon.generate(60, 32)

    local dungeonRenderSystem =
        ecsWorld:getSystem(DungeonRenderSystem)

    dungeonRenderSystem:setDungeon(dungeon)
end

function love.update(dt)
    ecsWorld:emit("update", dt)
end

function love.draw()
    ecsWorld:emit("draw")
    love.graphics.print("Just Another Dungeon Crawler", 20, 20)
    love.graphics.print(
        "Dungeon: " .. dungeon.width .. " x " .. dungeon.height,
        20,
        40
    )
end
