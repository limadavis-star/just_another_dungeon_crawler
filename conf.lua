function love.conf(config)
    config.window.title = "Just Another Dungeon Crawler"

    -- Both dimensions are multiples of 16 to align with the tile grid
    config.window.width = 1024
    config.window.height = 576

    config.window.resizable = false
    config.window.vsync = 1
end
