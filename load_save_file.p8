pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- test load and save text file
-- by dw817

cls()
game_name=""
game_x={} game_y={} game_r={}
game_c={}

#include gamedata.p8l

repeat
cls()

for i=0,15 do
  circ(game_x[i],game_y[i],game_r[i],game_c[i])
end

rectfill(0,0,44,5,0)
print("name="..game_name,0,0,6)
rectfill(0,96,127,127,0)
color(6)
print("",0,98)
?"left for new name"
?"right to clear name"
?"up to clear circles"
?"down to create new circles"
print("press 🅾️ to save",0,122)

flip()

if btnp(⬅️) then
  game_name=""
  for i=1,3 do
    r=flr(rnd(17))+1
    game_name=game_name..sub("bdfghjklmnprstvwy",r,r)
    r=flr(rnd(5))+1
    game_name=game_name..sub("aeiou",r,r)
  end--next i
elseif btnp(➡️) then
  game_name=""
elseif btnp(⬆️) then
  for i=0,15 do
    game_x={} game_y={}
    game_r={} game_c={}
  end
elseif btnp(⬇️) then
  for i=0,15 do
    game_x[i]=flr(rnd(128))
    game_y[i]=flr(rnd(128))
    game_r[i]=flr(rnd(16))+16
    game_c[i]=flr(rnd(15))+1
  end
elseif btnp(🅾️) then
  t=""
  t='game_name="'..game_name..'" '
  for i=1,4 do
    t=t.."game_"..sub("xyrc",i,i).."={"
    for j=0,15 do
      if (i==1) v=game_x[j]
      if (i==2) v=game_y[j]
      if (i==3) v=game_r[j]
      if (i==4) v=game_c[j]
      if v!=nil then
        t=t..v
        if j<15 then
          t=t..","
        else
          t=t.."}"
        end
      end
    end--next j
    t=t.." "
  end--next i
  printh(t,"gamedata",1)
  sfx(0)
end

until forever
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
