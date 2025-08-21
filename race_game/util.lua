-- Function to rotate a point (x, y) around another point (cx, cy) by an angle (in radians)
function rotatePoint(x, y, cx, cy, angle)
    local angle=angle%1
    -- Calculate distance from the center to the point
    local dx = x - cx
    local dy = y - cy
    
    -- Apply rotation
    local cosAngle = cos(angle)
    local sinAngle = sin(angle)
    local rotatedX = cosAngle * dx - sinAngle * dy + cx
    local rotatedY = sinAngle * dx + cosAngle * dy + cy
    
    -- Return rotated coordinates
    return rotatedX, rotatedY
end