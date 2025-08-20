function render_math(text_row, start_text_index, math_fonts, x, y, cursor_index, theme)
    if in_bounds(cursor_index, start_text_index, start_text_index + #text_row) then
        local number_of_spaces = cursor_index - start_text_index
        print("\14"..space_pad_symbol("▮", number_of_spaces), x, y, theme.cursorc)
        print(text_row, x, y, theme.pc)
    else
        -- Draw math
        -- local equation = {
        --     math_regular("3X"),
        --     math_exponed("2"),
        --     math_regular("*Y"),
        --     math_exponed("3"),
        --     math_regular("+X=5"),
        --     math_frac({math_regular("3X"),math_exponed("2"),math_regular("+325")},{math_regular("490")})
        -- }
        local equation = string_to_equation(sub(text_row, 2))

        -- Calculate height of equation

        -- Draw equation
        for seg in all(equation) do
            x = seg:draw(x, y + 2)
        end
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

function string_to_equation(text)
    local result = {}
    local i = 1

    -- read text inside braces, return substring and index of closing brace
    local function read_braces(pos)
        local depth = 1
        local start = pos
        local j = pos
        while j <= #text and depth > 0 do
            j += 1
            local c = text[j]
            if c == "{" then depth += 1 end
            if c == "}" then depth -= 1 end
        end
        return sub(text, start + 1, j - 1), j
    end

    while i <= #text do
        local c = text[i]

        if c == "^" then
            i += 1
            local exponent
            if text[i] == "{" then
                exponent, i = read_braces(i)
                i += 1 -- move past closing brace
            else
                exponent = text[i]
                i += 1
            end
            add(result, math_exponed(exponent))

        elseif c == "{" then
            local numerator, end_pos = read_braces(i)
            i = end_pos + 1 -- move past closing brace

            if text[i] == "/" and text[i + 1] == "{" then
                i += 1 -- move to opening brace of denominator
                local denominator, end_pos2 = read_braces(i)
                i = end_pos2 + 1 -- move past closing brace of denominator

                add(result, math_frac(string_to_equation(numerator), string_to_equation(denominator)))
            else
                add(result, math_regular(numerator))
            end

        else
            local start = i
            while i <= #text do
                local ch = text[i]
                if ch == "^" or ch == "{" then break end
                i += 1
            end
            local segment = sub(text, start, i - 1)
            add(result, math_regular(segment))
        end
    end

    return result
end

function math_regular(text)
    local o = {}
    o.text = text
    o.get_width = function(this)
        return #this.text * 4
    end
    o.get_height = function (this)
        return 6
    end
    o.draw = function(this, x, y)
        math4x6_font()
        return print("\14"..this.text, x, y, theme.mc)
    end
    return o
end

function math_exponed(text)
    local o = {}
    o.text = text
    o.get_width = function(this)
        return #this.text * 4
    end
    o.get_height = function (this)
        return 4
    end
    o.draw = function(this, x, y)
        small3x3_font()
        return print("\14"..this.text, x, y - 1, theme.mc)
    end
    return o
end

function math_frac(eq_top, eq_bottom)
    local o = {}
    o.eq_top    = eq_top
    o.eq_bottom = eq_bottom
    o.get_height = function(this)
        return 6*2 +2
    end
    o.get_width = function(this)
        return max(get_equation_width(this.eq_top), get_equation_width(this.eq_bottom))
    end
    o.draw = function(this, start_x, y)
        local top_width = get_equation_width(this.eq_top)
        local bot_width = get_equation_width(this.eq_bottom)
        local frac_width = max(top_width, bot_width)
        local top_y = y - 4
        local top_x = start_x + (frac_width - top_width)/2
        for seg in all(this.eq_top) do
            top_x = seg:draw(top_x, top_y)
        end
        local bottom_y = y + 4
        local bot_x = start_x + (frac_width - bot_width)/2
        for seg in all(this.eq_bottom) do
            bot_x = seg:draw(bot_x, bottom_y)
        end
        local max_x = max(bot_x, top_x) - 2
        local mid_y = y + 5/2
        line(start_x, mid_y, max_x, mid_y, theme.mc)
        return max(bot_x, top_x)
    end
    return o
end

function get_equation_width(equation)
    local width = 0
    for seg in all(equation) do
        width += seg:get_width()
    end
    return width
end