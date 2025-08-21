--RENDER--------------------------------------------------
function _draw()
    cls(0)
    --get mouse position
    local o = xy_to_note_step(m.x, m.y, offset_x, offset_y, step_width, key_height)
    local step = o[1]
    local key  = o[2]
    local x0 =  offset_x + step * step_width
    local y0 = -offset_y + key * key_height

    draw_piano_side(offset_y, offset_x - 1, key_height, key)
    draw_input_grid(offset_y, offset_x, key_height, step_width)

    if m.x > offset_x then
        rectfill(x0 + 1, y0 + 1, x0 + step_width - 1, y0 + key_height - 1, 13)--hover of mouse
    end
    if note_hovered then
        note_hovered:draw(offset_x, offset_y, step_width, key_height, 2, 0)
    end
    for note in all(notes) do
        note:draw(offset_x, offset_y, step_width, key_height)
    end
    if temp_note then temp_note:draw(offset_x, offset_y, step_width, key_height) end
    --draw step
    local patterns_played = stat(55)
    local currstep = patterns_played * 32 / step_length
    if currstep>=0 then
        currstep = currstep % 32
        x = currstep * step_width + offset_x
        line(x,0,x,128,7)
    end
    --?debug
    m:draw()
end

function draw_piano_side(offset_y, w, key_height, m_key)
    --takes in width w as pixels wide for piano
    rect(0,0,w,127,1)
    --draw rects
    for i=0,60 do
        local x0 = 0
        local x1 = w
        local y0 = i * key_height - offset_y
        local y1 = (i + 1) * key_height - offset_y
        if m_key==i then
            rectfill(x0, y0, x1, y1, 1)
        end
        rect(x0, y0, x1, y1, 1)
        if i%7==0 then--octave
            line(x0, y0 + 1, x0, y1 - 1, 13)
        end
        local key = xy_to_note_step(x0, y0, 0, offset_y, 0, key_height)[2]
        local note = new_note(key, 0, 0)
        local real_key = note:get_key()
        --convert key to name of note
        local names = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"}
        local key_name = names[(real_key % #names) + 1]
        print(key_name, x0 + 1, y0, 7)

    end
end

function draw_input_grid(offset_y, start_x, key_height, step_width)
    --draw rects
    for i=0,60 do
        for step=0,31 do
            local x=step*step_width+start_x
            local y=i*key_height-offset_y
            rect(x, y, x+step_width, y+key_height, 1)
            if step % 4==0 then
                line(x,0,x,127,13)
            end
            if step % 16==0 then
                line(x,0,x,127,2)
            end
        end
    end
end
