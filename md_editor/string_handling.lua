function get_first_word(string)
  return split(string, " ")[1]
end

function centered_print(text, x, y, c)
  print(text,x-#text*2, y-2, c)
end

function reverse_case(str)
  local result = ""
  for i=1,#str do
    local c = str[i]
    local code = ord(c)
    if in_bounds(code, 65, 90) or in_bounds(code, 97, 122) then
      result = result .. chr(code ^^ 1 << 5)
    else
      result = result .. c
    end
  end
  return result
end

function string_to_text_rows(str)
  return split(str, "\n", false)
end

function string_list_to_string(list_of_strings)
  local new_string = ""
  for string in all(list_of_strings) do
    new_string = new_string..string.."\n"
  end
  return new_string
end

function string_to_list_of_words_with_index(str, start_index)
  local words   = {}
  local indexes = {}
  local i = 1
  local len = #str
  while i <= len do
    -- skip spaces
    while i <= len and sub(str, i, i) == " " do
      i = i + 1
    end
    if i > len then break end
    -- find word end
    local start_i = i
    while i <= len and sub(str, i, i) ~= " " do
      i = i + 1
    end
    local word = sub(str, start_i, i - 1)
    add(words, word)
    add(indexes, start_i + start_index - 1)
  end
  return words, indexes
end

function space_pad_symbol(symbol, space_count)
  --Returns a string with spaces and a square marker at index
  local string = ""
  for i=1,space_count do
    string = string.." "
  end
  string = string..symbol
  return string
end

function del_char(string, index)
  return sub(string, 1, index - 1)..sub(string, index + 1)
end

function insert_char(string, char, index)
  return sub(string, 1, index)..char..sub(string, index + 1)
end

function cursor_index_to_position_in_list_of_strings(list_of_strings, cursor_index)
  local row_i        = 1
  local index_in_row = 1
  for curr_i=1,cursor_index-1 do
    local row_length = #list_of_strings[row_i] + 1--Newline comp.
    if index_in_row < row_length then
      index_in_row += 1
    else
      row_i += 1
      index_in_row = 1
    end
  end
  return row_i, index_in_row
end

function cursor_index_to_position_in_glyphs(glyph_rows, cursor_index)
  for row_i=1,#glyph_rows do
    local glyph_row = glyph_rows[row_i]
    for glyph_i=1,#glyph_row do
      local glyph = glyph_row[glyph_i]
      if cursor_index >= glyph.index_in_text_rows and cursor_index <= glyph.index_in_text_rows + glyph.glyph_length then
        return row_i, glyph_i
      end
    end
  end
end

function draw_cursor(number_of_spaces, x, y, cursorc)
  rectfill(x + number_of_spaces * char_width - 1, y - 1, x + (number_of_spaces + 1) * char_width - 1, y + char_height - 1, cursorc)
end

function cursor_index_to_index_in_visible_row(cursor_index, glyph_rows)
  -- Used to track last cursor position (useful for moving up and down along different line lengths)
  local glyph_row_i, glyph_index_in_row = cursor_index_to_position_in_glyphs(glyph_rows, cursor_index)
  if glyph_row_i == #glyph_rows then -- No more lines to jump to
    local last_glyph_row = glyph_rows[#glyph_rows]
    local last_glyph = last_glyph_row[#last_glyph_row]
    local line_end_index = last_glyph.index_in_text_rows + last_glyph.glyph_length
    return line_end_index
  end
  local glyph = glyph_rows[glyph_row_i][glyph_index_in_row]
  local delta_index = cursor_index - glyph.index_in_text_rows
  local index_in_row = (glyph.index_in_text_rows + delta_index) - glyph_rows[glyph_row_i][1].index_in_text_rows
  return index_in_row
end

function x_y_to_cursor_index(x, y, glyph_rows)
  for glyph_row in all(glyph_rows) do
    local glyph_y = glyph_row[1].y
    local glyph_height = glyph_row[1].char_height
    if y >= glyph_y and y <= glyph_y + glyph_height then
      local found_glyph = glyph_row[1]
      for i=2,#glyph_row do
        local curr_glyph = glyph_row[i]
        if x >= curr_glyph.x then
          found_glyph = curr_glyph
        end
      end
      if found_glyph then
        local dx = x - found_glyph.x
        local max_index = glyph_row[#glyph_row].index_in_text_rows + glyph_row[#glyph_row].glyph_length
        return min(found_glyph.index_in_text_rows + flr(dx / found_glyph.char_width), max_index)
      end
    end
  end
  return cursor_index
end

function jump_cursor_down(cursor_index, glyph_rows, real_cursor_index_in_row)
  -- First we find position of cursor in glyph_rows
  local glyph_row_i, glyph_index_in_row = cursor_index_to_position_in_glyphs(glyph_rows, cursor_index)
  if glyph_row_i == #glyph_rows then -- No more lines to jump to so we jump to the end of the final line
    local last_glyph_row = glyph_rows[#glyph_rows]
    local last_glyph = last_glyph_row[#last_glyph_row]
    local line_end_index = last_glyph.index_in_text_rows + last_glyph.glyph_length
    return line_end_index
  end
  local glyph = glyph_rows[glyph_row_i][glyph_index_in_row]
  local delta_index = cursor_index - glyph.index_in_text_rows
  local index_in_row = real_cursor_index_in_row
  local new_cursor_index = index_in_row + glyph_rows[glyph_row_i + 1][1].index_in_text_rows
  local cursor_max_index = glyph_rows[glyph_row_i + 1][#glyph_rows[glyph_row_i + 1]].index_in_text_rows + glyph_rows[glyph_row_i + 1][#glyph_rows[glyph_row_i + 1]].glyph_length
  new_cursor_index = min(new_cursor_index, cursor_max_index)
  return new_cursor_index
end

function jump_cursor_up(cursor_index, glyph_rows, real_cursor_index_in_row)
  -- First we find position of cursor in glyph_rows
  local glyph_row_i, glyph_index_in_row = cursor_index_to_position_in_glyphs(glyph_rows, cursor_index)
  if glyph_row_i == 1 then -- If were on the first line set cursor to first char (prevents out of bounds)
    return 1
  end
  local glyph = glyph_rows[glyph_row_i][glyph_index_in_row]
  local delta_index = cursor_index - glyph.index_in_text_rows
  local index_in_row = real_cursor_index_in_row
  local new_cursor_index = index_in_row + glyph_rows[glyph_row_i - 1][1].index_in_text_rows
  --Correction for nline is OOB of the current line
  if new_cursor_index >= glyph_rows[glyph_row_i][1].index_in_text_rows then
    new_cursor_index = glyph_rows[glyph_row_i][1].index_in_text_rows - 1
  end
  return new_cursor_index
end