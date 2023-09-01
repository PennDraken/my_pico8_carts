pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	boxes={
	new_inpbox(30,104,6,"$/mnth","monthly investment",10),
	new_inpbox(90,104,2,"%","interest rate",6),
	new_inpbox(110,104,2,"y","years",3)
	}
	boxes[0]=new_inpbox(0,104,6,"start","starting capital",480)

	seln=0
	arrx={}
	arry={}
end
-->8
function _draw()
	cls(13)
	for i=0,#boxes do
		if i!=seln then
			boxes[i]:draw(13)
		else
			boxes[i]:draw(11)
		end
	end
	--extended info box
	rectfill(0,128-8,128,128,1)
	print(boxes[seln].desc,2,122,7)
	--graph
	_x1=1+16
	_y1=8
	_x2=126-16
	_y2=102
	o=2
	rectfill(_x1,_y1,_x2,_y2,0)
	draw_graph(_x1+o,_y1+o,_x2-o,_y2-o,arrx,arry)
end

function draw_graph(x1,y1,x2,y2,arrx,arry)
	rectfill(x1,y1,x2,y2,0)
	--find min values
	minx=amin(arrx)
	--miny=amin(arry)
	miny=0
	--find max values
	maxx=amax(arrx)
	maxy=amax(arry)
	
	--find width+height
	w=x2-x1
	h=y2-y1
	_x=nil--for line drawing
	_y=nil
	for i=1,#arrx do
		numx=arrx[i]
		numy=arry[i]
		oldx=_x
		oldy=_y
		--check if first coord
		if _x==nil and _y==nil then
			--coords on screen
			_x=((numx-minx)/(maxx-minx))*(w)+x1
			--local _y=((numy-miny)/(maxy-miny))*(h)+y1
			_y=h-(((numy-miny)/(maxy-miny))*h)+y1
		else
			--coords on screen
			_x=((numx-minx)/(maxx-minx))*(w)+x1
			--local _y=((numy-miny)/(maxy-miny))*(h)+y1
			_y=h-(((numy-miny)/(maxy-miny))*h)+y1
			line(oldx,oldy,_x,_y,7)
			--circ(_x,_y,0,7)
		end
		--year seperator
		if numx%12==0 then
			line(_x,_y,_x,y1+h,1)
			circfill(_x,_y,2,9)
		end
		
		--text for first and last point
		if i==1 then
			print(arry[1],_x-12,_y,7)
		elseif i==#arrx then
			print(flr(arry[#arry]),_x+2,_y,7)
		end
	end
end

function amin(arr)
	minv=30000
	for num in all(arr) do
		if num<minv then
			minv=num
		end
	end
	return minv
end

function amax(arr)
	maxv=0
	for num in all(arr) do
		if num>maxv then
			maxv=num
		end
	end
	return maxv
end
-->8
function _update()
	b=boxes[seln]
	if b.num<100 then
		_inc=1
	else
		_inc=10
	end
	if btnp(➡️) then
		seln=(seln+1)%(#boxes+1)
	elseif btnp(⬅️) then
		seln=(seln-1)%(#boxes+1)
	elseif btnp(⬆️) then
		b.num=(b.num+_inc)%(10^b.w)
	elseif btnp(⬇️) then
		b.num=(b.num-_inc)%(10^b.w)
	end
	--calculations
	arrx={}--reset graph arr
	arry={}
	for i=1,boxes[3].num*12 do
		start=boxes[0].num
		s=boxes[1].num
		r=boxes[2].num
		m=i
		--add to arr
		add(arrx,i)
		add(arry,calc(start,s,r,m))
	end
end

--find capital in future
function calc(start,s,r,m)
	money=start
	r=1+(r)/100
	if m<=1 then return start end
	for i=2,m do
		money+=s
		if i%12==0 then
			money*=r
		end
	end
	return money
end
-->8
--input boxes
function new_inpbox(x,y,w,name,desc,num)
	b={}
	b.x=x
	b.y=y
	b.w=w
	b.name=name
	b.num=num--number displayed
	b.desc=desc--description
	
	b.draw=function(this,c)
		rectfill(this.x,this.y,this.x+this.w*4+2,this.y+16,c)
		print(this.name,this.x+2,this.y+2,0)
		print(this.num,this.x+2,this.y+10,0)
	end
	
	return b
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
