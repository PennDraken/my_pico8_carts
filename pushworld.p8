pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	--world
	map_width=100
	wall_pal={64,65}
	walls=gen_world(map_width,1000)
	moving={}--moving blocks
	--camera
	c=new_cam(0,0)
	--player
	p=new_p(64,64)
end

--camera
function new_cam(x,y)
	c={}
	c.x=x
	c.y=y
	return c
end

--walls (todo height)
function new_wall(n,x,y)
	w={}
	w.n=n
	w.x=x
	w.y=y
	return w
end

--creates a moving wall from a wall block
function new_moving(o,tx,ty)
	o.sx=o.x--start position
	o.sy=o.y
	o.tx=tx	--target x
	o.ty=ty	--target y
	o.p =0  --percentage
	return o
end

--returns a table of walls with defined dimensions
--w   = world width
--num = num of walls
function gen_world(w,num)
	local arr={}
	for i=0,num do
		local n=rnd(wall_pal)
		local x=flr(rnd(w))
		local y=flr(rnd(w))
		add(arr,new_wall(n,x,y))
	end
	return arr
end
-->8
--draw
function _draw()
	cls(3)
	draw_player(p)--player
	for i=1,5 do--walls
		draw_arr(walls,8,1+i/75)
		draw_arr(moving,8,1+i/75)
	end
	--selected square
	draw_selection()
	?p.dir
	?p.dir_look
end

--draws objects with depth
--s    =position scale
--depth=perspecive shift scale
function draw_arr(arr,s,depth)
	for o in all(arr) do
		local x=depth*(s*o.x-c.x-60)+60
		local y=depth*(s*o.y-c.y-60)+60
		spr(o.n,x,y)
	end
end

--draws square in front of player
function draw_selection()
	local pos=p_look_square(p)
	pos.x*=8
	pos.y*=8
	rect(pos.x-c.x,pos.y-c.y,pos.x+8-c.x,pos.y+8-c.y)
end
-->8
--update
function _update()
	--camera snapping
	c.x=p.x-64+4
	c.y=p.y-64+4
	--player
	input()
	update_player(p)
	--moving blocks
	update_moving(moving)
end

--updates all moving blocks
function update_moving(arr)
	for o in all(arr) do
		if o.p<1 then
			--move wall forward
			o.x=lerp(o.sx,o.tx,o.p)
			o.y=lerp(o.sy,o.ty,o.p)
			o.p+=0.1
		else
			--reached target round
			o.x=o.tx
			o.y=o.ty
			--transfer back to walls
			add(walls,new_wall(o.n,o.x,o.y))
			--o=nil--delete old
			del(moving,o)
		end
	end
end
-->8
--player
function new_p(x,y)
	p={}
	p.x=x--position
	p.y=y
	p.spdx=0--speed
	p.spdy=0
	p.spd=0
	p.max_spd=1--maxspeed
	p.dir=0
	p.dir_last=0
	p.dir_look=0
	return p
end

function update_player(p)
	--player movement
	p.spd=p.dir and p.max_spd or 0
	p.spdx=p.spd*cos(p.dir)
	p.spdy=p.spd*sin(p.dir)
	--rounds only when changing dir
	if p.dir~=p.dir_last then
		p.x=round(p.x)
		p.y=round(p.y)
	end
	if p.spd>0 then
		p.x+=p.spdx
		p.y+=p.spdy
	end
	--update dir look
	if p.dir!=nil then
		p.dir_look=p.dir
	end
	p.dir_last=p.dir
end

function draw_player(p)
	spr(128,p.x-c.x,p.y-c.y)
end

--returns coords where player is looking
function p_look_square(p)
	local x=round(p.x/8)
	local y=round(p.y/8)
	x+=round(1*cos(p.dir_look))
	y+=round(1*sin(p.dir_look))
	return {x=x,y=y}
end

--dir input for a given player
function get_dir(player_index)
	local p=player_index
 local dirs={nil,0.5,0,nil,0.25,0.375,0.125,nil,0.75,0.625,0.875,nil,nil,nil,nil,nil}
 local dec=0
 for i,b in ipairs({btn(⬅️,p),btn(➡️,p),btn(⬆️,p),btn(⬇️,p)}) do
  dec+=b and (2^(i-1)) or 0
 end
 return dirs[dec+1]
end

--player input
function input()
	--set player direction
	p.dir=get_dir(0)
	--player push
	if btnp(❎) then
		pos=p_look_square(p)
		w=get_wall(walls,pos.x,pos.y)
		while w!=nil do
			local tx=pos.x+round(cos(p.dir_look))
			local ty=pos.y+round(sin(p.dir_look))
			start_move_block(w,tx,ty)
			pos={x=tx,y=ty}--check next block
			w=get_wall(walls,pos.x,pos.y)
		end
	end
end

--moves a block
function start_move_block(w,tx,ty)
	--add block to moving list
	mw=new_moving(w,tx,ty)
	add(moving,mw)
	--remove block from walls
	del(walls,mw)
end
-->8
--util
--rounds value up/down
function round(n)
 return (n%1<0.5) and flr(n) or ceil(n)
end

--converts pixel coords to map coords

--smoothing function
function lerp(tar,pos,perc)
	return (1-perc)*tar + perc*pos;
end

--returns a wall block at x and y
function get_wall(arr,x,y)
	for o in all(arr) do
		if o.x==x and o.y==y then
			return o
		end
	end
	return nil
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
166666611ffffff10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66666662fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66666662fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66666662fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66666662fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66666662fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d66666662fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dddddd1122222210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d666760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dd66660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02222222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00222222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
