function box(x, y, w, h)
    return {x=x,y=y,w=w,h=h}
end

function landing_page_button(text, x, y, padding, bg_color, fg_color, centered, func)
    local elem = box(x,y,0,0)
    elem.text = text
    elem.px = x
    elem.py = y
    elem.padding = padding
    elem.bg_color = bg_color
    elem.fg_color = fg_color
    elem.centered = centered
    elem.func = func
    elem.draw = function(this)
        local width  = 2 * this.padding + #this.text * 4
        local height = 2 * this.padding + 6
        if (centered) this.x = this.px - width/2 this.y = this.py - height /2
        this.w = width
        this.h = height
        local cadd = 0
        if (mouse.object_hovered == this) cadd = 1
        rectfill(this.x, this.y, this.x + this.w, this.y + this.h, this.bg_color + cadd)
        print(reverse_case(this.text), this.x + padding, this.y + padding, this.fg_color)
    end
    return elem
end

local landing_page_elems = {
    landing_page_button("Create New Empty Project", 64, 32, 10, 1, 7, true, function(this)

    end),
    landing_page_button("Open Project Folder", 64, 64, 10, 1, 7, true, function(this)
        Folder()
    end),

}

ui_elements = landing_page_elems