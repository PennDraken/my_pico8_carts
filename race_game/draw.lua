function _draw()
    cls(1)
    draw_track(track)
    car:draw()

    ?camera.angle,7
    ?car.angle,7
end

--draws a line based on camera position
function my_line(x0, y0, x1, y1, color)
    local x0 = x0 - camera.x
    local x1 = x1 - camera.x
    local y0 = y0 - camera.y
    local y1 = y1 - camera.y
    local x0, y0 = rotatePoint(x0, y0, 64, 64, camera.angle)
    local x1, y1 = rotatePoint(x1, y1, 64, 64, camera.angle)
    line(x0 * camera.scale, y0 * camera.scale, x1 * camera.scale, y1 * camera.scale, color)
end