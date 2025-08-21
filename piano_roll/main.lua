--this is the main entry point for the pico-8 midi editor/ player
function _init()
    offset_y = 0
    m = init_mouse()
    key_scale = {0,2,3,5,7,8,10}--minor
    notes = {}
    --notes = {new_note(30, 0, 2), new_note(20, 0, 2), new_note(25, 4, 2), new_note(30, 5, 6)}
    note_hovered = nil
    temp_note = nil
    key_height=5
    step_width=3
    offset_x = 31
    max_key = 3*12+1
    step_length = 16
    state = {}
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
        rolldown = false,
        timelheld = 0,
    }
    m.update=function(this)
        this.x        = stat(32)
        this.y        = stat(33)
        this.lclick   = stat(34)==1
        if this.lclick then
            this.timelheld = this.timelheld + 1
        else
            this.timelheld = 0
        end
        this.rclick   = stat(34)==2
        this.mclick   = stat(34)==4
        this.rollup   = stat(36)>0
        this.rolldown = stat(36)<0

    end
    m.draw=function(this)
        local o=3
        if this.lclick and not state.note_selected then
            spr(2,this.x-o,this.y-o)
        elseif this.rclick then
            spr(3,this.x-o,this.y-o)
        elseif not note_hovered then
            spr(1,this.x-o,this.y-o)
        elseif note_hovered and not state.note_selected then
            spr(4,this.x-o,this.y-o)
        end
        if state.note_selected then
            --DRAG
            spr(5,this.x-o,this.y-o)
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
    note.draw = function(this, offset_x, offset_y, step_width, key_height, color, offset)
        if color==nil then color=10 end
        if offset==nil then offset=1 end--offset is the pixel offset (negative values inflate note)
        this.step = max(0, this.step)
        local x = offset_x + this.step * step_width
        local y = -offset_y + this.key * key_height
        rectfill(x + offset, y + offset, x + (this.length) * step_width - offset, y + key_height - offset, color)
    end
    note.get_key = function(this)
        --reverse order
        local real_key = max_key - this.key
        local scale_index = (real_key % #key_scale) + 1
        local octave_index = flr(real_key / #key_scale)
        local scaled_real_key = key_scale[scale_index] + octave_index * 12
        return scaled_real_key
    end
    note.update = function(this)

    end
    return note
end




--MUSIC------------------------------------
function sfx_step(key, waveform)
    return {key=key, waveform=waveform}
end

function set_allsfxspd(N, speed)
    for i=0,N do
        sfxspd(i, speed)
    end
end

function sfxspd(sfx_i, spd)
    --sets speed of sfx pattern i
	local addr=0x3200+(68*sfx_i)+64+1
	poke(mem_addr,spd)
end

function new_music_buffer()
    local buffer = {}
    local tracks = {}
    local n_tracks = 4
    local sfx_length = 32
    --init empty tracks (corresponding to channels of audio)
    for i=1, n_tracks do
        add(tracks, {})
        for j=1, sfx_length * step_length do
            add(tracks[i], {-1, 0})
        end
    end
    buffer.n_tracks = n_tracks
    buffer.tracks = tracks
    buffer.sfx_length = sfx_length
    buffer.step_length = step_length
    buffer.add_note = function(this, note)
        --check each track for empty space
        local found_note = false
        for track_index=1, this.n_tracks do
            --check step free
            if (this.tracks[track_index][note.step * this.step_length + 1][1] == -1) then
                --add note to sfx
                local key = note:get_key()
                --local sfx = sfx_step(key, 0)
                for i=1, this.step_length * note.length do-- NOTE THAT NOTE MAY OVERLAP NOTE IN THE FUTURE, WRITING SHOULD THEREFORE BE DONE IN CHRONOLOGICAL ORDER
                    --write note
                    this.tracks[track_index][note.step * this.step_length + i] = {key, i}
                end
                found_note = true
                break
            end
        end
        if not found_note then
            --replace note that has started playing
            local highest_i = -1
            local highest_i_track_index = -1
            for track_index=1, this.n_tracks do
                local i = this.tracks[track_index][note.step * this.step_length + 1][2]
                if i > highest_i then
                    highest_i = i
                    highest_i_track_index = track_index
                end
            end
            if highest_i > 1 then
                local key = note:get_key()
                for i=1, this.step_length * note.length do
                    --write note
                    this.tracks[highest_i_track_index][note.step * this.step_length + i] = {key, i}
                end
            end
        end
    end
    buffer.write_song = function(this)
        -- Clear all 64 SFX: 64 * 68 = 4352 bytes
        memset(0x3200, 0, 4352)
        local volume_list = {1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,4,5,5,5,5,5,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
        -- Set all SFX to workable values
        for track_index = 1, this.n_tracks do
            local track = this.tracks[track_index]
            local last_key = -1 -- willl be used to add transient to notes
            for note_index = 1, #track do
                local pattern_num = flr((note_index - 1) / 32)
                local note_pos = (note_index - 1) % 32
                local sfx_id = pattern_num * this.n_tracks + (track_index - 1)
                --debug = sfx_id
                local sfx_address = 0x3200 + sfx_id * 68 + note_pos * 2
                local key = track[note_index][1]
                local i   = track[note_index][2]
                if key and key != -1 then
                    local pitch  = key
                    local instr  = 2
                    
                    local vol    = volume_list[min(i, #volume_list-1)]
                    local effect = 0
    
                    local note = (effect << 12) | (vol << 9) | (instr << 6) | (pitch & 0x3f)

                    -- Store as two bytes (little-endian)
                    local byte1 = note & 0xff         -- low byte
                    local byte2 = (note >> 8) & 0xff  -- high byte

                    poke(sfx_address, byte1)
                    poke(sfx_address + 1, byte2)
                end
            end
        end
        set_allsfxspd(64,10)
    end
    return buffer
end

function sort_notes(notes)
    for i = 2, #notes do
        local key = notes[i]
        local j = i - 1
        while j >= 1 and notes[j].step > key.step do
            notes[j + 1] = notes[j]
            j -= 1
        end
        notes[j + 1] = key
    end
end