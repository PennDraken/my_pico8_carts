function combine_tables(table1, table2)
    for elem in all(table2) do
        add(table1, elem)
    end
    return table1
end

function in_bounds(val, start, stop)
    return val >= start and val <= stop
end

function disable_pause_on_enter()
  poke(24368,1) --disable pause on enter (needs to be done every frame)
end

function show_cpu(y)
  ?"\#0"..stat(1),0,y,7
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
  _draw = draw_text_editor
  _update60 = update_text_editor
end