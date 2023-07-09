pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	start_game()
end

--inits+starts game
function start_game()
	--variable inits
	t=0--time
	p={x=32,y=32,dx=0.1,dy=0,w=16,h=16}--player
	ga=-0.1--gravity acceleration
	obstacles={}
	--method inits
	_draw=draw_game
	_update=update_game
end
-->8
function draw_game()
	cls(12)
	draw_bg()
	draw_player()
	for o in all(obstacles) do
		draw_o(o)
	end
end

function draw_bg()

end

function draw_player()
	spr(66,p.x,p.y,2,2)
end

function draw_o(o)
	spr(o.n,o.x,o.y,2,2)
end
-->8
function update_game()
	input()
	update_player()
	--obstacles
	if rnd()>0.95 then
		add_obstacle()
	end
	update_obstacles()
end

function input()
	if btnp(❎) then
		p.dy=3
	end
end

function update_player()
	p.dy+=ga--gravity
	p.y-=p.dy
end


-->8
--obstacles
function new_obstacle(n,x,y)
	o={}
	o.n=n
	o.x=x
	o.y=y
	o.w=16
	o.h=16
	return o
end

function update_obstacles()
	for o in all(obstacles) do
		o.x-=1--move obstacles
		if overlaps(p,o) then
			stop()
		end
	end
end

function overlaps(o1,o2)
	if o1.x					<o2.x+o2.w and
				o1.x+o1.w>o2.x 					and
				o1.y					<o2.y+o2.h and
				o1.y+o1.h>o2.x then
		return true
	end
	return false
end

function add_obstacle()
	o=new_obstacle(3,128,rnd(128))
	add(obstacles,o)
end


__gfx__
00000000111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000100000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700110000000000001100000002880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000101000000000010100000028888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000100100000000100100000288888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700100011111111000100000288888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111114994941111100000228888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001ddd14444441ddd100000028888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111114444441111100000022888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111112222221111100000002880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000100011111111000100000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000100100000000100100000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000010100000000001010000000ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000011000000000000110000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000010000000000000010000000ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111111111100000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011999999110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00199999999991000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01999999991119100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01999999997719100000f00990f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19999999997719910000099999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19999199999999910000999999990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1991999999999991000099199199f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1911999999999991000f999999990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19199119999999910000999899990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19111999919999910000099999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
019199991999991000000f09900f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01911111999999100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00199999999991000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011999999110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000