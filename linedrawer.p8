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
	cls() 
	--nodes
	for node in all(nodes) do
	 node:draw()
	end
	
	--selected nodes
	if prev_node!=nil then
	 circ(prev_node.x,prev_node.y,prev_node.w,12)
	end
	
	--mouse draw
	spr(1,stat(32)-1,stat(33)-1)
end
-->8
--update
function _update()
	--mouse click
 if mouse_pressed() then
  --select a node
  _node=node_collision(stat(32)-1,stat(33)-1)
  
  if _node==nil then
   --create new node
   _node=new_node(stat(32)-1,stat(33)-1,prev_node,next_node)
   add(nodes,_node)
   prev_node=_node
  elseif prev_node==_node then
   --deselect prev_node
   prev_node=nil
  else
  	--select prev_node
   prev_node=_node
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
 node.w=4
 
 node.draw=function(this)
  circ(this.x,this.y,this.w,4)
  if this.prv!=nil then
   --this.prv:draw()
   line(this.x,this.y,this.prv.x,this.prv.y)
  end
  if this.nxt!=nil then
   --this.nxt:draw()
   line(this.x,this.y,this.nxt.x,this.nxt.y)
  end
  
 end
 
 return node
end

--if mouse on node
--return node under mouse
--if no node return nil
function node_collision(mx,my)
 for n in all(nodes) do
  if mx>n.x-n.w and my>n.y-n.w and
 				mx<n.x+n.w and my<n.y+n.w then
   return n
  end
 end
 return nil
end
-->8
--mouse handler
function init_input()
 poke(0x5f2d, 1)--mouse listen
 last_press=0
end

function mouse_pressed()
 if stat(34)==1 then
		if last_press==0 then
		 last_press=1
		 return true 
		end
		return false
 end
 last_press=0
 return false
end
__gfx__
00000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
