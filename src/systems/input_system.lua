local Concord = require("libraries.concord")

local InputSystem = Concord.system({
    pool = {
        "controllable",
        "velocity",
        "speed"
    }
})

function InputSystem:update()
    for _, entity in ipairs(self.pool) do
        local directionX = 0

        if love.keyboard.isDown("a", "left") then
            directionX = directionX - 1
        end

        if love.keyboard.isDown("d", "right") then
            directionX = directionX + 1
        end

        entity.velocity.x = directionX * entity.speed.value
    end
end

return InputSystem
