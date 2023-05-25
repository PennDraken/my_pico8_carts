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
	cls(13)
	print(stat(34),0,0)
	--nodes
	for node in all(nodes) do
	 node:draw()
	end
	
	--selected nodes
	if prev_node!=nil then
	 circ(prev_node.x,prev_node.y,prev_node.w,12)
	end
	
	--mouse draw
	if mouse_node!=nil then
		--on node so point finger
		circ(mouse_node.x,mouse_node.y,mouse_node.w,15)
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
 
 --left click
 if mouse_held()==1 then
	 if mouse_node==nil then
	  _node=new_node(mx,my,prev_node,next_node)
	 	add(nodes,_node)
	 	prev_node=_node
	 else
	  prev_node=mouse_node
	 end
 elseif mouse_held()>10 then
 	if selected_node==nil then
 		selected_node=node_collision(mx,my)
 	else
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
 node.w=2
 
 node.draw=function(this)
  if this.prv!=nil then
   --this.prv:draw()
   linefill(this.x,this.y,this.prv.x,this.prv.y,this.prv.w,6)
  end
  if this.nxt!=nil then
   --this.nxt:draw()
   linefill(this.x,this.y,this.nxt.x,this.nxt.y,this.nxt.w,6)
  end
  circ(this.x,this.y,this.w,7)
 end
 
 
 return node
end

--return node under mouse
function node_collision(mx,my)
 p=2--pixels extra grab radius
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
__gfx__
00000000010000000100000000111000001111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000171000001610000000171000017777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177100001661000000171110111177710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177710001666100011177771171177710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177771001666610017177771017777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177110001661100001777771001777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011710000116100000177710000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
