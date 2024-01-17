pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
x1,y1=0,128
dx1,dy1=1,-1

x2,y2=0,118
dx2,dy2=0.33,-0.1

function _update60()
 x1+=dx1
 y1+=dy1
 x2+=dx2
 y2+=dy2
 if x1>128 then
  x1,y1=0,128
 end
 if x2>128 then
  x2,y2=0,118
 end
end

aa_lut = {0,0,1,1,1,13,6,7,7,7,7}
function oldplot(x,y,c)
 local x1=flr(x)
 local y1=flr(y)
 local x2=flr(x+1)
 local y2=flr(y+1)
 local d_x=x%1
 local d_y=y%1
 
 local c1=1-d_x
 local c2=d_x
 local c3=1-d_y
 local c4=d_y
 local lut_size=#aa_lut-1
 
 pset(x1,y1,aa_lut[flr(c1*c3*lut_size)+1])
 pset(x2,y1,aa_lut[flr(c2*c3*lut_size)+1])
 pset(x1,y2,aa_lut[flr(c1*c4*lut_size)+1])
 pset(x2,y2,aa_lut[flr(c2*c4*lut_size)+1])
end

function plot(x,y,c)
	if c==0 then return end
	--⬅️⬆️
	local dx=flr(x+1)-x
	local dy=flr(y+1)-y
	local perc=dx*dy
	--?perc,7
	plot1p(x,y,c,perc)
	--➡️⬆️
	local dx=x+1-flr(x+1)
	local dy=flr(y+1)-y
	local perc=dx*dy
	--?perc,7
	plot1p(x+1,y,c,perc)
	--⬅️⬇️
	local dx=flr(x+1)-x
	local dy=y+1-flr(y+1)
	local perc=dx*dy
	--?perc,7
	plot1p(x,y+1,c,perc)
	--➡️⬇️
	local dx=flr(x+2)-(x+1)
	local dy=y+1-flr(y+1)
	local perc=dx*dy
	--?perc,7
	plot1p(x+1,y+1,c,perc)
	--stop()
end

--x y color
function plot1p(x,y,c,perc)
	if c==0 then return end
	local oldc=pget(x,y)--old color
	local newc=blend(oldc,c,perc)
	pset(x,y,newc)
end

--blends two colors
--uses an rgb lookup table
--quantizes the result afterwards
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
function blend(botc,topc,perc)
	local rgb1=_rgb_arr[botc+1]
	local rgb2=_rgb_arr[topc+1]
	--average values (note perc applied here)
	local avgr=(rgb1[1]*(1-perc)+rgb2[1]*perc)
	local avgg=(rgb1[2]*(1-perc)+rgb2[2]*perc)
	local avgb=(rgb1[3]*(1-perc)+rgb2[3]*perc)

	cout=closest_color(avgr,avgg,avgb,_rgb_arr)
	--return found color
	return cout
end

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
	--top right pixel coords of sprite
	--local strtx=(n*8)%16
	--local strty=8*flr(n/8)
	local strtx=n*8
	local strty=0
	--iterate through all pixels
	for i=0,7 do
		for j=0,7 do
			c=sget(i+strtx,j+strty)
			if c!=0 then
				plot(x+i,y+j,c)
				--pset(x+i,y+j,c)
			end
		end
	end
end
-->8
function _draw()
 cls()
 --pset(x1,y1,7)
 --spr(1,x1,y1)
 --plot(x2,y2,7)
 --oldplot(x2-3,y2,7)
 --for i=1,100 do
 --	perc=i/100
 --	pset(i,0,blend(0,7,perc))
 --end
 --subspr(2,10.1,0)
 test_draw()
 subspr(2,x2,y2)

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
__gfx__
00000000000770007000000700777700000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000770000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000cccc000000000077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000c0cc0c00000000077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000c0cc0c00000000077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
