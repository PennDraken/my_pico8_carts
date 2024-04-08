--track
function node(x,y,r)
    local scale=1
    local o={
        x=x*scale,
        y=y*scale,
        r=r*scale
    }
    return o
end

function load_track1()
    local track={}
    add(track, node(-100,0,40))
    add(track, node(200,0,40))
    add(track, node(200,200,40))
    add(track, node(120,500,40))
    add(track, node(300,-200,40))
    return track
end

function load_track2()
    local track={}
    add(track, node(10,50,4))
    add(track, node(100,20,4))
    add(track, node(100,50,8))
    add(track, node(120,60,4))
    add(track, node(39,90,4))
    return track
end

function draw_track(track)
    -- Iterate through each node in the track
    for i = 1, #track - 1 do
        -- Draw a line between current node and next node
        --line(track[i].x, track[i].y, track[i + 1].x, track[i + 1].y, 7)
        local p1 = track[i]
        local p2 = track[i+1]
        --circ(p1.x,p1.y,p1.r,7)
        draw_road_segment(p1.x, p1.y, p1.r, p2.x, p2.y, p2.r)
    end
    -- Draw a line between last node and first node to close the track
    
end

function draw_road_segment(x1, y1, r1, x2, y2, r2)
    -- Rotate the road points
    local rotated_x1, rotated_y1 = rotatePoint(x1, y1, camera.x + 64, camera.y + 64, camera.angle)
    local rotated_x2, rotated_y2 = rotatePoint(x2, y2, camera.x + 64, camera.y + 64, camera.angle)

    -- Apply camera offset
    rotated_x1 = rotated_x1 - camera.x
    rotated_y1 = rotated_y1 - camera.y
    rotated_x2 = rotated_x2 - camera.x
    rotated_y2 = rotated_y2 - camera.y

    -- Calculate angle of the road segment
    local angle = atan2(rotated_x2 - rotated_x1, rotated_y2 - rotated_y1)

    -- Draw left edge
    local lx1 = rotated_x1 + cos(angle + 0.25) * r1
    local ly1 = rotated_y1 + sin(angle + 0.25) * r1
    local lx2 = rotated_x2 + cos(angle + 0.25) * r2
    local ly2 = rotated_y2 + sin(angle + 0.25) * r2
    line(lx1, ly1, lx2, ly2, 7)

    -- Draw right edge
    local rx1 = rotated_x1 + cos(angle - 0.25) * r1
    local ry1 = rotated_y1 + sin(angle - 0.25) * r1
    local rx2 = rotated_x2 + cos(angle - 0.25) * r2
    local ry2 = rotated_y2 + sin(angle - 0.25) * r2
    line(rx1, ry1, rx2, ry2, 7)
end
