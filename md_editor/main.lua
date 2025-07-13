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
    "markdown is a lightweight **markup language** for creating formatted text using a plain-text editor.",
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
    text_rows = string_to_text_rows(user_string)
  end
  ci    = 3 --cursor index in row
  rowi  = 1 --selected row
  t = 0     --timer for blinking animation
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
  glyph_rows = render_text(text_rows)
end

function new_glyph(char_width, char_height, index_in_text_rows, index_in_text_rows_edit)
  return {
    char_width=char_width, char_height=char_height,
    index_in_text_rows=index_in_text_rows, index_in_text_rows_edit=index_in_text_rows_edit
  }
end

function render_text(text_rows)
  local glyph_rows = {} -- Stores how text is rendered on screen
  local text_index = 1  -- Text index stores the corresponding char in text rows
  local x = 0
  local y = 0
  for row_i, text_row in ipairs(text_rows) do
    text_row = reverse_case(text_row)
    local new_glyph_rows = nil
    new_glyph_rows, x, y = render_row(text_row, text_index, x, y)
    add(glyph_rows, new_glyph_rows)
    text_index += #text_row
  end
  return glyph_rows
end

function render_row(text_row, text_index, x, y)
  local first_word = get_first_word(text_row)
  if first_word=="#" then
    return render_heading(text_row, text_index, x, y)
  elseif first_word=="##" then
    return render_heading2(text_row, text_index, x, y)
  elseif first_word=="###" then
    return render_heading3(text_row, text_index, x, y)
  else
    return render_body(text_row, text_index, x, y)
  end
end

function render_heading(text_row, text_index, x, y)
  local char_width, char_height = header_font()
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

function render_heading2(text_row, text_index, x, y)
  local char_width, char_height = subheader_font()
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

function render_heading3(text_row, text_index, x, y)
  local char_width, char_height = subheader_font()
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

function render_body(text_row, text_index, x, y)
  local char_width, char_height = 4, 6
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

function _draw2()
  theme = themes[theme_i]
  cls(theme.bgc)
  set_cursor_y(1)--y padding
  -- draw live text
  local cy = 0 -- camera offset
  for i, curr_row in ipairs(text_rows) do
    local first_char = curr_row[1]
    local styling = ""
    local c = theme.pc --color
    char_width = 4
    char_height = 6
    lpadding = 1
    first_word, word_i = get_first_word(curr_row)
    if first_word == "#" then
      styling = "\14"
      header_font()
      c = theme.h1c
    elseif first_word == "##" then
      styling = "\14"
      subheader_font()
      c = theme.h2c
    elseif first_word == '-' then
      --bullet point list
      c = theme.list1c
      char_width = 5
      char_height = 7
      if i != rowi then
        curr_row = " ○ "..sub(curr_row, 3, #curr_row)
      end
    elseif tonum(first_word)!=nil and tonum(first_word) >= 0 and tonum(first_word) <= 999 then
      --numeric list
      c = theme.list2c
      char_width = 5
      char_height = 7
      if i != rowi then
        curr_row = " "..first_word..") "..sub(curr_row, 3, #curr_row)
      end
    elseif first_word == '---' then
      --horisontal line
      c = theme.linec
      if i != rowi then
        char_height = 6
        char_width = 3
        local num_chars = flr((128 - lpadding)/char_width - 1)
        curr_row = "-"
        for i=0,num_chars do
          curr_row = curr_row.."-"
        end
      end
    elseif first_word[1]=="[" and first_word[-1]=="]" then
      --image
      if rowi != i then
        local split_word = split_string_with_character(sub(first_word,2,-2), ",")
        if #split_word==3 then
          --draw image
          local x = 0
          local y = get_onscreen_y()
          spr(split_word[1], (128 - split_word[2]*8)/2, y, split_word[2], split_word[3])
          set_cursor_x(lpadding)
          set_cursor_y(y + split_word[3]*8) --adjust because we still print an empty line
          curr_row = ""
        end
      end
    end
    if styling != "" and rowi != i then
      -- remove md symbols when not on that specific line
      curr_row = sub(curr_row, word_i)
    end
    if t % 30 <= 15 and i == rowi then
      --show cursor
      --curr_row = sub(curr_row, 1, ci).."▮"..sub(curr_row, ci+2, #curr_row)
      --this part essentially prints a duplicate string identical, except to create cursor at desired position
      local cx=0
      local cy=get_onscreen_y()
      special_print(styling, char_width, char_height, reverse_case(sub(curr_row, 1, ci).."▮"..sub(curr_row, ci+2, #curr_row)), theme.cursorc, lpadding, rowi==i)
      poke(0x5f27, cy)
    end
    special_print(styling, char_width, char_height, reverse_case(curr_row), c, lpadding, rowi==i)
    if i == rowi then
      cy = get_onscreen_y()--cursor position
    end
  end
  if cy > 128 then
    --setting camera here is a bit weird as it is for the next frame
    camera(0, cy-128)
  else
    camera(0, 0)
  end

  t += 1
end

function special_print(styling, char_width, char_height, str, c, lpadding, rowselected)
  --special print function that splits words to a new line
  --there are probably more efficient ways to do this
  local padding_x = lpadding
  local screen_width = 128

  local x = padding_x
  if sub(str, 1, 1)==" " then
    x += char_width
  end
  local y = get_onscreen_y()

  words = string_to_list_of_words(str)

  local isbold    = false
  local iscursive = false
  local selected_word = nil--stores the index of the word were cursor is
  for w = 1, #words do
    local word = words[w]
    local boldchar_width = char_width + 1
    local curisivechar_width = char_width
    --BOLD TEXT
    if sub(word,1,2)=="**" then
      --bold text start
      isbold = true
      regular_bold()
      if not rowselected then
        word = sub(word,3,-1)--truncate starting bold signs
      end
    end
    --CURSIVE TEXT
    if word[1]=="*" and word[2]!="*" and not isbold then
      --cursive text start
      iscursive = true
      regular_italic()
      if not rowselected then
        word = sub(word,2,-1)--truncate starting bold signs
      end
    end
    if isbold then
      if sub(word,-2,-1)=="**" then
        --bold text ends
        isbold = false
        if not rowselected then
          word = sub(word,1,-3)--truncate ending bold signs
        end
      end
      local word_width = #word * boldchar_width

      if x + word_width > screen_width then
        x = padding_x
        y = y + char_height
      end

      for j = 1, #word do
        local char = sub(word, j, j)
        print("\14"..styling.. char, x, y, c)--TODO use parameter instead
        x = x + boldchar_width
      end

      if w < #words then
        if isbold then
          print("\14"..styling .. " ", x, y, c)
          x = x + boldchar_width
        else
          print(styling .. " ", x, y, c)
          x = x + char_width
        end
      end

      set_cursor_x(x)
      set_cursor_y(y)
    --CURSIVE TEXT
    elseif iscursive then
      if sub(word,-1,-1)=="*" then
        --cursive text ends
        iscursive = false
        if not rowselected then
          word = sub(word,1,-2)--truncate ending bold signs
        end
      end
      local word_width = #word * curisivechar_width

      if x + word_width > screen_width then
        x = padding_x
        y = y + char_height
      end

      for j = 1, #word do
        local char = sub(word, j, j)
        print("\14"..styling.. char, x, y, c)--TODO use parameter instead
        x = x + curisivechar_width
      end

      if w < #words then
        if iscursive then
          print("\14"..styling .. " ", x, y, c)
          x = x + curisivechar_width
        else
          print(styling .. " ", x, y, c)
          x = x + char_width
        end
      end

      set_cursor_x(x)
      set_cursor_y(y)
    else
      --regular text
      local word_width = #word * char_width

      if x + word_width > screen_width then
        x = padding_x
        y = y + char_height
      end

      for j = 1, #word do
        local char = sub(word, j, j)
        print(styling .. char, x, y, c)
        x = x + char_width
      end

      if w < #words then
        print(styling .. " ", x, y, c)
        x = x + char_width
      end

      set_cursor_x(x)
      set_cursor_y(y)
    end
  end

  set_cursor_x(0)
  poke(0x5f27, y + char_height)
end

