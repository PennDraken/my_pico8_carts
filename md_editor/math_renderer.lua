function render_math(text_row, start_text_index, math_fonts, x, y, cursor_index, theme)
    if in_bounds(cursor_index, start_text_index, start_text_index + #text_row) then
        local number_of_spaces = cursor_index - start_text_index
        print("\14"..space_pad_symbol("▮", number_of_spaces), x, y, theme.cursorc)
        print(text_row, x, y, theme.pc)
    end
    -- Draw math
    local equation = {
        math_regular("3X"),
        math_exponed("2"),
        math_regular("*Y"),
        math_exponed("3"),
        math_regular("+X=5"),
        math_frac({math_regular("3X"),math_exponed("2")},{math_regular("490")})
    }
    for seg in all(equation) do
        x = seg:draw(x, y)
    end

    local glyph = new_glyph(
      4,
      6,
      start_text_index,
      start_text_index,
      #text_row
    )
    return {{glyph}}, 0, y + 10
end

function math_regular(text)
    local o = {}
    o.text = text
    o.draw = function(this, x, y)
        regular_1()
        return print("\14"..this.text, x, y, 7)
    end
    return o
end

function math_exponed(text)
    local o = {}
    o.text = text
    o.draw = function(this, x, y)
        small3x3_font()
        return print("\14"..this.text, x, y, 7)
    end
    return o
end

function math_frac(eq_top, eq_bottom)
    local o = {}
    o.eq_top    = eq_top
    o.eq_bottom = eq_bottom
    o.draw = function(this, start_x, y)
        local top_y = y - 4
        local top_x = start_x
        for seg in all(this.eq_top) do
            top_x = seg:draw(top_x, top_y)
        end
        local bottom_y = y + 4
        local bot_x = start_x
        for seg in all(this.eq_bottom) do
            bot_x = seg:draw(bot_x, bottom_y)
        end
        local max_x = max(bot_x, top_x)
        local mid_y = y + 5/2
        line(start_x, mid_y, max_x, mid_y, 7)
        return max(bot_x, top_x)
    end
    return o
end