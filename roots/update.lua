-- GAME LOOP
-- UPDATING FUNCTIONS
function _update()
    upd_keys()
    input_handler()
end

function input_handler()
    -- arrow keys
    if is_pressed(0) then
        move_cursor(-1, 0)
    elseif is_pressed(1) then
        move_cursor(1, 0)
    elseif is_pressed(2) then
        move_cursor(0, -1)
    elseif is_pressed(3) then
        move_cursor(0, 1)
    end

    -- z and x keys
    if is_pressed(4) then
        if can_place_tile(selected_tile, cx/16, cy/16) then
            add_tile_to_board(selected_tile, cx/16, cy/16)
            add_tile_to_hand()
        end
    elseif is_pressed(5) then
        selected_tile:rotate()
    end
end

function can_place_tile(tile, x, y)
    -- TODO check connections as well
    x=x+1 -- because cursor is offset
    y=y+1
    if board[x][y] != nil then return false end

    -- top
    if board[x][y - 1] != nil then
        if not selected_tile:check_connection(board[x][y - 1]) then
            return false
        end
    end
    --right
    if board[x + 1][y] != nil then
        if not selected_tile:check_connection(board[x + 1][y]) then
            return false
        end
    end
    -- bottom
    if board[x][y + 1] != nil then
        if not selected_tile:check_connection(board[x][y + 1]) then
            return false
        end
    end
    -- left
    if board[x - 1][y] != nil then
        if not selected_tile:check_connection(board[x - 1][y]) then
            return false
        end
    end
    -- all checks were clear
    return true
end

function add_tile_to_board(tile, x, y)
    board[x+1][y+1] = new_tile(tile.x, tile.y, tile.type, tile.rotation)
    printh("Added tile to board")
end

function add_tile_to_hand()
    type = choose_weighted(probability_table)
    selected_tile = new_tile(cx/16+1, cy/16+1, type, 0)
end