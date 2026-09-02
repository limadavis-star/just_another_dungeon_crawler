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
        local directionY = 0

        if love.keyboard.isDown("a", "left") then
            directionX = directionX - 1
        end

        if love.keyboard.isDown("d", "right") then
            directionX = directionX + 1
        end

        if love.keyboard.isDown("w", "up") then
            directionY = directionY - 1
        end

        if love.keyboard.isDown("s", "down") then
            directionY = directionY + 1
        end

        entity.velocity.x = directionX * entity.speed.value
        entity.velocity.y = directionY * entity.speed.value
    end
end

return InputSystem
