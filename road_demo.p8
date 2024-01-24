pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	_set_fps(60)
	tool_table={"add_node",
													"connect_node_straight",
													"connect_node_curved",
													"delete"}
	sel_tool="add_node"
	poke(0x5f2d,1)--mouse listener
	m=new_m()--mouse
	--objects
	nodes={}
	_node_r=2
	connections={}
	--ui
	ui={}
	local b=new_b(0,120,64,80,"add_node")
	b.selected=true
	add(ui,b)
	local b=new_b(8,120,65,81,"connect_node_straight")
	add(ui,b)
	local b=new_b(16,120,66,82,"connect_node_curved")
	add(ui,b)
	local b=new_b(24,120,67,83,"delete")
	add(ui,b)
end

--node
function new_n(x,y,r)
	n={}
	n.x=x
	n.y=y
	n.r=r
	n.selected=false
	return n
end

--connection
function new_c(from,to,t)
	c={}
	c.from=from
	c.to=to
	c.t=t--type ("straight","curved")
	return c
end

--mouse
function new_m()
	m={}
	m.x=stat(32)-1
	m.y=stat(33)-1
	m.lclick=false
	m.rclick=false
	m.lheld=0--frames held
	m.rheld=0
	m.s=128--standard sprite
	m.draw=function(this)
		spr(this.s,this.x,this.y)
	end
	m.update=function(this)
		this.x=stat(32)-1--update position
		this.y=stat(33)-1
		if stat(34)==1 then
			if this.lheld==0 and not this.lclick then
				this.lclick=true
			elseif this.lheld then
				this.lclick=false
				this.lheld+=1
			end
		elseif stat(34)!=1 then
			this.lclick=false
			this.lheld=0
		end
		
		if stat(34)==2 then
			if this.rheld==0 and not this.rclick then
				this.rclick=true
			elseif not this.rheld then
				this.rclick=false
				this.rheld+=1
			end
		else
				this.rclick=false
				this.rheld=0
		end
	end
	return m
end

--pressable button
function new_b(x,y,n1,n2,name)
	b={}
	b.x=x
	b.y=y
	b.w=8
	b.h=8
	b.n1=n1
	b.n2=n2
	b.selected=false
	b.name=name
	b.draw=function(this)
		if this.selected then
			spr(this.n2,this.x,this.y)
		else
			spr(this.n1,this.x,this.y)
		end
	end
	return b
end
-->8
function _draw()
	cls(3)--grass color
 print(stat(34))
 
 for n in all(nodes) do
	 if n.selected then
	  circ(n.x,n.y,n.r,7)
	 else
	  circ(n.x,n.y,n.r,1)
	 end
 end
 
 for c in all(connections) do
 	n1=c.from
 	n2=c.to
 	line(n1.x,n1.y,n2.x,n2.y,6)
 end
 --ui
 draw_ui()
 m:draw()
end

function draw_ui()
	--lower box
	rectfill(0,120,128,128,0)
	for b in all(ui) do
		b:draw()
	end
end
-->8
function _update60()
	--update mouse
	m:update()
	--mouse click
	--ui area
	if m.y>120 then
		if m.lclick then
			for b in all(ui) do
				if m.x>b.x and m.x<b.x+b.w and
				 		m.y>b.y and m.y<b.y+b.h then
					deselect(ui)
					sel_tool=b.name
					b.selected=true
					break
				end
			end
		end
	elseif sel_tool=="add_node" then
		if m.lclick then
			local n=new_n(m.x,m.y,_node_r)
			add(nodes,n)
		end
	elseif sel_tool=="connect_node_straight" then
		if m.lclick then
			local n=node_at(m.x,m.y)
			if n!=nil then
				if not n.selected then
					n.selected=true
				else
					n.selected=false
				end
				if select_count(nodes)>=2 then
					local connect_nodes={}
					for n2 in all(nodes) do
						if n2.selected then
							add(connect_nodes,n2)
						end
					end
					local c=new_c(connect_nodes[1],connect_nodes[2])
					add(connections,c)
					deselect(nodes)
				end
			end
		end
	end
end

--returns node at x y coordinates
function node_at(x,y)
	for n in all(nodes) do
		if x>n.x-n.r and x<n.x+n.r and
				 y>n.y-n.r and y<n.y+n.r then
			return n
  end
	end
	return nil--nothing found
end

--deselects all elements in list
function deselect(list)
	for e in all(list) do
		e.selected=false
	end
end

function select_count(list)
	local counter=0
	for e in all(list) do
		if e.selected then
			counter+=1
		end
	end
	return counter
end	
__gfx__
00000000111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111113333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100011000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01000010160100001777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10000001107100001001670007000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10000001011700000110067000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10000071000071100000017000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10000777000017010000107100707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01000070000010610000100107000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100000001100000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c1111c0011cccc0011cccc00cccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c1cccc1c16c1cccc17777cccc7cccc7c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1cccccc11c71cccc1cc167cccc7cc7cc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1cccccc1c117ccccc11cc67cccc77ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1ccccc71cccc711cccccc17cccc77ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1cccc777cccc17c1cccc1c71cc7cc7cc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c1cccc7ccccc1c61cccc1cc1c7cccc7c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c1111c00cccc1100cccc1100cccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01000000010000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000171000001710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000177100001771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000177710001777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100177771001777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711000177110b01771100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0117100001171bbb0117188800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707007707700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707707007070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70707707707700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707770777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70007700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77007000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707000777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
