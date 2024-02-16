pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- faces of the isosphere
local faces = {
    {1, 3, 5},
    {3, 2, 5},
    {2, 4, 5},
    {4, 1, 5},
    {1, 3, 6},
    {3, 2, 6},
    {2, 4, 6},
    {4, 1, 6}
}

-- initialize variables
zoom = 50
angle_x = 0
angle_y = 0
rotation_speed = 0.005
subdivision_level = 2


function _update()
    -- update angles for rotation along both axes
    angle_x = angle_x + rotation_speed
    angle_y = angle_y + rotation_speed
end

function _draw()
    -- clear screen
    cls()

    -- draw isosphere
    draw_isosphere()
end

function draw_isosphere()
    -- vertices of the isosphere
    local vertices = {
        {1, 0, 0},
        {-1, 0, 0},
        {0, 1, 0},
        {0, -1, 0},
        {0, 0, 1},
        {0, 0, -1}
    }

    -- apply rotation to vertices along both axes
    local rotated_vertices = {}
    for i, vertex in ipairs(vertices) do
        local rotated_vertex = rotate_vertex(vertex, angle_x, angle_y)
        rotated_vertices[i] = rotated_vertex
    end

    -- subdivide faces of the isosphere
    local subdivide_faces = {}
    for _, face in ipairs(faces) do
        local v1 = rotated_vertices[face[1]]
        local v2 = rotated_vertices[face[2]]
        local v3 = rotated_vertices[face[3]]
        subdivide_face(subdivide_faces, v1, v2, v3, subdivision_level)
    end

    -- draw faces
    for _, face in ipairs(subdivide_faces) do
        local v1 = face[1]
        local v2 = face[2]
        local v3 = face[3]
        draw_triangle(v1, v2, v3)
    end
end

function draw_triangle(v1, v2, v3)
    -- project vertices onto 2d screen
    local x1, y1 = project_vertex(v1)
    local x2, y2 = project_vertex(v2)
    local x3, y3 = project_vertex(v3)

    -- draw triangle
    line(x1, y1, x2, y2, 7)
    line(x2, y2, x3, y3, 7)
    line(x3, y3, x1, y1, 7)
end

function project_vertex(vertex)
    -- apply zoom and center the isosphere on the screen
    local x = 64 + vertex[1] * zoom
    local y = 64 + vertex[2] * zoom
    return x, y
end

function rotate_vertex(vertex, angle_x, angle_y)
    -- rotate vertex along x-axis
    local y1 = vertex[2] * cos(angle_x) - vertex[3] * sin(angle_x)
    local z1 = vertex[2] * sin(angle_x) + vertex[3] * cos(angle_x)
    -- rotate vertex along y-axis
    local x2 = vertex[1] * cos(angle_y) + z1 * sin(angle_y)
    local z2 = -vertex[1] * sin(angle_y) + z1 * cos(angle_y)
    return {x2, y1, z2}
end

function subdivide_face(subdivide_faces, v1, v2, v3, level)
    if level == 0 then
        add(subdivide_faces, {v1, v2, v3})
    else
        local v12 = normalize(mix(v1, v2))
        local v23 = normalize(mix(v2, v3))
        local v31 = normalize(mix(v3, v1))
        subdivide_face(subdivide_faces, v1, v12, v31, level - 1)
        subdivide_face(subdivide_faces, v2, v23, v12, level - 1)
        subdivide_face(subdivide_faces, v3, v31, v23, level - 1)
        subdivide_face(subdivide_faces, v12, v23, v31, level - 1)
    end
end

function mix(v1, v2)
    return {(v1[1] + v2[1]) / 2, (v1[2] + v2[2]) / 2, (v1[3] + v2[3]) / 2}
end

function normalize(v)
    local length = sqrt(v[1]^2 + v[2]^2 + v[3]^2)
    return {v[1] / length, v[2] / length, v[3] / length}
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
