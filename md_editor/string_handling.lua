function get_first_word(string)
  --gets first word in string (note no spaces allowed)
  local nstring = ""
  local word_end_i
  for i=1,#string do
    if sub(string, i, i) !=' ' then
      nstring = nstring..sub(string, i, i)
    else
      word_end_i = i + 1
      break
    end
  end
  return nstring, word_end_i
end

function reverse_case(str)
  -- used to make text more pretty and readable
  local result = ""
  for i=1, #str do
    local c = sub(str, i, i)
    local code = ord(c)

    if code >= 65 and code <= 90 then
      -- uppercase A-Z -> lowercase a-z
      result = result .. chr(code + 32)
    elseif code >= 97 and code <= 122 then
      -- lowercase a-z -> uppercase A-Z
      result = result .. chr(code - 32)
    else
      -- non-alphabetic characters unchanged
      result = result .. c
    end
  end
  return result
end

function string_to_text_rows(str)
--splits a string with line breaks into a list of strings
  local rows = {}
  for line in all(split(str, "\n", false)) do
    add(rows, line)
  end
  return rows
end

function split_string_with_character(str, char)
  local rows = {}
  for line in all(split(str, char, true)) do
    add(rows, ""..line)--Ensures numbers are still cast as strings. Note that 1. will be cast to 1 (NOT GOOD)
  end
  return rows
end

function string_to_list_of_words(str)
  local words = {}
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
  end
  return words
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
  -- Takes in a scalar index and returns position in list of strings
  -- Returns: Index of row, index of character in row
  local row_i        = 1
  local index_in_row = 1
  for curr_i=1,cursor_index-1 do
    local row_length = #list_of_strings[row_i] + 1--List of strings does not include newline symbol
    if index_in_row < row_length then
      index_in_row += 1
    else
      row_i += 1
      index_in_row = 1
    end
  end
  return row_i, index_in_row
end

function test_cursor_index_to_position_in_list_of_strings(cursor_index)
  local text_rows = {
    "This is the first line",-- 1->23
    "",-- 24
    "This is the seconds line",-- 25->
    "# Whatever",
    " "
  }
  local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
  print(text_rows[row_i][index_in_row])
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

function jump_cursor_down(cursor_index, glyph_rows)
  -- First we find position of cursor in glyph_rows
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
  local new_cursor_index = index_in_row + glyph_rows[glyph_row_i + 1][1].index_in_text_rows
  local cursor_max_index = glyph_rows[glyph_row_i + 1][#glyph_rows[glyph_row_i + 1]].index_in_text_rows + glyph_rows[glyph_row_i + 1][#glyph_rows[glyph_row_i + 1]].glyph_length
  new_cursor_index = min(new_cursor_index, cursor_max_index)
  return new_cursor_index
end

function jump_cursor_up(cursor_index, glyph_rows)
  -- First we find position of cursor in glyph_rows
  local glyph_row_i, glyph_index_in_row = cursor_index_to_position_in_glyphs(glyph_rows, cursor_index)
  if glyph_row_i == 1 then -- If were on the first line set cursor to first char (prevents out of bounds)
    return 1
  end
  local glyph = glyph_rows[glyph_row_i][glyph_index_in_row]
  local delta_index = cursor_index - glyph.index_in_text_rows
  local index_in_row = (glyph.index_in_text_rows + delta_index) - glyph_rows[glyph_row_i][1].index_in_text_rows
  local new_cursor_index = index_in_row + glyph_rows[glyph_row_i - 1][1].index_in_text_rows
  --Correction when next line is outside the bounds of the current line
  if new_cursor_index >= glyph_rows[glyph_row_i][1].index_in_text_rows then
    new_cursor_index = glyph_rows[glyph_row_i][1].index_in_text_rows - 1
  end
  return new_cursor_index
end