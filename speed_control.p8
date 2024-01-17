pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	--player
	px=64
	py=64
	pmaxv=2
	pmaxa=0.3
	pa=0
	pvx=0
	pax=0
	--camera
	cx=64
	cxf=64
	cy=64
	cmaxv=2
	cmaxa=0.05
	ca=0
	cvx=0
	cax=0
end

function new_e(x,y,vx,vy,ax,ay,amax)
	e={}
	e.x=x
	e.y=y
	e.vx=vx
	e.vy=vy
	e.ax=ax
	e.ay=ay
	e.amax=amax
	
	return e
end
-->8
--update	
function _update()
	--player steering
	if btnp(⬅️) then
		pa=-pmaxa
	elseif btnp(➡️) then
		pa=pmaxa
	else
		pa=0
	end
	pvx+=pa
	--camera logic
	t=flr(abs((cvx-pvx)/cmaxa))
	cxf=fp(cx,cvx,-ca,t)
	pxf=px+pvx*t
	if cxf>pxf then
		ca=-cmaxa
	elseif cxf<pxf then
		ca=cmaxa
	else
		ca=0
	end
	cvx+=ca
	--move player
	px+=pvx
	--move camera
	cx+=cvx
end
-->8
--draw
function _draw()
	cls()
	--draw camera
	circ(cx,cy,1,1)
	--draw deceleration point
	circ(cxf,cy,0,1)
		--draw player
	circ(px,py,1,6)
end
-->8
--misc
--future position
--position,velocity,acc,frames
function fp(x,v,a,t)
	return x+v*t+0.5*a*t^2
end

--gets acceleration to
--reach goal
function get_a(cx,cvx,ca,cmaxa
															px,pvx)
	t=flr(abs((cvx-pvx)/cmaxa))
	cxf=fp(cx,cvx,-ca,t)
	pxf=px+pvx*t
	if cxf>pxf then
		ca=-cmaxa
	elseif cxf<pxf then
		ca=cmaxa
	else
		ca=0
	end
	cvx+=ca
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
