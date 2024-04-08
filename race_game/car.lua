--initialises a car object
function init_car(x, y, player_number)
    local o={}
    o.x=x
    o.y=y
    o.dx=0
    o.dy=0
    o.speed=0
    o.acc=0.1
    o.angle_speed=0.05
    o.angle=0
    o.player_number=player_number
    o.model=car_model
    o.draw=function(this)
        draw_model(this.model, this.x, this.y, this.angle)
    end
    o.update=function(this)
        if btn(0) then
            this.angle+=this.angle_speed
        elseif btn(1) then
            this.angle-=this.angle_speed
        end
        if btn(2) then
            this.dx+=this.acc*cos(this.angle)
            this.dy+=this.acc*sin(this.angle)
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