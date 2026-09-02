local Concord = require("libraries.concord")
local entity = require("libraries.concord.entity")

local CircleRenderSystem = Concord.system({
    pool = {
        "position",
        "circle"
    },
})

function CircleRenderSystem:draw()
    for _, entity in ipairs(self.pool) do
        local position = entity.position
        local circle = entity.circle

        love.graphics.setColor(
            circle.red,
            circle.green,
            circle.blue,
            circle.alpha
        )

        love.graphics.circle(
            "fill",
            position.x,
            position.y,
            circle.radius
        )

        -- Restore the default color so this system does not affect later drawing.
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return CircleRenderSystem
