function _draw()
    cls()
    car:draw()
    draw_track(track)
end

function my_line(x0, y0, x1, y1, color)
    line(x0, y0, x1, y1, color)
end