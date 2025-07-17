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
  -- render_body_test()
  -- stop()
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
    "**Markdown** is a lightweight **markup language** for creating formatted text using a plain-text editor.",
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
  user_string = stat(4)
  if user_string!="" then
    --text_rows = string_to_text_rows(user_string)
  end
  ci    = 3 --cursor index in row
  rowi  = 1 --selected row
  t = 0     --timer for blinking animation
  cursor_index = 1 -- Stores cursor position (index is index of char in original array)
end

function control_cursor(row_length)
--Controls cursor, called every frame in update method.
  if btnp(0) then
    ci -= 1
    if ci<0 then
      rowi = max(1, rowi - 1)
      ci = #text_rows[rowi]
    end
  elseif btnp(1) then
    ci = min(ci + 1, row_length)
  end
  if btnp(2) then
    rowi = max(1, rowi - 1)
    ci = min(ci, row_length)
    ci = max(0, ci)
  elseif btnp(3) then
    rowi += 1
    if rowi > #text_rows then
      add(text_rows, "")
    end
    rowi = min(rowi, #text_rows)
    ci = min(ci, row_length)
    ci = max(0, ci)
  end
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
  local curr_row   = text_rows[rowi]
  local row_length = #curr_row
  control_cursor(row_length)

  -- get key input
  local key = stat(31)
  if key == chr(8) then
    -- backspace
    sfx(4)
    if ci != 0 then
      text_rows[rowi] = sub(curr_row, 1, ci-1)..sub(curr_row, ci+1, #curr_row)
      ci -= 1
    elseif rowi != 1 then
      text_rows[rowi-1] = text_rows[rowi-1]..curr_row
      del(text_rows, curr_row)
      ci = #text_rows[rowi-1] - #curr_row
      rowi-=1
    end
  elseif key >= " " and key <= "~" then
    -- add character
    sfx(rnd({0,1,2}))
    text_rows[rowi] = sub(curr_row, 1, ci)..key..sub(curr_row, ci+1, #curr_row)
    ci += 1
  elseif key >= "○" and key <= "▥" then
    -- add character that is capital case (note this is automatically emoji instead of capital cases)
    sfx(rnd({0,1,2}))
    local code = ord(key) -- TODO need to get all keys (not just last key) active to get capital case to work
    key = chr(code-63)
    text_rows[rowi] = sub(curr_row, 1, ci)..key..sub(curr_row, ci+1, #curr_row)
    ci += 1
  elseif key == chr(13) then
    -- new line
    sfx(3)
    text_rows[rowi] = sub(curr_row, 1, ci)
    --add a new line
    add(text_rows, sub(curr_row, ci+1, #curr_row), rowi + 1)
    ci = 0
    rowi += 1
  elseif key =="\t" then
    --tab key
    extcmd("pause")
  end
end

---RENDER----------------------------------------------------------
function _draw()
  theme = themes[theme_i]
  cls(theme.bgc)
  glyph_rows = render_text(text_rows, cursor_index)
end

function new_glyph(char_width, char_height, index_in_text_rows, index_in_text_rows_edit)
  return {
    char_width=char_width, char_height=char_height,
    index_in_text_rows=index_in_text_rows, index_in_text_rows_edit=index_in_text_rows_edit
  }
end

function render_text(text_rows, cursor_index)
  local glyph_rows = {} -- Stores how text is rendered on screen
  local text_index = 1  -- Text index stores the corresponding char in text rows
  local x = 0
  local y = 0
  for row_i, text_row in ipairs(text_rows) do
    text_row = reverse_case(text_row)
    local new_glyph_rows = nil
    new_glyph_rows, x, y = render_row(text_row, text_index, x, y, cursor_index)
    -- add(glyph_rows, new_glyph_rows)
    combine_tables(glyph_rows, new_glyph_rows)
    text_index += #text_row
  end
  return glyph_rows
end

function render_row(text_row, text_index, x, y, cursor_index)
  local first_word = get_first_word(text_row)
  if first_word=="#" then
    return render_heading(text_row, text_index, x, y, cursor_index)
  elseif first_word=="##" then
    return render_heading2(text_row, text_index, x, y, cursor_index)
  elseif first_word=="###" then
    return render_heading3(text_row, text_index, x, y, cursor_index)
  elseif first_word=="---" then
    return render_horisontal_line(text_index, x, y, cursor_index)
  elseif first_word=="" then
    local glyph = new_glyph(
      4,
      6,
      text_index,
      text_index
    )
    return {{glyph}}, 0, y + 6
  else
    return render_body(text_row, text_index, x, y, cursor_index)
  end
end

function render_heading(text_row, text_index, x, y, cursor_index)
  local char_width, char_height = header_font()
  -- We want to preview markdown when cursor is not on row
  if not (cursor_index >= text_index and cursor_index < text_index + #text_row) then
    text_row = sub(text_row, 3, -1)
  end
  print("\14"..text_row, x, y)
  local glyph = new_glyph(
    char_width,
    char_height,
    text_index,
    text_index
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, get_onscreen_y()
end

function render_heading2(text_row, text_index, x, y, cursor_index)
  local char_width, char_height = subheader_font()
  if not (cursor_index >= text_index and cursor_index < text_index + #text_row) then
    text_row = sub(text_row, 4, -1)
  end
  print("\14"..text_row, x, y)
  local glyph = new_glyph(
    char_width,
    char_height,
    text_index,
    text_index
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, get_onscreen_y()
end

function render_heading3(text_row, text_index, x, y, cursor_index)
  local char_width, char_height = subheader_font()
  if not (cursor_index >= text_index and cursor_index < text_index + #text_row) then
    text_row = sub(text_row, 5, -1)
  end
  print("\14"..text_row, x, y)
  local glyph = new_glyph(
    char_width,
    char_height,
    text_index,
    text_index
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, get_onscreen_y()
end

function render_body_test()
  cls()
  render_body("**This** is a test. This is a pretty long sentence. This is **bold**", 1, 0, 0, 1)
end

function render_body(text_row, text_index, x, y, cursor_index)
  -- This function includes word wrapping
  local words = string_to_list_of_words(text_row)
  local word_formatting_functions = {}
  local cleaned_words = {}
  local is_bold    = false
  local is_cursive = false
  --Iterate through all words and store their formatting type and text index
  for word in all(words) do
    --Word prefix
    if sub(word, 1, 2)=="**" then
      is_bold = true
      word = sub(word, 3)
    elseif sub(word, 1, 1)=="*" then
      is_cursive = true
      word = sub(word, 2)
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
    if sub(word, -2)=="**" then
      is_bold = false
      word = sub(word, 1, -3)
    elseif sub(word, -1)=="*" then
      is_cursive = false
      word = sub(word, 1, -2)
    end
    add(cleaned_words, {word=tostr(word), index="TODO"})
  end

  local glyph_rows = {}
  local glyph_row  = {}
  --Draws all words to screen
  for i,word in ipairs(words) do
    local formatting_func = word_formatting_functions[i]
    local cleaned_word = cleaned_words[i].word
    local char_width, char_height = formatting_func()
    local next_x = x + char_width * #cleaned_word
    if next_x > 128 then
      -- Move to new line
      x = 0
      y = y + char_height
      add(glyph_rows, glyph_row)--Save previous glyph row
      glyph_row = {}
    end
    x = char_width + print("\14"..cleaned_word, x, y, 7)
    local glyph = new_glyph(
      char_width,
      char_height,
      text_index,
      text_index
    )
    add(glyph_row, glyph)
    text_index += #word + 1
  end
  add(glyph_rows, glyph_row)
  return glyph_rows, 0, get_onscreen_y()
end

function render_horisontal_line(text_index, x, y, cursor_index)
  local char_width, char_height = 4, 6
  if not (cursor_index >= text_index and cursor_index < text_index + #text_row) then
    text_row = "--------------------------------"
  else
    text_row = "---"
  end
  print(text_row, x, y)
  local glyph = new_glyph(
    char_width,
    char_height,
    text_index,
    text_index
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, get_onscreen_y()
end