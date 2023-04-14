-- DATA REGARDING TILE OBJECTS
-- contains tile data for game
function new_tile(x, y, type, rotation)
    t={}
    t.x = x -- not pixel based but tile based
    t.y = y
    t.type = type
    t.rotation = rotation -- 0,1,2,3
    t.connections_arr = {}
    for i=1,#type.connection_points do
        connection = type.connection_points[i]
        temp_connection = {connection[(0-rotation)%4 + 1],connection[(1-rotation)%4 + 1],connection[(2-rotation)%4 + 1],connection[(3-rotation)%4 + 1]}
        add(t.connections_arr, temp_connection)
    end

    t.rotate = function(this)
        -- updates rotation int
        this.rotation = (this.rotation + 1) % #this.type.rotation_ids
        printh("Rotation is "..this.rotation)

        -- rotates the connections strings
        -- remember that connections is an array so we need to iterate through all connection in connections
        temp_connections = {}
        for i=1,#this.connections_arr do
            connection = this.connections_arr[i]
            temp_connection = {connection[4],connection[1],connection[2],connection[3]}
            add(temp_connections, temp_connection)
        end
        this.connections_arr = temp_connections
    end

    t.draw = function(this)
        curr_id = this.type.rotation_ids[this.rotation + 1]
        bspr(curr_id, (this.x - 1) * 16, (this.y - 1) * 16)
    end

    -- determines if a connection is possible, returns true or false
    t.check_connection = function(this, tile)
        if tile == nil then
            return true
            spr(0, )
        end
        
        connection = this.connections_arr[1]
        other_connection = tile.connections_arr[1]
        -- other tile is above
        if     tile.x == this.x and tile.y == this.y - 1 then
            if connection[1] != other_connection[3] then
                return false
            end
        -- other tile is to the right
        elseif tile.x == this.x + 1 and tile.y == this.y then
            if connection[2] != other_connection[4] then
                return false
            end
        -- other tile is below
        elseif tile.x == this.x and tile.y == this.y + 1 then
            if connection[3] != other_connection[1] then
                return false
            end
        -- other tile is to the left
        elseif tile.x == this.x - 1 and tile.y == this.y then
            -- printh("connection left"..connection[4])
            -- printh("connection right"..other_connection[2])
            if connection[4] != other_connection[2] then
                return false
            end
        end
        -- if one connection failed we would have returned false by now
        printh("check connection returned true")
        return true
    end
    
    return t
end

-- this is used to create templates for different kinds of tiles that will be used in the game
function new_tile_type(rotation_ids, connection_points)
    type={}
    type.rotation_ids = rotation_ids -- stores the sprite numbers for different rotations
    type.connection_points = connection_points -- table storing data regarding how you can connect the item

    return type
end


--TYPE DEFINITIONS
trunk = new_tile_type({14}, {{"branch","branch","branch","branch"}})

branch_straight = new_tile_type({32, 34}, {{nil,"branch",nil,"branch"}})
branch_curve = new_tile_type({0, 2, 4, 6}, {{"branch","branch",nil,nil}})
branch_fourway = new_tile_type({10}, {{"branch","branch","branch","branch"}})

branch_water = new_tile_type({36, 38, 40, 42}, {{nil, "water", nil, "branch"}})

water_full = new_tile_type({64}, {{"water","water","water","water"}})
water_edge = new_tile_type({66, 68, 70, 72}, {{nil,"water",nil,nil}})

-- for pickups to hand
probability_table = {
    {trunk, 1},
    {branch_straight,4},
    {branch_curve,   4},
    {branch_fourway, 3},
    {branch_water,   4},

    {water_full,     4},
    {water_edge,     2},
}

selected_tile = new_tile(flr(cx/16)+1, flr(cy/16)+1, branch_straight, 0)