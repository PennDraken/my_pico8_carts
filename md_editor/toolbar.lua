function new_toolbar(x, y, width)
    local toolbar = {}
    toolbar.x = x
    toolbar.y = y
    toolbar.movement_speed = 3
    toolbar.bgc = 2
    toolbar.width = width
    toolbar.elems = {}
    toolbar.draw = function(this)
        mouse.object_hovered = nil
        local x = this.x
        local y = this.y
        circfill(this.x, this.y + 3, 3, this.bgc)
        circfill(this.x, this.y + 4, 3, this.bgc)
        rectfill(this.x, this.y, this.x + this.width, this.y + 7, this.bgc)
        for elem in all(this.elems) do
            elem.x = x
            elem.y = y
            elem:draw(x, y)
            x += elem.width
        end
    end
    toolbar.update = function(this)
        for elem in all(this.elems) do
        end
    end
    return toolbar
end

function elem(width, height)
    local elem = {
        width = width,
        height = height
    }
    return elem
end

function text(max_chars, text_field, color)
    local o = elem(max_chars * 4, 6)
    o.text_field = text_field
    o.max_chars = max_chars
    o.color = color
    o.draw = function(this, x, y)
        local text = this.text_field
        local scroll_speed = 0.1
        if #this.text_field > this.max_chars then
            local start_index = flr(t * scroll_speed % #this.text_field) + 1
            text = sub(text, start_index, start_index + this.max_chars - 1)
        end
        print(reverse_case(text), x, y + 1, this.color)
    end
    return o
end

function button(sprite_n, hover_text, func)
    local o = elem(8, 8)
    o.sprite_n = sprite_n
    o.func = func
    o.hover_text = hover_text
    o.draw = function(this, x, y)
        if in_bounds(mouse.x, x, x + 7) and in_bounds(mouse.y, y, y + 7) then
            spr(48, x, y)
            mouse.object_hovered = this
        end
        spr(this.sprite_n, x, y)
    end
    return o
end

function init_toolbar()
    toolbar = new_toolbar(0, 0, 128)
    toolbar.elems = {
        button(37, "Minimise", function(this)
            anim_minimise_toolbar(this)
        end
        ),
        button(32, "Save Project", function(this)
            save_note(text_rows)
            export_notes()
        end),
        button(35, "Open Note", function(this)
            save_note(text_rows)
            export_notes()
            local options = {}
            for note in all(notes.nodes) do
                local option = {
                    text_field = note.name,
                    func       = function()
                        note:func()
                        this.sprite_n = 35
                        panel = nil
                    end
                }
                add(options, option)
            end
            open_panel(this, options)
            this.sprite_n = 35
            if (panel) this.sprite_n = 51
        end),
        text(20, "...", 7),
        button(36, "Add Link", function(this)
            save_note(text_rows)
            export_notes()
            local options = {}
            for note in all(notes.nodes) do
                local option = {
                    text_field = note.name,
                    func       = function()
                        insert_link(note.name)
                        panel = nil
                    end
                }
                add(options, option)
            end
            open_panel(this, options)
        end),
        button(33, "Graph View", function(this)
            save_note(text_rows)
            export_notes()
            open_graph_view()
        end),
        button(34, "Settings", function(this)
            local options = {
                {text_field = "Toggle Theme",
                func = toggle_theme}
            }
            open_panel(this, options)
        end),
    }
end

function anim_minimise_toolbar(this)
    panel = nil
    this.sprite_n = 38
    local c = cocreate(function(this)
        while toolbar.x < 120 do
            toolbar.x += toolbar.movement_speed
            yield()
        end
        toolbar.x = 120
    end)
    add(coroutines, c)
    this.func = function(this) anim_expand_toolbar(this) end
end

function anim_expand_toolbar(this)
    this.sprite_n = 37
    local c = cocreate(function(this)
        while toolbar.x > 0 do
            toolbar.x -= toolbar.movement_speed
            yield()
        end
        toolbar.x = 0
    end)
    add(coroutines, c)
    this.func = function(this) anim_minimise_toolbar(this) end
end

function open_panel(caller, options)
    if panel then
        if panel.caller == caller then
            panel = nil
            return
        end
    end
    panel = {
        caller = caller,
        options = options,
        selected_i = nil,
        draw = function(this)
            local max_text_width = 0
            for option in all(this.options) do
                max_text_width = max(max_text_width, #option.text_field)
            end
            local width = max_text_width * 4
            local x = this.caller.x
            local y = this.caller.y + 8
            if (x + width > 128) x = 128 - width
            for i,option in ipairs(this.options) do
                option.x = x
                option.y = y
                option.w = width
                option.h = 8
                c = theme.pc
                if (this.selected_i == i) c = theme.linec mouse.object_hovered = option
                rectfill(x, y, x + width, y + 8, c)
                print(reverse_case(option.text_field), x + 1, y + 1, theme.bgc)
                y += 7
            end
        end,
        update = function(this)
            this.selected_i = nil
            for i,option in ipairs(this.options) do
                if in_bounds(mouse.x, option.x, option.x + option.w) and in_bounds(mouse.y, option.y, option.y + option.h) then
                    this.selected_i = i
                    break
                end
            end
        end
    }
    panel:draw()
end