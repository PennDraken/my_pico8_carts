pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	ga=0.3
	frict=0.01
	balls={}
	--balls that are  colliding
	coll_pairs={}
	
	for i=1,5 do
		rnd_num=2+ceil(rnd(10))
		r=rnd_num
		m=3.14*rnd_num^2
		b=new_b(r+flr(rnd(127-r)),
										r+flr(rnd(127-r)),
										r,m)
		add(balls,b)
	end
end

function new_b(x,y,r)
	b={
	x=x,y=y,r=r,
	dx=0,dy=0,
	ax=0,ay=0,
	m=0.1
	}
	return b
end
-->8
--update
function _update()
	--move balls
	for ball_i=1,#balls do
		move_ball(ball_i)
	end
	--fix overlap
	for ball_i=1,#balls do
		overlap_ball(ball_i)
	end
	--collisions
	for pair in all(coll_pairs) do
		ball_collision(pair)
	end
	coll_pairs={}
end

function move_ball(ball_i)
	ball=balls[ball_i]
	ball.ax=(-ball.dx*frict)+0
	ball.ay=(-ball.dy*frict)+ga
	ball.dx+=ball.ax
	ball.dy+=ball.ay
	ball.x+=ball.dx
	ball.y+=ball.dy
	--wall collision
	move_in_bounds(ball)
	--clamp velocity
	if abs(ball.dx^2+ball.dy^2)<0.05 then
		ball.dx=0
		ball.dy=0
	end
end

function move_in_bounds(ball)
	if ball.x-ball.r<0 then--left wall
		ball.x=ball.r
		ball.dx=abs(ball.dx)
	elseif ball.x+ball.r>127 then--right wall
		ball.x=127-ball.r
		ball.dx=-abs(ball.dx)
	elseif ball.y<ball.r then--top
		ball.y=ball.r
		ball.dy=abs(ball.dy)
	elseif ball.y+ball.r>127 then--bot
		ball.y=127-ball.r
		ball.dy=-abs(ball.dy)
	end
end

function overlap_ball(ball_i)
	b1=balls[ball_i]
	for i=1,#balls do
		if i~=ball_i then
			b2=balls[i]
			local dx=b1.x-b2.x
		 local dy=b1.y-b2.y
		 d=sqrt(dx^2+dy^2)
			--check if balls overlaps
			if d<=b1.r+b2.r then
				--fix overlap
				disp=0.5*(d-b1.r-b2.r)
				movex=disp*(dx)/d
				movey=disp*(dy)/d
				--move balls to place
				b1.x-=movex
				b1.y-=movey
				b2.x+=movex
				b2.y+=movey
				--fix outer bounds
				move_in_bounds(b1)
				move_in_bounds(b2)
				add(coll_pairs,{b1,b2})
			end
		end
	end
end

function ball_collision(ball_pair)
	b1=ball_pair[1]
	b2=ball_pair[2]
	local dx=b2.x-b1.x
 local dy=b2.y-b1.y
	d=sqrt(dx^2+dy^2)
	--collision
	--normal
	nx=(dx)/d
	ny=(dy)/d
	--tangent
	tx=-ny
	ty=nx
	--dot product tangent
	dptan1=b1.dx*tx+b1.dy*ty
	dptan2=b2.dx*tx+b2.dy*ty
	--dot product normal
	dpnorm1=b1.dx*nx+b1.dy*ny
	dpnorm2=b2.dx*nx+b2.dy*ny
	--conservation of momentum
	m1=(dpnorm1*(b1.m-b2.m)+2.0*b2.m*dpnorm2)/(b1.m+b2.m)
	m2=(dpnorm2*(b2.m-b1.m)+2.0*b1.m*dpnorm1)/(b1.m+b2.m)
	--update velocities
	b1.dx=tx*dptan1+nx*m1
	b1.dy=ty*dptan1+ny*m1
	b2.dx=tx*dptan2+nx*m2
	b2.dy=ty*dptan2+ny*m2
end
-->8
--draw
function _draw()
	cls(15)
	for ball in all(balls) do
		draw_ball(ball)
	end
end

cols={1,13,12,11}

function draw_ball(ball)
	col_i=get_color(ball)
	circfill(ball.x,ball.y,ball.r,col_i)
end

function get_color(ball)
	maxv=5
	abs_vel=sqrt(ball.dx^2+ball.dy^2)
	perc=abs_vel/maxv
	if perc>1 then perc=1 end
	col_index=ceil(perc*#cols)
	return cols[col_index]
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
