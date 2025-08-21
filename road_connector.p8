pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	n1=new_node(10,120,0.9)
	n2=new_node(100,30,0.6)
	r=10
	poke(0x5f2d,1)--mouse init
end
-->8
--draw
function _draw()
	cls(1)
	n1:draw()
	n2:draw()
	--draw circles
	circ(p11.x,p11.y,r,2)
	circ(p12.x,p12.y,r,2)
	circ(p21.x,p21.y,r,2)
	circ(p22.x,p22.y,r,2)
	--draw centre points
	circ(pc1.x,pc1.y,1,7)
	circ(pc2.x,pc2.y,1,7)
	--circ(px.x,px.y,1,7)
	--arcs
	draw_arc_points(n1,px,pc1,7)
	draw_arc_points(n2,px,pc2,7)	
	--mouse
	spr(1,stat(32),stat(33))
end

--draw arc
function draw_arc_points(p1,p2,pc,c)
	--draws arc from p1 to p2
	local r=dist(p2,pc)
	local start_angle=atan2(p1.x-pc.x,p1.y-pc.y)
	local end_angle  =atan2(p2.x-pc.x,p2.y-pc.y)
	--circ(pc.x+cos(start_angle)*r,pc.y+sin(start_angle)*r,3,c)
	--circ(pc.x+cos(end_angle)*r  ,pc.y+sin(end_angle)*r,3,c)
	if (end_angle<start_angle) end_angle+=1--adjust so we can iterate towards it
	local a=start_angle
	while a<end_angle do
		pset(pc.x+cos(a)*r,pc.y+sin(a)*r,c)
		a+=0.001
	end
end

--intersection circles
function intersection_circles(p1, p2, r)
    local distance_squared = (p2.x - p1.x)^2 + (p2.y - p1.y)^2
    local radius_sum_squared = (r + r)^2
    if distance_squared <= radius_sum_squared then
        local distance = sqrt(distance_squared)
        local a = (r*r - r*r + distance*distance) / (2 * distance)
        local h = sqrt(r*r - a*a)
        local intersection_x1 = p1.x + a * (p2.x - p1.x) / distance + h * (p2.y - p1.y) / distance
        local intersection_y1 = p1.y + a * (p2.y - p1.y) / distance - h * (p2.x - p1.x) / distance
        local intersection_x2 = p1.x + a * (p2.x - p1.x) / distance - h * (p2.y - p1.y) / distance
        local intersection_y2 = p1.y + a * (p2.y - p1.y) / distance + h * (p2.x - p1.x) / distance
        return {x = intersection_x1, y = intersection_y1}, {x = intersection_x2, y = intersection_y2}
    else
        return nil -- Circles do not intersect
    end
end

-->8
--update
function _update()
    -- Update circle positions based on mouse input
    if stat(34) == 1 then -- Check if primary mouse button is pressed
        n1.x = stat(32) -- Update n1's x position to mouse x coordinate
        n1.y = stat(33) -- Update n1's y position to mouse y coordinate
        
        -- Change angle of n1 when scrolling and holding left mouse button
        if stat(36) == 1 then
            n1.a = n1.a + 0.1
        elseif stat(36) == -1 then
            n1.a = n1.a - 0.1
        end
    elseif stat(34) == 2 then -- Check if secondary mouse button is pressed
        n2.x = stat(32) -- Update n2's x position to mouse x coordinate
        n2.y = stat(33) -- Update n2's y position to mouse y coordinate
        
        -- Change angle of n2 when scrolling and holding right mouse button
        if stat(36) == 1 then
            n2.a = n2.a + 0.1
        elseif stat(36) == -1 then
            n2.a = n2.a - 0.1
        end
    end

	--create our points
	p11=p(n1.x+cos(n1.a)*r, n1.y+sin(n1.a)*r)
	p12=p(n1.x-cos(n1.a)*r, n1.y-sin(n1.a)*r)
	p21=p(n2.x+cos(n2.a)*r, n2.y+sin(n2.a)*r)
	p22=p(n2.x-cos(n2.a)*r, n2.y-sin(n2.a)*r)
	for i=0,10 do
		--recalculate r
		r=min_table({dist(p11,p21), dist(p11,p22), dist(p12,p21), dist(p12,p22)})/2
		--create our points
		p11=p(n1.x+cos(n1.a)*r, n1.y+sin(n1.a)*r)
		p12=p(n1.x-cos(n1.a)*r, n1.y-sin(n1.a)*r)
		p21=p(n2.x+cos(n2.a)*r, n2.y+sin(n2.a)*r)
		p22=p(n2.x-cos(n2.a)*r, n2.y-sin(n2.a)*r)	
	end
	--find intersection point
	if req(dist(p11,p21),2*r) then
		--centre points
		pc1=p11
		pc2=p21
	elseif req(dist(p11,p22),2*r) then
		pc1=p11
		pc2=p22
	elseif req(dist(p12,p21),2*r) then
		pc1=p12
		pc2=p21
	elseif req(dist(p12,p22),2*r) then
		pc1=p12
		pc2=p22
	end
	px=p(pc1.x+(pc2.x-pc1.x)/2,pc1.y+(pc2.y-pc1.y)/2)
end

--tests if intersection is valid
function test_intersection()

end

--roughly equal
function req(val1, val2)
	local thr=0.1
	return val1-thr<val2 and val2<val1+thr
end

function min_table(table)
	local min_val=16000
	for num in all(table) do
		if num<min_val then
			min_val = num
		end
	end
	return min_val
end

function p(x,y)
	local p={x=x,y=y}
	return p
end

function dist(p1,p2)
	return sqrt((p2.x/8-p1.x/8)^2+(p2.y/8-p1.y/8)^2)*8
end
-->8
---obejcts
function new_node(x,y,a)
	local n={
		x=x,
		y=y,
		a=a,
		r=4,
		draw=function(this)
			circ(this.x,this.y,this.r,7)
			line(this.x+cos(this.a)*this.r,
								this.y+sin(this.a)*this.r,
								this.x-cos(this.a)*this.r,
								this.y-sin(this.a)*this.r,7)
		end
	}
	return n
end
__gfx__
00000000990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
