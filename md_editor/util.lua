function combine_tables(t1, t2)
    foreach(t2, function(v) add(t1, v) end)
end

function in_bounds(val, start, stop)
    return val >= start and val <= stop
end

function disable_pause_on_enter()
  poke(24368,1) -- (needs to be done every frame)
end

function is_marker_visible()
    return t % 50 < 25
end

function new_glyph(char_width, char_height, index_in_text_rows, index_in_text_rows_edit, glyph_length)
  return {
    char_width=char_width, char_height=char_height,
    index_in_text_rows=index_in_text_rows, index_in_text_rows_edit=index_in_text_rows_edit,
    glyph_length=glyph_length
  }
end

function load_text_editor()
  mouse = init_mouse()
  _draw = draw_text_editor
  _update60 = update_text_editor
end