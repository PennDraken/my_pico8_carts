function get_onscreen_x()
  --wrapper function that looks at memory to find current cursor position
  return peek(0x5f26)
end

function get_onscreen_y()
  --wrapper function that looks at memory to find current cursor position
  return peek(0x5f27)
end

function set_cursor_x(x)
  poke(0x5f26, x)
end

function set_cursor_y(y)
  poke(0x5f27, y)
end

function _init()
  cls()
  extcmd("set_title","Tiny Markdown Editor")
  --themes
  theme_i = 4--theme index
  --bgc,h1c,h2c,h3c,pc,list1c,list2c,linec,cursorc
  themes = get_themes()
  menuitem(1, "Change theme", toggle_theme)
  poke(0x5f2d, 1)  -- enable devkit keyboard input
  text_rows = {
    "# Markdown",
    "## Introduction",
    "### What is it?",
    "*Markdown* is a lightweight **markup language** for creating formatted text using a plain-text editor.",
    "",
    "## Facts",
    "- Created in 2004",
    "- File format is .md",
    "- This is a list",
    "---",
    "## Tutorial",
    "1. ⬇️⬅️⬆️➡️ Move cursor",
    "2. Write with keyboard",
    "3. Enjoy!",
    "[0,8,8]"
  }
  -- text_rows = {""}
  user_string = stat(4)
  if user_string!="" then
    --text_rows = string_to_text_rows(user_string)
  end
  t = 0     --timer for blinking animation
  cursor_index = 1 -- Stores cursor position (index is index of char in original array)
  cursor_index_in_row = 4 -- Stores cursor position in row (useful when jumping up and down)
  -- DEFAULT FONTS
  header_font       = header_font_3
  subheader_font    = header_font_2
  subsubheader_font = skinny_font
  regular = regular_1
  regular_bold = regular_bold_1
  regular_italic = regular_italic_1
end

function _update60()
  -- read user input
  if user_string != stat(4) then
    --new user input
    user_string = stat(4)
    print(user_string)
    text_rows = string_to_text_rows(user_string)
  end
  poke(24368,1) --disable pause on enter (needs to be done every frame)
  -- cursor control
  if btnp(0) then
    cursor_index = max(cursor_index - 1, 1)
    local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
    cursor_index_in_row = index_in_row
    t = 0
  elseif btnp(1) then
    cursor_index = min(cursor_index + 1, cursor_index + 1) -- TODO use actual length instead
    local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
    cursor_index_in_row = index_in_row
    t = 0
  end
  if btnp(2) then
    cursor_index = jump_cursor_up(cursor_index, glyph_rows)
    _draw()
    t = 0
  elseif btnp(3) then
    --Slightly hacky solution to render the transition of the cursor before actual movement
    local temp = cursor_index
    cursor_index = 0
    _draw()
    cursor_index = temp
    cursor_index = jump_cursor_down(cursor_index, glyph_rows)
    t = 0
  end

  local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
  local text_row = text_rows[row_i]
  -- get key input
  local key = stat(31)
  if key == chr(8) then --TODO backspace at start of line
    -- backspace
    sfx(4)
    if #text_row==0 then
      deli(text_rows, row_i)
    elseif index_in_row==1 then
      text_rows[row_i - 1] = text_rows[row_i - 1]..text_rows[row_i]
      deli(text_rows, row_i)
    else
      text_rows[row_i] = del_char(text_row, index_in_row - 1)
    end
    cursor_index = max(1, cursor_index - 1)
  elseif key >= " " and key <= "~" then
    -- add character
    sfx(rnd({0,1,2}))
    text_rows[row_i] = insert_char(text_row, key, index_in_row - 1)
    cursor_index += 1 
  elseif key >= "○" and key <= "▥" then
    -- add character that is capital case (note this is automatically emoji instead of capital cases)
    sfx(rnd({0,1,2}))
    local code = ord(key) -- TODO need to get all keys (not just last key) active to get capital case to work
    key = chr(code-63)
    text_rows[row_i] = insert_char(text_row, key, index_in_row - 1)
    cursor_index += 1 
  elseif key == chr(13) then
    -- new line (enter)
    sfx(3)
    text_rows[row_i] = sub(text_row, 1, index_in_row - 1)
    --add a new line
    add(text_rows, sub(text_row, index_in_row, #text_row), row_i + 1)
    cursor_index += 1
  elseif key =="\t" then
    --tab key
    extcmd("pause")
  end
  -- Increment timer
  t += 1
end

---RENDER----------------------------------------------------------
function _draw()
  debug = new_debugger()
  theme = themes[theme_i]
  cls(theme.bgc)
  camera(-1,-1)
  debug:log("CPU start", stat(1))
  glyph_rows = render_text(text_rows, cursor_index, theme)
  debug:log("CPU end", stat(1))
  --debug:draw()

end

function new_glyph(char_width, char_height, index_in_text_rows, index_in_text_rows_edit, glyph_length)
  return {
    char_width=char_width, char_height=char_height,
    index_in_text_rows=index_in_text_rows, index_in_text_rows_edit=index_in_text_rows_edit,
    glyph_length=glyph_length
  }
end

function render_text(text_rows, cursor_index, theme)
  local glyph_rows = {} -- Stores how text is rendered on screen
  local text_index = 1  -- Text index stores the corresponding char in text rows
  local x = 0
  local y = 0
  for row_i, text_row in ipairs(text_rows) do
    text_row = reverse_case(text_row)
    local new_glyph_rows = nil
    new_glyph_rows, x, y = render_row(text_row, text_index, x, y, cursor_index, theme)
    -- debug:log(sub(text_row, 1, 10), stat(1))
    combine_tables(glyph_rows, new_glyph_rows)
    text_index += #text_row + 1 -- +1 adjusts for newline symbol not present as seperator
  end
  return glyph_rows
end

function render_row(text_row, text_index, x, y, cursor_index, theme)
  local first_word = get_first_word(text_row)
  if first_word=="#" then
    return render_heading(text_row, header_font,    text_index, x, y, cursor_index, theme.h1c, theme.cursorc)
  elseif first_word=="##" then
    return render_heading(text_row, subheader_font, text_index, x, y, cursor_index, theme.h2c, theme.cursorc)
  elseif first_word=="###" then
    return render_heading(text_row, subsubheader_font, text_index, x, y, cursor_index, theme.h3c, theme.cursorc)
  elseif first_word=="---" then
    return render_horisontal_line(text_index, x, y, cursor_index, theme)
  elseif first_word=="" then
    if cursor_index==text_index and is_marker_visible() then
      print("▮", 0, y, theme.cursorc)
    end
    local glyph = new_glyph(
      4,
      6,
      text_index,
      text_index,
      0
    )
    return {{glyph}}, 0, y + 6
  else
    return render_body(text_row, text_index, x, y, cursor_index, theme)
  end
end

function render_heading(text_row, font_function, text_index, x, y, cursor_index, color, cursor_color)
  local char_width, char_height = font_function()
  local glyph_length = #text_row
  -- We want to preview markdown when cursor is not on row
  if not (cursor_index >= text_index and cursor_index < text_index + #text_row + 1) then
    local words, indexes = string_to_list_of_words_with_index(text_row, 1)
    text_row = sub(text_row, indexes[2])
  elseif is_marker_visible() then
    -- Cursor is inside text
    local highligh_index = cursor_index - text_index
    local highlight_x = print("\14"..sub(text_row, 1, highligh_index), 0, y)
    rectfill(highlight_x, y, highlight_x + char_width - 1, y + char_height, cursor_color)
  end
  print("\14"..text_row, x, y, color) -- <-- TEXT RENDERING
  local glyph = new_glyph(
    char_width,
    char_height,
    text_index,
    text_index,
    glyph_length
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, get_onscreen_y()
end

function render_body_test()
  cls()
  render_body("**This** is a test. This is a pretty long sentence. This is **bold**", 1, 0, 0, 1)
end

function render_body(text_row, text_index, x, y, cursor_index, theme)
  -- This function includes word wrapping
  local words, indexes = string_to_list_of_words_with_index(text_row, text_index)
  local word_formatting_functions = {}
  local cleaned_words = {}
  local is_bold    = false
  local is_cursive = false
  --Iterate through all words and store their formatting type and text index
  local temp_text_index = text_index
  debug:log("1", stat(1))
  for i=1,#words do
    local word   = words[i]
    local word_i = indexes[i]
    --Word prefix
    if sub(word, 1, 2)=="**" then
      is_bold = true
      if not in_bounds(cursor_index, word_i, word_i+#words[i]) then
        word = sub(word, 3)
      end
    elseif sub(word, 1, 1)=="*" then
      is_cursive = true
      if not in_bounds(cursor_index, word_i, word_i+#words[i]) then
        word = sub(word, 2)
      end
    end
    --Store data
    if is_bold then
      add(word_formatting_functions, regular_bold)
    elseif is_cursive then
      add(word_formatting_functions, regular_italic)
    else
      add(word_formatting_functions, regular)
    end
    --Word postfix
    add(cleaned_words, {word=tostr(word), index="TODO", is_bold=is_bold, is_cursive=is_cursive})
    if sub(word, -2)=="**" then
      is_bold = false
      if not in_bounds(cursor_index, word_i, word_i+#words[i]) then
        word = sub(word, 1, -3)
      end
    elseif sub(word, -1)=="*" then
      is_cursive = false
      if not in_bounds(cursor_index, word_i, word_i+#words[i]) then
        word = sub(word, 1, -2)
      end
    end
    cleaned_words[i].word = word
  end
  debug:log("2", stat(1))
  local glyph_rows = {}
  local glyph_row  = {}
  --Draws all words to screen
  local formatting_func = word_formatting_functions[1]
  char_width, char_height = formatting_func()
  for i,word in ipairs(words) do
    if formatting_func != word_formatting_functions[i] then
      formatting_func = word_formatting_functions[i]
      char_width, char_height = formatting_func()
    end
    local cleaned_word = cleaned_words[i].word
    local next_x = x + char_width * #cleaned_word --TODO This is not correct because char_width varies for special characters. Perhaps print invisible text to canvas instead?
    local word_i = indexes[i]
    if next_x > 128 then
      -- Move to new line
      x = 0
      y = y + char_height
      add(glyph_rows, glyph_row)--Save previous glyph row
      glyph_row = {}
    end
    if in_bounds(cursor_index, word_i, word_i + #words[i]) and is_marker_visible() then
      local number_of_spaces = cursor_index - word_i
      print("\14"..space_pad_symbol("▮", number_of_spaces), x, y-1, theme.cursorc)
      print("\14"..space_pad_symbol("▮", number_of_spaces), x, y+1, theme.cursorc)
    end
    local c = theme.pc
    if cleaned_words[i].is_bold then
      c = theme.boldc
    elseif cleaned_words[i].is_cursive then
      c = theme.cursivec
    end
    x = char_width + print("\14"..cleaned_word, x, y, c) -- <-- TEXT RENDERING
    local glyph = new_glyph(
      char_width,
      char_height,
      word_i,
      word_i,
      #word
    )
    add(glyph_row, glyph)
  end
  debug:log("3", stat(1))
  add(glyph_rows, glyph_row)
  return glyph_rows, 0, get_onscreen_y()
end

function render_horisontal_line(text_index, x, y, cursor_index, theme)
  local char_width, char_height = 4, 6
  if not (cursor_index >= text_index and cursor_index <= text_index + 3) then
    text_row = "--------------------------------"
    line(0, y + 2, 128, y + 2, theme.linec)
  else
    local number_of_spaces = cursor_index - text_index
    if is_marker_visible() then
      print("\14"..space_pad_symbol("▮", number_of_spaces), x, y-1, theme.cursorc)
      print("\14"..space_pad_symbol("▮", number_of_spaces), x, y+1, theme.cursorc)
    end
    text_row = "---"
    print(text_row, x, y, theme.linec)
  end
  local glyph = new_glyph(
    char_width,
    char_height,
    text_index,
    text_index,
    3
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, y + 6
end