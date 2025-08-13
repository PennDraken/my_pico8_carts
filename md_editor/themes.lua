function toggle_theme()
  theme_i += 1
  if theme_i > #themes then
    theme_i = 1
  end
  theme = themes[theme_i]
  draw_text_editor() -- TODO think if this should be included here?
  menu:draw()
end

colors = {
  black=0,
  dark_blue=1,
  purple=2,
  green=3,
  brown=4,
  dark_gray=5,
  light_gray=6,
  white=7,
  red=8,
  orange=9,
  yellow=10,
  lime=11,
  blue=12,
  blue_gray=13,
  pink=14,
  beige=15
}

function new_theme(bgc, h1c, h2c, h3c, pc, list1c, list2c, linec, cursorc, boldc, cursivec, mc)
  return {bgc=bgc, h1c=h1c, h2c=h2c, h3c=h3c, pc=pc, list1c=list1c, list2c=list2c, linec=linec, cursorc=cursorc, boldc=boldc, cursivec=cursivec, mc=mc}
end

function get_themes()
  --                         bgc,              h1c,            h2c,           h3c,            pc,        list1c,        list2c,        linec,        cursorc,         boldc,     cursivec, mathcolor
  return {new_theme(           0,               10,             14,             7,             7,            12,             1,            1,              1,             7,            7,  colors.blue),--regular dark
          new_theme(           7,               13,             14,             1,             1,             6,             6,           14,             12,             1,            1,  colors.pink),--light
          new_theme(           7,                0,              0,             0,             0,             0,             0,            0,    colors.orange, colors.black, colors.black, colors.orange),--monocrome grey
          new_theme(           1,               12,             10,            14,             7,            14,            14,           10,              8, colors.orange, colors.pink,   colors.yellow),--Sweden theme
          new_theme(           2,                7,              6,            14,            14,            14,            14,           14,              8,    colors.red, colors.red,    colors.red),--girly
          new_theme(           1,                7,              6,             7,             7,             7,             7,            6,              5,   colors.blue, colors.blue,   colors.blue),
          new_theme(  colors.red,    colors.yellow,  colors.yellow, colors.yellow,  colors.beige,  colors.beige, colors.yellow, colors.orange, colors.purple, colors.yellow, colors.yellow, colors.white)
  }
end