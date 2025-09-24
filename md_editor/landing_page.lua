function box(x, y, w, h)
    return {x=x,y=y,w=w,h=h}
end

function phys_update(this)
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
    local f = 0.8
    this.dx *= f
    this.dy *= f
    this.x += this.dx
    this.y += this.dy
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
        phys_update(this)
    end
    return elem
end

function input_box(text, x, y, w, padding, bg_color, fg_color, centered, focus, func)
    local base = landing_page_button(text, x, y, padding, bg_color, fg_color, centered, func)
    base.h *= 2
    base.w = w
    base.text_content = "firSt project"
    base.cursor_position = #base.text_content + 1
    base.draw = function(this)
        rectfill(this.x, this.y, this.x + this.w, this.y + this.h, this.bg_color)
        if (mouse.object_hovered == this) rect(this.x - 2, this.y - 2, this.x + this.w + 2, this.y + this.h + 2, this.bg_color)
        local x = this.x + this.padding
        print(reverse_case(this.text), x, this.y + this.padding, this.fg_color)
        local y = this.y + this.h - this.padding - 6
        rectfill(x, y, this.x + this.w - this.padding, y + 6, 7)
        if (is_marker_visible()) local mx = this.cursor_position * 4 + 1 - 4 rectfill(x+mx, y+1, x+mx+3, y+5, 6)
        print(reverse_case(this.text_content), x + 1, y + 1, this.bg_color)
    end
    base.update = function(this)
        phys_update(this)
        if (btnp(0)) this.cursor_position -= 1
        if (btnp(1)) this.cursor_position += 1
        local key = stat(31)
        if key == chr(8) and this.cursor_position > 1 then
            -- Backspace
            this.text_content = del_char(this.text_content, this.cursor_position - 1)
            this.cursor_position -= 1
        elseif key >= " " and key <= "~" then
            this.text_content = insert_char(this.text_content, key, this.cursor_position)
            this.cursor_position += 1
        elseif key >= "○" and key <= "▥" then
            local code = ord(key)
            key = chr(code-63)
            this.text_content = insert_char(this.text_content, key, this.cursor_position)
            this.cursor_position += 1
        end
        this.text_content = sanitize_project_title(this.text_content)
        this.cursor_position = force_bounds(this.cursor_position, 1, #this.text_content+1)
    end 
    return base
end

function _init()
    extcmd("set_title","brittle.md - Tiny Note-Taking Tool")
    poke(0x5f2d, 1)  -- kb input
    t = 0
	theme = get_themes()[1]
	mouse = init_mouse()
    local padding = 3
    ui_elements = {
        landing_page_button("Create New Empty Project", 64, 64, padding, 1, 7, true, function(this)
            local title_box = input_box("Input Project Title", 64, 64, 100, padding, 1, 7, true, true, function(this) end)
            ui_elements = {
                title_box,
                landing_page_button("Confirm", 64, 80, padding, 3, 7, true, function(this)
                    project_title = title_box.text_content
                        ui_elements = {}
                    init_notes_from_text_rows({{"Untitled",""}})
                    init_text_editor()
                end)
            }
            for e in all(ui_elements) do e.y = 128 end
        end),
        landing_page_button("Open Project Folder", 64, 80, padding, 1, 7, true, function(this)
            extcmd("folder")
        end)
    }
    for e in all(ui_elements) do e.y = 128 end
    _draw = drw_landing
    _update60 = upd_landing
end

function upd_landing()
    disable_pause_on_enter()
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
    t += 1
end

function drw_landing()
	cls(0)
    local yoffs = 2*sin(t*0.01)+2
	sspr(72, 0, 8*3, 8, 
		 64 - 8*3, 8+yoffs,
		 8*6, 8*2)
	centered_print(reverse_case("by penndraken"), 64, 8*3 + yoffs, 1)
    centered_print(reverse_case(sub("The tiny markdown based", 1, t)), 64, 6*6, 7)
    centered_print(reverse_case(sub("note-taker", 1, t)), 64, 6*7, 7)
    centered_print(reverse_case(sub("Load project by", 1, t)), 64, 100, 6)
    centered_print(reverse_case(sub("dropping from explorer", 1, t)), 64, 105, 6)
    draw_all(ui_elements)
    if (mouse.object_selected) mouse.object_selected:draw()
	mouse:draw()
end