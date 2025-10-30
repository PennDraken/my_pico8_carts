function round(x, decimals)
 local m = 10^decimals
 return flr(x * m + 0.5) / m
end

function fmt2(x)
 local s = tostr(round(x, 2))
 local dotpos = nil
 for i=1,#s do
  if sub(s, i, i) == "." then
   dotpos = i
   break
  end
 end

 if not dotpos then
  s = s..".00"
 else
  local after = #s - dotpos
  if after == 0 then s = s.."00"
  elseif after == 1 then s = s.."0"
  end
 end

 return s
end


function _draw()
    cls(0)
    draw_track(track)

    -- ?camera.angle,7
    -- ?car.angle,7
    
    for p in all(particles) do
        p:draw()
    end
    -- spr(16,60,80) -- player sprite
    car:draw()

    for p in all(particles_top) do
        p:draw()
    end
    print( "sPEED: "..fmt2(abs(car.speed * 10)),7 )
end

--draws a line based on camera position
function my_line(x0, y0, x1, y1, color)
    local x0 = x0 - camera.x
    local x1 = x1 - camera.x
    local y0 = y0 - camera.y
    local y1 = y1 - camera.y
    local x0, y0 = rotatePoint(x0, y0, 64, 64, camera.angle)
    local x1, y1 = rotatePoint(x1, y1, 64, 64, camera.angle)
    line(x0 * camera.scale, y0 * camera.scale, x1 * camera.scale, y1 * camera.scale, color)
end