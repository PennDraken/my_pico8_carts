--this is the main entry point for the pico-8 midi editor/ player
function _init()
    offset_y = 0
    m = init_mouse()
    key_scale = {0,2,3,5,7,8,10}--minor
    notes = {new_note(30, 0, 2), new_note(20, 0, 2), new_note(25, 4, 2), new_note(30, 5, 6)}
    note_hovered = nil
    temp_note = nil
    key_height=5
    step_width=3
    offset_x = 8
end

function init_mouse()
    poke(0x5F2D, 1)
    m = {
        x = stat(32),
        y = stat(33),
        lclick   = false,
        rclick   = false,
        mclick   = false,
        rollup   = false,
        rolldown = false
    }
    m.update=function(this)
        this.x        = stat(32)
        this.y        = stat(33)
        this.lclick   = stat(34)==1
        this.rclick   = stat(34)==2
        this.mclick   = stat(34)==4
        this.rollup   = stat(36)>0
        this.rolldown = stat(36)<0

    end
    m.draw=function(this)
        if this.lclick then
            spr(2,this.x,this.y)
        elseif this.rclick then
            spr(3,this.x,this.y)
        else
            spr(1,this.x,this.y)
        end
    end

    return m
end

function xy_to_note_step(x, y, offset_x, offset_y, step_width, key_height)
    --calculate step
    local norm_x = x - offset_x
    local step = flr(norm_x/step_width)
    local norm_y = y + offset_y
    local key = flr(norm_y/key_height)
    return {step, key}
end

function new_note(key, step, length)
    note = {}
    note.key    = key
    note.step   = step
    note.length = length
    note.draw = function(this, offset_x, offset_y, step_width, key_height)
        this.step = max(1, this.step)
        local x = offset_x + this.step * step_width
        local y = -offset_y + this.key * key_height
        rectfill(x + 1, y + 1, x + (this.length) * step_width - 1, y + key_height - 1, 10)
    end
    note.update = function(this)

    end
    return note
end

--RENDER--------------------------------------------------
function _draw()
    cls()
    draw_piano_side(offset_y, offset_x - 1, key_height)
    draw_input_grid(offset_y, offset_x, key_height, step_width)
    --highlight step and key
    local o = xy_to_note_step(m.x, m.y, offset_x, offset_y, step_width, key_height)
    local step = o[1]
    local key  = o[2]
    local x0 =  offset_x + step * step_width
    local y0 = -offset_y + key * key_height
    rectfill(x0 + 1, y0 + 1, x0 + step_width - 1, y0 + key_height - 1, 13)
    for note in all(notes) do
        note:draw(offset_x, offset_y, step_width, key_height)
    end
    if temp_note then temp_note:draw(offset_x, offset_y, step_width, key_height) end

    m:draw()
    ?stat(34),7
end

function draw_piano_side(offset_y, w, key_height)
    --takes in width w as pixels wide for piano
    rect(0,0,w,127,1)
    --draw rects
    for i=0,60 do
        local x0 = 0
        local x1 = w
        local y0 = i * key_height - offset_y
        local y1 = (i + 1) * key_height - offset_y
        rect(x0, y0, x1, y1, 1)
        if i%8==0 then
            line(x0, y0 + 1, x0, y1 - 1, 13)
        end
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

--UPDATE--------------------------------------------------
function _update60()
    m:update()
    --scrolling
    if (m.rollup) then
        offset_y-=1
    end
    if (m.rolldown) then
        offset_y+=1
    end
    --snap offset
    offset_y = max(0,offset_y)
    --creating notes
    local o = xy_to_note_step(m.x, m.y, offset_x, offset_y, step_width, key_height)
    local step = o[1]
    local key  = o[2]
    if (m.lclick) then--TODO use lheld instead
        --if pressing note
        if (note_hovered and not temp_note) then

        --if no note has been created and not hovering over a note
        elseif (not temp_note) then
            --create new note at position
            temp_note = new_note(key, step, 1)
        --if note has already been created
        elseif (temp_note) then
            --change length of note
            temp_note.length = step - temp_note.step
        end
    else
        if temp_note then
            add(notes, temp_note)
            temp_note = nil
        end
    end
end