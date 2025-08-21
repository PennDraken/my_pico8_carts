pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	--camera
	c={}
	c.x=256
	c.y=256
	c.vx=0
	c.vy=0
	
	_planets={}
	--add(_planets,new_p(14,50,0,-0.1,1,2))
	--add(_planets,new_p(50,50,0,0.1,1,2))
	local size_table={0.1,0.1,0.1,0.1,0.1,0.2,0.3,0.4,0.5,0.5,0.5}
	for i=1,100 do
		local r=rnd(size_table)
		local m=3.14*r^2--r+1 because r=0
		local speed=3
		local fx=rnd(speed)-speed/2
		local fy=rnd(speed)-speed/2
		local w=128
		local x=flr(rnd(w))+c.x-64
		local y=flr(rnd(w))+c.y-64
		local p=new_p(x,y,fx/m,fy/m,r,m,flr(rnd(15))+1)
		add(_planets,p)
	end
	t=0
end

function new_p(x,y,vx,vy,r,m,c)
	p={}
	p.x=x
	p.y=y
	p.vx=vx
	p.vy=vy
	p.ax=0
	p.ay=0
	p.r=r
	p.m=m
	p.c=c
	return p
end
-->8
function _draw()
	cls()
	camera(c.x-64,c.y-64)
	rect(c.x-64,c.y-64,c.x+63,c.y+63,7)
	local tp=_planets[1]
	for p in all(_planets) do
		circfill(p.x,p.y,p.r,p.c)
		--line(p.x,p.y,p.x+p.ax*100,p.y+p.ay*100,p.c)
		--put camera on biggest mass
		if p.m>tp.m then
			tp=p
		end
	end
	
	--move camera
	--[[
	local dx=tp.x-c.x
	local dy=tp.y-c.y
	if abs(dx+dy)>1 then
		local angle=atan2(dx,dy)
		local speed=1
		c.x+=speed*cos(angle)
		c.y+=speed*sin(angle)
	else
		c.x=tp.x
		c.y=tp.y
	end
	--]]
	
end
-->8
function _update()
	--move camera
	if btnp(⬅️) then
		c.x-=1
	elseif btnp(➡️) then
		c.x+=1
	end
	if btnp(⬆️) then
		c.y-=1
	elseif btnp(⬇️) then
		c.y+=1
	end

	--reset
	for p in all(_planets) do
		p.ax=0
		p.ay=0
	end
	--calculate acceleration
	local del_planets={}
	for i=1,#_planets-1 do
		local p1=_planets[i]
		for j=i+1,#_planets do
			local p2=_planets[j]
			local f=get_f(p1,p2)
			if f=="overlap" then--overlap
				--merge
				p1.m+=p2.m
				p1.r=sqrt(p1.m/3.14)
				p1.vx=((p1.m*p1.vx+p2.m*p2.vx)/2)/p1.m
				p1.vy=((p1.m*p1.vy+p2.m*p2.vy)/2)/p1.m
				add(del_planets,p2)
				break
			end
			local fx=f[1]
			local fy=f[2]
			p1.ax+=fx/p1.m
			p1.ay+=fy/p1.m
			p2.ax-=fx/p2.m
			p2.ay-=fy/p2.m
		end
	end
	--remove old planets
	for p in all(del_planets) do
		del(_planets,p)
	end

	for p in all(_planets) do
		move_p(p)
	end
	--[[
	local size_table={0.1,0.1,0.1,0.1,0.1,0.2,0.3,0.4,0.5,0.5,0.5}
	if t%10000==0 then
		local r=10
		local m=3.14*r^2--r+1 because r=0
		local speed=3
		local fx=rnd(speed)-speed/2
		local fy=rnd(speed)-speed/2
		local w=128
		local x=flr(rnd(w))+c.x-64
		local y=flr(rnd(w))+c.y-64
		local p=new_p(x,y,fx/m,fy/m,r,m,flr(rnd(15))+1)
		--add(_planets,p)
	end
	--]]
	t+=1
end

function move_p(p)
	p.vx+=p.ax
	p.vy+=p.ay
	local _fric=1
	p.vx*=_fric
	p.vy*=_fric
	p.x +=p.vx
	p.y +=p.vy
	--border collision
	--border_check(p)
end

function border_check(p)
	if p.x<0 then
		p.vx=abs(p.vx)
	elseif p.x>128 then
		p.vx=-abs(p.vx)
	end
	if p.y<0 then
		p.vy=abs(p.vy)
	elseif p.y>128 then
		p.vy=-abs(p.vy)
	end
end

--gets accelerational pull
--between two planets
function get_f(p1,p2)
	--f=g(m1*m2)/r^2
	local dx=p2.x-p1.x
	local dy=p2.y-p1.y
	--local r=sqrt(dx^2+dy^2)
	local r2=dx^2+dy^2
	--overlap
	if r2<(p1.r+p2.r)^2 and dx+dy<sqrt(32767) then
		return "overlap"
	end
	--gravity calculation
	local g=2
	local f=g*(p1.m*p2.m)/r2
	if f<0 or f>100 then
		f=0
	end
	local angle=atan2(dx,dy)
	local fx=cos(angle)*f
	local fy=sin(angle)*f
	return {fx,fy}
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
