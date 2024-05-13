pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	p=new_p()
	pipes={}
	add(pipes,new_pipe(100,6))
	score=0
end

function new_p()
	local p={
	x=64,
	y=64,
	dy=0,
	g=0.1,
	draw=function(this)
		spr(16,this.x,this.y)
	end,
	update=function(this)
		if btnp(❎) then
			this.dy=-2
		end
		this.dy+=this.g
		this.y+=this.dy
	end
	}
	return p
end

function new_pipe(x,hole)
	local p={
		x=x,
		hole=hole,
		draw=function(this)
			for gridy=0,16 do
				if gridy-2==this.hole then
					spr(1,this.x,gridy*8)
				elseif gridy+2==this.hole then
					spr(2,this.x,gridy*8)
				elseif gridy!=this.hole and gridy+1!=this.hole and gridy-1!=this.hole then
					spr(3,this.x,gridy*8)
				end
			end
		end,
		update=function(this)
			this.x-=1
		end,
		check_collision=function(this,x,y)
			--inside x
			if x+8>this.x+2 and x<this.x+8+2 then
				--inside y
				if y<this.hole*8-8 then
					stop()
				elseif y>this.hole*8+16 then
					stop()
				end
			end
		end
	}
	
	
	return p
end
-->8
function _draw()
	cls(12)
	p:draw()
	for pipe in all(pipes) do
		pipe:draw()
	end
end
-->8
function _update()
	p:update()
	for pipe in all(pipes) do
		pipe:update()
		pipe:check_collision(p.x,p.y)
	end
end
__gfx__
00000000abbbbbb10abbbb100abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333300abbbb100abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000abbbb100abbbb100abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000abbbb100abbbb100abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000abbbb100abbbb100abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000abbbb100abbbb100abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000abbbb10033333300abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000abbbb10abbbbbb10abbbb10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaa71a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaa71a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaa9999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaaa990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000