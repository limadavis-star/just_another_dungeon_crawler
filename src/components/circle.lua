local Concord = require("libraries.concord")

local Circle = Concord.component(
    "circle",
    function(component, radius, red, green, blue, alpha)
        component.radius = radius or 6
        component.red = red or 1
        component.green = green or 1
        component.blue = blue or 1
        component.alpha = alpha or 1
    end
)

return Circle
