-- RENDERING FUNCTIONS
function _draw()
    cls()
    pal()
    palt(0, false) -- black is no longer transparent

    draw_board()

    if selected_tile != nil then
        selected_tile:draw()
    end

    palt(0, true)
    -- printh(selected_tile.x)
    if can_place_tile(selected_tile, cx/16, cy/16) then
        pal(7, 3)
        draw_cursor()
    else
        pal(7, 8)
        draw_cursor()
    end
end

-- big_sprite: like spr but automatically draws 16x16 sprites instead of 8x8
function bspr(n, x, y)
    spr(n, x, y, 2, 2)
end

function draw_board()
    for i=1, 8 do
        for j=1, 8 do
            if board[i][j] != nil then
                board[i][j]:draw()
            end
        end
    end
end
