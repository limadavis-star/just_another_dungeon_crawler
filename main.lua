local Concord = require("libraries.concord")

local ecsWorld

function love.load()
    ecsWorld = Concord.world()
end

function love.draw()
    love.graphics.print("Just Another Dungeon Crawler", 20, 20)
end
