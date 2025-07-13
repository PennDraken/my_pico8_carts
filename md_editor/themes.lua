function toggle_theme()
  theme_i += 1
  if theme_i > #themes then
    theme_i = 1
  end
end

function new_theme(bgc, h1c, h2c, h3c, pc, list1c, list2c, linec, cursorc)
  return {bgc=bgc, h1c=h1c, h2c=h2c, h3c=h3c, pc=pc, list1c=list1c, list2c=list2c, linec=linec, cursorc=cursorc}
end

function get_themes()
    return {new_theme( 0,10,14, 7, 7,12, 1, 1, 1),--regular dark
            new_theme( 7, 13,14, 1,1, 6, 6,14, 12),--light
            new_theme( 6, 0, 0, 0, 0, 0, 0, 0, 7),--monocrome grey
            new_theme( 1,12,10,14, 7,14,14,10, 8),
            new_theme( 2, 7, 6,14,14,14,14,14, 8),--girly
            new_theme( 1, 7, 6, 7, 7, 7, 7, 6, 5)
    }
end