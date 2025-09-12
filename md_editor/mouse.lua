function init_mouse()
    poke(0x5F2D, 1) -- Mouse enabled
    mouse = {}
    mouse.x = stat(32)
    mouse.y = stat(33)
    mouse.dx = 0
    mouse.dy = 0
    mouse.left_click  = false
    mouse.left_held_time = 0
    mouse.right_click = false
    mouse.right_held_time = 0
    mouse.scrollup = false
    mouse.scrolldown = false
    mouse.object_hovered  = nil
    mouse.object_selected = nil
    mouse.is_moving = false
    mouse.enabled = true
    mouse.cursors = {0,1,2}

    mouse.update = function(this)
        if (btnp(0) or btnp(1) or btnp(2) or btnp(3)) this.enabled = false
        this.dx = stat(32) - this.x
        this.dy = stat(33) - this.y
        this.x = stat(32)
        this.y = stat(33)
        this.is_moving = abs(this.dx) > 0.1 and abs(this.dy) > 0.1

        this.scrollup   = stat(36)==1
        this.scrolldown = stat(36)==-1

        if (this.is_moving) this.enabled = true

        if this.left_click and (stat(34) & 0b001)!=1 and not this.is_moving and this.object_selected and this.left_held_time < 10 then
            -- Mouse release on node (using previously set left click boolean)
            if (this.object_selected.func) this.object_selected:func()
            this.object_hovered = nil
        end

        this.left_click = (stat(34) & 0b001)==1
        if this.left_click then
            this.left_held_time += 1
        else
            this.left_held_time = 0
        end

        if this.left_click and this.left_held_time < 2 and this.object_hovered and not this.object_selected then
            this.object_selected = this.object_hovered
        elseif this.left_click and this.object_selected then
            if (this.object_hovered.draggable) then
                this.object_selected.x += this.dx
                this.object_selected.y += this.dy
                this.object_selected.dx = this.dx
                this.object_selected.dy = this.dy
            end
        else
            this.object_selected = nil
        end
    end

    mouse.draw = function(this)
        if (not this.enabled) return
        local function outline_spr(n, x, y, c)
            pal(7, theme.bgc)
            local offsets = { {-1,-1},{1,-1},{-1,1},{1,1},{0,-1},{0,1},{-1,0},{1,0} }
            for _, d in ipairs(offsets) do
                spr(n, x + d[1], y + d[2])
            end
            pal()
            spr(n, x, y)
        end
        if this.left_click and not this.object_hovered then
            outline_spr(this.cursors[1], this.x, this.y, 0)
        elseif this.left_click and this.object_hovered then
            outline_spr(this.cursors[3], this.x, this.y, 0)
        elseif not this.left_click and this.object_hovered then
            outline_spr(this.cursors[2], this.x, this.y, 0)
        else
            outline_spr(this.cursors[1], this.x, this.y, 0)
        end
        if this.object_hovered and this.object_hovered.hover_text then
            local width = #this.object_hovered.hover_text * 4
            local x, y = this.x + 8, this.y + 8
            if (x + width > 128) x = 128 - width
            rectfill(x, y, x + width, y + 8, theme.bgc)
            print(reverse_case(this.object_hovered.hover_text), x, y, theme.pc)
        end
    end
    return mouse
end
