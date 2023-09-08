pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	cls()
	--mouse
	poke(0x5f2d, 1)
	f1=emptyfunc()
	f2=emptyfunc()
	--f1[1]=3
	--f1[2]=5
	--f1[3]=2
	--f2[1]=4
	--f2[2]=2
	--?convolve({2,3,0,0},{3},0)
	--?convolve({2,3,0,0},{3},1)
	--?convolve({2,3,0,0},{3},2)
	--stop()
	--?f3[1]
	--?f3[2]
	--stop()
	f3=convarr(f1,f2)
	for y in all(f3) do
		--print(y)
	end
	b1=new_inpbox(1,1+40*0,126,1+40*1,f1)
	b2=new_inpbox(1,1+40*1,126,1+40*2,f2)
	b3=new_inpbox(1,1+40*2,126,1+40*3,f3)
	b3.disp=true
	boxes={b1,b2,b3}
end

function emptyfunc()
	f={}
	for i=1,128 do
		add(f,0)
	end
	return f
end

function printarr(f)
	for p in all(f) do
		print("x="..p[1].." y="..p[2])
	end
end

function test()
	--test
	f1={3,-3,2}
	f2={4,2}
	f3=convarr(f1,f2)
end
-->8
--helper functions

--convolves two functions
--returns value at n (x-coord)
function convolve(f1,f2,n)
	--find x of the biggest non zero value
	bign=max(#f1,#f2)
	while bign!=1 do
		if f1[bign]==0 or f2[bign]==0 then
			bign-=1
		else
			break
		end
	end
	
	sum=0
	for k=0,bign do
		--f1[n+k]
		y1=f1[n+k]
		--f2[bign-1-k]
		y2=f2[bign-k]
		--sum
		if y1!=nil and y2!=nil then
			sum+=y1*y2
		end
	end
	
	return sum
end

--gives coord-array of convolved
--array
function convarr(f1,f2)
	f={}
	for x=0,126 do
		add(f,convolve(f1,f2,x))
	end
	return f
end

function minarr(f)
	minv=f[1]
	for i=2,#f do
		v=f[i]
		if v<minv then
			minv=v
		end
	end
	return minv
end

function abs_maxarr(f)
	maxv=f[1]
	for i=2,#f do
		v=f[i]
		if abs(v)>maxv then
			maxv=v
		end
	end
	return maxv
end


-->8
--draw
function _draw()
	--bg
	cls(15)
	--input boxes
	for b in all(boxes) do
		b:draw()
	end
	--mouse
	mx=stat(32)
	my=stat(33)
	mb=stat(34)
	if mb==0 then
		spr(1,mx,my)
	else
		spr(2,mx,my)
	end
end

--input box which stores a function
function new_inpbox(x1,y1,x2,y2,f)
	b={
		x1=x1,y1=y1,x2=x2,y2=y2,f=f,disp=false
	}
	b.draw=function(this)
		b=this
		rect(b.x1,b.y1,b.x2,b.y2,1)
		midy=b.y1+(b.y2-b.y1)/2
		--draw function in box
		if not b.disp then
			for _x=1,b.x2-b.x1-1 do
				_y=b.f[_x] or 0
				line(_x+b.x1,midy,
									_x+b.x1,midy-_y,6)
				pset(_x+b.x1,midy-_y,0,7)
			end
		else
			--find highest/lowest value
			maxy=abs_maxarr(b.f)
			--draw values
			for _x=1,b.x2-b.x1-1 do
				_y=b.f[_x] or 0
				_y=(_y/maxy)*(b.y2-b.y1)/2
				line(_x+b.x1,midy,
									_x+b.x1,midy-_y,6)
													pset(_x+b.x1,midy-_y,0,7)

			end
		end
	end
	return b
end


-->8
--update
function _update()
	--conv calc
	--mouse click
	if mb==0 and mblast!=0 then
		mblast=0--reset
		--update calculation in b3
		b3.f=convarr(b1.f,b2.f)
	end
	
	if mb==1 then
		mblast=1
		--find box
		for b in all(boxes) do
			if mx>b.x1 and my>b.y1 and
						mx<b.x2 and my<b.y2 then
					--set coordinate in box
					--y = distance to middle of box
					_y=-(my-(b.y1+(b.y2-b.y1)/2))
					--x = mx-b.x1
					_x=mx-b.x1
					b.f[_x]=_y
				break
			end
		end
	end
end
__gfx__
00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
