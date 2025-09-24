function new_text(str, x, y, c, w)
    return {
        str = str,
        x = x,
        y = y,
        c = c,
        w = w,
        draw = function(this)
            mprint(this.str, this.x, this.y, this.c, this.w)
        end
    }
end

function new_slide(bg_color, elems)
    local slide = {}
    slide.bg_color = bg_color
    slide.elems = elems
    slide.draw = function(this)
        cls(this.bg_color)
        for e in all(elems) do
            e:draw()
        end
    end
    return slide
end
