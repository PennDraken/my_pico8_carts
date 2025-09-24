function combine_tables(t1, t2)
    foreach(t2, function(v) add(t1, v) end)
end

function in_bounds(val, start, stop)
    return val >= start and val <= stop
end

function force_bounds(val, min_val, max_val)
  return min(max(min_val, val), max_val)
end

function disable_pause_on_enter()
  poke(24368,1)
end

function is_marker_visible()
    return t % 50 < 25
end

function if_exists_update(o)
  if (o) o:update()
end

function if_exists_draw(o)
  if (o) o:draw()
end

function draw_all(elems)
  for e in all(elems) do e:draw() end
end


function new_glyph(x, y, char_width, char_height, index_in_text_rows, index_in_text_rows_edit, glyph_length)
  return {
    x=x, y=y,
    char_width=char_width, char_height=char_height,
    index_in_text_rows=index_in_text_rows, index_in_text_rows_edit=index_in_text_rows_edit,
    glyph_length=glyph_length,
  }
end

function load_text_editor()
  mouse = init_mouse()
  mouse.cursors = {16,17,18}
  _draw = draw_text_editor
  _update60 = update_text_editor
  cam = {x = 0, y = 0}
end

