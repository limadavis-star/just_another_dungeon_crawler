local ROT = require("libraries.rotlove.rot")

local Dungeon = {}

Dungeon.CELL_FLOOR = 0
Dungeon.CELL_WALL = 1

function Dungeon.generate(width, height)
    local cells = {}
    local generator = ROT.Map.Digger(width, height)

    generator:create(function(x, y, value)
        -- Store cells by row first so callers can access them as cells[y][x].
        cells[y] = cells[y] or {}
        cells[y][x] = value
    end)

    return {
        width = width,
        height = height,
        cells = cells,
    }
end

return Dungeon
