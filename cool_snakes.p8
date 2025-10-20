pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function x_y_to_i_j(x, y)
    return flr(x%128), flr(y%128)
end

function shortest_angle_diff(a, b)
    local diff = (b - a + 0.5) % 1 - 0.5  -- wraps difference to [-0.5, 0.5)るひ
    local thr = 0.001
    if diff < -thr then
        return -1
    elseif diff > thr then
        return 1
    else
        return 0
    end
end


function init_board()
    local board = {}
    for i=0,128 do
        board[i] = {}
        for j=0,128 do
            board[i][j]=nil
        end
    end
    return board
end

function init_snake()
    local s = {}
    s.x = flr(rnd(128))
    s.y = flr(rnd(128))
    s.a = rnd()*0.4
    s.c = rnd({13,12,14})
    s.target_angle = s.a
    s.update = function(this)
        -- check if collide
        local thr_stop = 3 -- pixels look ahead
        for o=2,thr_stop do
            local i,j = x_y_to_i_j(this.x + cos(this.a) * o, this.y + sin(this.a) * o)
            if board[i][j] != nil then
                del(snakes, this)
                -- pset(x_y_to_i_j(this.x, this.y),7)
                return -- Snake is dead now
            end
        end
        -- if no collide attempt to turn
        local thr_turn = 10 -- pixels look ahead
        for o=thr_stop,thr_turn do
            local i,j = x_y_to_i_j(this.x + cos(this.a) * o, this.y + sin(this.a) * o)
            if board[i][j] != nil then

                local target_a1 = board[i][j] % 1
                local target_a2 = (board[i][j] - 0.5) % 1

                local diff1 = shortest_angle_diff(this.a, target_a1)
                local diff2 = shortest_angle_diff(this.a, target_a2)

                local target_angle
                if abs(diff1) < abs(diff2) then
                    target_angle = target_a1
                else
                    target_angle = target_a2
                end

                -- Move toward the chosen angle
                this.target_angle = target_angle
                break
            end
        end
        -- Update angle towards target
        local step_size = 0.1 
        this.a = (this.a + step_size * shortest_angle_diff(this.a, this.target_angle)) % 1

        -- update position
        local mov_spd = 1
        this.x += cos(this.a) * mov_spd
        this.y += sin(this.a) * mov_spd
        this.x = this.x % 128
        this.y = this.y % 128
        -- save position
        local i,j = x_y_to_i_j(this.x, this.y)
        board[i][j] = this.a
    end
    s.draw = function(this)
        circfill(this.x, this.y, 1, this.c)
    end
    return s
end

function _init()
    cls(1)
    board = init_board()
    snakes = {}
    for i=0,100 do
        add(snakes, init_snake())
    end
    sel_snake = 1
end

function _update()
    for s in all(snakes) do
        s:update()
    end
end

function _draw()
    -- cls(1)
    for s in all(snakes) do
        s:draw()
    end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
