pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
 init_input()
 
 nodes={}
 prev_node=nil
 next_node=nil
end


-->8
--draw
function _draw()
	cls(5)
	--nodes
	for node in all(nodes) do
	 node:draw_bg()
	end
	
	for node in all(nodes) do
	 node:draw_edges()
	end
	
	for node in all(nodes) do
	 node:draw_node()
	end
	
	--selected nodes
	if prev_node!=nil then
	 circ(prev_node.x,prev_node.y,prev_node.w+1,12)
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
 
 --scroll
 if mouse_node then
	 if stat(36)==1 then
			mouse_node:rotate(1)
		elseif stat(36)==-1 then
		 mouse_node:rotate(-1)
		end
	end
 --left click
 if mouse_held()==1 then
	 if mouse_node==nil then
	 	--create unconnected node
	  _node=new_node(mx,my,prev_node,next_node)
	 	add(nodes,_node)
	 	prev_node=_node
	 else
	 	--connect two nodes with eachother
	  mouse_node.nxt=prev_node
	  prev_node=mouse_node
	 end
 elseif mouse_held()>10 then
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
 node.angle=0
 node.w=3
 node.draw_bg=function(this)
  circfill(this.x,this.y,this.w,1)
 	if this.prv!=nil then
   --this.prv:draw()
   --linefill(this.x,this.y,this.prv.x,this.prv.y,this.prv.w,1)
  end
  if this.nxt!=nil then
   --linefill(this.x,this.y,this.nxt.x,this.nxt.y,this.nxt.w,1)
  end
 end
 node.draw_edges=function(this)
 	if this.prv!=nil then
  	--linefill(this.x,this.y,this.prv.x,this.prv.y,this.prv.w-1,6)
  	curvefill(this,this.prv,6)
  end
 	if this.nxt!=nil then
   --this.nxt:draw()
   --linefill(this.x,this.y,this.nxt.x,this.nxt.y,this.nxt.w-1,6)
   curvefill(this,this.nxt,6)
  end
 end
 node.draw_node=function(this)
 	circfill(this.x,this.y,this.w-1,6)
 	--draw angle line
  line(this.x+cos(this.angle)*this.w,
					  this.y+sin(this.angle)*this.w,
					  this.x-cos(this.angle)*this.w,
					  this.y-sin(this.angle)*this.w,
					  7
					  )
 end
 node.rotate=function(this,dir)
 	local speed=0.1
 	this.angle=(this.angle+speed*dir)%1
 end
 return node
end

--return node under mouse
function node_collision(mx,my)
 p=1--pixels extra grab radius
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
function curvefill(n1,n2,c)
	draw_arc(n1.x,n1.y,n2.x,n2.y,n2.w,c)
end

function draw_arc(x1, y1, x2, y2, radius, color)
    local angle1 = atan2(y1 - y2, x1 - x2)
    local angle2 = atan2(y2 - y1, x2 - x1)
    circfill(x1, y1, radius, color) -- draw starting point
    circfill(x2, y2, radius, color) -- draw ending point
    for i = 0, abs(angle1 - angle2) * radius * 0.5 do
        local angle = lerp(angle1, angle2, i / (abs(angle1 - angle2) * radius * 0.5))
        local x = x1 + cos(angle) * radius
        local y = y1 - sin(angle) * radius -- pico-8's y-axis is inverted
        circfill(x, y, radius, color)
    end
end

-- linear interpolation function
function lerp(a, b, t)
    return a + (b - a) * t
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
