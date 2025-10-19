pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- track editor for pico8
-- henry edition ユかいきヤま◆

-- each node: {x, y, r}
track = {
  {x=-100, y=0, r=30},
  {x=200, y=0, r=20},
  {x=200, y=200, r=30},
  {x=120, y=500, r=10},
  {x=120, y=1000, r=5},
  {x=200, y=500, r=10},
  {x=120, y=500, r=10}
}

-- camera & zoom
camx, camy = 0, 0
zoom = 1
selected = nil
dragging = false
drag_offx, drag_offy = 0, 0

function _init()
  poke(0x5f2d, 1) -- enable mouse
end

function _update()
  -- mouse input
  local mx, my, mb = stat(32), stat(33), stat(34)
  
  -- pan with arrows
  local speed = 5/zoom
  if (btn(0)) camx -= speed
  if (btn(1)) camx += speed
  if (btn(2)) camy -= speed
  if (btn(3)) camy += speed
  
  -- zoom with scroll wheel
  local scroll = stat(36)
  if scroll > 0 then zoom *= 1.1 end
  if scroll < 0 then zoom /= 1.1 end
  zoom = mid(0.1, zoom, 10)
  
  -- transform mouse to world coordinates
  local wx = (mx - 64)/zoom + camx
  local wy = (my - 64)/zoom + camy

  if mb == 1 then
      if not dragging then
          local nearest, dist = nil, 9999
          for i,node in ipairs(track) do
              local sx = (node.x - camx) * zoom + 64
              local sy = (node.y - camy) * zoom + 64
              local dx = mx - sx
              local dy = my - sy
              local d = sqrt(dx*dx + dy*dy)
              if d < 6 and d < dist then
                  nearest, dist = i, d
              end
          end
          if nearest then
              selected = nearest
              dragging = true
              drag_offx = wx - track[selected].x
              drag_offy = wy - track[selected].y
          else
              add(track, {x=wx, y=wy, r=10})
              selected = #track
          end
      else
          track[selected].x = wx - drag_offx
          track[selected].y = wy - drag_offy
      end
  else
      dragging = false
  end
end

function _draw()
  cls(1)
  camera()
  
  -- draw grid
  draw_grid()
  
  -- draw track
  for i=1,#track do
    local n = track[i]
    if i > 1 then
      local p = track[i-1]
      line(
        (p.x - camx)*zoom + 64,
        (p.y - camy)*zoom + 64,
        (n.x - camx)*zoom + 64,
        (n.y - camy)*zoom + 64,
        5
      )
    end
  end
  
  -- draw nodes
  for i,n in ipairs(track) do
    local sx = (n.x - camx)*zoom + 64
    local sy = (n.y - camy)*zoom + 64
    circ(sx, sy, n.r*zoom, 13)
    circfill(sx, sy, 2, i == selected and 10 or 7)
  end
  
  -- ui
  print("zoom: "..flr(zoom*100).."%", 2, 2, 7)
  -- draw cursor
  local mx, my = stat(32), stat(33)
  local mb = stat(34)
  local c = mb == 1 and 8 or 7  -- red when clicking
  line(mx-2, my, mx+2, my, c)
  line(mx, my-2, mx, my+2, c)
end

function draw_grid()
  local step = 100
  for gx=-1000,1000,step do
    local sx1 = (gx - camx)*zoom + 64
    line(sx1, 0, sx1, 128, 2)
  end
  for gy=-1000,1000,step do
    local sy1 = (gy - camy)*zoom + 64
    line(0, sy1, 128, sy1, 2)
  end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
