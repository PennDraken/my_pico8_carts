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
        circfill(this.x, this.y + 4, 4, this.bgc)
        rectfill(this.x, this.y, this.x + this.width, this.y + 8, this.bgc)
        for elem in all(this.elems) do
            if elem.x then
                elem:draw(elem.x, y)
            else
                elem:draw(x, y)
                x += elem.width
            end
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
        height = height,
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

function expand_toolbar()
    toolbar = new_toolbar(0, 0, 128)
    toolbar.elems = {
        button(37, function(this)
            anim_minimise_toolbar(this)
        end
        ),
        button(32),
        button(35),
        text(20, "Example Filename That Is Really Long", 7),
        button(36),
        button(33),
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
        -- toolbar.x = 120
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
        -- toolbar.x = 0
    end)
    add(coroutines, c)
    this.func = function(this) anim_minimise_toolbar(this) end
end