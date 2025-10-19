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

function load_track_bad()
    local track = {}
    local r = 30

    -- smooth S-curve
    add(track, node(-120, 0, r))
    add(track, node(-60, 20, r))
    add(track, node(0, 60, r))
    add(track, node(60, 120, r))
    add(track, node(120, 160, r))
    add(track, node(180, 180, r))
    add(track, node(240, 160, r))
    add(track, node(280, 120, r))
    add(track, node(300, 60, r))
    add(track, node(280, 0, r))
    add(track, node(240, -40, r))
    add(track, node(180, -60, r))
    add(track, node(120, -40, r))
    add(track, node(60, 0, r))
    add(track, node(0, 40, r))
    add(track, node(-60, 80, r))
    add(track, node(-120, 100, r))

    return track
end

function load_track1()
    local track = {}
    local r = 30
    add(track, node(0, 0, r))
    add(track, node(80, 0, r))
    add(track, node(160, 20, r))
    add(track, node(220, 80, r))
    add(track, node(240, 160, r))
    add(track, node(220, 240, r))
    add(track, node(160, 300, r))
    add(track, node(80, 320, r))
    add(track, node(0, 300, r))
    add(track, node(-60, 240, r))
    add(track, node(-80, 160, r))
    add(track, node(-60, 80, r))
    add(track, node(0, 20, r))
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

function load_track3()
    local track={}
    add(track, node(-100,0,30))
    add(track, node(200,0,20))
    add(track, node(200,200,30))
    add(track, node(120,500,10))
    add(track, node(120,1000,5))
    add(track, node(200,500,10))
    add(track, node(120,500,10))

    return track
end

function draw_track(track)
    -- Iterate through each node in the track
    for i = 1, #track - 1 do
        -- Draw a line between current node and next node
        local p1 = track[i]
        local p2 = track[i+1]
        draw_road_segment(p1.x, p1.y, p1.r, p2.x, p2.y, p2.r)
    end

    for i = 1, #track - 2 do
        -- Draw lines between circles
        local p1 = track[i]
        local p2 = track[i+1]
        local p3 = track[i+2]
        draw_road_node(p1, p2, p3)
    end
end

function draw_road_segment(x1, y1, r1, x2, y2, r2)
    -- Rotate the road points
    local rotated_x1, rotated_y1 = rotatePoint(x1, y1, camera.x + 64, camera.y + 64, camera.angle)
    local rotated_x2, rotated_y2 = rotatePoint(x2, y2, camera.x + 64, camera.y + 64, camera.angle)

    -- Apply camera offset
    local rotated_x1 = rotated_x1 - camera.x
    local rotated_y1 = rotated_y1 - camera.y
    local rotated_x2 = rotated_x2 - camera.x
    local rotated_y2 = rotated_y2 - camera.y

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

    --circ(rotated_x1,rotated_y1,r1,6)
    --circ(rotated_x2,rotated_y2,r2,6)
end

function draw_road_node(p1, p2, p3)
    -- Rotate the road points
    local rotated_x1, rotated_y1 = rotatePoint(p1.x, p1.y, camera.x + 64, camera.y + 64, camera.angle)
    local rotated_x2, rotated_y2 = rotatePoint(p2.x, p2.y, camera.x + 64, camera.y + 64, camera.angle)
    local rotated_x3, rotated_y3 = rotatePoint(p3.x, p3.y, camera.x + 64, camera.y + 64, camera.angle)

    -- Apply camera offset
    local rotated_x1 = rotated_x1 - camera.x
    local rotated_y1 = rotated_y1 - camera.y
    local rotated_x2 = rotated_x2 - camera.x
    local rotated_y2 = rotated_y2 - camera.y
    local rotated_x3 = rotated_x3 - camera.x
    local rotated_y3 = rotated_y3 - camera.y

    -- Calculate angle of the road segment
    local angle1 = atan2(rotated_x2 - rotated_x1, rotated_y2 - rotated_y1)
    local angle2 = atan2(rotated_x3 - rotated_x2, rotated_y3 - rotated_y2)

    -- Left edge
    local lxa = rotated_x2 + cos(angle1 + 0.25) * p2.r
    local lya = rotated_y2 + sin(angle1 + 0.25) * p2.r

    local lxb = rotated_x2 + cos(angle2 + 0.25) * p2.r
    local lyb = rotated_y2 + sin(angle2 + 0.25) * p2.r

    -- Right edge
    local rxa = rotated_x2 + cos(angle1 - 0.25) * p2.r
    local rya = rotated_y2 + sin(angle1 - 0.25) * p2.r

    local rxb = rotated_x2 + cos(angle2 - 0.25) * p2.r
    local ryb = rotated_y2 + sin(angle2 - 0.25) * p2.r


    line(lxa, lya, lxb, lyb, 7)
    line(rxa, rya, rxb, ryb, 7)
end