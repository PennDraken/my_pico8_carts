-- RUNS AT PROGRAM INITIALIZATION
-- initialize program
board = {}

function _init()
    printh("New game loop!-------------------")
    init_keys()
    for row = 0, 9 do
        board[row] = {}
        for column = 0, 9 do
            board[row][column] = nil
            -- board[row][column] = new_tile(row, column, branch_straight, 1)
            -- printh(board[row][column].x)
       end
    end

    test_cases()
end

function test_cases()
    test_connection()
end

function test_connection()
    tile_right = new_tile(3, 3, branch_straight, 0)
    tile_left = new_tile(2, 3, branch_curve, 0)
    print_connections(tile_left)

    result0 = tile_right:check_connection(tile_left)
    tile_left:rotate()
    print_connections(tile_left)
    result1 = tile_right:check_connection(tile_left)
    tile_left:rotate()
    print_connections(tile_left)
    result2 = tile_right:check_connection(tile_left)
    tile_left:rotate()
    print_connections(tile_left)
    result3 = tile_right:check_connection(tile_left)
    tile_left:rotate()
    print_connections(tile_left)


    printh(result0)
    printh(result1)
    printh(result2)
    printh(result3)


    if result == false then
        printh("Connection functionality failed")
    else
        printh("Connection succeded")
    end
end

function print_connections(tile)
    printh("connections")
    printh(tile.connections_arr[1][1])
    printh(tile.connections_arr[1][2])
    printh(tile.connections_arr[1][3])
    printh(tile.connections_arr[1][4])
end

function check_defined()
    printh("Creating tiles")
    printh("Checking if tile type branch_straight is defined...")
    printh(branch_straight)
    printh("Checking if original rotations are defined...")
    printh(branch_straight.rotation_states)
end

function check_rotatable(tile)
    printh("Before rotation")
    -- print rotation matrix for tile
    printh(tile.connections_arr[1][1])
    printh(tile.connections_arr[1][2])
    printh(tile.connections_arr[1][3])
    printh(tile.connections_arr[1][4])
    -- rotate tile
    printh("After rotation")
    tile:rotate()
    -- print new rotation matrix for tile
    printh(tile.connections_arr[1][1])
    printh(tile.connections_arr[1][2])
    printh(tile.connections_arr[1][3])
    printh(tile.connections_arr[1][4])
end