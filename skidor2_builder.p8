pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	s=1--scale
 --cam
	cam={}
	cam.x=0
	cam.y=0
	--mouse
	poke(0x5f2d,1)
	mouse={
		x=stat(32),
		y=stat(33),
		lclick=false,
		lheld=true
	}
	--fence
	fences={}
	selected=fences
end
-->8
--draw
function _draw()
	cls(7)
	camera(cam.x,cam.y)
	--fence
	for i=1,#fences-1 do
		local p1=fences[i]
		local p2=fences[i+1]
		--pset(p1[1],p1[2],1)
		--pset(p2[1],p2[2],1)
		line(p1[1]*s,p1[2]*s,p2[1]*s,p2[2]*s,1)
	end
	
	--mouse
	camera()
	if stat(34)==1 then
		spr(2,mouse.x,mouse.y)
	else
		spr(1,mouse.x,mouse.y)
	end
end
-->8
--update
function _update()
	--mouse
	mouse.x=stat(32)
	mouse.y=stat(33)
	if stat(34)==1 then
		if not mouse.lheld and not mouse.lclick then
			--first frame
			mouse.lclick=true
		elseif stat(34)==1 then
			--second frame
			mouse.lclick=false
			mouse.lheld=true
		end
	else
		mouse.lclick=false
		mouse.lheld=false
	end
	--press
	if mouse.lclick then
		add(selected,{(mouse.x+cam.x)/s,(mouse.y+cam.y)/s})
		--stop()
	end
	--buttons
	if btn(⬆️) then
		cam.y-=1
	elseif btn(⬇️) then
		cam.y+=1
	elseif btn(➡️) then
		cam.x+=1
	elseif btn(⬅️) then
		cam.x-=1
	end
end
__gfx__
00000000111000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000110000001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700101000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
