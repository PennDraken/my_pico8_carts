pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	--music(0)
	camera()
	_set_fps(60)
end

function reset_player()
 p_x = p_strtx
 p_y = p_strty
 p_crash = false
 p_trail={}
 p_n = 64
	p_speed = 0
	p_dx = 0
	p_dy = 0
	p_angle = 0.75
end

--player variables
p_maxspeed = 2
p_turnspeed = p_maxspeed/2
p_n = 64
p_speed = 0
p_dx = 0
p_dy = 0
p_angle = 0.75
p_friction = 0.991
p_acc = 0.02
p_strtx = 128/2+4
p_strty = 30
--p_strty = 0*(8*64)
p_x = p_strtx
p_y = p_strty
p_crash = false
p_width = 6
p_trail={}
score = 0
--camera
cx = 0
cstrty = p_strty - 30
cy = cstrty
cv = 0
ca = 0.1
--obstacles
function new_o(n, x, y)
	o   = {}
	o.n = n
	o.x = x
	o.y = y
	
	return o
end

o_list = {}



-->8
--draw game
function _draw()
	draw_game()
end

function draw_game()
	cls(7)
	draw_w()
	draw_trail(p_trail)
	draw_player()
	draw_score()
	--draw_wbot()
	move_camera()
	
end

screen=0
limy=64*8
function draw_w()
 mod_cy=cy%(limy)
 m1x=flr(cy/limy)*16
 m1y=flr(mod_cy/8)
 ofsy=-cy%8-8
 remtiles=flr((limy-mod_cy)/8)
 
 if remtiles < 16 then
  m2x=m1x+16
  m2y=(m1y+remtiles)%(limy/8)
  map(m2x,0,0,8*(remtiles+1)+ofsy,16,16)
 end
 map(m1x,m1y,0,ofsy,16,remtiles+1)
end



function draw_player()
	if p_crash then
		spr(79,p_x,p_y-cy)
		return
 end
 if p_angle > 0.75 then
  s_flip = false
 else
  s_flip = true
 end
 abs_angle = abs(p_angle - 0.75)
 if abs_angle < 0.01 then
  spr(64,p_x,p_y-cy,1,1,s_flip)
 elseif abs_angle < 0.10 then
  spr(65,p_x,p_y-cy,1,1,s_flip)
 elseif abs_angle < 0.16 then
 	spr(66,p_x,p_y-cy,1,1,s_flip)
 elseif abs_angle < 0.25 then
 	spr(67,p_x,p_y-cy,1,1,s_flip)
 elseif abs_angle < 0.30 then
 	spr(68,p_x,p_y-cy,1,1,s_flip)
 elseif abs_angle < 0.40 then
 	spr(69,p_x,p_y-cy,1,1,s_flip)
 else
 	spr(70,p_x,p_y-cy,1,1,s_flip)
 end
end

function draw_trail(trail)
 if trail==nil then
  return
 end
 
 for i=2,#trail do
  pos =trail[i]
  ppos=trail[i-1]
  line(ppos.x+2,ppos.y-cy+7,
       pos.x +2,pos.y -cy+7,6)
  line(ppos.x+5,ppos.y-cy+7,
       pos.x +5,pos.y -cy+7,6)
 end
end


function draw_score()
	print("distance:"..flr(score).."m",35,2,1)
end

function move_camera()
 b = p_y - 30
 cy = lerp(cy,b,0.1)
end

function lerp(a,b,amt)
 return a * (1 - amt) + b * amt
end
-->8
--update game
function _update60()
	update_game()
end

t=0
function update_game()
	if p_crash then
		p_speed *= 0.9
		if p_speed<0.2 then
		 reset_player()
		end
	else
	 input()
	end
	move_player()
	score=p_y/16
	t+=1
end

k = 8
ts = 0.01 --turn speed
maxangle=0.3
function input()
	--0 is left
	if btn(⬅️) then
	 if p_angle > 0.75-maxangle then
	  p_angle -= ts
	 end
	elseif btn(➡️) then
	 if p_angle < 0.75+maxangle then
	  p_angle += ts
	 end
	elseif btn(⬇️) then
	 if p_angle < 0.75 then
			p_angle += ts
		elseif p_angle > 0.75 then
			p_angle -= ts
		end
	else
		
	end
end

function move_player()
 if abs(p_speed) > 0 then
  p_speed = p_speed * p_friction
 else
  p_speed = 0
 end
 if p_speed < p_maxspeed then
  p_speed = p_speed + p_acc * sin(p_angle)
 else
  p_speed=lerp(p_speed,p_maxspeed,0.7)
 end
	p_dx = p_speed * cos(p_angle)
	p_dy = p_speed * sin(p_angle)
 --trail
 pos={}
 pos.x    =p_x
 pos.y    =p_y
 pos.angle=p_angle
 add(p_trail,pos)
 --update position
 p_x += p_dx
 p_y += p_dy
 
 collision_check()
end

--player collides with obstacle
function collision_check()
 mx=flr((p_x+4)/8)+flr(p_y/limy)*16
 my=flr((p_y+4)/8)%64
 --accelerate
 if mget(mx,my)==42 then
  p_angle=0.75
  p_speed=2*p_maxspeed
 elseif mget(mx,my)==58 then
  p_angle=0.5
  p_speed=2*p_maxspeed
 elseif mget(mx,my)==59 then
  p_angle=1
  p_speed=2*p_maxspeed
 end
 
 --checkpoint
 if fget(mget(mx,my),1) then
  tile=mget(mx,my)
  if tile==12 then
	  p_strtx = (mx*8+4)%128
	  p_strty = flr(p_y/8)*8
  elseif tile==13 then
	  p_strtx = (mx*8-4)%128
	  p_strty = flr(p_y/8)*8
  elseif tile==28 then
	  p_strtx = (mx*8+4)%128
	  p_strty = flr(p_y/8)*8
  elseif tile==29 then
	  p_strtx = (mx*8-4)%128
	  p_strty = flr(p_y/8)*8
  end
 --obstacle
 elseif not fget(mget(mx,my),0) then
  p_crash = true
 end
end











-->8
--game over
function draw_gameover()

end

function update_gameover()

end
__gfx__
777777777777777700000003300000000aaa00000000aaa000000000000000000000003333300000000000bbbbb0000000000000000000000000000000000000
707777077777777700000033330000000999aaaaaaaa99900000000000000000000033333333300000000bbbbbbbb00000000000000000000000000000000000
7707707777777777000003333300000009999999999999900999999999999990003333333333333000bb0bbbbbbbbb0000020000000000000000000000000000
7770077777777777000033333330000009999999999999900aaaaaaaaaaaaaa003333333333333300bbbbbbbbbbbbbb000021111111000000000000000000000
77700777777777770000333333330000099999999999999009999999999999900333333333333333bbbbbbbbbbbbbbbb00021441441000000000000000000000
7707707777777777000333333333300009999999999999900999999aa99999903333333333333333bbbbbbbbbbbbbbbb00021444441000000000000000000000
707777077777777700333333333333000999a999a999a990099999a99a9999903333333333333333bbbbbbbbbbbbbbbb00021144411000000000000000000000
77777777777777770333333333333330099aaa9aaa9aaa9009999a9889a9999033333333333333333bbbbbbbbbbbbbbb00021114111000000000000000000000
dddddddd777777770333333333333330099ada9ada9ada90aaaaa988889aaaaa33333333333333330333bbbbbbbbbb3300021111111000000000000000000000
dddddddd779777773333333333333333099d1d9d1d9d1d9099999681186999993333333333333333003353bbbbb3333000020000000000000000000000077700
dddddddd797977773333333333333333099d1d9d1d9d1d90006886811868860033333333333333330000053333333000000200000000000000000000007ddd70
dddddddd779777773333333333333333aaadddadddadddaa00688688886886003333333333333333000005055050000000020000000000000000000000dd6dd0
dddddddd77777d773333333333333333999999999999999900688681186886003333333333333333000000555500000000020000000000000000000000d666d0
dddddddd7777d7d7033333333333333000dd1ddd1ddd1d0000688681186886000333333333333330000000055000000000020000000000000000000000dd6dd0
dddddddd77777d77000333333333300000dd1ddddddddd00000dddddddddd0000003333333333000000000055000000000020000000000000000000000dd6dd0
dddddddd777777770000000550000000000000000000000000000000000000000000000550000000000000055000000000020000000000000000000000000000
77777777777773777777777777777777777777770000b00000000000000000000000000000000000000000000000000000000000000000000000000000000000
7777777777777737775555555555555555555555000bb00000000000000000000000000000000000066666000667660000000000000000000000000099999999
7777777777777737755555555555555557777775000bb00000000000000000000000000000000000676667606667666000011111111110009999999999919999
777766777777377775555555555555555555555500bbb00000000600000000000000000000000000676667606676766000011166111110009119199999919991
777766773773777775555aa5aaa5aaa55777777500bbbb0060006000000000000000000000000000667676606676766000011116611110009199199111919991
76677777737377777555555555555555555555550bbbbbb006606000000000000000000000000000667676606766676000011111661110009119199191919991
76677777737777777555555555555555577777750bbbbbb000060000000000000000000000000000666766606766676000011111166110009919199191919191
7777777777777777775555555555555555555555bbbbbbbb00060000000000000000000000000000066766000666660000011111661110009919119191911111
0000000000000000000000000000000000000000bbbbbbbb00065000000000000000000000000000000000000000000000011116611110009119999111999999
0000000000000000000000000000000000000000bbbbbbbb00066000000000000000000000000000066666000066666000011166111110009999999999999999
0000000000000000000000000000000000000000bbbbbbbb00066060000000000000000000000000666677600677666600011111111110009999999999999999
00000000000000000000000000000000000000003bbbbbb300056600000000000000000000000000667766600666776600000005500000009999999110000000
00000000000000000000000000000000000000000333333000056000000000000000000000000000776666600666667700000005500000000000000550000000
00000000000000000000000000000000000000000005500000066000000000000000000000000000667766600666776600000005500000000000000055000000
00000000000000000000000000000000000000000005500000005600000000000000000000000000666677600677666600000000000000000000000055000000
00000000000000000000000000000000000000000005500000006600000000000000000000000000066666000066666000000000000000000000000550000000
000ee0000000ee0000070ee000000ee000ee00000000ee00000ee000000000000000000000000000000000000000000000000000000000000000000000e00e00
009ff9007000ff0070009ff000000ff000ff0000000999000099990000000000000000000000000000000000000000000000000000000000000000000e1001e0
009ff9000799ff0007999ff077999ff000990ee000099900009999000000000000000000000000000000000000000000000000000000000000000000e001100e
099999900099110000911100000999000999e0000000990009999990000000000000000000000000000000000000000000000000000000000000000000099000
791111970e111000e011e000009990007097100e000111e009111190000000000000000000000000000000000000000000000000000000000000000000999900
071001700e10e0000e100e0000111ee0009911e0000e01e07010010700000000000000000000000000000000000000000000000000000000000000000909f090
00e00e0000e00e0000e00e000011000000700e0000e00e0000e00e0000000000000000000000000000000000000000000000000000000000000000000909f090
00e00e0000e00e00000e00000eeeee000700e00000e00e0000e00e00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00044400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444400444000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444044040440000000004444404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444470444744000000444444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444470440744000004444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444470440744000044444444444040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444444444444000004444444444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440707074000000444444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444040000004000000444000444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444004444444000000444000444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000044000000000444000444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31101010101010101011a1b111118090203020302030101010101010101010101122323232423232323232323232323210101010101011101010101010101080
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
30101010101010101010101010118191213121312131101010101010101010101110101010101010607040506070607010108090101011101010101010111081
10101010101010101010101011101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3110101010101010101010101011112020302030203010101010101010101010a0b0a0b010101010617141516171617180908191101011101010101010809080
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3010101010101010101010101010102121312131213110101010101010101010a1b1a1b1101010a0b0a0b0a0b0a0b0a081918090809011101010108090819181
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
311010101010101010101010101010102030203020301010101010101010101090111110101010a1b1a1b1a1b1a1b1a180908191819111101010108191809080
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
101010101010101110101010101010102131213121311010101010101010101091111010101010101010020211a0b01181918090809010101010101010819181
10101010101010101010101010101010000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000
621010101010101020301010101010108090203020301010101010101010101090111010101010100202021010a1b1a080908191819110101010101080908090
10101010101010101010101010101010000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000
631010101010101021311010101010108191213121311010101010108090101091a0b0101010100202021010101011a181918090101011101010101081918191
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
301110101010101010101010101010621080901010101010101010108191101090a1b11111101002021010101010101180908191101011101010101080908090
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31101010101010101010101010101063908191809010101010101080908090109180908090809080901010101010101081911010101011101010101081918191
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111010101010101010101010102030918090819110101010021081918191109081918191819181911010101010101052405040501010101052405060708090
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20301010101010101010101010102131908191a0b0101002101080908090809080908090021010101010101010101010534151415111a2111053415161718191
b0101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21311110101010101010101010101062918090a1b110021080908191819181918191819102021010101010101010101032323232323242323232323232323232
b1101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
30203010101010101010101010101063628191020210101081911280900280909080901010021010101010101010101052522030607010607040502030203052
a0101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31213110101010101010101010101010630202101010101010121281911281919181911010020202101010101010809053532131617110617141512131213153
a1101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2030203010101010101010101010101010a0b01010101010108090121112121290101010101010020210101080908191522030102030b310101010101010a252
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2131213110101010101010101010101010a1b1101010101010819110128090129110101010101010021080908191809053213110213110203020308090101053
10101110101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2030809020301010101010101010101010a0b01010101010a0b01010108191119010101010101010809081918090819111101010101010213121318191101052
90101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2131819121311010101010101010101010a1b11010101010a1b11010101010109110101010101010819180908191809011101010101010102030101010101053
91101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2030203020302030521010101010101010a0b0101010101010101010101010109010101010101010101081918090819111111111111010102131101010101052
10101010101010101010101011101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2131213121312131531210101010101010a1b1101010101010a0b010101010109180901010101010101010108191809011111111111010101010101010111053
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6220302030809020302030101010101010a0b0101010101010a1b110101010109081918090101010101010101010819111118090111110101010101080908090
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6321312131819121312131101010101012a1b1101010101010101010101010109180908191101010101010101010101011118191809010108090809081918191
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20302030203020302030101010102030128090101010101010101080908090809081911010101010101010101010101011111111819180908191819180902131
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21312131213121312131101010122131908191101010101010101081918191819110101010101010101010102030203010101010101081911010101181912030
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
30521010101010101010101010101010911280901010101010108090809080901010101010101010101010102131213110101010101010101010101010102131
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31531010101010101010101010101012809081911010101010108191819181911010101010101010101010101010101010101010101010101080908090809080
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010621010101181912030101010e2f2809020308090801010101010101010101010102030203080908090101010101081918191819181
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010105220308090631010203020302131101010e3f3819121318191811010101010101010101010102131213181918191c0d0c0d08090809080908090
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10101010101053213181911111112131213120301011111010108090809080908090c0d080908090809080908090809080908090c1d1c1d18191819181918191
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101020308090203080902030203030f121311010111110108191819181918191c1d181918191819181918191819181918191101010101010809080908090
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10101010213181912131819121312131311010101010101111101010101010101010101010101010101010101010101010101010101010101010819181918191
10101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000202000001010000000000000000000002020000010101010100000000000505010101010000000000000000000005050101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1010101010101010101010101010101001010101010101010101010809080908090101010101010111010101010101010101010101010101010101010101011101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101001010101010101010101011819181918190101010101010111010101010101010101010101010101010101010101080911110101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101001010101010101010101010108090809090101010101010101110101010101010101010101010101010101010101181911010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101010101010101010118191819190101010101010101111101010101010b0a0b2508090809010101010a0b0809250a0b01010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101010101010101010101020302090101010101010101011111010101011b1a1b3518191819010101011a1b1819351a1b01010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01010101010101010101010101010101010101010101010101010101201213121901010101010101010111011101010102030a0b2a0101013a3a3a3a3a01080908090a0b010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01010101010101010101010101010101080902030101010101010101012001080901010101010101010101111101010112131a1b2a010101010101010101181918191a1b010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010101010101010101010101010101011819121301010101010101010101011819010101010101010101010111110101020308092a02030a0b0809010a0b080901010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010101010101010101010101010101012508090809010101010101010101010209010101010101010101010111110101121318192a12131a1b1819011a1b181901010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010135181918190101010101010101010112190101010101010101010111110101010a0b0a0b2a0a0b1108090a0b0203080901011101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090101010101200101010101010126080203020302030809020302030c0d0203090101010101010101111101010101011a1b1a1b011a1b1118191a1b1213181901010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
190101010120010101010101010136181213121312131819121312131c1d1213190101010101011111110101010101010108090101020306070a0b250809020301010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0203020301200203080902030203020309020308090101010101010101010101090101010101111101010101010101010118190101121316171a1b351819121301010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1213121301201213181912131213121319121318190101010101010101010101190101010111110101010101010101010a0b013b3b3b010101010101012a0a0b01010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0908090101010101010101010102030208090101010101010101010101010101090101010111110101010101010101011a1b0203020302030a0b020301011a1b01010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19181901010101010101010101121312181901010101010101010101010101011901010101111101010101010101010102031213121312131a1b121301010a0b01010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02030101012001010101010101010203010101010101010101010101010101010101010101011111010101010101010112130203010101010108090101011a1b01010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12130101012001010101010101011213010101010101010104050101080902030b0101010101011111111101010101010203121302030101011819010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02030101010120010101010101010203010101010101010114150203181912131b01010101012c2d01111111010101011213020312132a01010101110108090801010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12130203010101010101010102031213010101010120202002031213111111110a0b0a0b01013c3d01010111110101010203121302032a0101013a010118191801010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01011213010101010101010112131120202020202001010112130111111111111a1b1a1b010101012c2d0101011101011213020312132a01080908090809080901011101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02030203020301200101020302030203010101010101010203111111011111110b0a0b0a0b0101013c3d0101011101010203121302031101181918191819181901010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12131213121301200101121312131213010101010101011213111111011111081b1a1b1a1b01010101010101011101011213010112131101010101010111010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03020302030101010101010203020302030101080908090809010111111111180a0b0a0b0a0b0a0b0a0b0a0b010111010108090809011101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13121312130101010101011213121312130101181918191819010101010108091a1b1a1b1a1b1a1b1a1b1a1b011111010118191819011101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
020302030101012001010203020301010101010101010809080908090809181926112621010101010101010111110101010101010101110a0b0101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
121312130101012001011213121302030101010101011819181918191819010136263601010101010101011111110101010101010101111a1b0101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0203010101012001010102030809121301010101010101010101010101010101113621010101010101010101010101180101010101011101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12130101010120010203121318190203010101010101010101010101010101010a0b0a0b0c0d0c0d0a0b0a0b0a0b0a0b0101010101010101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01010101012001011213020302031213010101010101010101010101010101011a1b1a1b1c1d1c1d1a1b1a1b1a1b1a1b0101010101011101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2020202020010101080912131213080902030101010101010101010101010101060706070101010104050405040504050101010101011101010101010101010101011101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
030101010101010118190a0b1111181912130101010101010101010101010101161716170101010114151415141514150101010101010101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
311000000f0500f05012050140501605014050120500f0501c050000000000000000180500000000000000001105012050140500f050120500f0500d0500f0501505011000000000000011050000000000000000
19160000180531c0501f054180501c0501f054180501c0511c0501f050230541f050230501c0541f050210511f05323050260541f05023050260541f05028052170501305217054180501c053170541c0501f051
b716000028250185463c6551854524350000003c6550000000000000003c6551854500000000003c655000002b250185463c6551854528450000003c6550000000000000003c65518545000003c6551c3501d450
b91600000025000000000000025500250000000000000250042500000000000000000425504250000000000005250000000000005255052500000000000052570725000000000000725007255052500525504250
011600001d0511f0551c055210551d0551f0551c055210551d0551f0551c055210551d0551f0551c051210552b0512d055290552b0552b0552d055290552b0552d0552905528055260552d055290552805126055
b51600200c15324655000002465500000246550000024655000002465500000246550c1532465500000246550c15324655000002465500000246550000024655000002465500000246550c153246550000024655
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00040000276102c62038630346402e640246301b63015620116200b61008610036100260001600006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 02030444
00 05064344

