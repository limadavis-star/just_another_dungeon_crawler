local Concord = require("libraries.concord")

local Player = {}

function Player.create(world, x, y)
    local entity = Concord.entity(world)
        :give("position", x, y)
        :give("circle", 6, 0.35, 0.8, 1, 1)

    return entity
end

return Player
