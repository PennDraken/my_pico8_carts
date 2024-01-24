pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	player0=player_new(0)
	player0.max_spd=0.1
 player0.spr=1
end

function _update60()
	player_update(player0)
end


-->8
function _draw()
 cls(0)
	subspr(1,player0.x,player0.y)
	--subspr(3,player0.x-10,player0.y)
	spr(1,player0.x+30,player0.y)
end

function test_draw()
	local x=0
	subspr(2,x,0)
	subspr(2,x+.1,8)
 subspr(2,x+.3,16)
 subspr(2,x+.5,24)
 subspr(2,x+.70,32)
 subspr(2,x+.8,40)
 subspr(2,x+.9,48)
 subspr(2,x+.99,54)
 local x=16
 subspr(2,x,0)
 subspr(2,x+.1,8)
 subspr(2,x+.6,16.4)
 subspr(2,x+.5,24)
 subspr(2,x+.70,32)
 subspr(2,x+.8,40)
 subspr(2,x+.9,48)
 subspr(2,x+.99,54)
end
-->8
--renderer
--uses an rgb lookup table
_rgb_arr={{0,0,0},
										{29,43,83},
										{126,37,83},
										{0, 135,81},
										{171, 82,54},
										{95, 87,79},
										{194, 195,199},
										{255, 241,232},
										{255, 0,77},
										{255, 163,0},
										{255, 236,39},
										{0, 228,54},
										{41, 173,255},
										{131,118,156},
										{255,119,168},
										{255,204,170}}

--finds closest color in palette
function closest_color(r,g,b)
	local p=_rgb_arr--palette
	local f=256
	local r1=r/f
	local g1=g/f
	local b1=b/f
	
	--find closest color
	local cout=0--color out
	local lowd=32767--lowest dist
	
	for i=1,#p do
		local crgb=p[i]
		local r2=crgb[1]/f
		local g2=crgb[2]/f
		local b2=crgb[3]/f
		--local d=((avgr-r)*0.30)^2
  --  +((avgg-g)*0.59)^2
  --  +((avgb-b)*0.11)^2
  local d=(r2-r1)^2+(g2-g1)^2+(b2-b1)^2
  
  if d<lowd then
  	cout=i-1
  	lowd=d
  end
	end
	return cout
end


function subspr(n,x,y)
	--draws sprite n at position x and y
	--whole pixels
	local x1=flr(x)
	local y1=flr(y)
	for i=0,9 do
		for j=0,9 do
			local bgpixel=pget(x1+i,y1+j)
			--pixels
			local p1=getpixel(n,i-1,j-1)
			local p2=getpixel(n,i,j-1)
			local p3=getpixel(n,i-1,j)
			local p4=getpixel(n,i,j)
			--percenteages
			local p4dx=x1+1-x
			local p4dy=y1+1-y
			local p1dx=1-p4dx
			local p1dy=1-p4dy
			local p2dx=p4dx
			local p2dy=p1dy
			local p3dx=p1dx
			local p3dy=p4dy
			local p1perc=p1dx*p1dy
			local p2perc=p2dx*p2dy
			local p3perc=p3dx*p3dy
			local p4perc=p4dx*p4dy
			
			--?p1perc
			--?p2perc
			--?p3perc
			--?p4perc
			--stop()
			--add colors and average
			local p1rgb=getrgb(p1,p1perc,bgpixel)
			local p2rgb=getrgb(p2,p2perc,bgpixel)
			local p3rgb=getrgb(p3,p3perc,bgpixel)
			local p4rgb=getrgb(p4,p4perc,bgpixel)
			--?p4rgb[1]
			--?p4rgb[2]
			--?p4rgb[3]
			local sum=sumrgb({p1rgb,p2rgb,p3rgb,p4rgb})
			--?sum[1]
			--?sum[2]
			--?sum[3]
			local c=closest_color(sum[1],sum[2],sum[3])			
			--?c
			
			pset(x1+i,y1+j,c)
			--stop()
		end
	end
end

--gets rgb value
--if c is null returns
--bg color
function getrgb(c,perc,bgc)
	if c==nil then
		local rgb=percrgb(perc,_rgb_arr[bgc+1])
		return rgb
	end
	local rgb=percrgb(perc,_rgb_arr[c+1])
	return rgb
end

function sumrgb(rgbarr)
	local r=0
	local g=0
	local b=0
	for rgb in all(rgbarr) do
		r+=rgb[1]
		g+=rgb[2]
		b+=rgb[3]
	end
	return {r,g,b}
end

--takes rbg={r,g,b} and applies perc to it
function percrgb(perc,rgb)
	return {perc*rgb[1],perc*rgb[2],perc*rgb[3]}
end

--returns pixel color of given sprite
function getpixel(n,i,j)
	if i<0 or j<0 or i>=8 or j>=8 then
		return nil--transparent(out of bounds)
	end
	local c=sget(n*8%128+i,flr(n/16)*8+j)
	--pset(i,j,c)
	return c
end
-->8
--objects
--player
function actor_new()
 local actor={
  x=63,
  y=63,
  dx=0,
  dy=0,
  spd=0,
  spd_max=0,
  dir=0,
  dir_last=0,
  spr=0,
 }
 return actor
end

function actor_update(actor)
    actor.spd=actor.dir and actor.max_spd or 0
    actor.spdx=actor.spd*cos(actor.dir)
    actor.spdy=actor.spd*sin(actor.dir)
    if actor.dir~=actor.dir_last then
        actor.x=round(actor.x)
        actor.y=round(actor.y)
    end
    if actor.spd>0 then
        actor.x+=actor.spdx
        actor.y+=actor.spdy
    end
    actor.dir_last=actor.dir
end

function player_new(player_index)
 local player=actor_new()
 player.index=player_index
 return player
end

function player_update(player)
	player.dir=get_direction(player.index)
 actor_update(player)
end

function get_direction(player_index)
 local p=player_index
 local dirs={nil,0.5,0,nil,0.25,0.375,0.125,nil,0.75,0.625,0.875,nil,nil,nil,nil,nil}
 local dec=0
 for i,b in ipairs({btn(⬅️,p),btn(➡️,p),btn(⬆️,p),btn(⬇️,p)}) do
     dec+=b and (2^(i-1)) or 0
 end
 return dirs[dec+1]
end

function round(n)
 return (n%1<0.5) and flr(n) or ceil(n)
end
__gfx__
00000000007777007000000700777700000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700007777000000000077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000cccccc00007700077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000c0cc0c00007700077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000110000000000077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001101000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001001007000000700777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000112489a7112489a7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
