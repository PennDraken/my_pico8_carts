function get_onscreen_x()
  --looks at memory to find current cursor position
  return peek(0x5f26)
end

function get_onscreen_y()
  --looks at memory to find current cursor position
  return peek(0x5f27)
end

function new_note()
  text_rows = {"Untitled"}
  cursor_index = 1
  load_text_editor()
  last_node = nil -- Will be set again by the save function
  save_note(text_rows)
end

function init_text_editor()
  cls()
  theme_i = 4--theme index
  themes = get_themes()
  theme = themes[theme_i]
  cursor_index = 1
  cursor_index_2 = nil
  cursor_index_in_row = 1
  header_font       = header_font_3
  subheader_font    = header_font_2
  subsubheader_font = skinny_font
  regular = regular_1
  regular_bold = regular_bold_1
  regular_italic = regular_italic_1
  init_toolbar()
  load_text_editor()
  mouse = init_mouse()
  cam = {x = 0, y = 0}
  coroutines = {}
end

function update_text_editor()
  if (stat(120)) import_notes_file()
  mouse:update()
  toolbar:update()
  toolbar.elems[4].text_field = project_title
  toolbar.elems[5].text_field = text_rows[1]
  if_exists_update(panel)
  for c in all(coroutines) do coresume(c) end
  disable_pause_on_enter()
  -- Cursor
  if mouse.left_held_time == 1 and not mouse.object_hovered then
    cursor_index = x_y_to_cursor_index(mouse.x, mouse.y, glyph_rows)
    panel = nil
    t=0
  end
  local scroll_amount = 4
  if not mouse.object_hovered then
    if (mouse.scrollup) cam.y   += scroll_amount
    if (mouse.scrolldown) cam.y -= scroll_amount
  end
  cam.y = min(0, cam.y)

  if btnp(0) then
    cursor_index = max(cursor_index - 1, 1)
    local index_in_row = cursor_index_to_index_in_visible_row(cursor_index, glyph_rows)
    cursor_index_in_row = index_in_row
    t = 0
  elseif btnp(1) then
    cursor_index = min(cursor_index + 1, #string_list_to_string(text_rows)+1) -- TODO use actual length instead
    local index_in_row = cursor_index_to_index_in_visible_row(cursor_index, glyph_rows)
    cursor_index_in_row = index_in_row
    t = 0
  end
  if btnp(2) then
    cursor_index = jump_cursor_up(cursor_index, glyph_rows, cursor_index_in_row)
    draw_text_editor()
    t = 0
  elseif btnp(3) then
    --Hacky sol. to compute nxt pos
    local temp = cursor_index
    cursor_index = 0
    draw_text_editor()
    cursor_index = temp
    cursor_index = jump_cursor_down(cursor_index, glyph_rows, cursor_index_in_row)
    t = 0
  end

  local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
  local text_row = text_rows[row_i]
  -- get key input
  local key = stat(31)
  if (key != "") t = 0 mouse.enabled = false
  if key == chr(8) then
    if cursor_index != 1 then
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
    end
  elseif key >= " " and key <= "~" then
    -- Lower
    sfx(rnd({0,1,2}))
    text_rows[row_i] = insert_char(text_row, key, index_in_row - 1)
    cursor_index += 1 
  elseif key >= "○" and key <= "▥" then
    -- Capitals
    sfx(rnd({0,1,2}))
    local code = ord(key)
    key = chr(code-63)
    text_rows[row_i] = insert_char(text_row, key, index_in_row - 1)
    cursor_index += 1
  elseif key == chr(13) then
    -- enter
    sfx(3)
    text_rows[row_i] = sub(text_row, 1, index_in_row - 1)
    add(text_rows, sub(text_row, index_in_row, #text_row), row_i + 1)
    cursor_index += 1
  elseif key =="\t" then
    --tab
  end
  t += 1
end

function draw_text_editor()
  mouse.cursors = {16,17,18}
  theme = themes[theme_i]
  cls(theme.bgc)
  camera(-1,-1)
  glyph_rows = render_text(text_rows, cursor_index, theme)
  camera(0, 0)
  if (mouse.enabled) toolbar:draw()
  if (panel and mouse.enabled) panel:draw()
  mouse:draw()
end

function render_text(text_rows, cursor_index, theme)
  local glyph_rows = {} -- Stores how text is rendered on screen
  local text_index = 1  -- Text index stores the corresponding char in text rows
  local x = 0
  local y = cam.y + 8
  local par_pad = 1
  for row_i, text_row in ipairs(text_rows) do
    text_row = reverse_case(text_row)
    local new_glyph_rows = nil
    new_glyph_rows, x, y = render_row(text_row, text_index, x, y, cursor_index, theme)
    combine_tables(glyph_rows, new_glyph_rows)
    text_index += #text_row + 1 -- +1 adjusts for newline symbol not present as seperator
    y += par_pad
  end
  return glyph_rows
end

function render_row(text_row, text_index, x, y, cursor_index, theme)
  local first_word = get_first_word(text_row)
  if text_index == 1 then
    return render_heading(text_row, header_font, text_index, x, y, cursor_index, theme.h1c, theme.cursorc)
  elseif first_word=="#" then
    return render_heading(text_row, header_font, text_index, x, y, cursor_index, theme.h1c, theme.cursorc)
  elseif first_word=="##" then
    return render_heading(text_row, subheader_font, text_index, x, y, cursor_index, theme.h2c, theme.cursorc)
  elseif first_word=="###" then
    return render_heading(text_row, subsubheader_font, text_index, x, y, cursor_index, theme.h3c, theme.cursorc)
  elseif first_word=="---" then
    return render_horisontal_line(text_index, x, y, cursor_index, theme)
  -- Empty line
  elseif first_word=="" and #text_row == 0 then
    if cursor_index==text_index and is_marker_visible() then
      print("▮", 0, y, theme.cursorc)
    end
    local glyph = new_glyph(
      0,
      y,
      4,
      6,
      text_index,
      text_index,
      0
    )
    return {{glyph}}, 0, y + 6
  -- elseif text_row[1]=="." then
  --   return render_math(text_row, text_index, math_fonts, x, y, cursor_index, theme)
  elseif first_word=="-" and #text_row > 2 then
    return render_list_item(text_row, text_index, x, y, cursor_index, theme)
  else
    return render_body(text_row, text_index, x, y, cursor_index, theme)
  end
end

function render_heading(text_row, font, text_index, x, y, cursor_index, color, cursor_color)
  char_width, char_height = font:load()
  local glyph_length = #text_row
  -- Preview markdown when not editing
  local mouse_hover_row = not (mouse.enabled and mouse.y >= y and mouse.y <= y + char_height)
  if not (cursor_index >= text_index and cursor_index < text_index + #text_row + 1) then
    local words, indexes = string_to_list_of_words_with_index(text_row, 1)
    if (text_index != 1) text_row = sub(text_row, indexes[2])
  elseif is_marker_visible() then
    draw_cursor(cursor_index - text_index, x, y, cursor_color)
  end
  print("\14"..text_row, x, y, color)
  local glyph = new_glyph(
    x,
    y,
    char_width,
    char_height,
    text_index,
    text_index,
    glyph_length
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, get_onscreen_y()
end

function render_list_item(text_row, text_index, x, y, cursor_index, theme)
  char_width, char_height = regular:load()
  local glyph_length = 2 -- #text_row
  if not in_bounds(cursor_index, text_index, text_index + 1) then
    print("♥", x, y, theme.list1c)
  else
    draw_cursor(cursor_index-text_index, x, y, theme.cursorc)
    print("-", x, y, theme.pc)
  end
  -- print(text_row, x, y, theme.pc)
  local glyph = new_glyph(
    x,
    y,
    char_width,
    char_height,
    text_index,
    text_index,
    glyph_length
  )
  local glyph_rows_start = {glyph}
  text_row = sub(text_row,3)
  text_index += 2
  local glyph_rows, x, y = render_body(text_row, text_index, 8, y, cursor_index, theme)
  for g in all(glyph_rows[1]) do
    add(glyph_rows_start, g)
  end
  glyph_rows[1] = glyph_rows_start
  return glyph_rows, x, y
end

function render_body(text_row, text_index, x, y, cursor_index, theme)
  -- This function includes word wrapping
  local start_x = x
  local screen_width = 128
  local words, indexes = string_to_list_of_words_with_index(text_row, text_index)
  -- x += 4 * (indexes[1] - text_index)
  local first_word = ""
  for i=0,indexes[1] - text_index do first_word=first_word.." " end
  add(words, first_word, 1)
  add(indexes, text_index, 1)
  local font_per_word = {}
  local cleaned_words = {}
  local is_bold    = false
  local is_cursive = false
  local is_link    = false
  --Iterate through all words and store their formatting type and text index
  local temp_text_index = text_index
  for i=1,#words do
    local word   = words[i]
    local word_i = indexes[i]
    --Markdown word prefix removal
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
    elseif sub(word, 1, 2)=="[[" then
      is_link = true
      if not in_bounds(cursor_index, word_i, word_i+#words[i]) then
        word = sub(word, 3)
      end
    end
    --Store data
    if is_bold then
      add(font_per_word, regular_bold)
    elseif is_cursive then
      add(font_per_word, regular_italic)
    else
      add(font_per_word, regular)
    end
    --Word postfix
    add(cleaned_words, {word=tostr(word), index="TODO", is_bold=is_bold, is_cursive=is_cursive, is_link=is_link})
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
    elseif sub(word, -2)=="]]" then
      is_link = false
      if not in_bounds(cursor_index, word_i, word_i+#words[i]) then
        word = sub(word, 1, -3)
      end
    end
    cleaned_words[i].word = word
  end
  local glyph_rows = {}
  local glyph_row  = {}
  --Draws all words to screen
  local curr_font = font_per_word[1]
  if curr_font.load then end
  char_width, char_height = curr_font:load()
  for i,word in ipairs(words) do
    -- Update formatting (font style)
    if curr_font != font_per_word[i] then
      curr_font = font_per_word[i]
      char_width, char_height = curr_font:load()
    end
    local cleaned_word = cleaned_words[i].word
    local next_x = x + char_width * #cleaned_word
    local word_i = indexes[i]
    if next_x > screen_width then
      -- Move to new line
      x = start_x
      y = y + char_height
      add(glyph_rows, glyph_row)--Save previous glyph row
      glyph_row = {}
    end
    -- TODO simplify this messy if statement
    if in_bounds(cursor_index, word_i, word_i + #words[i]) and is_marker_visible() then
      local number_of_spaces = cursor_index - word_i
      draw_cursor(number_of_spaces, x, y, theme.cursorc)
    elseif i < #words and in_bounds(cursor_index, word_i, indexes[i + 1] - 1) and is_marker_visible() then
      local number_of_spaces = cursor_index - word_i
      draw_cursor(number_of_spaces, x, y, theme.cursorc)
    elseif i == #words and cursor_index >= word_i + #word and cursor_index <= text_index + #text_row then
      local number_of_spaces = cursor_index - word_i
      draw_cursor(number_of_spaces, x, y, theme.cursorc)
    end
    local c = theme.pc
    if cleaned_words[i].is_bold then
      c = theme.boldc
    elseif cleaned_words[i].is_cursive then
      c = theme.cursivec
    elseif cleaned_words[i].is_link then
      c = theme.h1c
    end
    -- Render to screen
    local glyph = new_glyph(
      x,
      y,
      char_width,
      char_height,
      word_i,
      word_i,
      #word
    )
    x = print("\14"..cleaned_word, x, y, c)
    -- Adding trailing spaces to x
    if i < #words then
      local next_char_index = indexes[i + 1]
      local curr_char_index = word_i + #word
      local number_spaces   = next_char_index - curr_char_index
      x += number_spaces * char_width
      glyph.glyph_length += number_spaces
    end
    add(glyph_row, glyph)
  end
  add(glyph_rows, glyph_row)
  return glyph_rows, 0, get_onscreen_y()
end

function render_horisontal_line(text_index, x, y, cursor_index, theme)
  regular:load()
  local char_width, char_height = 4, 7
  if not (cursor_index >= text_index and cursor_index <= text_index + 3) then
    line(0, y + 2, 125, y + 2, theme.linec)
  else
    local number_of_spaces = cursor_index - text_index
    if is_marker_visible() then
      draw_cursor(number_of_spaces, x, y, theme.cursorc)
    end
    text_row = "---"
    print(text_row, x, y, theme.linec)
  end
  local glyph = new_glyph(
    x,
    y,
    char_width,
    char_height,
    text_index,
    text_index,
    3
  )
  local glyph_rows = {{glyph}}
  return glyph_rows, 0, y + 6
end