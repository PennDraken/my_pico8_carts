pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	boxes={
	new_inpbox(30,104,6,"$/mnth","monthly investment"),
	new_inpbox(90,104,2,"%","interest rate"),
	new_inpbox(110,104,2,"y","years")
	}
	boxes[0]=new_inpbox(0,104,6,"start","starting capital")

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
	draw_graph(1,8,126,102,arrx,arry)
end

function draw_graph(x1,y1,x2,y2,arrx,arry)
	rectfill(x1,y1,x2,y2,0)
	--find min values
	minx=amin(arrx)
	miny=amin(arry)
	--find max values
	maxx=amax(arrx)
	maxy=amax(arry)
	
	--find width+height
	w=x2-x1
	h=y2-y1
	for i=1,#arrx do
		numx=arrx[i]
		numy=arry[i]
		--cords on screen
		local _x=((numx-minx)/(maxx-minx))*(w)+x1
		--local _y=((numy-miny)/(maxy-miny))*(h)+y1
		local _y = h - (((numy - miny) / (maxy - miny)) * h) + y1

		circ(_x,_y,1,7)
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
	if btnp(➡️) then
		seln=(seln+1)%(#boxes+1)
	elseif btnp(⬅️) then
		seln=(seln-1)%(#boxes+1)
	elseif btnp(⬆️) then
		b.num=(b.num+1)%(10^b.w)
	elseif btnp(⬇️) then
		b.num=(b.num-1)%(10^b.w)
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
	r=1+r/12
	for i=0,m do
		money+=s
		money*=r
	end
	return money
end
-->8
--input boxes
function new_inpbox(x,y,w,name,desc)
	b={}
	b.x=x
	b.y=y
	b.w=w
	b.name=name
	b.num=0--number displayed
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
