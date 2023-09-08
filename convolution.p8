pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	cls()
	--f1={{0,3},{1,2},{2,-1}}
	--f2={{0,4},{3,-4}}
	f1={{0,3},{1,3},{2,2}}
	f2={{0,4},{1,2}}
	f3=convarr(f1,f2)
	for p in all(f3) do
		print("x="..p[1].." y="..p[2])
	end
end
-->8
--helper functions

--convolves two functions
--returns value at n (x-coord)
function convolve(f1,f2,n)
	--convulates two functions consisting of discrete points
	--sum of f(n-m)*g(m)
	--set m to min x-value of f1
	strtm=-minarr(f2)
	endm=minarr(f2)
	sum=0
	for m=strtm,endm,1 do
		--f1(n-m)*f2(m)
		--find y at (n-m) in f1
		y1=gety(f1,n-m)
		--find y at (m) in f2
		y2=gety(f2,m)
		sum+=y1*y2
	end
	return sum
end

--gives coord-array of convolved
--array
function convarr(f1,f2)
	f={}
	startx=min(minarr(f1),minarr(f2))
	endx=max(maxarr(f1),maxarr(f2))

	for x=-10,8 do
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


--minimum non-zero element of
--array of coords (points)
function minarr(f)
	minx=f[1][1]
	for i=2,#f,1 do
		x=f[i][1]
		y=f[i][2]
		--check if x value is lower
		if x<minx and y!=0 then
			minx=x
		end
	end
	return minx
end

--max
function maxarr(f)
	maxx=f[1][1]
	for i=2,#f,1 do
		x=f[i][1]
		y=f[i][2]
		--check if x value is higher
		if x>maxx and y!=0 then
			maxx=x
		end
	end
	return maxx
end


-->8
--update
-->8
--misc functions

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
