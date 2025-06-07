--UPDATE--------------------------------------------------
function _update60()
    sort_notes(notes)
    m:update()
    update_scroll()
    --snap offset
    offset_y = max(0, offset_y)
    --creating notes
    note_hovered = get_note_at_position(m.x, m.y, notes, offset_x, offset_y, step_width, key_height)
    local o = xy_to_note_step(m.x, m.y, offset_x, offset_y, step_width, key_height)
    local step = o[1]
    local key  = o[2]

    -- PIANO ROLL PRESSED
    if (m.lclick and m.x >= offset_x) then--TODO use lheld instead
        --if pressing note
        if (note_hovered and not temp_note and not state.note_selected) then
            --start dragging note
            state = {note_selected = note_hovered, step_offset = step - note_hovered.step}
        elseif (state.note_selected) then
            --keep dragging note
            state.note_selected.step = step - state.step_offset
            state.note_selected.key = key
        --if no note has been created and not hovering over a note
        elseif (not temp_note) and m.x >= offset_x then
            --create new note at position
            temp_note = new_note(key, step, 1)
        --if note has already been created
        elseif (temp_note) then
            --change length of note
            temp_note.length = max(1, step - temp_note.step + 1)
            local end_step = temp_note.step + temp_note.length - 1
            if step < temp_note.step then
                --if step is before note, move note to step
                temp_note.step = step
                temp_note.length = end_step - step + 1
            end
        end

    -- PIANO PRESSED (PLAY NOTE DIRECTLY)
    elseif (m.lclick and m.x < offset_x and not temp_note) then
        music(-1)--stop music playback
        --play note
        local key = xy_to_note_step(m.x, m.y, offset_x, offset_y, step_width, key_height)[2]
        local note = new_note(key, 0, 1)
        local buffer = new_music_buffer()
        buffer:add_note(note)
        buffer:write_song()
        sfx(0)
    end

    --MOUSE RELEASED
    if (not m.lclick) then
        --if mouse is released
        if temp_note or state.note_selected then
            add(notes, temp_note)
            local buffer = new_music_buffer()
            for i=1, #notes do
                local note = notes[i]
                --add note to buffer
                buffer:add_note(note)
            end
            buffer:write_song()
            temp_note = nil
        end
        state = {}

    end

    --DELETE NOTE
    if (m.rclick) then
        --remove note
        if note_hovered then
            for i=1, #notes do
                if notes[i] == note_hovered then
                    del(notes, notes[i])
                    buffer = new_music_buffer()
                    for i=1, #notes do
                        local note = notes[i]
                        --add note to buffer
                        buffer:add_note(note)
                    end
                    buffer:write_song()
                    break
                end
            end
            note_hovered = nil
        end
    end
    --play music
    if btnp(5) then
        buffer = new_music_buffer()
        --notes = sort(notes, function(a,b) return a.step < b.step end)
        for i=1, #notes do
            local note = notes[i]
            --add note to buffer
            buffer:add_note(note)
        end
        buffer:write_song()
        music(0)
    end
end

function update_scroll()
    --scrolling
    if (m.rollup) then
        offset_y-=flr(key_height/2)
    end
    if (m.rolldown) then
        offset_y+=flr(key_height/2)
    end
end

function get_note_at_position(x, y, notes, offset_x, offset_y, step_width, key_height)
    --returns note at position
    local o = xy_to_note_step(x, y, offset_x, offset_y, step_width, key_height)
    local step = o[1]
    local key  = o[2]
    for note in all(notes) do
        if (step >= note.step and step <= note.step + note.length - 1 and key == note.key) then
            return note
        end
    end
    return nil
end