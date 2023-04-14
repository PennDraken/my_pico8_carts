pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

-- used to put a pixel at correct position without having to put at x=0 y=0
function mpset(x, y, c)
    if (x!=nil or y!=nil) then
        pset(x - 1, y - 1, c)
    end
end

 
-->8
-- pathfinder
-- by @casualeffects

-- returns the shortest path, in
-- reverse order, or nil if the
-- goal is unreachable.

-- from the graphics codex
-- http://graphicscodex.com
function find_path
    (start,
    goal,
    estimate,
    edge_cost,
    neighbors, 
    node_to_id, 
    graph)
     
    -- the final step in the
    -- current shortest path
    local shortest, 
    -- maps each node to the step
    -- on the best known path to
    -- that node
    best_table = {
    last = start,
    cost_from_start = 0,
    cost_to_goal = estimate(start, goal, graph)
    }, {}

    best_table[node_to_id(start, graph)] = shortest

    -- array of frontier paths each
    -- represented by their last
    -- step, used as a priority
    -- queue. elements past
    -- frontier_len are ignored
    local frontier, frontier_len, goal_id, max_number = {shortest}, 1, node_to_id(goal, graph), 32767.99

    -- while there are frontier paths
    while frontier_len > 0 do

        -- find and extract the shortest path
        local cost, index_of_min = max_number
        for i = 1, frontier_len do
            local temp = frontier[i].cost_from_start + frontier[i].cost_to_goal
            if (temp <= cost) index_of_min,cost = i,temp
        end
     
        -- efficiently remove the path 
        -- with min_index from the
        -- frontier path set
        shortest = frontier[index_of_min]
        frontier[index_of_min], shortest.dead = frontier[frontier_len], true
        frontier_len -= 1
    
        -- last node on the currently
        -- shortest path
        local p = shortest.last
        if node_to_id(p, graph) == goal_id then
            -- we're done.  generate the
            -- path to the goal by
            -- retracing steps. reuse
            -- 'p' as the path
            p = {goal}
    
            while shortest.prev do
                shortest = best_table[node_to_id(shortest.prev, graph)]
                add(p, shortest.last)
            end

            -- we've found the shortest path
            return p
        end -- if
    
        -- consider each neighbor n of
        -- p which is still in the
        -- frontier queue
        for n in all(neighbors(p, graph)) do
            -- find the current-best
            -- known way to n (or
            -- create it, if there isn't
            -- one)
            -- printh(stat(0))
            local id = node_to_id(n, graph)
            local old_best, new_cost_from_start =
            best_table[id],
            shortest.cost_from_start + edge_cost(p, n, graph)
       
            if not old_best then
                -- create an expensive
                -- dummy path step whose
                -- cost_from_start will
                -- immediately be
                -- overwritten
                old_best = {
                    last = n,
                    cost_from_start = max_number,
                    cost_to_goal = estimate(n, goal, graph)
                }
    
                -- insert into queue
                frontier_len += 1
                frontier[frontier_len], best_table[id] = old_best, old_best
            end -- if old_best was nil
    
            -- have we discovered a new
            -- best way to n?
            if not old_best.dead and old_best.cost_from_start > new_cost_from_start then
                -- update the step at this
                -- node
                old_best.cost_from_start, old_best.prev = new_cost_from_start, p
            end -- if
        end -- for each neighbor
    end -- while frontier not empty
    
     -- unreachable, so implicitly
     -- return nil
end
    
-->8
map_arr = {} -- create the matrix
npc_arr = {} -- contains all agents in the village          
house_arr = {}

function init_map()
    for i=1,128 do
        map_arr[i] = {}     -- create a new row
        for j=1,128 do
            map_arr[i][j] = new_tile(1) -- object type
        end
    end
end

function init_house_arr(num_houses)
    for i=1, num_houses do
        add(house_arr, {x=flr(rnd(127) + 1),y=flr(rnd(127) + 1)})
    end
end

function init_npc_arr()
    npc_arr = {}
    for house in all(house_arr) do
        add(npc_arr, new_npc(house.x, house.y))
    end
end

function _init()
    poke(0x5f2d, 1) -- initiate mouse listener
    init_map()
    init_house_arr(20)
    init_npc_arr()

    -- Sets random paths for all npcs
    for npc in all(npc_arr) do
        -- npc:set_path({flr(rnd(128)),flr(rnd(128))})
        target_house = rnd(house_arr)
        npc:set_path(target_house.x, target_house.y)
    end
end

function map_cost(from, node, graph)
    return map_arr[node.x][node.y].cost
end


function map_neighbors(pos, map_arr)
    local neighbors = {}
    
    if (map_arr[pos.x][pos.y - 1] != nil) add(neighbors, {x=pos.x, y=pos.y - 1})
    if (map_arr[pos.x][pos.y + 1] != nil) add(neighbors, {x=pos.x, y=pos.y + 1})
    if (map_arr[pos.x - 1][pos.y] != nil) add(neighbors, {x=pos.x - 1, y=pos.y})
    if (map_arr[pos.x + 1][pos.y] != nil) add(neighbors, {x=pos.x + 1, y=pos.y})

    if (map_arr[pos.x + 1][pos.y + 1] != nil) add(neighbors, {x=pos.x + 1, y=pos.y + 1})
    if (map_arr[pos.x - 1][pos.y + 1] != nil) add(neighbors, {x=pos.x - 1, y=pos.y + 1})
    if (map_arr[pos.x - 1][pos.y - 1] != nil) add(neighbors, {x=pos.x - 1, y=pos.y - 1})
    if (map_arr[pos.x + 1][pos.y - 1] != nil) add(neighbors, {x=pos.x + 1, y=pos.y - 1})

    return neighbors
end

-- estimates the cost from a to
-- b by assuming that the graph
-- is a regular grid and all
-- steps cost 1.
function euclidean_distance(a, b)
    -- dx = (abs(a.x - b.x))
    return sqrt((a.x - b.x)^2 + (a.y - b.y)^2)
end

-->8
-- draw methods
-- draws the entire world

function _draw()
    _set_fps(60)
    cls()
    draw_world(map_arr)
  
    for house in all(house_arr) do
        mpset(house.x, house.y, 1)
    end

    for npc in all(npc_arr) do
        -- draw_path(npc.path)
        npc:draw()
    end
end 

function draw_path(path)
    local p = path[1]
    for i = 2, #path do
        local n = path[i]
        mpset(p.x, p.y, 7)
        p = n
    end
end

function draw_world(map_arr)
    for x = 1, 128 do
        for y = 1, 128 do
            draw_tile(map_arr[x][y], x, y)
        end
    end
end

-- Draws a tile
function draw_tile(tile, x, y)
    if tile.cost < 0.6 then
        mpset(x, y, 6)
    else
        mpset(x, y, 3)
    end
end

-->8
-- update methods
function _update()
    update_world(map_arr)


    for npc in all(npc_arr) do
        npc:update()
    end
end

function update_world(map_arr)
    for x = 1, 128 do
        for y = 1, 128 do
            update_tile(map_arr[x][y])
        end
    end
end

function new_tile(cost)
    tile = {}
    tile.cost = cost -- cost determines tile type

    return tile
end



-- Updates cost of tile
function update_tile(tile)
    regrow_rate = 0.0025
    if tile.cost < 1 - regrow_rate then
        tile.cost += regrow_rate
    else
        tile.cost = 1
    end
end

-- Use tile
function use_tile(tile)
    use_decrement = 0.4
    min_cost = 0.25
    if tile.cost > min_cost then
        tile.cost -= use_decrement
    end
    if tile.cost <= min_cost then
        tile.cost = min_cost
    end
end

-- This is a pathfinding character that walks to the target location using a path that is found using astar algorithm
function new_npc(x,y)
    npc = {}
    npc.x = x
    npc.y = y

    npc.target_x = nil
    npc.target_y = nil

    npc.path = {} -- used for pathfinding
    npc.path_seg = 1

    npc.set_path = function(this, target_x, target_y)
        start = {x = this.x, y = this.y}
        target = {x = target_x, y = target_y}

        --(start, goal, estimate, edge_cost, neighbors, node_to_id, graph)
        this.path = find_path(start,
                            target,
                            euclidean_distance,
                            map_cost,
                            map_neighbors,
                            function (node) return shl(node.y, 8) + node.x end,
                            map_arr)
        this.path_seg = #this.path
    end

    npc.update = function(this)
        -- npc has reached target
        if this.path[this.path_seg] == nil then
            -- calculate new path
            target_house = rnd(house_arr)
            this:set_path(target_house.x, target_house.y)
            this.path_seg = #this.path
            return
        end

        -- when no target has been reached update player position
        this.x = this.path[this.path_seg].x
        this.y = this.path[this.path_seg].y
        -- make sure to update cost of tile that we use
        use_tile(map_arr[this.x][this.y])

        this.path_seg -= 1
    end

    npc.draw = function(this)
        mpset(this.x, this.y, 16)
        mpset(this.target_x, this.target_y, 15)
    end

    return npc
end


__gfx__
00000000666d666666666d6d00eeaa9000088e003333333333333333333333331111111111111111d1113333d111111111113333311111113333333300000000
00000000d6666666d666666607eafaa900e7e8e03333b3333333333333333333111111111111b111d1113333d111111111113333331111113333333300000000
007007006d6d666d6d6d6d6d87fa1f1008fe88883333b33333333333333b3333111111111111b111d1113333d11111111111333333311111d333333300000000
00077000ddddddddd6666666070ffff408e888f43b3b1bb333333333333bb333333333333b1b1bb3d1113333511133333333333333333333d333333300000000
000770005ddd55dd666d6d6607eef80400888e423bb1bb13333333333bb1b1bb333333333bb1bb13d1113333d11133333333333333333333d133333300000000
0070070055ddddd566d6d6d6ccc494840008842133b333333333333333bb3bb13333333333b33333d1113333d11133333333333333333333d113333300000000
00000000ddd5555d666d66660f8ee804000242103333333333333333333333333333333333333333d11133335111333333333333333333335111333300000000
00000000d5555555d66666d600400400000011003333333333333333333333333333333333333333d1113333511133333333333333333333d111333300000000
1100000000000000000000000000000000000000f3333f3300000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000003f333f3300000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000003f3f391300000000000000000000000000000000000000000000000000000000000000000000000000000000
1777100000000000000000000000000000000000393f31f300000000000000000000000000000000000000000000000000000000000000000000000000000000
1777710000000000000000000000000000000000393933f900000000000000000000000000000000000000000000000000000000000000000000000000000000
17711000000000000000000000111110000000003919f39900000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000000000000000000000111111000000003119f33900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000010011000000003333133100000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0201010102020201010201010101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020b09080202020b08020b090808080200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a06020202020a06020a0202020e0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a0601010101010e020a0102020a0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a060d080808080c020a0d02020a0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a050607020e020201020e02020a0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a151506010a01010b010a02020a0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a0605060d0c0d080c0d0c0202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a060606060606071506060101010200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a0602020e0606061515150d08080200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a0601010a1515150606060606060200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a150d090c0602020202020e07060200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a061515060601010101010a06060200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020a06150606060d080908080c06060200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
