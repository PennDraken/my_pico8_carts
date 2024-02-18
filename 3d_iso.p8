pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function init_verts()
	local verts = {
		p(-1, 1, -1),--front
  p(1, 1, -1),  
  p(-1, -1, -1), 
  p(1, -1, -1), 
  p(-1, 1, 1),--back
  p(1, 1, 1), 
  p(-1, -1, 1),
  p(1, -1, 1)  
	}
	return verts
end

--triangles
function init_faces()
 local faces = {
	 {1,2,3},--front
	 {2,3,4},
	 {5,6,7},--back
	 {6,7,8}, 
	 {1,2,5},--top
	 {2,5,6},
	 {3,7,8},--bottom
	 {3,4,8},
	 {1,5,3},--side
	 {3,7,5},
	 {4,6,8},--side
	 {4,2,6},
 }
 return faces
end


function _init()
	--stores angle information
	a=0.9
	a2=0
	--mesh
	zoom=40
	mesh={}
	--add edges
	verts=init_verts()
	faces=init_faces()
end


-->8
--update
function _update()
	local v=0.005
	if (btn(⬆️)) a+=v
	if (btn(⬇️)) a-=v
	if (btn(➡️)) a2-=v
	if (btn(⬅️)) a2+=v
	if (btn(❎)) zoom+=1
	if (btn(🅾️)) zoom-=1
	a=a%1
	a2=a2%1
end
-->8
--draw
function _draw()
	cls(0)
	local r=64--radius
	--draw_front_sphere(64,64,r,a)
	for face in all(faces) do
		local p1=verts[face[1]]
		local p2=verts[face[2]]
		local p3=verts[face[3]]
		screenp1=plot_point(p1.x,p1.y,p1.z,7)
		screenp2=plot_point(p2.x,p2.y,p2.z,7)
		screenp3=plot_point(p3.x,p3.y,p3.z,7)
		line(screenp1[1],screenp1[2],screenp2[1],screenp2[2],4)
		line(screenp1[1],screenp1[2],screenp3[1],screenp3[2],4)
		line(screenp2[1],screenp2[2],screenp3[1],screenp3[2],4)

	end
end

function plot_point(px,py,pz,c)
	local r=64
	local np=ry(px,py,pz,a2)
	px=np.x
	py=np.y
	pz=np.z
	p=draw_point_front(64,64,r,px*zoom,py*zoom,pz*zoom,c)
	return p
end

function draw_front_sphere(x,y,r,a)
	circ(x,y,r,1)
	--draw lines
	local n=3
	for i=-n+1,n-1,2 do
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
function draw_point_front(x,y,r,px,py,pz,c)
	local p=rotate_point(x,y,x+pz,y+py,a)
	--line(x+px,p.y,x,y,1)
	if pz>0 then
		--pset(x+px,p.y,c)
		circfill(x+px,p.y,1,c)
	else
		circfill(x+px,p.y,1,c)
	end
	return {x+px,p.y}
end

--rotate point around center coords
--center point=cx,cy point=x,y
function rotate_point(cx,cy,x,y,a)
	local nx=cx+(x-cx)*cos(a)-(y-cy)*sin(a)
	local ny=cy+(x-cx)*sin(a)+(y-cy)*cos(a)
	return {x=nx,y=ny}
end

--rotates around the y axis a degrees
function ry(x,y,z,a)
	local xp=x*cos(a)+z*sin(a)
	local yp=y
	local zp=-x*sin(a)+z*cos(a)
	return {x=xp,y=yp,z=zp}
end
-->8
--mesh
--point
function p(x,y,z)
	o={}
	o.x=x
	o.y=y
	o.z=z
	return o
end

--edge
function e(p1,p2)
	o={}
	o.p1=p1
	o.p2=p2
	return o
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
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
00000000000000000000000000333333333333000000000000000000000000000000000000000000000000000011111411111000000000000000000000000000
00000000000000000000003333100000000000333300000000000000000000000000000000000000000000111100009000000111100000000000000000000000
00000000000000000003331000000000000000000033300000000000000000000000000000000000000111000000090000000000011100000000000000000000
00000000000000000331000003333333333333300000033000000000000000000000000000000000011000000000090000000000000041000000000000000000
00000000000000003100033330000000000000033330000310000000000000000000000000000001100000000000900000000000000900110000000000000000
00000000000000330033300000000000000000000003330033000000000000000000000000000010000000000009000000000000009000001000000000000000
00000000000003103300000000000000000000000000003300310000000000000000000000001100000000000090000000000000009000000110000000000000
00000000000030330000000000000000000000000000000033031000000000000000000000010000000000000090000000000000090000000001000000000000
00000000000333000000000000000000000000000000000000333100000000000000000000100000000000000900000000000000900000000000100000000000
00000000003300000000000000000000000000000000000000003310000000000000000001000000000000009000000000000009000000000000010000000000
00000000033000000000000003333333333333300000000000000331000000000000000010000000000000090000000000000009000000000000001400000000
00000000330000000000033330000000000000033330000000000033100000000000000100000000000000900000000000000090000000000000009100000000
000000033000000000333000000000033000000000033300000000033100000000000c1000000000000000900000000000000900000000000000090010000000
00000030300000003300000000000000000000000000003300000003031000000000010000000000000009000000000000009000000000000000090001000000
00000313000000330000000000070000000000000000000033000000303000000000010000000000000090000000000000009000000000000000900001700000
00000303000033000000000000010000000000000000000000330000303100000000100000000000000900000000000000090000000000000009000011100000
00003003000300000000000000001000000000000000070000003000300310000001000000000000000900000000000000900000000000000090000170010000
00031030033000000000000000001000000000000000100000000330030030000001000000000000009000000000000009000000000000000090011100010000
00030030300000700000000000001000000000000001000000000003030031000010000000000000090000000000000009000000000000000900110700001000
00310033000000010000000000001000000000000001000000000000330003000010000000000000900000000000000090000000000000009001111000001000
00300030000000001100000000000100000000000010000000000000030003100100000000000000900000000000000900000000000000090111100000000100
03100330000000000010000000000100000000000100000000000000033000300100000000000009000000000000009000000000000000091110000000000100
03100330000000000001000000000100000000001000000000000000033000300100000000000090000000000000009000000000000000111100000000000100
03003030000000000000110000333133333333010000000000000000030300311000000000000900000000000000090000000000000001110000000000000410
31030071000000000000001333000010000000313300000000000000300030031000000000009000000000000000900000000000000111000170000000009010
31030003111000000003330100000010000000100033300000000000300030031000000000009000000000000009000000000000001110011000000000090010
31300003000111100330000010000010000001000000033000000000300003031000000000090000000000000009000000000000111901100000000000090010
30300000300000011100000001100001000010000000000300000003000003031000000000900000000000000090000000000001119110000000000000900001
33000000300000330011100000010001000100000000000033000003000000331000000009000000000000000900000000000011111000000000000009000001
33000000030003000000011100001001001000000000000000300030000000331000000009000000000000009000000000001111090000000000000090000001
33000000030030000000000011110111001000000000000000030030000000331000000090000000000000090000000000011100900000000000000090000001
30000000003300000000000000001111110000000000000000003300000000031000000900000000000000090000000001110009000000000000000900000001
30000000003300000000000000000001100000000000000000003300000000031000009000000000000000900000000011000090000000000000009000000001
33000000030030000000000000000000000000000000000000030030000000331000090000000000000009000000000000000090000000000000090000000001
33000000030003000000000000000000000000000000000000300030000000331000090000000000000090000000000000000900000000000000900000000001
33000000300000330000000000000000000000000000000033000003000000331000900000000000000090000000000000009000000000000000900000000001
30300000300000003000000000000000000000000000000300000003000003031009000000000000000900000000000000090000000000000009000000000001
30300003000000000330000000000000000000000000033000000000300003031090000000000000009000000000000000900000000000000090000000000001
31030003000000000003330000000000000000000033300000000000300030031090000000000000090000000000000000900000000000000900000000000010
31030003000000000000003333000000000000333300000000000000300030031900000000000000090000000000000009000000000000000900000000000010
0300303000000000000000000033333333333300000000000000000003030031c000000000000000900000000000000090000000000000009000000000000010
03000330000000000000000000000000000000000000000000000000033000311000000000000009000000000000000900000000000000090000000000000010
03100330000000000000000000000000000000000000000000000000033000300100000000000090000000000000000900000000000000900000000000000100
00300030000000000000000000000000000000000000000000000000030003100100000000000090000000000000009000000000000000900000000000000100
00300033000000000000000000000000000000000000000000000000330003100100000000000900000000000000090000000000000009000000000000000100
00030030300000000000000000000000000000000000000000000003030031000010000000009000000000000000900000000000000090000000000000001000
00030030033000000000000000000000000000000000000000000330030031000010000000090000000000000000900000000000000900000000000000001000
00003003000300000000000000000000000000000000000000003000300310000001000000090000000000000009000000000000009000000000000000010000
00001303000033000000000000000000000000000000000000330000303010000001000000900000000000000090000000000000009000000000000000010000
00000303000000330000000000000000000000000000000033000000303100000000100009000000000000000900000000000000090000000000000000100000
00000030300000003300000000000000000000000000003300000003031000000000010090000000000000000900000000000000900000000000000001000000
000000133000000000333000000000033000000000033300000000033010000000000100900000000000000090000000000000090000000000000000c1000000
00000001330000000000033330000000000000033330000000000033010000000000001900000000000000090000000000000009000000000000000010000000
0000000013300000000000000333333333333330000000000000033010000000000000c100000000000000900000000000000090000000000000000100000000
00000000013300000000000000000000000000000000000000003301000000000000000010000000000000900000000000000900000000000000001000000000
00000000001333000000000000000000000000000000000000333010000000000000000001000000000009000000000000009000000000000000010000000000
00000000000130330000000000000000000000000000000033030100000000000000000000100000000090000000000000090000000000000000100000000000
00000000000013003300000000000000000000000000003300301000000000000000000000010000000900000000000000090000000000000001000000000000
00000000000001330033300000000000000000000003330033110000000000000000000000001100000900000000000000900000000000000110000000000000
00000000000000013000033330000000000000033330000301000000000000000000000000000010009000000000000009000000000000001000000000000000
000000000000000013300000033333333333333000000331100000000000000000000000000000011c0000000000000090000000000000110000000000000000
00000000000000000013330000000000000000000033311000000000000000000000000000000000011000000000000090000000000011000000000000000000
00000000000000000000113333000000000000333311100000000000000000000000000000000000000111000000000900000000011100000000000000000000
0000000000000000000000011133333333333311110000000000000000000000000000000000000000000011110000c000000111100000000000000000000000

