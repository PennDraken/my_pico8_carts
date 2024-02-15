pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	a=0
	pointx=0
end
-->8
--update
function _update()
	a+=0.004
	a=a%1
	
end
-->8
--draw
function _draw()
	cls(0)
	draw_side_sphere(64+32-1,96,32,a)
	draw_front_sphere(32,96,32,a)
	--draw_front_sphere(32,32,32,(a+0.25)%1)
	pointx=(pointx+1)%64
	draw_point(32,96,32,pointx-32,10,7,a)
end

function draw_side_sphere(x,y,r,a)
	circ(x,y,r,1)
	--draw lines
	local n=10
	for i=-n,n,2 do
		local s=(i)*(r/n) -- adjust the step size as needed
		local x1=x+sqrt(r^2-s^2)
		local y1=y-s
		local x2=x-sqrt(r^2-s^2)
		local y2=y-s
		local p1=rotate_point(x,y,x1,y1,a)
		local p2=rotate_point(x,y,x2,y2,a)
		line(p1.x,p1.y,p2.x,p2.y,9)
		pset(p1.x,p1.y,9)
		pset(p2.x,p2.y,12)
	end
	--state vector
	local x1=x+5
	local y1=y+6
	local p=rotate_point(x,y,x1,y1,a)
	line(p.x,p.y,x,y,7)
end

function draw_front_sphere(x,y,r,a)
	circ(x,y,r,1)
	--draw lines
	local n=10
	for i=-n,n,2 do
		local s=(i)*(r/n) -- adjust the step size as needed
		local x1=x+sqrt(r^2-s^2)
		local y1=y-s
		local x2=x-sqrt(r^2-s^2)
		local y2=y-s
		local p1=rotate_point(x,y,x1,y1,a)
		local p2=rotate_point(x,y,x2,y2,a)
		--draw oval
		local dx=sqrt(r^2-s^2)
		oval(x-dx,p1.y,x+dx,p2.y,3)
	end
end

--draws point on outside of circle
function draw_point(x,y,r,px,py,pz,a)
	local p=rotate_point(x,y,x+px,y+pz,a)
	--now we find width
	local dx=sqrt(r^2-py^2-px^2)
	line(x+dx,p.y,x,y,1)
	pset(x+dx,p.y,7)
end

--rotate point around center coords
--center point=cx,cy point=x,y
function rotate_point(cx,cy,x,y,a)
	local nx=cx+(x-cx)*cos(a)-(y-cy)*sin(a)
	local ny=cy+(x-cx)*sin(a)+(y-cy)*cos(a)
	return {x=nx,y=ny}
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
