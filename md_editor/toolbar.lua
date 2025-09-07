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

function button(sprite_n, func)
    local o = elem(8, 8)
    o.sprite_n = sprite_n
    o.func = func
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
        button(37, function(this)
            anim_minimise_toolbar(this)
        end
        ),
        button(32),
        button(35, function(this)
            local options = {}
            for note in all(notes.nodes) do
                local option = {
                    text_field = note.name,
                    func       = function()
                        note:func()
                    end
                }
                add(options, option)
            end
            open_panel(this, options)
        end),
        text(20, "...", 7),
        button(36),
        button(33, open_graph_view),
        button(34),
    }
end

function anim_minimise_toolbar(this)
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
        draw = function(this)
            local max_text_width = 0
            for option in all(this.options) do
                max_text_width = max(max_text_width, #option.text_field)
            end
            local width = max_text_width * 4
            local x = this.caller.x
            local y = this.caller.y + 8
            for option in all(this.options) do
                rectfill(x, y, x + width, y + 8, theme.bgc)
                print(option.text_field, x + 1, y, theme.pc)
                y += 8
            end
        end
    }

end