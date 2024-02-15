pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	a=0
	a2=0
	pointx=0
end
-->8
--update
function _update()
	a+=0.004
	a=a%1--2pi==1
	a2+=0.003
	a2=a2%1
	--pointx=(pointx+0.5)%64
end
-->8
--draw
function _draw()
	cls(0)
	local r=32--radius
	draw_side_sphere(64+32-1,96,32,a)
	draw_front_sphere(32,96,32,a)
	--draw_front_sphere(32,32,32,(a+0.25)%1)
	px=pointx+4
	py=5
	pz=sqrt(r^2-px^2-py^2)
	plot_point(px,py,pz)
	
	px=pointx-20
	py=10
	pz=sqrt(r^2-px^2-py^2)
	plot_point(px,py,pz)
	
	px=pointx-10
	py=25
	pz=sqrt(r^2-px^2-py^2)
	plot_point(px,py,pz)
	
	px=pointx+20
	py=-25
	pz=sqrt(r^2-px^2-py^2)
	plot_point(px,py,pz)
end

function plot_point(px,py,pz)
	r=32
	draw_point_front(32,96,r,px,py,pz)
	draw_point_side(96,96,r,px,py,pz)
end

function draw_side_sphere(x,y,r,a)
	circ(x,y,r,1)
	--draw lines
	local n=5
	for i=-n,n,2 do
		local s=(i)*(r/n) -- adjust the step size as needed
		local x1=x+sqrt(r^2-s^2)
		local y1=y-s
		local x2=x-sqrt(r^2-s^2)
		local y2=y-s
		local p1=rotate_point(x,y,x1,y1,a)
		local p2=rotate_point(x,y,x2,y2,a)
		line(p1.x,p1.y,p2.x,p2.y,9)
		pset(p1.x,p1.y,4)
		pset(p2.x,p2.y,12)
	end
	--state vector
	local x1=x+5
	local y1=y+6
	local p=rotate_point(x,y,x1,y1,a)
	--line(p.x,p.y,x,y,7)
end

function draw_front_sphere(x,y,r,a)
	circ(x,y,r,1)
	--draw lines
	local n=5
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
function draw_point_front(x,y,r,px,py,pz,a)
	local p=rotate_point(x,y,x+pz,y+py,a)
	line(x+px,p.y,x,y,1)
	pset(x+px,p.y,7)
end

function draw_point_side(x,y,r,px,py,pz,a)
	local p=rotate_point(x,y,x+pz,y+py,a)
	line(p.x,p.y,x,y,1)
	pset(p.x,p.y,7)
	--?px
	--?py
	--?pz,7
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
