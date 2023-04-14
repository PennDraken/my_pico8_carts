-- CURSOR TO PLACE TILES ON BOARD
-- Note: cursor coordinates are pixel based, not tile based
cx=16
cy=16
cincrement=16
cn = 192

-- moves cursor in a given direction. if it travels outside area it will loop to other side
function move_cursor(x_dir, y_dir)
    cx = (cx + x_dir * cincrement) % 128
    cy = (cy + y_dir * cincrement) % 128
    selected_tile.x = flr(cx / 16)+1
    selected_tile.y = flr(cy / 16)+1
end

-- used to update position of cursor to create smooth movement
function update_cursor()

end

function draw_cursor()
    bspr(cn, cx, cy)
end