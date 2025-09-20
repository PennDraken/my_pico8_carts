function box(x, y, w, h)
    return {x=x,y=y,w=w,h=h}
end

function landing_page_button(text, x, y, padding, bg_color, fg_color, centered, func)
    local elem = box(x,y,0,0)
    elem.text = text
    elem.px = x
    elem.py = y
    elem.dx = 0
    elem.dy = 0
    local width  = 2 * padding + #text * 4 - 2
    local height = 2 * padding + 6 - 2
    if (centered) elem.x = elem.px - width/2 elem.y = elem.py - height /2
    elem.w = width
    elem.h = height
    elem.padding = padding
    elem.bg_color = bg_color
    elem.fg_color = fg_color
    elem.centered = centered
    elem.draggable = true
    elem.func = func
    elem.draw = function(this)
        rectfill(this.x, this.y, this.x + this.w, this.y + this.h, this.bg_color)
        if (mouse.object_hovered == this) rect(this.x - 2, this.y - 2, this.x + this.w + 2, this.y + this.h + 2, this.bg_color)
        print(reverse_case(this.text), this.x + padding, this.y + padding, this.fg_color)
    end
    elem.update = function(this)
        if (this == mouse.object_selected) return
        local cx = this.x + this.w / 2
        local cy = this.y + this.h / 2
        local dx = cx - this.px
        local dy = cy - this.py
        local force = sqrt((dx)^2 + (dy)^2) * 0.1
        if (force < 0.1) force = 0
        local a = atan2(dx, dy)
        this.dx -= cos(a) * force
        this.dy -= sin(a) * force
        local f = 0.9
        this.dx *= f
        this.dy *= f
        this.x += this.dx
        this.y += this.dy
    end
    return elem
end

function _init()
	theme = get_themes()[1]
	mouse = init_mouse()
    ui_elements = {
        landing_page_button("Create New Empty Project", 64, 64, 3, 1, 7, true, function(this)
            project_title = "first_project"
            init_notes_from_text_rows({{"Untitled",""}})
            init_text_editor()
        end),
        landing_page_button("Open Project Folder", 64, 80, 3, 1, 7, true, function(this)
            extcmd("folder")
        end)
    }
    for e in all(ui_elements) do e.y = 128 end
end

function _update60()
    if (stat(120)) import_notes_file() 
	mouse.object_hovered = nil
	for e in all(ui_elements) do
        e:update()
		if in_bounds(mouse.x,e.x,e.x+e.w) and
					in_bounds(mouse.y,e.y,e.y+e.h) then
			mouse.object_hovered = e		
		end
	end
	mouse:update()
end

function _draw()
	cls(0)
	sspr(72, 0, 8*3, 8, 
		 64 - 8*3, 8,
		 8*6, 8*2)
	centered_print(reverse_case("by penndraken"), 64, 8*3, 1)
	centered_print(reverse_case("The tiny markdown based"), 64, 6*6, 7)
	centered_print(reverse_case("note-taker"), 64, 6*7, 7)
	centered_print(reverse_case("Load project by"), 64, 100, 6)
	centered_print(reverse_case("dropping from explorer"), 64, 105, 6)

	for e in all(ui_elements) do
		e:draw()
	end
    if (mouse.object_selected) mouse.object_selected:draw()
	mouse:draw()
end
