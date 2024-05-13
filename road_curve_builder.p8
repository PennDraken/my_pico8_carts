pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
 init_input()
 
 nodes={}
 prev_node=nil
 next_node=nil
 last_angle=0
 debug=false
end


-->8
--draw
function _draw()
	cls(5)
	--nodes
	for node in all(nodes) do
	 node:draw_curve()
	end
	
	for node in all(nodes) do
	 node:draw_node()
	end
	
	if prev_node!=nil then
		--draw outline of node selected
		circ(prev_node.x,prev_node.y,prev_node.w+1,12)
		--draw imaginary connection
		draw_curve(prev_node, {x=stat(32), y=stat(33), a=(last_angle+0.5)%1}, prev_node.w, 6)
	end
	draw_mouse()
end

function draw_mouse()
	--mouse draw
	if mouse_node!=nil then
		--on node so point finger
		circ(mouse_node.x,mouse_node.y,mouse_node.w+1,15)
	 if mouse_time_held>10 then
	 	--grab hand
	 	spr(4,stat(32)-1,stat(33)-1)
	 else
	 	--point finger
	 	spr(3,stat(32)-1,stat(33)-1)
	 end
	elseif stat(34)==0 then
	 spr(1,stat(32)-1,stat(33)-1)
	else
		spr(2,stat(32)-1,stat(33)-1)
	end
end
-->8
--update
function _update()
 mx=stat(32)-1
 my=stat(33)-1
 mouse_node=node_collision(mx,my)
 
	--scroll rotate
	if mouse_node then
		if stat(36)==1 then
			mouse_node:rotate(1)
		elseif stat(36)==-1 then
			mouse_node:rotate(-1)
		end
	else
		if stat(36)==1 then
			last_angle=(last_angle+0.05)%1
		elseif stat(36)==-1 then
			last_angle=(last_angle-0.05)%1
		end
	end
 --left click
 if mouse_held()==1 then
	 if mouse_node==nil then
	 	--create unconnected node
	  	_node=new_node(mx,my,prev_node,next_node)
		_node.a=last_angle
	 	add(nodes,_node)
	 	prev_node=_node
	 else
	 	--connect two nodes with eachother
	  mouse_node.nxt=prev_node
	  prev_node=mouse_node
	  last_angle=mouse_node.a
	 end
 elseif mouse_held()>2 then
 	--find node
 	if selected_node==nil then
 		selected_node=node_collision(mx,my)
 	else
 		--move node
 		selected_node.x=mx
 		selected_node.y=my
 	end
 else
		selected_node=nil 
 end
 
 --right click
 if stat(34)==2 then
 	--deselect
  if mouse_node==nil then
  	prev_node=nil
  --delete node under mouse
  else
  	for n in all(nodes) do
  		if n.prv==mouse_node then
  			n.prv=mouse_node.prv
				elseif n.nxt==mouse_node then
				 n.nxt=mouse_node.nxt
				end  		
  	end
   del(nodes,mouse_node)
   mouse_node=nil
  end
 end
end


-->8
--nodes system
function new_node(x,y,prv,nxt)
 node={}
 node.x=x
 node.y=y
 node.prv=prv
 node.nxt=nxt
 node.a=0
 node.w=1
 node.draw_curve=function(this)
	if this.prv!=nil then
		local n={x=this.x,y=this.y,a=(this.a+0.5)%1}
		draw_curve(n,this.prv,this.w,7)
  	end
	if this.nxt!=nil then
		--local n={x=this.nxt.x,y=this.y,a=(this.a+0.5)%1}
		--draw_curve(this,this.nxt,7)
  end
 end
 node.draw_node=function(this)
 	circfill(this.x,this.y,this.w-1,6)
 	--draw angle line
  line(this.x+cos(this.a)*this.w,
					  this.y+sin(this.a)*this.w,
					  this.x-cos(this.a)*this.w,
					  this.y-sin(this.a)*this.w,
					  7
					  )
 end
 node.rotate=function(this,dir)
 	local speed=0.05
 	this.a=(this.a+speed*dir)%1
 end
 return node
end


--return node under mouse
function node_collision(mx,my)
 local p=1--pixels extra grab radius
 for n in all(nodes) do
  if mx>n.x-n.w-p and my>n.y-n.w-p and
 				mx<n.x+n.w+p and my<n.y+n.w+p then
   return n
  end
 end
 return nil
end

--linefill x0 y0 x1 y1 r [col]
--made by freds72
function linefill(ax,ay,bx,by,r,c)
 if(c) color(c)
 local dx,dy=bx-ax,by-ay
 -- avoid overflow
 -- credits: https://www.lexaloffle.com/bbs/?tid=28999
 local d=max(abs(dx),abs(dy))
 local n=min(abs(dx),abs(dy))/d
 d*=sqrt(n*n+1)
 if(d<0.001) return
 local ca,sa=dx/d,-dy/d
   
 -- polygon points
 local s={
  {0,-r},{d,-r},{d,r},{0,r}
 }
 local u,v,spans=s[4][1],s[4][2],{}
 local x0,y0=ax+u*ca+v*sa,ay-u*sa+v*ca
 for i=1,4 do
  local u,v=s[i][1],s[i][2]
  local x1,y1=ax+u*ca+v*sa,ay-u*sa+v*ca
  local _x1,_y1=x1,y1
  if(y0>y1) x0,y0,x1,y1=x1,y1,x0,y0
  local dx=(x1-x0)/(y1-y0)
  if(y0<0) x0-=y0*dx y0=-1
  local cy0=y0\1+1
  -- sub-pix shift
  x0+=(cy0-y0)*dx
  for y=y0\1+1,min(y1\1,127) do
   -- open span?
   local span=spans[y]
   if span then
   	rectfill(x0,y,span,y)
   else
    spans[y]=x0
   end
   x0+=dx
  end
  x0,y0=_x1,_y1
 end
end
-->8
--mouse handler
function init_input()
 poke(0x5f2d, 1)--mouse listen
 last_press=0
 mouse_time_held=0
end

function mouse_held()
 if stat(34)==1 then
  mouse_time_held+=1
 else
 	mouse_time_held=0
 end
 return mouse_time_held
end
-->8
--rendering functions
--input:two nodes
--draws curve between two nodes with color c
function draw_curve(n1,n2,w,c)
	--test our four intersections
	--p11 p21
	local a1=get_eval(n1,n2,true,true)
	local b1=get_eval(n1,n2,true,false)
	local c1=get_eval(n1,n2,false,false)
	local d1=get_eval(n1,n2,false,true)
	evals_list={}--for some reason we need to add these values manually :/
	add(evals_list,a1)
	add(evals_list,b1)
	add(evals_list,c1)
	add(evals_list,d1)
	if #evals_list==0 then
		print("No solution found",7)
	end
	--find best eval by looking at lengths
	local min_length=16000
	local best_fit_i=nil
	for i=1,#evals_list do
		if evals_list[i] then--if it exists
			local length=evals_list[i].length
			if length<min_length then
				best_fit_i=i--update our tabulation
				min_length=length
			end
		end
	end
	if (not best_fit_i) then
		linefill(n1.x,n1.y,
				 n2.x,n2.y, w, c)--linefill x0 y0 x1 y1 r [col]
		return--no position found
	end
	--load best eval
	pos=evals_list[best_fit_i]
	pc1=pos.pc1
	pc2=pos.pc2
	px=pos.px
	r=pos.r
	print(pos.r,7)
	dir1=pos.dir1
	dir2=pos.dir2
	--stop()
	--draw
	if debug then
		--draw centre points
		circ(pc1.x,pc1.y,r,2)
		circ(pc2.x,pc2.y,r,2)
		circ(pc1.x,pc1.y,1,7)
		circ(pc2.x,pc2.y,1,7)
	end
	--arcs
	if (dir1!=dir2) return
	local an1=(n1.a+0.25)%1--angle normals
	local an2=(n2.a+0.25)%1
	local dir1=find_dir(n1,pc1,an1)
	local dir2=find_dir(n2,pc2,an2)
	if dir1==1 then
		draw_arc_points(n1,px,pc1,w,c,dir1)
	else
		draw_arc_points(n1,px,pc1,w,c,dir1)
	end
	if dir2==1 then
		draw_arc_points(n2,px,pc2,w,c,dir2)
	else
		draw_arc_points(n2,px,pc2,w,c,dir2)
	end
	--direction points
	--circ(n1.x+cos(an1)*8,n1.y+sin(an1)*8,1,4)
	--circ(n2.x+cos(an2)*8,n2.y+sin(an2)*8,1,4)
end

--evaluates intersection between circles at points and returns the point data for the "situation"
--set right to true if evaluating right point
function get_eval(n1,n2,right1,right2)
	local r=1
	local p1=get_point(n1,right1,r)
	local p2=get_point(n2,right2,r)
	--find r
	for i=0,30 do
		r=dist(p1,p2)/2
		--create our points
		p1=get_point(n1,right1,r)
		p2=get_point(n2,right2,r)
	end
	--find point at intersection
	local px=p(p1.x+(p2.x-p1.x)/2,p1.y+(p2.y-p1.y)/2)
	if (not req(dist(px,p1),r)) return nil
	local an1=(n1.a+0.25)%1--angle normals
	local an2=(n2.a+0.25)%1
	local dir1=find_dir(n1,p1,an1)
	local dir2=find_dir(n2,p2,an2)
	--print("dir1="..dir1.." dir2="..dir2)
	if debug then
		circ(p1.x,p1.y,r,1)
		circ(p2.x,p2.y,r,1)
		circ(px.x,px.y,3,7)
	end

	--evaluate intersection
	if dir1==dir2 then
		--circ(px.x,px.y,3,9)
		local length1=arc_length(n1,px,p1,dir1)
		local length2=arc_length(n2,px,p2,dir2)
		local pos={length=length1+length2, pc1=p1, pc2=p2, px=px, dir1=dir1, dir2=dir2, r=r}
		return pos
	end
	return nil
end

--returns point of a node
function get_point(n,right1,r)
	if right1 then
		return {x=n.x+cos(n.a)*r,y=n.y+sin(n.a)*r}
	else
		return {x=n.x-cos(n.a)*r,y=n.y-sin(n.a)*r}
	end
end

--estimates arc length
function arc_length(p1,p2,pc,dir)
	--draws arc from p1 to p2
	local r=dist(p2,pc)
	local start_angle=atan2(p1.x-pc.x,p1.y-pc.y)
	local end_angle  =atan2(p2.x-pc.x,p2.y-pc.y)
	if dir==-1 then
		end_angle, start_angle = start_angle, end_angle--swap
	end
	--circ(pc.x+cos(start_angle)*r,pc.y+sin(start_angle)*r,3,c)
	--circ(pc.x+cos(end_angle)*r  ,pc.y+sin(end_angle)*r,3,c)
	if (end_angle<start_angle) end_angle+=1--adjust so we can iterate towards it
	local delta_angle=abs(end_angle-start_angle)
	return delta_angle*2*3.14*r
end

--draw arc (dir=-1,1 clockwise/ anticlockwise)
function draw_arc_points(p1,p2,pc,w,c,dir)
	--draws arc from p1 to p2
	local r=dist(p2,pc)
	local start_angle=atan2(p1.x-pc.x,p1.y-pc.y)
	local end_angle  =atan2(p2.x-pc.x,p2.y-pc.y)
	if dir==-1 then
		end_angle, start_angle = start_angle, end_angle--swap
	end
	--circ(pc.x+cos(start_angle)*r,pc.y+sin(start_angle)*r,3,c)
	--circ(pc.x+cos(end_angle)*r  ,pc.y+sin(end_angle)*r,3,c)
	if (end_angle<start_angle) end_angle+=1--adjust so we can iterate towards it
	local a=start_angle
	while a<end_angle do
		--pset(pc.x+cos(a)*r,pc.y+sin(a)*r,c)
		circfill(pc.x+cos(a)*r,pc.y+sin(a)*r,w,c)
		a+=0.0005
	end
end


--distance between two points

function dist(p1,p2)
    local xdif=p2.x-p1.x
    local ydif=p2.y-p1.y
    local atan=atan2(xdif,ydif)
    return xdif / cos(atan)
end

--pythagorean distance (not used)
function dist2(p1,p2)
	local s=8--scales the output so we dont overflow
	return sqrt((p2.x/s-p1.x/s)^2+(p2.y/s-p1.y/s)^2)*s
end



--point
function p(x,y)
	local p={x=x,y=y}
	return p
end

--return direction. points are a table. x and y of a point p can be accessed through p.x and p.y. p point on circle. pc centre point of circle. a = angle of direction of point
-- -1 if anticlockwise 1 if clockwise
function find_dir(p1, pc, a)
	--create new point along direction of travel
	local d=1
	local temp_p=p(p1.x+cos(a)*d,p1.y+sin(a)*d)
	local org_a=atan2(p1.x    -pc.x,p1.y    -pc.y)--will always be 0
	local new_a=atan2(temp_p.x-pc.x,temp_p.y-pc.y)--will either be roughly 0.01 or 0.99
	--note we have an edge case when we cross angle 0
	--print("org_a:"..org_a.." new_a:"..new_a,c)
	local dist=abs(new_a-org_a)
	if dist<0.2 then
        if org_a>new_a then
            return -1
        else
            return 1
        end
    else
        if org_a<new_a then
            return -1
        else
            return 1
        end
    end
end

function find_dir2(p1, pc, a)
    --create new point along direction of travel
	local d=1--distance
	local temp_p=p(p1.x+cos(a)*d,p1.y+sin(a)*d)
	local org_a=atan2(p1.x-pc.x,p1.y-pc.y)
	local new_a=atan2(temp_p.x-pc.x,temp_p.y-pc.y)
	--note we have an edge case when we cross angle 0
	local mod_d=mod_dist(org_a,new_a,1)
	if mod_d>=0 then
		return -1
	else
		return 1
	end
end

--shortest distance between a and b
function mod_dist(a,b,n)
	local dist1=a-b
	local dist2=(a+1)-b
	if abs(dist1) > abs(dist2) then
		return dist1
	else
		return dist2
	end
end

--roughly equal
function req(val1, val2)
	local thr=0.015625--fraction 1/64
	return val1-(val1*thr)<val2 and val2<val1+(val1*thr)
end

__gfx__
00000000010000000100000000111000001111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000171000001610000000171000016666100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177100001661000000171110111166610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177710001666100011177771161166610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177771001666610017177771016666610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177110001661100001777771001666100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011710000116100000177710000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
