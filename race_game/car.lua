player_states={
    THRUSTING=0,
    NON_THRUSTING=1,
    STOPPED_THRUSTING=2
}
--initialises a car object
function init_car(x, y, player_number)
    local o={}
    o.x=x
    o.y=y
    o.dx=0
    o.dy=0
    o.speed=0
    o.acc=0.1
    o.angle_speed=0.03
    o.angle=0
    o.player_number=player_number
    o.model=car_model
    o.state=player_states.NON_THRUSTING
    o.t_state_change=0
    o.draw=function(this)
        -- TODO simplify this logic
        if this.state == player_states.NON_THRUSTING then
            spr(64,60,80)
        elseif this.state == player_states.THRUSTING then
            local ns = {65,66,67}
            local i = flr(t/3)
            local n = ns[i % #ns + 1]
            spr(n,60,80)
            spr(n+16,60,88)
        elseif this.state == player_states.STOPPED_THRUSTING then
            local dt = t - this.t_state_change
            local ns = {97,98,99,100,101,102}
            local i = flr(dt/3)
            local i = i + 1
            if i > #ns then
                this.state = player_states.NON_THRUSTING
                spr(64,60,80)
            else
                local n = ns[i] 
                spr(n,60,80)    
                spr(n+16,60,88) 
            end
        end
        -- draw_model(this.model, this.x, this.y, this.angle)
    end
    o.update=function(this)
        local speed = sqrt(this.dx^2 + this.dy^2)
        this.speed = speed

        if btn(0) then
            this.angle+=this.angle_speed
        elseif btn(1) then
            this.angle-=this.angle_speed
        end
        
        if this.state == player_states.THRUSTING then
            -- this will be set to thrusting in if btn(2) if still thrusting
            this.state = player_states.STOPPED_THRUSTING
            this.t_state_change = t
        end

        if btn(2) then
            this.state = player_states.THRUSTING
            this.dx+=this.acc*cos(this.angle)
            this.dy+=this.acc*sin(this.angle)
            local offs = 25
            local dx = cos(-camera.angle - 0.25) * offs
            local dy = sin(-camera.angle - 0.25) * offs
            for i=0,10 do
                smoke(camera.x + 64 + dx, camera.y + 64 + dy, -this.dx, -this.dy)
            end
        end
        if btnp(4) then
            this.dx+=this.acc*cos(this.angle-0.5)
            this.dy+=this.acc*sin(this.angle-0.5)
            local speed = sqrt(this.dx^2 + this.dy^2)
            local offs = 20
            local dx = cos(-camera.angle - 0.25) * offs
            local dy = sin(-camera.angle - 0.25) * offs
            local px = -cos(-camera.angle - 0.25)
            local py = -sin(-camera.angle - 0.25)
            for i=0,2 do
                fire(camera.x + 64 + dx, camera.y + 64 + dy, 10 * px, 10 * py)
            end
        end
        this.x+=this.dx
        this.y+=this.dy
    end
    return o
end

scale = 0.5
car_model={
    {scale * 10, scale * -5},
    {scale * 10,scale * 5},
    {scale * -10,scale * 10},
    {scale * -10,scale * -10}
}

-- Function to draw a model rotated around a point
function draw_model(model, x, y, angle)
    -- Create a new model rotated around its center with the given angle
    local rotated_model = rotate_model(model, angle)
    
    -- Rotate and draw using global variables camera.x, camera.y, camera.angle
    for i = 1, #rotated_model-1 do
        local x0 = rotated_model[i][1]
        local y0 = rotated_model[i][2]
        local x1 = rotated_model[i+1][1]
        local y1 = rotated_model[i+1][2]
        my_line(x + x0, y + y0, x + x1, y + y1, 8)
    end
    local x0 = rotated_model[1][1]
    local y0 = rotated_model[1][2]
    local x1 = rotated_model[#rotated_model][1]
    local y1 = rotated_model[#rotated_model][2]
    my_line(x + x0, y + y0, x + x1, y + y1, 8)
end

--rotates a model around itself
function rotate_model(model, angle)
    -- Calculate center point of the model
    local center_x, center_y = 0, 0
    for i = 1, #model do
        center_x = center_x + model[i][1]
        center_y = center_y + model[i][2]
    end
    center_x = center_x / #model
    center_y = center_y / #model

    -- Rotate each point of the model around the center point
    local rotated_model = {}
    for i = 1, #model do
        local px, py = rotatePoint(model[i][1], model[i][2], center_x, center_y, angle)
        rotated_model[i] = {px, py}
    end

    return rotated_model
end