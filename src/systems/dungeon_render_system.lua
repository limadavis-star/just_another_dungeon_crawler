local Concord = require("libraries.concord")
local Dungeon = require("src.world.dungeon")

local TILE_SIZE = 16

local DungeonRenderSystem = Concord.system({})

function DungeonRenderSystem:setDungeon(dungeon)
    self.dungeon = dungeon
end

function DungeonRenderSystem:init()
    self.floorAtlas = love.graphics.newImage(
        "assets/images/dungeon/floor_tiles.png"
    )
end

function DungeonRenderSystem:draw()
    if not self.dungeon then
        return
    end

    -- rotLove coordinates can start at zero, so pairs is used instead of ipairs.
    for y, row in pairs(self.dungeon.cells) do
        for x, cell in pairs(row) do
            if cell == Dungeon.CELL_WALL then
                love.graphics.setColor(0.22, 0.24, 0.3, 1)
            else
                love.graphics.setColor(0.1, 0.11, 0.15, 1)
            end

            love.graphics.rectangle(
                "fill",
                x * TILE_SIZE,
                y * TILE_SIZE,
                TILE_SIZE,
                TILE_SIZE
            )
        end
    end

    -- Restore the default color so this system does not affect later drawing.
    love.graphics.setColor(1, 1, 1, 1)
end

return DungeonRenderSystem
