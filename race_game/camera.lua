function init_camera()
    local c={}
    c.x=-64
    c.y=-64
    c.cx=c.x+64
    c.cy=c.y+64
    c.angle=0
    c.scale=1--scale factor

    c.target=function (this, x, y, angle)--targets the camera at a position and angle
        local speed=0.1
        this.cx = this.cx + (x - this.cx) * speed--TODO 
        this.cy = this.cy + (y - this.cy) * speed
        -- Calculate the shortest angle difference
        local angle_diff = angle - this.angle
        angle_diff = (angle_diff + 1.5) % 1 - 0.5
        -- Adjust the angle towards the target
        local angle_speed = 0.04
        this.angle = this.angle + angle_diff * angle_speed
        -- Ensure the angle remains between 0 and 1
        this.angle = (this.angle + 1) % 1
        --set camera position from center
        this.x=this.cx-64
        this.y=this.cy-64
    end
    return c
end