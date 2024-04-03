pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--electric gryphon


--------------------------------------------------------------------------------------------------
--------------------------------------Model Definitions-------------------------------------------
--------------------------------------------------------------------------------------------------

--model definitions

--start with vector list: {x,y,z}
--and face list: {vertex1,vertex2,vertex3,color1,color2)
--face list numbers indicate the indeces of the vector list
--that make up the 3 corners of a triangle. If provided, the
--4th and 5th index are used to hold the two colors that make
--up the faces composite color. This is only necessary if you
--want to overide the shaded monochromatic color options.

--I have a series of find/replaces that converts an OBJ format
--exported from blender into these lists. If someone is in the
--mood to write a conversion scrip that would be really awesome.

carpet_v_string="ff0000020100010000020100ff000002ff0001000002ff00"
carpet_f_string="0203010e0e0204030e0e"

chair_v_string="ffcc004c0033004c004c0033ffcc004cffcc004c004cffcc004c00000033ffcc00000033004c0000ffccffcc0000ffccffe6004c0033ffe6004cffccffe600000033ffe60000ffcc0033004c00330033000000330033004cffcc00330000ffccffcc004c0033004c004c0033004c00000033ffcc00000033ffcc0066ffcc004c00660033004c0066ffccffcc004cffd9ffcc0000ffd9004c004cffd9004c0000ffd9ffcc00660033ffb300e6ffccffb300e60033ffcc004c0026ffcc00000026004c004c0026004c00000026ffcc00eaffccffcc00ea0033ffe6006a0033ffe6006affcc"
chair_f_string="030c0804040b01060404020e05040410040704040114060000021312000023252604040317040404021c0104040416020404011503040408180304041a07040404261c1504041f141104041321120404241d1e0f0f23151d04041c241e040416151c0f0f151e1d0202030a0c04040b09010404020d0e0404100f040404011114000002051300002324250404031517040402161c04040417160404011c15040408191804041a1b07040426251c04041f20140404132221040424231d0f0f23261504041c252404041617150f0f151c1e0202"

bed_v_string="ff990099ff9900660099ff99ff990099ff1900660099ff19ff8000b3ff99008000b3ff99ff8000b30100008000b30100ffb30099ff19ffb30099ff80004c0099ff19004c0099ff80ffb300ccff19ffb300b3ff80004c00b3ff80004c00ccff19ff800033ff9900800033ff99ff8000330100008000330100ff99004cff990066004cff99ff99004cff190066004cff19006600e6ff19ff9900e6ff19006600e6ff00ff9900e6ff0000660000ff19ff990000ff1900660000ff00ff990000ff00ff80003300e60080003300e6ff80003300cc0080003300ccff80000000e60080000000e6ff80000000cc0080000000cc"
bed_f_string="010602010105080601010a030106060a020c06060c040b06060f0d0e07070b0f0c0707090e0d07070c0e0a07070812060101051307010102180406060315010606130807010106160201011505010101171d180404191c1a04042427230404232521040421262204042228240404191f1b04041b201c0404201a1c040410191a0404010506010105070801010a090306060a010206060c020406060f100d07070b100f0707090a0e07070c0f0e07070814120101051113010102161806060317150606131408010106121601011511050101171e1d0404191b1c04042428270404232725040421252604042226280404191d1f04041b1f200404201e1a040403090d0d0d100b0407071a030d040410041904041a0d100404"

night_table_v_string="ffcc00330033003300330033ffcc0033ffcc00330033ffcc003300000033ffcc0000003300330000ffccffcc0000ffccffe600330033ffe60033ffccffe600000033ffe60000ffcc00190033003300190000003300190033ffcc00190000ffccffcc00330019003300330019003300000019ffcc00000019ffcc0099ffccffcc0099003300330099003300330099ffccffcc0033ffe6ffcc0000ffe600330033ffe600330000ffe6"
night_table_f_string="030c0801010b01060101020e05010110040701011106010d0d0512020d0d1715160f0f03180402020216010202041702040401150304040819030d0d1b07040d0d030a0c01010b09010101020d0e0101100f0401011114060d0d0513120d0d1718150f0f0315180202021716020204181704040116150404081a190d0d1b1c070d0d"

table_v_string="ff9900990066006600990066ff990099ff9900660099ff99006600000066ff990000006600660000ff99ff990000ff99ffb300990066ffb30099ff99ffb300000066ffb30000ff99004c00990066004c00000066004c0099ff99004c0000ff99ff990099004c00660099004c00660000004cff990000004cff9900b3ff99ff9900b30066006600b30066006600b3ff99ff990099ffb3ff990000ffb300660099ffb300660000ffb3"
table_f_string="030c0802020b01060202020e0502021004070202110601040405120204041715160f0f031804020202160102020417020404011503040408190304041b07040404030a0c02020b09010202020d0e0202100f040202111406040405131204041718150f0f0315180202021716020204181704040116150404081a1904041b1c070404"

wardrobe_v_string="ffb30033004c004c0033004cffb30033ffb3004c0033ffb3004c0000004cffb30000004c004c0000ffb3ffb30000ffb3ffcc0033004cffcc0033ffb3ffcc0000004cffcc0000ffb300330033004c00330000004c00330033ffb300330000ffb3ffb300330033004c00330033004c00000033ffb300000033ffb30200ffb3ffb30200004c004c0200004c004c0200ffb3ffb30033ffccffb30000ffcc004c0033ffcc004c0000ffcc"
wardrobe_f_string="030c0801010b01060101020e0501011004070101110601010105120201011715160f0f031804040402160104040417020404011503040408190301011b07040101030a0c01010b09010101020d0e0101100f040101111406010105131201011718150f0f0315180404021716040404181704040116150404081a1901011b1c070101"

carept_v_string="ff0000020100010000020100ff000002ff0001000002ff00"
carept_f_string="0203010e0e0204030e0e"

------------------------------------------------------------------------------------------------------------

hex_string_data = "0123456789abcdef"
char_to_hex = {}
for i=1,#hex_string_data do
	char_to_hex[sub(hex_string_data,i,i)]=i-1
end

function read_byte(string)
	return char_to_hex[sub(string,1,1)]*16+char_to_hex[sub(string,2,2)]
end

function read_2byte_fixed(string)
	local a=read_byte(sub(string,1,2))
	local b=read_byte(sub(string,3,4))
	local val =a*256+b
	return val/256
end

cur_string=""
cur_string_index=1
function load_string(string)
	cur_string=string
	cur_string_index=1
end

function read_vector()
	v={}
	for i=1,3 do
		text=sub(cur_string,cur_string_index,cur_string_index+4)
		value=read_2byte_fixed(text)
		v[i]=value
		cur_string_index+=4
	end
	return v
end

function read_face()
	f={}
	--verts 1 to 3
	for i=1,3 do
		text=sub(cur_string,cur_string_index,cur_string_index+2)
		value=read_byte(text)
		--print(value)

		f[i]=value
		cur_string_index+=2
	end
	--color test
	--f[4]=7
	--f[5]=7
	--print(f[4])
	return f
end

function read_colored_face()
	f={}
	--verts 1 to 3 + 2 color values
	for i=1,5 do
		text=sub(cur_string,cur_string_index,cur_string_index+2)
		value=read_byte(text)
		--print(value)

		f[i]=value
		cur_string_index+=2
	end
	--color test
	--print(f[4])
	return f
end	

function read_vector_string(string)
	vector_list={}
	load_string(string)
	while(cur_string_index<#string)do
		vector=read_vector()
		add(vector_list,vector)
	end
		return vector_list
end

function read_face_string(string)
	face_list={}
	load_string(string)
	while(cur_string_index<#string)do
		face=read_face()
		add(face_list,face)
	end
		return face_list
end

function read_colored_face_string(string)
	face_list={}
	load_string(string)
	while(cur_string_index<#string)do
		face=read_colored_face()
		add(face_list,face)
	end
		return face_list
end
------------------------------------------------------------end hex string data handling--------------------------------


-------------------------------------------------------------BEGIN CUT HERE-------------------------------------------------
------------------------------------------------------Electric Gryphon's 3D Library-----------------------------------------
----------------------------------------------------------------------------------------------------------------------------

k_color1=4
k_color2=5

k_screen_scale=120
k_x_center=64
k_y_center=64

z_clip=0
z_max=-50

k_min_x=0
k_max_x=128
k_min_y=0
k_max_y=128

--These are used for the 2 scanline color shading scheme
double_color_list=	{{0,0,0,0,0,0,0,0,0,0},
					 {0,0,0,0,0,0,0,0,0,0},

					{0,0,1,1,1,1,13,13,12,12},
					{0,0,0,1,1,1,1,13,13,12},
					
					{2,2,2,2,8,8,14,14,14,15},
					{0,1,1,2,2,8,8,8,14,14},
					
					{1,1,1,1,3,3,11,11,10,10},
					{0,1,1,1,1,3,3,11,11,10},
					
					{1,1,2,2,4,4,9,9,10,10},
					{0,1,1,2,2,4,4,9,9,10},
					
					{0,0,1,1,5,5,13,13,6,6},
					{0,0,0,1,1,5,5,13,13,6},
					
					{1,1,5,5,6,6,6,6,7,7},
					{0,1,1,5,5,6,6,6,6,7},
					
					{5,5,6,6,7,7,7,7,7,7},
					{0,5,5,6,6,7,7,7,7,7},
					
					{2,2,2,2,8,8,14,14,15,15},
					{0,2,2,2,2,8,8,14,14,15},
					
					{2,2,4,4,9,9,15,15,7,7},
					{0,2,2,4,4,9,9,15,15,7},
					
					{4,4,9,9,10,10,7,7,7,7},
					{0,4,4,9,9,10,10,7,7,7},
					
					{1,1,3,3,11,11,10,10,7,7},
					{0,1,1,3,3,11,11,10,10,7},
					
					{13,13,13,12,12,12,6,6,7,7},
					{0,5,13,13,12,12,12,6,6,7},
					
					{1,1,5,5,13,13,6,6,7,7},
					{0,1,1,5,5,13,13,6,6,7},
					
					{2,2,2,2,14,14,15,15,7,7},
					{0,2,2,2,2,14,14,15,15,7},
					
					{4,4,9,9,15,15,7,7,7,7},
					{0,4,4,9,9,15,15,7,7,7}
					}


k_ambient=.3
function color_faces(object,base)
	--local p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z
	for i=1,#object.faces do
		local face=object.faces[i]
		-- load every point in triangle face
		local p1x=object.t_vertices[face[1]][1]
		local p1y=object.t_vertices[face[1]][2]
		local p1z=object.t_vertices[face[1]][3]
		local p2x=object.t_vertices[face[2]][1]
		local p2y=object.t_vertices[face[2]][2]
		local p2z=object.t_vertices[face[2]][3]
		local p3x=object.t_vertices[face[3]][1]
		local p3y=object.t_vertices[face[3]][2]
		local p3z=object.t_vertices[face[3]][3]		
		--print(face[1])
		local nx,ny,nz = vector_cross_3d(p1x,p1y,p1z,
							p2x,p2y,p2z,
							p3x,p3y,p3z)

	
		nx,ny,nz = normalize(nx,ny,nz)
		local b = vector_dot_3d(nx,ny,nz,light1_x,light1_y,light1_z)
		--see how closely the light vector and the face normal line up and shade appropriately
		
		-- print(nx.." "..ny.." "..nz,10,i*8+8,8) 
		-- flip()
		if(object.color_mode==k_multi_color_dynamic)then
			--here we load the color at index 4 of the face
			face[4],face[5]=color_shade(object.base_faces[i][4], mid( b,0,1)*(1-k_ambient)+k_ambient )
			stop()
			--print("Here")
		else
			face[4],face[5]=color_shade(base, mid( b,0,1)*(1-k_ambient)+k_ambient )
		end
	end
	
end

					
function color_shade(color,brightness)
	--return double_color_list[ (color+1)*2-1 ][flr(brightness*10)] , double_color_list[ (color+1)*2 ][flr(brightness*10)] 
	local b= band(brightness*10,0xffff)
	local c= (color+1)*2
	return double_color_list[ c-1 ][b] , double_color_list[ c ][b] 
end			
	


light1_x=.1
light1_y=.35
light1_z=.2

--t_light gets written to
t_light_x=0
t_light_y=0
t_light_z=0

function init_light()
	light1_x,light1_y,light1_z=normalize(light1_x,light1_y,light1_z)
end

function update_light()
	t_light_x,t_light_y,t_light_z = rotate_cam_point(light1_x,light1_y,light1_z)
end

function normalize(x,y,z)
	local x1=shl(x,2)
	local y1=shl(y,2)
	local z1=shl(z,2)
	
	local inv_dist=1/sqrt(x1*x1+y1*y1+z1*z1)
	
	return x1*inv_dist,y1*inv_dist,z1*inv_dist
	
end

function	vector_dot_3d(ax,ay,az,bx,by,bz)
	return ax*bx+ay*by+az*bz
end
	
function	vector_cross_3d(px,py,pz,ax,ay,az,bx,by,bz)

	 ax-=px
	 ay-=py
	 az-=pz
	 bx-=px
	 by-=py
	 bz-=pz
	
	
	local dx=ay*bz-az*by
	local dy=az*bx-ax*bz
	local dz=ax*by-ay*bx
	return dx,dy,dz
end



k_colorize_static = 1
k_colorize_dynamic = 2
k_multi_color_static = 3
k_multi_color_dynamic = 4
k_preset_color = 5

--Function load object:
--object_vertices: vertex list for object (see above)
--object_faces: face list for object (see above)
--x,y,z: translated center for the the object
--ax,ay,az: rotation of object about these axis
--obstacle: boolean will the player collide with this?
--color mode:
--k_colorize_static = 1 : shade the model at init with one shaded color
--k_colorize_dynamic = 2 : color the model dynamically with one shade color -- slow
--k_multi_color_static = 3 : shade the model based on colors defined in face list
--k_multi_color_dynamic = 4 : shade the model dynamically based on colors define din face list -- slow
--k_preset_color = 5 : use the colors defined in face list only -- no lighting effects

function load_object(object_vertices,object_faces,x,y,z,ax,ay,az,obstacle,color_mode,color)
	object=new_object()
	
	object.vertices=object_vertices
	
	
	--make local deep copy of faces 
	--if we don't car about on-demand shading we can share faces
	--but it means that objects will look wrong when rotated
	
	if(color_mode==k_preset_color)then
		object.faces=object_faces
	else
		object.base_faces=object_faces
		object.faces={}
		for i=1,#object_faces do
			object.faces[i]={}
			for j=1,#object_faces[i] do
				object.faces[i][j]=object_faces[i][j]
			end
		end
	end

	
	object.radius=0
	
	--make local deep copy of translated vertices
	--we share the initial vertices
	for i=1,#object_vertices do
		object.t_vertices[i]={}
			for j=1,3 do
				object.t_vertices[i][j]=object.vertices[i][j]
			end
	end

	object.ax=ax or 0
	object.ay=ay or 0
	object.az=az or 0
	
	transform_object(object)
	
	set_radius(object)
	set_bounding_box(object)
	
	object.x=x or 0
	object.y=y or 0
	object.z=z or 0
	
	object.color = color or 8
	object.color_mode= color_mode or k_colorize_static
	
	object.obstacle = obstacle or false
	
	if(obstacle)add(obstacle_list,object)
	
	if(color_mode==k_colorize_static or color_mode==k_colorize_dynamic or color_mode==k_multi_color_static )then
		color_faces(object,color)
	end

	
	
	return object
end

function set_radius(object)
	for vertex in all(object.vertices) do
		object.radius=max(object.radius,vertex[1]*vertex[1]+vertex[2]*vertex[2]+vertex[3]*vertex[3])
	end
	object.radius=sqrt(object.radius)
end

function set_bounding_box(object)
	for vertex in all(object.t_vertices) do
	
		object.min_x=min(vertex[1],object.min_x)
		object.min_y=min(vertex[2],object.min_y)
		object.min_z=min(vertex[3],object.min_z)
		object.max_x=max(vertex[1],object.max_x)
		object.max_y=max(vertex[2],object.max_y)
		object.max_z=max(vertex[3],object.max_z)
	end

end

function intersect_bounding_box(object_a, object_b)
	return 
        ((object_a.min_x+object_a.x < object_b.max_x+object_b.x) and (object_a.max_x+object_a.x > object_b.min_x+object_b.x) and
         (object_a.min_y+object_a.y < object_b.max_y+object_b.y) and (object_a.max_y+object_a.y > object_b.min_y+object_b.y) and
         (object_a.min_z+object_a.z < object_b.max_z+object_b.z) and (object_a.max_z+object_a.z > object_b.min_z+object_b.z))
end

function new_object()
	object={}
	object.vertices={}
	object.faces={}
	
	object.t_vertices={}

	
	object.x=0
	object.y=0
	object.z=0
	
	object.rx=0
	object.ry=0
	object.rz=0
	
	object.tx=0
	object.ty=0
	object.tz=0
	
	object.ax=0
	object.ay=0
	object.az=0
	
	object.sx=0
	object.sy=0
	object.radius=10
	object.sradius=10
	object.visible=true
	
	object.render=true
	object.background=false
	object.collision_x=true
	object.collision_y=false
	object.collision_down=false
	object.collision_up=false
	object.collision_left=false
	object.ring=false
	
	object.min_x=100
	object.min_y=100
	object.min_z=100
	
	object.max_x=-100
	object.max_y=-100
	object.max_z=-100
	
	object.vx=0
	object.vy=0
	object.vz=0

	object.age=0
	object.health=2
	add(object_list,object)
	return object

end

function delete_object(object)
	del(object_list,object)
end


function new_triangle(p1x,p1y,p2x,p2y,p3x,p3y,z,c1,c2)
	add(triangle_list,{p1x=p1x,
	                   p1y=p1y,
	                   p2x=p2x,
	                   p2y=p2y,
	                   p3x=p3x,
	                   p3y=p3y,
	                   tz=z,
	                   c1=c1,
	                   c2=c2})
	
	
	
	
end

function draw_triangle_list()
	--for t in all(triangle_list) do
	for i=1,#triangle_list do
		local t=triangle_list[i]
		shade_trifill( t.p1x,t.p1y,t.p2x,t.p2y,t.p3x,t.p3y, t.c1,t.c2 )
	end
end

function update_visible(object)
		object.visible=false

		local px,py,pz = object.x-cam_x,object.y-cam_y,object.z-cam_z
		object.tx, object.ty, object.tz =rotate_cam_point(px,py,pz)

		object.sx,object.sy = project_point(object.tx,object.ty,object.tz)
		object.sradius=project_radius(object.radius,object.tz)
		object.visible= is_visible(object)
end

function cam_transform_object(object)
	if(object.visible)then

		for i=1, #object.vertices do
			local vertex=object.t_vertices[i]

			vertex[1]+=object.x - cam_x
			vertex[2]+=object.y - cam_y
			vertex[3]+=object.z - cam_z
			
			vertex[1],vertex[2],vertex[3]=rotate_cam_point(vertex[1],vertex[2],vertex[3])
		
		end
	end
end

function transform_object(object)
	if(object.visible)then
		generate_matrix_transform(object.ax,object.ay,object.az)
		for i=1, #object.vertices do
			local t_vertex=object.t_vertices[i]
			local vertex=object.vertices[i]
			
			t_vertex[1],t_vertex[2],t_vertex[3]=rotate_point(vertex[1],vertex[2],vertex[3])
		
		end
	

	end
end

function generate_matrix_transform(xa,ya,za)
	local sx=sin(xa)
	local sy=sin(ya)
	local sz=sin(za)
	local cx=cos(xa)
	local cy=cos(ya)
	local cz=cos(za)
	
	mat00=cz*cy
	mat10=-sz
	mat20=cz*sy
	mat01=cx*sz*cy+sx*sy
	mat11=cx*cz
	mat21=cx*sz*sy-sx*cy
	mat02=sx*sz*cy-cx*sy
	mat12=sx*cz
	mat22=sx*sz*sy+cx*cy
end

function generate_cam_matrix_transform(xa,ya,za)
	local sx=sin(xa)
	local sy=sin(ya)
	local sz=sin(za)
	local cx=cos(xa)
	local cy=cos(ya)
	local cz=cos(za)
	
	cam_mat00=cz*cy
	cam_mat10=-sz
	cam_mat20=cz*sy
	cam_mat01=cx*sz*cy+sx*sy
	cam_mat11=cx*cz
	cam_mat21=cx*sz*sy-sx*cy
	cam_mat02=sx*sz*cy-cx*sy
	cam_mat12=sx*cz
	cam_mat22=sx*sz*sy+cx*cy

end

function	matrix_inverse()
	local det = mat00* (mat11 * mat22- mat21 * mat12) -
                mat01* (mat10 * mat22- mat12 * mat20) +
                mat02* (mat10 * mat21- mat11 * mat20)
	local invdet=2/det
		

		
		mat00,mat01,mat02,mat10,mat11,mat12,mat20,mat21,mat22=(mat11 * mat22 - mat21 * mat12) * invdet,(mat02 * mat21 - mat01 * mat22) * invdet,(mat01 * mat12 - mat02 * mat11) * invdet,(mat12 * mat20 - mat10 * mat22) * invdet,(mat00 * mat22 - mat02 * mat20) * invdet,(mat10 * mat02 - mat00 * mat12) * invdet,(mat10 * mat21 - mat20 * mat11) * invdet,(mat20 * mat01 - mat00 * mat21) * invdet,(mat00 * mat11 - mat10 * mat01) * invdet

		--uh yeah I looked this one up :-)
end

function rotate_point(x,y,z)	
	return (x)*mat00+(y)*mat10+(z)*mat20,(x)*mat01+(y)*mat11+(z)*mat21,(x)*mat02+(y)*mat12+(z)*mat22
end

function rotate_cam_point(x,y,z)
	return (x)*cam_mat00+(y)*cam_mat10+(z)*cam_mat20,(x)*cam_mat01+(y)*cam_mat11+(z)*cam_mat21,(x)*cam_mat02+(y)*cam_mat12+(z)*cam_mat22
end

function is_visible(object)

	if(object.tz+object.radius>z_max and object.tz-object.radius<z_clip and
	   object.sx+object.sradius>0 and object.sx-object.sradius<128 and
	   object.sy+object.sradius>0 and object.sy-object.sradius<128 )
	   then return true else return false end
end

function	cross_product_2d(p0x,p0y,p1x,p1y,p2x,p2y)
	return ( ( (p0x-p1x)*(p2y-p1y)-(p0y-p1y)*(p2x-p1x)) > 0 )
end

function render_object(object)

	--project all points in object to screen space
	--it's faster to go through the array linearly than to use a for all()
	for i=1, #object.t_vertices do
		local vertex=object.t_vertices[i]
		vertex[4],vertex[5] = vertex[1]*k_screen_scale/vertex[3]+k_x_center,vertex[2]*k_screen_scale/vertex[3]+k_x_center
	end

	for i=1,#object.faces do
	--for face in all(object.faces) do
		local face=object.faces[i]
	
		local p1=object.t_vertices[face[1]]
		local p2=object.t_vertices[face[2]]
		local p3=object.t_vertices[face[3]]
		
		local p1x,p1y,p1z=p1[1],p1[2],p1[3]
		local p2x,p2y,p2z=p2[1],p2[2],p2[3]
		local p3x,p3y,p3z=p3[1],p3[2],p3[3]

		
		local cz=.01*(p1z+p2z+p3z)/3
		local cx=.01*(p1x+p2x+p3x)/3
		local cy=.01*(p1y+p2y+p3y)/3
		local z_paint= -cx*cx-cy*cy-cz*cz
		
		
		
		
		if(object.background==true) z_paint-=1000 
		face[6]=z_paint
		

		if((p1z>z_max or p2z>z_max or p3z>z_max))then
			if(p1z< z_clip and p2z< z_clip and p3z< z_clip)then
			--simple option -- no clipping required

					local s1x,s1y = p1[4],p1[5]
					local s2x,s2y = p2[4],p2[5]
					local s3x,s3y = p3[4],p3[5]
		

					if( max(s3x,max(s1x,s2x))>0 and min(s3x,min(s1x,s2x))<128)  then
						--only use backface culling on simple option without clipping
						--check if triangles are backwards by cross of two vectors
						if(( (s1x-s2x)*(s3y-s2y)-(s1y-s2y)*(s3x-s2x)) < 0)then
						
							if(object.color_mode==k_colorize_dynamic)then
								--nx,ny,nz = vector_cross_3d(p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z)
								--save a bit on dynamic rendering by moving this funciton inline
								p2x-=p1x p2y-=p1y p2z-=p1z	
								p3x-=p1x p3y-=p1y p3z-=p1z	
								local nx = p2y*p3z-p2z*p3y
								local ny = p2z*p3x-p2x*p3z
								local nz = p2x*p3y-p2y*p3x
								
								--nx,ny,nz = normalize(nx,ny,nz)
								--save a bit by moving this function inline
								nx=shl(nx,2) ny=shl(ny,2) nz=shl(nz,2)
								local inv_dist=1/sqrt(nx*nx+ny*ny+nz*nz)
								nx*=inv_dist ny*=inv_dist nz*=inv_dist						
															
								
								--b = vector_dot_3d(nx,ny,nz,t_light_x,t_light_y,t_light_z)
								--save a bit by moving this function inline
								face[4],face[5]=color_shade(object.color, mid( nx*t_light_x+ny*t_light_y+nz*t_light_z,0,1)*(1-k_ambient)+k_ambient )
							end
								
						
							--new_triangle(s1x,s1y,s2x,s2y,s3x,s3y,z_paint,face[k_color1],face[k_color2])
							--faster to move new triangle function inline
							add(triangle_list,{p1x=s1x,
												p1y=s1y,
												p2x=s2x,
												p2y=s2y,
												p3x=s3x,
												p3y=s3y,
												tz=z_paint,
												c1=face[k_color1],
												c2=face[k_color2]})
							

						end
					end
					
			--not optimizing clipping functions for now
			--these still have errors for large triangles
			elseif(p1z< z_clip or p2z< z_clip or p3z< z_clip)then
			
			--either going to have 3 or 4 points
				p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z = three_point_sort(p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z)
				if(p1z<z_clip and p2z<z_clip)then
				

				
					local n2x,n2y,n2z = z_clip_line(p2x,p2y,p2z,p3x,p3y,p3z,z_clip)
					local n3x,n3y,n3z = z_clip_line(p3x,p3y,p3z,p1x,p1y,p1z,z_clip)
					

					
					local s1x,s1y = project_point(p1x,p1y,p1z)
					local s2x,s2y = project_point(p2x,p2y,p2z)
					local s3x,s3y = project_point(n2x,n2y,n2z)
					local s4x,s4y = project_point(n3x,n3y,n3z)

					
					if( max(s4x,max(s1x,s2x))>0 and min(s4x,min(s1x,s2x))<128)  then
						new_triangle(s1x,s1y,s2x,s2y,s4x,s4y,z_paint,face[k_color1],face[k_color2])
					end
					if( max(s4x,max(s3x,s2x))>0 and min(s4x,min(s3x,s2x))<128)  then
						new_triangle(s2x,s2y,s4x,s4y,s3x,s3y,z_paint,face[k_color1],face[k_color2])
					end
				else

				
					local n1x,n1y,n1z = z_clip_line(p1x,p1y,p1z,p2x,p2y,p2z,z_clip)
					local n2x,n2y,n2z = z_clip_line(p1x,p1y,p1z,p3x,p3y,p3z,z_clip)
					

					
					local s1x,s1y = project_point(p1x,p1y,p1z)
					local s2x,s2y = project_point(n1x,n1y,n1z)
					local s3x,s3y = project_point(n2x,n2y,n2z)
					
					--solid_trifill(s1x,s1y,s2x,s2y,s3x,s3y,face[k_color1])
					if( max(s3x,max(s1x,s2x))>0 and min(s3x,min(s1x,s2x))<128)  then
						new_triangle(s1x,s1y,s2x,s2y,s3x,s3y,z_paint,face[k_color1],face[k_color2])
					end
				end
				
				--print("p1",p1x+64,p1z+64,14)
				--print("p2",p2x+64,p2z+64,14)
				--print("p3",p3x+64,p3z+64,14)
				
			
			
			end
		end
		
	end


end

function three_point_sort(p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z)
	if(p1z>p2z) p1z,p2z = p2z,p1z p1x,p2x = p2x,p1x p1y,p2y = p2y,p1y
	if(p1z>p3z) p1z,p3z = p3z,p1z p1x,p3x = p3x,p1x p1y,p3y = p3y,p1y
	if(p2z>p3z) p2z,p3z = p3z,p2z p2x,p3x = p3x,p2x p2y,p3y = p3y,p2y
	
	return p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z
end

function quicksort(t, start, endi)
   start, endi = start or 1, endi or #t
  --partition w.r.t. first element
  if(endi - start < 1) then return t end
  local pivot = start
  for i = start + 1, endi do
    if t[i].tz <= t[pivot].tz then
      if i == pivot + 1 then
        t[pivot],t[pivot+1] = t[pivot+1],t[pivot]
      else
        t[pivot],t[pivot+1],t[i] = t[i],t[pivot],t[pivot+1]
      end
      pivot = pivot + 1
    end
  end
   t = quicksort(t, start, pivot - 1)
  return quicksort(t, pivot + 1, endi)
end



function z_clip_line(p1x,p1y,p1z,p2x,p2y,p2z,clip)
	if(p1z>p2z)then
		p1x,p2x=p2x,p1x
		p1z,p2z=p2z,p1z
		p1y,p2y=p2y,p1y
	end
	
	if(clip>p1z and clip<=p2z)then

	--	line(p1x+64,p1z+64,p2x+64,p2z+64,14)
		alpha= abs((p1z-clip)/(p2z-p1z))
		nx=lerp(p1x,p2x,alpha)
		ny=lerp(p1y,p2y,alpha)
		nz=lerp(p1z,p2z,alpha)
				
	--	circ(nx+64,nz+64,1,12)
		return nx,ny,nz
	else
		return false
	end
end

function project_point(x,y,z)
	return x*k_screen_scale/z+k_x_center,y*k_screen_scale/z+k_x_center
end

function project_radius(r,z)
	return r*k_screen_scale/abs(z)
end



function lerp(a,b,alpha)
  return a*(1.0-alpha)+b*alpha
end

function handle_buttons()
	
	if(btn(0))then
		player.ay+=-.01
	end
	
	if(btn(1))then
		player.ay+=.01
	end
	
	generate_matrix_transform(cam_ax,cam_ay,cam_az)
	matrix_inverse()
	vx,vy,vz=rotate_point(0,0,.2)
	
	if(btn(2))then
	
		player.vx=-vx
		player.vy=-vy
		player.vz=-vz
	

	end
	
	if(btn(3))then
		player.vx=vx
		player.vy=vy
		player.vz=vz
	end
	
end

function init_player()
	player=new_object()
	player.min_x=-4.5
	player.min_y=-4.5
	player.min_z=-4.5
	player.max_x=4.5
	player.max_y=4.5
	player.max_z=4.5
	
	player.x=0
	player.y=1.6
	player.z=15
	
	player.vx=0
	player.vy=0
	player.vz=0
end

k_friction=.7
function update_player()
	
	old_x=player.x
	old_y=player.y
	old_z=player.z

	

	player.y+=player.vy
	

	
	player.x+=player.vx
	for object in all(obstacle_list) do
		if( intersect_bounding_box(player, object)) player.vx=0 player.x=old_x 
	end
	player.z+=player.vz
	for object in all(obstacle_list) do
		if( intersect_bounding_box(player, object)) player.vz=0 player.z=old_z 
	end
	
	
	player.vx*=k_friction
	player.vy*=k_friction
	player.vz*=k_friction
end

function update_camera()	
	cam_x=player.x
	cam_y=player.y
	cam_z=player.z

	cam_ax=player.ax
	cam_ay=player.ay
	cam_az=player.az

	generate_cam_matrix_transform(cam_ax,cam_ay,cam_az)
end

function init_3d()
	init_player()
	init_light()
	object_list={}
	obstacle_list={}
	particle_list={}
end

function update_3d()
	for object in all(object_list) do
			update_visible(object)
			transform_object(object)
			cam_transform_object(object)
			update_light()
	end
end

function draw_3d()
	triangle_list={}
	quicksort(object_list)
	
	start_timer()
	for object in all(object_list) do
		
		if(object.visible and not object.background) then
			render_object(object) --sort_faces(object)
			--if(object.color_mode==k_colorize_dynamic or object.color_mode==k_multi_color_dynamic) color_faces(object,object.color)
		end
	end
	render_time=stop_timer()
	
	start_timer()
		quicksort(triangle_list)
	sort_time=stop_timer()
	
	start_timer()
		draw_triangle_list()
	triangle_time=stop_timer()
end


function shade_trifill( x1,y1,x2,y2,x3,y3, color1, color2)

		  local x1=band(x1,0xffff)
		  local x2=band(x2,0xffff)
		  local y1=band(y1,0xffff)
		  local y2=band(y2,0xffff)
		  local x3=band(x3,0xffff)
		  local y3=band(y3,0xffff)
		  
		  local nsx,nex
		  --sort y1,y2,y3
		  if(y1>y2)then
			y1,y2=y2,y1
			x1,x2=x2,x1
		  end
		  
		  if(y1>y3)then
			y1,y3=y3,y1
			x1,x3=x3,x1
		  end
		  
		  if(y2>y3)then
			y2,y3=y3,y2
			x2,x3=x3,x2		  
		  end
		  
		 if(y1!=y2)then 		 
			local delta_sx=(x3-x1)/(y3-y1)
			local delta_ex=(x2-x1)/(y2-y1)
			
			if(y1>0)then
				nsx=x1
				nex=x1
				min_y=y1
			else --top edge clip
				nsx=x1-delta_sx*y1
				nex=x1-delta_ex*y1
				min_y=0
			end
			
			max_y=min(y2,128)
			
			for y=min_y,max_y-1 do

			--rectfill(nsx,y,nex,y,color1)
			if(band(y,1)==0)then rectfill(nsx,y,nex,y,color1) else rectfill(nsx,y,nex,y,color2) end
			nsx+=delta_sx
			nex+=delta_ex
			end

		else --where top edge is horizontal
			nsx=x1
			nex=x2
		end

		if(y3!=y2)then
			local delta_sx=(x3-x1)/(y3-y1)
			local delta_ex=(x3-x2)/(y3-y2)
			
			min_y=y2
			max_y=min(y3,128)
			if(y2<0)then
				nex=x2-delta_ex*y2
				nsx=x1-delta_sx*y1
				min_y=0
			end
			
			 for y=min_y,max_y do

				--rectfill(nsx,y,nex,y,color1)
				if(band(y,1)==0)then rectfill(nsx,y,nex,y,color1) else rectfill(nsx,y,nex,y,color2) end
				nex+=delta_ex
				nsx+=delta_sx
			 end
			
		else --where bottom edge is horizontal
			--rectfill(nsx,y3,nex,y3,color1)
			if(band(y,1)==0)then rectfill(nsx,y3,nex,y3,color1) else rectfill(nsx,y3,nex,y3,color2) end
		end
end


----------------------------------END COPY-------------------------------------------------------
----------------------------------Electric Gryphon's 3D Library----------------------------------
-------------------------------------------------------------------------------------------------


function center_text(text,x,y,c)
	x=x-#text/2*4
	print(text,x,y,1)
	print(text,x+1,y,1)
	print(text,x,y-1,1)
	print(text,x,y+1,1)
	
	print(text,x,y,c)
end


function init_stars()
	star_list={}
	for i=1,150 do
		star_list[i]={}
		star_list[i].x=rnd(508)
		star_list[i].y=rnd(55)
	end
end

function draw_stars()
	for i=1,#star_list do
		pset((-cam_ay*508+star_list[i].x+cur_frame/20)%508,star_list[i].y,15)
	end
end

function draw_background()
	rectfill(0,0,127,64,14)
	draw_stars()

	
	rectfill(0,64,127,127,5)
	
	for i=0,2 do
		rectfill(0,66+i*2,127,66+i*2,6)
		rectfill(0,60-i*2,127,60-i*2,15)
	end
end

function start_timer()
	timer_value=stat(1)
end

function stop_timer()
	return stat(1)-timer_value
end

function load_factory()
	factory_data={}
	for i=-2,2 do
		factory_data[i]={}
		for j=-2,2 do
			--if(rnd(1)>.5)then v=1 else v=2 end
			factory_data[i][j]=1
		end
	end
	--factory_data[0][0]=0
	--factory_data[1][0]=2
	--factory_data[-1][0]=2
	--factory_data[0][1]=2
	--factory_data[0][-1]=2
	player.x=10
	player.z=10
	for i=-2,2 do
		for j=-2,2 do
			if(factory_data[i][j]==1)load_object(read_vector_string(factory_v_string),read_face_string(factory_f_string),i*20,0,j*20,0,0,0,true,k_colorize_static,6)
			if(factory_data[i][j]==2)load_object(read_vector_string(tower_v_string),read_face_string(tower_f_string),i*20,0,j*20,0,0,0,true,k_colorize_static,6)
		end
	end
	
	clouds={}
	for i=1,10 do
		clouds[i]={}
		clouds[i].x=rnd(160)-15
		clouds[i].y=rnd(160)-15
	end
end


function update_factory()
	if(player.x>10)player.x-=20 
	if(player.x<-10)player.x+=20
	if(player.z>10)player.z-=20
	if(player.z<-10)player.z+=20
end

function draw_factory_background()
	cls(1)
	
	srand(1)
	
	for cloud in all(clouds) do
		circfill((cloud.x-player.ay*400)%127,cloud.y,15,13)
		cloud.y-=1
		if(cloud.y<-15)then cloud.y=127 end
	end
	
	rectfill(0,64,127,127,13)

end

function load_fox_dynamic()
	fox_v=read_vector_string(fox_v_string)
	fox_f=read_face_string(fox_f_string)
	fox=load_object(fox_v,fox_f,0,0,-10,0,-.35,0,false,k_colorize_dynamic,8)
end

function update_fox_dynamic()
	fox.ay+=.01
end

function load_temple()
	init_stars()
	for i=1,5 do
		l=30
		x=sin(i/5)*l
		z=cos(i/5)*l
		c=load_object(read_vector_string(column_v_string),read_face_string(column_f_string),x,0,z,0,0,0,true,k_colorize_static,9)--load models
	end
	
	fnt=load_object(read_vector_string(fountain_v_string),read_face_string(fountain_f_string),0,0,0,0,.08,0,true,k_colorize_static,14)
	hole=load_object(read_vector_string(hole_v_string),read_face_string(hole_f_string),0,11,0,.125,.125,.125,false,k_colorize_dynamic,12)
	
	pyramids={}
	for i=1,5 do
		l=25
		a=i/5+.125
		x=sin(a)*l
		z=cos(a)*l
		pyramids[i]=load_object(read_vector_string(pyramid_v_string),read_face_string(pyramid_f_string),x,0,z,0,0,0,false,k_colorize_static,13)
	end
end

function update_temple()
	hole.ay+=-.004 --dynamically adjust object parameters to make them move each frame
	hole.az+=.001
	hole.ax+=.002
	hole.y=11+sin(cur_frame/100)
	
	for i=1,5 do
		l=35
		a=i/5+.125+cur_frame/1000
		x=sin(a)*l
		z=cos(a)*l
		pyramids[i].x=sin(a)*l pyramids[i].z=cos(a)*l
		pyramids[i].y=10+sin(a-cur_frame/200)*4
		pyramids[i].ax+=.003 pyramids[i].ay+=.002 pyramids[i].az+=.004
	end
end

function draw_temple_background()
	rectfill(0,0,127,64,14)
	draw_stars()
	
	rectfill(0,64,127,127,5)
	
	for i=0,2 do
		rectfill(0,66+i*2,127,66+i*2,6)
		rectfill(0,60-i*2,127,60-i*2,15)
	end
end

function init_stars()
	star_list={}
	for i=1,150 do
		star_list[i]={}
		star_list[i].x=rnd(508)
		star_list[i].y=rnd(55)
	end
end

function draw_stars()
	for i=1,#star_list do
		pset((-cam_ay*508+star_list[i].x+cur_frame/20)%508,star_list[i].y,15)
	end
end

function draw_fox_background()
	cls(9)
	srand(2)
	for i=1,8 do
		circfill((rnd(167)+cur_frame)%167-20,rnd(167),rnd(20),10)
	end
end

function load_scene(init_func,update_func,background_func)
	scene_update_func=update_func
	scene_background_function=background_func
	init_3d()
	init_func()
end

-->8
--custom room
function load_room()
	for o in all(furniture) do
		load_o_3d(o)
	end
end

function init_furniture()
	bed_v = read_vector_string(bed_v_string)
	bed_f = read_colored_face_string(bed_f_string)	
	chair_v = read_vector_string(chair_v_string)
	chair_f = read_colored_face_string(chair_f_string)
	wardrobe_v = read_vector_string(wardrobe_v_string)
	wardrobe_f = read_colored_face_string(wardrobe_f_string)
	night_table_v = read_vector_string(night_table_v_string)
	night_table_f = read_colored_face_string(night_table_f_string)
	table_v = read_vector_string(table_v_string)
	table_f = read_colored_face_string(table_f_string)
	carpet_v = read_vector_string(carpet_v_string)
	carpet_f = read_colored_face_string(carpet_f_string)
end

function load_o_3d(o)
	c_mode = k_preset_color
	local x=(o.x+o.w/2)/10-6.4
	local y=(o.y+o.h/2)/10-6.4
	local rz=o.r
	
	if o.str=="bed" then
		bed = load_object(bed_v, bed_f, x,0,y, 0, rz, 0, False, c_mode, 4)
	elseif o.str=="chair" then
		chair = load_object(chair_v, chair_f, x,0,y, 0, rz, 0, False, c_mode, 4)
	elseif o.str=="wardrobe" then
		wardrobe = load_object(wardrobe_v, wardrobe_f, x,0,y, 0, rz, 0, False, c_mode, 4)
	elseif o.str=="night_table" then
		night_table = load_object(night_table_v, night_table_f, x,0,y, 0,rz, 0, False, c_mode, 4)
	elseif o.str=="table" then
		table = load_object(table_v, table_f, x,0,y, 0, rz, 0, False, c_mode, 4)
	elseif o.str=="carpet" then
		carpet = load_object(carpet_v, carpet_f, x,0,y,  0, rz, 0, False, c_mode, 4)
	end
end

function update_room()

end

function draw_room_background()
	cls(9)
	srand(2)
	for i=1,8 do
		circfill((rnd(167)+cur_frame)%167-20,rnd(167),rnd(20),10)
	end
end

scene_index=1
scene_list=
{
{load_room, update_room, draw_room_background},
{load_fox_dynamic,update_fox_dynamic,draw_fox_background},
{load_temple,update_temple,draw_temple_background},
{load_factory,update_factory,draw_factory_background}
}
-->8
--draw
planning=true
function _draw()
	if planning then
		draw_planscreen()
	else
		draw_3dview()
	end
end

function draw_3dview()
	local t=stat(1)
	cur_frame+=1
	
	scene_background_function()

	local t=stat(1)
	update_3d() -- call update_3d() at the end of the _update() function to transform etc.
	update_time=stat(1)-t
	draw_3d() --render objects into triangles, sort the triangles and draw them onto the screen
	draw_time=stat(1)-t
	print(stat(1),2,0,7)
end
-->8
--update
function _update60()
	if btnp(❎) then
		planning=not planning
		if not planning then
			load_scene(scene_list[scene_index][1],scene_list[scene_index][2],scene_list[scene_index][3])
		end
	end
	if planning then
		update_planscreen()
	else
		update_3dview()
	end
end

function update_3dview()
	local t=stat(1)
	handle_buttons() -- handle default buttons for player-- this can be overwritten obviously.
	update_player() -- update the player with default movement, stopping at obstacles
	update_camera() -- update the camera based on player location and direction
	utility_time=stat(1)-t
	scene_update_func()
end

-->8
--init
function _init()
	poke(0x5f2d, 1)
	cur_frame=0
	init_3d() --Need to call init_3d() to set up player, camera and lights
	--load_scene(load_fox_dynamic,update_fox_dynamic,draw_fox_background)
	load_scene(scene_list[scene_index][1],scene_list[scene_index][2],scene_list[scene_index][3])
	m=mouse()
	--init menu positions
	local x=100
	local y=0
	local ofs=2
	for o in all(o_menu) do
		o.x=x
		o.y=y
		y+=o.h+ofs
	end
	--init furniture list
	init_furniture()
	o=_o("bed",0,32,8,20)
	o.x=0
	o.y=0
	furniture={o}
end

function mouse()
	mouse={}
	mouse.x=stat(32)
	mouse.y=stat(33)
	mouse.dx=0
	mouse.dy=0
	mouse.lastx=mouse.x
	mouse.lasty=mouse.y
	mouse.lclick=false
	mouse.lheld=false
	mouse.holding=nil
	--update
	mouse.update=function(this)
		this.x=stat(32)
		this.y=stat(33)
		this.dx=this.x-this.lastx
		this.dy=this.y-this.lasty
		this.lastx=this.x
		this.lasty=this.y
		if stat(34)==1 then
			if not this.lclick and not this.lheld then
				this.lclick=true
			else
				this.lclick=false
				this.lheld=true
			end
		else
			this.lclick=false
			this.lheld=false
		end
	end
	--draw
	mouse.draw=function(this)
		if stat(34)==1 then
			spr(1,this.x,this.y)
		else
			spr(0,this.x,this.y)
		end
	end
	return mouse
end

--for furniture items
function _o(str,sx,sy,w,h,r)
	o={}
	o.str=str
	o.sx=sx
	o.sy=sy
	o.r=0--rotate
	o.w=w
	o.h=h
	o.draw=function(this,x,y)
		--implement rotation
		if this.r==0 then
			sspr(this.sx,this.sy,this.w,this.h,x,y)
		elseif this.r==0.25 then
			sspr(this.sx,this.sy,this.w,this.h,x,y,this.h,this.w)
		elseif this.r==0.5 then
			sspr(this.sx,this.sy,this.w,this.h,x,y,this.w,this.h,true,false)
		elseif this.r==0.75 then
			sspr(this.sx,this.sy,this.w,this.h,x,y,this.h,this.w,true,false)
		end
	end
	return o
end



o_menu={
_o("bed",0,32,8,20),
_o("chair",8,32,6,4),
_o("wardrobe",14,32,6,6),
_o("night_table",20,32,4,4),
_o("table",24,32,8,8),
_o("carpet",32,32,20,20),
}
-->8
--draw planner screen
function draw_planscreen()
	cls(6)
	
	for o in all(o_menu) do
		o:draw(o.x,o.y)
		print(o.str,o.x+o.w,o.y,1)
	end
	
	for o in all(furniture) do
		o:draw(o.x,o.y)
	end
	
	if m.lheld and m.holding!=nil then
		m.holding:draw(o.x,o.y)
	end
	--draw selected furniture
	if sel_furn!=nil then
		--sel_furn:draw(sel_furn.x-3,sel_furn.y)
		spr(16,sel_furn.x+sel_furn.w,sel_furn.y+sel_furn.h)
	end
	m:draw()
end


-->8
--update plan screen
sel_furn=nil
function update_planscreen()
	m:update()--update mouse
	--check if clicked furniture
	if m.lclick then
		--check furniture
		for o in all(o_menu) do
			if m.x>o.x and m.x<o.x+o.w and
						m.y>o.y and m.y<o.y+o.h then
				m.holding=_o(o.str,o.sx,o.sy,o.w,o.h,o.r)
				m.holding.x=o.x
				m.holding.y=o.y
				m.holding.r=o.r
				break
			end						
		end
		for o in all(furniture) do
			if m.x>o.x and m.x<o.x+o.w and
						m.y>o.y and m.y<o.y+o.h then
				del(furniture,o)
				m.holding=_o(o.str,o.sx,o.sy,o.w,o.h,o.r)
				m.holding.x=o.x
				m.holding.y=o.y
				m.holding.r=o.r
				break
			end						
		end
		--check rotate
		if sel_furn!=nil then
			local x=sel_furn.x+sel_furn.w
			local y=sel_furn.y+sel_furn.h
			if m.x>x and m.x<x+8 and m.y>y and m.y<y+8 then
				--clicked rotate
				sel_furn.r=(sel_furn.r+0.25)%1
			end
		end
	end
	--dragging furniture
	if m.lheld and m.holding!=nil then
		m.holding.x+=m.dx
		m.holding.y+=m.dy
		sel_furn=nil
	end
	if not m.lclick and not m.lheld then
		--place furniture
		add(furniture,m.holding)
		sel_furn=furniture[#furniture]
		m.holding=nil
	end
end
__gfx__
11000000a00000000000000000000000000000000000000000000000000000005555555555555555555555550000000000000000000000000000000000000000
10000000000000000666666607777777000c100000000000000cc000000000005666666556666665566666650111111101111111011111110222222202222222
00000000000000000600000607000007000c10000000000000cccc00000000005600006556000065560200650100000101000001010000010200000202000002
00000000000000000605550607000507000c100000666600000cc000000000005622206556020265562000650101110101011101010001010202220202022202
00000000000000000605550607005007000c10000666666000044000005555005602006556202025560200650100100101011101010010010200200202022202
00000000000000000605050607000507000c10000600006000044000056666505602006556200025562000650100100101010101010001010200200202020202
00000000000000000600000607005007000c10000066660000044000056006505666666556666665566666650100000101000001010010010200000202000002
00000000000000000666666607777777000c10000000000000044000056006505555555555555555555555550111111101111111011111110222222202222222
07777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
71111167000000000000000000000000000000000000000001111010010111111010000111000000000000000000000000000000000000000000000000000000
76666167000000000000000000000000000000000000000017777171171717777171001777100000000000000000000000000000000000000000000000000000
76666167000000000000000000000000000000000000000017111171171717111171001711710000000000000000000000000000000000000000000000000000
76616161000000000000000000000000000000000000000017777177771717771171001711710000000000000000000000000000000000000000000000000000
76661117000000000000000000000000000000000000000001117171171717111171111711710000000000000000000000000000000000000000000000000000
76666167000000000000000000000000000000000000000017777171171717777177771777100000000000000000000000000000000000000000000000000000
07777770000000000000000000000000000000000000000001111010010111111011110111000000000000000000000000000000000000000000000000000000
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
00000000088888888888880000000000000000000000000000000000000000000008888888888888888888000000000000000000000000000000000000000000
00000000088aaaaaaaaaa888000000000000000000000000000000000000000000008aaaaaaaaaaaaaaa88000000000000000000000000000000000000000000
0000000000888aaaaaaaaaa880000000000000000000000000000000000000000000888aaaaaaaaaaa8800000000000000000000000000000000000000000000
0000000000088aaaaaaaaaaa88888888888800888888888000000888888888880000088aaaaaaaaaa88888888888888888888888800088888888888000000000
0000000000088aaaaaaaaaaaa8888aaaaa88088aaaaaaa88800088aaaaaaaaa8800088aaaaaaaaaaa88aaaaaaaaaa88888aaaaa880088aaaaaaaa88000000000
77777777fff1ff9999991111ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
76666667ffff1f9999991111ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
76777767fff1ff9999991111ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
76777767ffffff9999991111ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
767777670000009999990000ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
111111110000009999990000ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
111111110000000000000000ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
111111110000000000000000ffffffff222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000222222222222222222220000000000000000000000000000000000000000000000000000000000000000000000000000
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
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000000000088899999999999999
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000000000888999999988888889
eeeeeeeeeee55555eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee555eeeeeeeeeeeeeeeee00020000000000000000000000000000000000888888888880000088
eeeeeeeeeee5555455eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee555455eeeeeeeeeeeeeeee000f00000001000000050000000e2000000000088800000000000000
eeeeeeeeee5551155445eeeeeeeeeeeeeeeeeeeeeeeeeeee555445555eeeeeeeeeeeeeee02fff200000000000057500000022000000000000000000000000000
eeeeeeeeee4411111154445eeeeeeeeeeeeeeeeeeeeeee55544555545eeeeeeeeeeeeeee000f0000000000000005000000000000000000000000000000000000
eeeeeeeeee55511115554444eeeeeeeeeeeeeeeeeeee5554445115445eeeeeeeeeeeeeee00020000000000000000000000000000000000000000000000000000
eeeeeeeee4411111111154444eeeeeeeeeeeeeeeeee554444511544f5eeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee45551111115554445eeeeeeeeeeeeeeee554444511544fffeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee441111111111154445eeeeeeeeeeeeee55444451115444ffeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee4555111111115554445eeddddddddeed554444111544ffffeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee44111111111111154445d666666666d55444451115444fffeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee4555111115551115444567777777776554444111554fffffeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee4411111544455555445d666667777654444511554444fffeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee4555115444444555445d666666666d54444555444fffffeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee44111154fff444554455dd6666666554445554ff444fffeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee45551154fff4444544455dddddd6d55444554444444fffeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeee451115444444444444155555555554444444fffff4fffeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeee455511444444444ff411555555511444444444f444ffeeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee451115444444999f415ddddddd5544fff44444444ffeeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee45511544449944994155555555554ffffff44444fffeeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeee411154444444444455555555554fffffffffff44ffeeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeee4515444444444444444449999ffffffffffffff4455eeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeee455544442222224444444499fffff777777ffffff51eeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeee454444444422444444449999999ffffffffffffff651eeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeee44442222222222224444449fffff777777777fffffd5eeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeee44444442222222444444499999fffffffffffffff765eeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee444422222222222222244449ffff99f77777fff77776deeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee4444444221111112224444999999944444dffffffff7d1eeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee44422222115555111222444999994444d6ddffff777765eeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee444442211144444511244444499444ff77fddffffff76deeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeee44422211154999995552244449444f99999644fff7776deeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeee154442221115555555551244444444555555555fffff76deeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee115422211111577b73b5511544444445b73b77544fff7776eeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee1154444222111577b33b5551555444455b33b77444ffff77ddeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee11544422111115777bb775515444554d77bb777499ffff77dd6eeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeee115444442222111557777d111499455dfd7777449ffffff776ddeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeee1144444222111111155d55112499f4444444999999ffff7776dd6eeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeee1155554422222111112222224999ff444444449fffffff77655d6eeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeee111511422221111111111122249ff7f44449999ffffff776d55ddeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeee1111244442222211112222244999f77f4444449fff77776ddddddeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee1112d222222211111112222249ffff7ff444999d6f776dd66d6deeeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee1112dd222222221112222244999f77777ff444515d665d66d6665eeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee1115dd2222222112222222449ffff7777ff4515555515ddd66d1eeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee11115dd2222221122222444999f777777ff411dd1115d55666d1eeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee111115dd21221112222222249ffff7777f44511115dd515d66d1eeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee1111115d2111111122222499996777777f44511115d5111566d1eeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee11111111111111112222222111177777ff54d515555d51115d51eeeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeee1111111111111151122222111dd1677ff44d515d55d6651111111eeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeee111111111111111111124421111d167ff44551166d5d676d555511eeeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeee1111111111111111111122441111116ff451111567d5d6776ddd6d11eeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeee551111111111111111111124451111fff4511115df7d5d67776dd66d1eeeeeeee00000000000000000000000000000000000000000000000000000000
eeeeeedd51111111111111111111115545224444511154ff76d5d67777d5d6651eeeeeee00000000000000000000000000000000000000000000000000000000
eeeee5d6511155555111111111111115555544451114499af655d6677765d6651eeeeeee00000000000000000000000000000000000000000000000000000000
eeee5d6d115ddddd555111111111111155444551154252222d5dd667777d5d665eeeeeee00000000000000000000000000000000000000000000000000000000
eeeed66515d6dddddd551111111111111155111544999444655ddd6677765d665eeeeeee00000000000000000000000000000000000000000000000000000000
eeeed6655d6666ddddd51111111111111111124488882222655d66666776dd665eeeeeee00000000000000000000000000000000000000000000000000000000
eee566d5d666dd5ddddd51114111444452224449999444f6555dddd66666d566d1eeeeee00000000000000000000000000000000000000000000000000000000
eeed6d5d666d51115ddd51111411144444444488882222d555d5dd5555d6d5d765eeeeee00000000000000000000000000000000000000000000000000000000
eeeddd5d6651111111dd11111141114444444999444445115dd5111111555d6765eeeeee00000000000000000000000000000000000000000000000000000000
ee5ddd55d5111111115511111114414488888888445111115d51111115ddd66765eeeeee00000000000000000000000000000000000000000000000000000000
eedddd51111111155d511111111444424999991111111111551111111ddd667765eeeeee00000000000000000000000000000000000000000000000000000000
ee6dddd5511115dd66d5111111114444444422511111111155155dd55dd667777deeeeee00000000000000000000000000000000000000000000000000000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000
__map__
0100000200000300000300300000000000000000000000000000000000000000000000002200000000000100000001000001000001000002000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000022000000000000000000000000000000000000
000c0000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030b00000b0000000000000000000023000000000000000000000d010d010d010000000000000d01000000000000000000000000000000000009000000000000
000000000000000000000000000000000002000000020000000000000000000400000000000000000000000000000000000000000000000000000000000000000003030003030000000000000b0b000000020000000002000000000d000d000d000000000300000d0000000d01000d01000e000e000000000000000000000000
2300000000000000000700000000000000000000000000060000060000000000000002000000050000050000000000000000002000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000200000000000000000000000000d00000000000000000000000004040400
0000000007000000000000002100000000000007000000000000230000060000000000000000000000000000200000000000000000000000002100000010080000000000230000000000010000000000002000000100110000000000000000000020010000000000000000000000000000000000000000110000000000000000
200000000000000020000000000000000000000000000006000006000000000000000200000005000005000000000000000000000000000000000000001000000000000000000003000000000000000000020000000000000000010000000000000000000000000f000f000000000d0100000101000000000000000004040400
00000000000000000000000000000000000200000002000000000000000000040000000000000000000000000010080000000000000000000000010000000000000000000000000b0000000000000023000000000000020000000100000001000000000003000000000000000000000000000000000000000000000000000000
00000f00000f000000000000000000000000000000000000000000000000000000000000000000000101000000000000000100000100000200000100000000000000000000000000000000000b0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000
010000020000030000030000000000000000000000000000000000002200000000000000000d0f0000000000000000000000000000000000000000080000000000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000022000000000000000000000000000000000000
0c00000000000000000000000000000b22000b2200000b00000000000000000000000000000f0d000000000000000021000000000000000000000000000000000000000000000000000006000000000000000400000000000000000400000000230000000000000000000000000000000e000000000000000000000000000000
0000000000000004000000040000000000000000000000000000000000000000000000000000000000000000060000000000000000000800000000210000080000000000000000000000000000000000000000000000040000000000000000000000000000000000230000000000000000000000000500000000000000000000
00000c00000000000004000000000000000000000000000000000010000f000e00000000000000000000000000000000000000000000000000000000000000000020080000110006000000000000000400000000000000000000000000002300000000000000000000000d00000000000e000000200000000000000000060000
0000000000000004000000040000000000000000000000000000000000002300000000000000000000000000000000000010000000002100000800000000000000000000000000000000000000000000000000040000000004000000000000000000000023000000000000000000000000002000000000000000000000060000
000000000c00000000040000000000000000000000000000110000000000000023000000000000000000000000000000100c000000000000000000000000080000000000000021000000060000042200000400000000000000000000000000000d0d00000000000700000000070000000e000000200000000000000000060000
0000000000000004000000000000000000000000000000000000000000000000000023000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0d000000000000000000000000000000000000000500000000000000000000
00000c00000000000004000000000000000000000000000000000010000f000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000d00000000000e000000000000000000000000000000
00000000000000040000000400000000000000000000000000000000000000000000000000000000000d0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000220000002200000000000000000000000000000000000000
0c0000000000000000000000000022000b22000b2200000b00000000000000000000000000000000000f0d000000000000000800000000000000000000040000000000000000000e0000000e0000000000000000000000000000000000000000000000000000000000000000000000000e0000000f0000000000000000040400
080000000000000000000000050005000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000002300000000000000000000000000000000000000000300000000000d000000080000000000000000000000000000000000000000000000050000000000000000
0000000000000000000000000000000000000000000000000000000000000010000000080000000000000000000b00000000000800000000000a0000000000000000000000000000000e0000000e000000000000000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000
0000000800080000000000000000000000040000000000000004001000000000000000000000001000000000000b0000000000000000000000000000000000000000000b210000000000000000000000000000000000200000000020000f000a00000000000007000000000000060000000f0000000000230005000007000000
000000000000000008000000000000000000000400000004000000000800000000000010000000000000000000000d000000000000000800000000000004000000000000000000000000000e0000000000000000000000002000000d000000000000000000000000000600000000000e0000000f000000000000000000000000
000800000010000000000000000006000000000000040000000000000000000008000000080000000000000000000d001100000a0000000000000000000000000000000b210000000000000000000000000300000000000003000000000f00080000000700000000000000000000000000000000000000050000000000000000
0b0000000008000000000000000000000000000400000004000000000000001000000000000000000000000000000d00000000000000000008000000000000000000000000000000000e0000000e000000000000000000000000000000000000000000000000000000000000000000000f000e00000000000000000000040400
0000100000000010090000000000000000040000000000000004000000000800000000100000080000000000000b0000000000000000000000000000000000002300000000000000000000000000000000000000000000000000000d000000000000000000000022000000220000000000000000000000000000000000000000
0000000800000000000000000000000000000000000000000000000000000000000800000000000000000000000b000000000000000000000000000000040000000000000000000e0000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b00000000000000000000000500050022000022000022000022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010800001f14000000000002614000000000002b14000000000001f14000000000002b14000000000001f14000000000002614000000000002b14000000000001f14000000000002614000000000002b14000000
010800001333013330000001332013320000001331013310000001331013310000001331013310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01080000000002214000000000002114000000000001d14000000000001a14000000000001d14000000000001f14000000000002614000000000002b14000000000001f14000000000002b14000000000001f140
0108000000000000002614000000000002b14000000000001f14000000000002614000000000002b14000000000002214000000000002114000000000001d14000000000001a14000000000001d1400000000000
010800001333013330000001332013320000001331013310000001331013310000001331013310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800000000000000000000000000000000000743007430074300743000000000000743000000000000743007430000000000000000000000743000000000000743007430074300743000000000000743000000
01080000000000000000000000001333013330000001533015330000001532015320000001633016330000000f3300f330000000f3200f320000000f3100f310000000f3100f310000000f3100f3100000000000
010800000000007430074300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003430034300343003430000000000003430000000000003430
010800000000000000000000000000000000000000000000113301133000000113201132000000113101131000000113101131000000113101131000000000000000000000113301133000000113201132000000
010800000343000000000000000000000034300000000000000000000000000000000000000000054300543005430054300000000000054300000000000054300543000000000000000000000000000000000000
010800000000000000000000000000000000000743007430074300743000000000000743000000000000743007430000000000000000000000743000000000000743007430074300743000000000000743000000
010800000343000000000000000000000034300000000000000000000000000000000000000000054300543005430054300000000000054300000000000054300543000000000000000000000000000000000000
010800000000000000000001624016240000002224022240000001624016240000002124021240000001624016240000001f2401f240000001624016240000001d2401d240000001f2401d2401b2401b24000000
010800000f3300f330000000f3200f320000000f3100f310000000f3100f310000000f3100f310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800001d2401d240000000000000000000001a2401a240000001b2401b240000001d2401d240000002124021240212402124000000000001f2401f240000001d2401d240000000000000000000001d2401d240
01080000000001f2401f2400000021240212400000021240212402124021240000000000022240222400000022240222402224022240222402224000000000000000022240222402224022240000000000022240
0108000022240222402224000000000001f2401f240000001f2401f2401f2401f2401f2401f240000000000000000222402224022240222400000000000242402424024240242400000000000212402124000000
010800002124021240212402124021240212400000000000000002424024240242402424000000000002524025240252402524000000000002224022240000002224022240222402224022240222400000000000
010800000000025240252402524025240000000000026240262400000023240232400000026240262400000027240272400000024240242400000027240272400000028240282400000025240252400000028240
0108000028240000002924029240000002624026240000002924029240000002f2403024031240322400000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001333013330000001332013320000001331013310000001331013310000001331013310
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000743007430074300743000000000000743000000
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013330133300000015330153300000015320153200000016330
010800000000007430074300000000000000000000007430000000000007430074300743007430000000000007430000000000007430074300000000000000000000000000000000000000000000000000000000
0108000016330000000f3300f330000000f3200f320000000f3100f310000000f3100f310000000f3100f31000000000000000000000000000000000000000000000000000113301133000000113201132000000
010800000000000000000000000000000000000000000000034300343003430034300000000000034300000000000034300343000000000000000000000034300000000000000000000000000000000000000000
010800001131011310000001131011310000001131011310000000000000000000001133011330000001132011320000001333013330000001332013320000001331013310000001331013310000001331013310
010800000543005430054300543000000000000543000000000000543005430000000000000000000000000000000000000000000000000000000000000000000743007430074300743000000000000743000000
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016240162400000022240222400000016240162400000021240212400000016240
010800001131011310000001131011310000001131011310000000000000000000001133011330000001132011320000000f3300f330000000f3200f320000000f3100f310000000f3100f310000000f3100f310
010800000543005430054300543000000000000543000000000000543005430000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0108000016240000001f2401f240000001624016240000001d2401d240000001f2401d2401b2401b240000001d2401d240000000000000000000001a2401a240000001b2401b240000001d2401d2400000021240
0108000021240212402124000000000001f2401f240000001d2401d240000000000000000000001d2401d240000001f2401f24000000212402124000000212402124021240212400000000000222402224000000
010800002224022240222402224022240222400000000000000002224022240222402224000000000002224022240222402224000000000001f2401f240000001f2401f2401f2401f2401f2401f2400000000000
010800000000022240222402224022240000000000024240242402424024240000000000021240212400000021240212402124021240212402124000000000000000024240242402424024240000000000025240
0108000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002b1402b14000000
0108000025240252402524000000000002224022240000002224022240222402224022240222400000000000000002524025240252402524000000000000000000000000002b2402b24000000262402624000000
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000133301333000000133201332000000
010800002614026140000002414024140000001f1401f140000001a1401a140000001814018140000001314013140000000000000000000000000000000000000000000000000000000000000000000000000000
010800002424024240000001f2401f240000001a2401a240000001824018240000001324013240000000000000000000000000000000000002424024240242402424000000000002424024240242402424000000
010800001331013310000001331013310000001331013310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800000000000000000000000000000000000000024240242402424024240000000000000000000000000000000000000000024240242402424024240000000000024240242402424024240000000000000000
0108000000000000000000000000000000000000000000000000000000000000000000000000001f14000000000002614000000000002b14000000000001f14000000000002b14000000000001f1400000000000
010800000000000000000000000000000242402424024240242400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800000000000000000000000000000000000000000000000000000000000000000000000000133301333000000133201332000000133101331000000133101331000000133101331000000000000000000000
010800002614000000000002b14000000000001f14000000000002614000000000002b14000000000002214000000000002114000000000001d14000000000001a14000000000001d14000000000001f14000000
01080000000002614000000000002b14000000000001f14000000000002b14000000000001f14000000000002614000000000002b14000000000001f14000000000002614000000000002b140000000000022140
0108000000000000002114000000000001d14000000000001a14000000000001d1400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010800000000000000000000000000000000000000000000000000000000000000000000000000133301333000000133201332000000133101331000000133101331000000133101331000000000000000000000
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074300743007430074300000000000074300000000000074300743000000
010a00001b3431b5331b533125000e500045001d7001b500145001450000000000000740000000000000740007400394000740000000000000740000000000000740007400074000740000000000000740000000
000200000c7500d7500e76014650106500e6300c6200a62008620066200562003610026100001000000000000000000000000000000000000000001a3001a3000000000000000000000000000000000000019300
01060000122330f2330c2330b2300a630086200562003610036100360007400000000000007400074000000000000000000000007400000000000000000000000000007400000000000007400000000000000000
010d00000545305453096460a6360b726057260371601700000000000000000153001530000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400000762008640096500b6500c6500e6500f650106501364014640156301563016630176201762018620196201962019620196201a6201962019620196201862018620176101761016610156101460013600
0104000007440094400b6400f63014630196302063024630266202662024610216101b6100f6000a6000940009400094000940000000000000940000000000000940009400094000940000000000000940000000
01080000227522675229552205522854224532285222c5220d505115040f5030f5020f5040f5050f506000000000000000000000000000000000001c3001c3000000000000000000000000000000000000010300
010800000000009430000000000009430094300943009430000000000009430000000000009430094300000000000000000000009430000000000000000000000000000000000000000004430000000000000000
010800001033000000000000000000000113301133000000000000000000000123301233000000133301333000000133201332000000133101331000000133101331000000133101331000000000000000000000
010800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074300743007430074300000000000074300000000000074300743000000
010800000000009430000000000009430094300943009430000000000009430000000000009430094300000000000000000000009430000000000000000000000000000000000000000004430000000000000000
010800001033000000000000000000000113301133000000000000000000000123301233000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 00420144
00 02424344
00 03424344
00 41420405
00 41420607
00 41420809
00 4142040a
00 41420607
00 4142080b
00 410c0d44
00 410e4344
00 410f4344
00 41104344
00 41114344
00 41124344
00 41131415
00 41421617
00 41421819
00 41421a1b
00 41421617
00 41421819
00 411c1d1e
00 411f4344
00 41204344
00 41214344
00 41224344
00 23242544
02 26272844
00 41294344
00 2a2b2c44
00 2d424344
00 2e424344
00 2f423031
00 41424332
00 41423334
00 41423536
00 41424337
00 41423839
00 41423a3b
00 41424332
00 41423334
00 41423536
00 41424337
00 4142383c
00 41423d44

