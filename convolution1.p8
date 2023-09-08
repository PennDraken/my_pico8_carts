pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	--mouse
	poke(0x5f2d, 1)
	f1=emptyfunc()
	f2=emptyfunc()
	b1=new_inpbox(1,1,126,64,f1)
	
end

function emptyfunc()
	f={}
	for i=0,128 do
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
	bign=max(#f1,#f2)
	sum=0
	for k=0,bign do
		--f1[n+k]
		y1=f1[n+k]
		--f2[bign-1-k]
		y2=f2[bign-1-k]
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
	
	for x=0,max(#f1,#f2) do
	--for x=startx,endx do
		add(f,{x,convolve(f1,f2,x)})
	end
	return f
end

--gets y component of coord array
function gety(f,x)
	for coord in all(f) do
		if coord[1]==x then
			return coord[2]
		end
	end
	return 0
end



-->8
--draw
function _draw()
	cls(15)
	--mouse
	mx=stat(32)
	my=stat(33)
	mb=stat(34)
	spr(1,mx,my)
	--input boxes
	b1:draw()
	
end

--input box which stores a function
function new_inpbox(x1,y1,x2,y2,f)
	b={
		x1=x1,y1=y1,x2=x2,y2=y2,f=f
	}
	b.draw=function(this)
		b=this
		rect(b.x1,b.y1,b.x2,b.y2,1)
	end
	
	return b
end

-->8
--update
function _update()
	cls(15)
end
__gfx__
00000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000171100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
