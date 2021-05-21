function love.conf(t)
    t.console = false

    t.window.title = "Konigsberg"
    t.window.width = 960
    t.window.height = 720
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 960
    t.window.minheight = 720
    t.window.display = 1

    -- Modules
    t.modules.audio = true
    t.modules.data = false
    t.modules.event = true
    t.modules.font = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = false
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = false
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = true
    t.modules.timer = true
    t.modules.touch = false
    t.modules.video = false
    t.modules.window = true
end
