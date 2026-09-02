local Concord = require("libraries.concord")
local Dungeon = require("src.world.dungeon")

local TILE_SIZE = 16

local DungeonRenderSystem = Concord.system({})

function DungeonRenderSystem:init()
    self.floorAtlas = love.graphics.newImage(
        "assets/images/dungeon/floor_tiles.png"
    )

    local atlasWidth, atlasHeight =
        self.floorAtlas:getDimensions()

    self.floorQuads = {
        love.graphics.newQuad(
            0,
            0,
            TILE_SIZE,
            TILE_SIZE,
            atlasWidth,
            atlasHeight
        ),
    }
end

function DungeonRenderSystem:setDungeon(dungeon)
    self.dungeon = dungeon
end

function DungeonRenderSystem:draw()
    if not self.dungeon then
        return
    end

    -- rotLove coordinates can start at zero, so pairs is used instead of ipairs.
    for y, row in pairs(self.dungeon.cells) do
        for x, cell in pairs(row) do
            local screenX = x * TILE_SIZE
            local screenY = y * TILE_SIZE

            if cell == Dungeon.CELL_WALL then
                love.graphics.setColor(0.22, 0.24, 0.3, 1)

                love.graphics.rectangle(
                    "fill",
                    screenX,
                    screenY,
                    TILE_SIZE,
                    TILE_SIZE
                )
            else
                love.graphics.setColor(1, 1, 1, 1)

                love.graphics.draw(
                    self.floorAtlas,
                    self.floorQuads[1],
                    screenX,
                    screenY
                )
            end
        end
    end

    -- Restore the default color so this system does not affect later drawing.
    love.graphics.setColor(1, 1, 1, 1)
end

return DungeonRenderSystem
