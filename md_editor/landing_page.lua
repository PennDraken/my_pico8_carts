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
        local width  = 2 * this.padding + #this.text * 4 - 2
        local height = 2 * this.padding + 6 - 2
        if (centered) this.x = this.px - width/2 this.y = this.py - height /2
        this.w = width
        this.h = height
        rectfill(this.x, this.y, this.x + this.w, this.y + this.h, this.bg_color)
        if (mouse.object_hovered == this) rect(this.x - 2, this.y - 2, this.x + this.w + 2, this.y + this.h + 2, this.bg_color)
        print(reverse_case(this.text), this.x + padding, this.y + padding, this.fg_color)
    end
    return elem
end

local landing_page_elems = {
    landing_page_button("Create New Empty Project", 64, 64, 2, 1, 7, true, function(this)

    end),
    landing_page_button("Open Project Folder", 64, 80, 2, 1, 7, true, function(this)
        extcmd("folder")
    end),

}

ui_elements = landing_page_elems