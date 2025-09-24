function _init()
    slide_manager = init_slides()
    init_mouse()
end

function _draw()
    slide_manager:draw()
    mouse:draw()
end

function _update60()
    slide_manager:update()
    mouse:update()
end