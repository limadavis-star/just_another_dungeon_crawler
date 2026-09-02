local Concord = require("libraries.concord")

local MovementSystem = Concord.system({
    pool = {
        "position",
        "velocity"
    }
})

function MovementSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        local position = entity.position
        local velocity = entity.velocity
        -- Multiplying by dt keeps movement speed independent of the frame rate.
        position.x = position.x + velocity.x * dt
        position.y = position.y + velocity.y * dt
    end
end

return MovementSystem
