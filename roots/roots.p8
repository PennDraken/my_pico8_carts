pico-8 cartridge // http://www.pico-8.com
version 38
__lua__


#include cursor.lua
#include tile.lua
#include main.lua
#include globals.lua
#include probability_table.lua
#include keyboard_handler.lua

#include draw.lua
#include update.lua
__gfx__
00000077770000000000000000000000000000000000000000000077770000000000007777000000000000777700000000000077770000000000077777700000
00000077770000000000000000000000000000000000000000000077770000000000007777000000000000777700000000000077770000000007700000077000
00000077770000000000000000000000000000000000000000000077770000000000007777000000000000777700000000000077770000000070000000000700
00000077770000000000000000000000000000000000000000000077770000000000007777000000000000777700000000000077770000000700000000000070
00000077770000000000000000000000000000000000000000000077770000000000077770000000000000777700000000000000000000000700000000000070
00000077770000000000000000000000000000000000000000000077770000000000777770000000000000777700000000000000000000007000000000000007
00000077777777770000007777777777777777777700000077777777770000007777777700000777777777777777777777777777777777777000000000000007
00000077777777770000007777777777777777777700000077777777770000007777777000077777777777777777777777777777777777777000000000000007
00000077777777770000007777777777777777777700000077777777770000007777770000777777777777777777777777777777777777777000000000000007
00000077777777770000007777777777777777777700000077777777770000007777000007777777777777777777777777777777777777777000000000000007
00000000000000000000007777000000000000777700000000000000000000000000000077770000000000777700000000000000000000007000000000000007
00000000000000000000007777000000000000777700000000000000000000000000000777700000000000777700000000000000000000000700000000000070
00000000000000000000007777000000000000777700000000000000000000000000000777000000000000777700000000000077770000000700000000000070
00000000000000000000007777000000000000777700000000000000000000000000007777000000000000777700000000000077770000000070000000000700
00000000000000000000007777000000000000777700000000000000000000000000007777000000000000777700000000000077770000000007700000077000
00000000000000000000007777000000000000777700000000000000000000000000007777000000000000777700000000000077770000000000077777700000
00000000000000000000007777000000000000000000000ccccccc7777ccccccc000000000000000000000777700000000000077770000000000007700000000
0000000000000000000000777700000000000000000000cc0ccccc7777ccccc0cc00000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc00cccc7777cccc00ccc0000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc0000007777000000ccc0000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc0000007777000000ccc0000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc0000007777000000ccc0000000000000000000777700000000000077770000000000007700000000
77777777777777770000007777000000777777777777777700000077770000007777777777777777000000777700000077777777777777777777777777777777
77777777777777770000007777000000777777777777777700000077770000007777777777777777000000777700000077777777777777777777777777777777
77777777777777770000007777000000777777777777777700000077770000007777777777777777000000777700000077777777777777777777777777777777
77777777777777770000007777000000777777777777777700000077770000007777777777777777000000777700000077777777777777777777777777777777
000000000000000000000077770000000000000000000ccc0000007777000000ccc0000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc0000007777000000ccc0000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc0000007777000000ccc0000000000000000000777700000000000077770000000000007700000000
000000000000000000000077770000000000000000000ccc0000007777000000ccc000000000000000cccc7777cccc0000000077770000000000007700000000
0000000000000000000000777700000000000000000000cc0000007777000000cc000000000000000ccccc7777ccccc000000077770000000000007700000000
00000000000000000000007777000000000000000000000c0000007777000000c000000000000000cccccc7777cccccc00000077770000000000007700000000
cccccccccccccccc000000000000000c0000000000000000c000000000000000cccccccccccccccc0000000000000000000000000000000000000000cccccccc
cccccccccccccccc00000000000000cc0000000000000000cc000000000000000cccccccccccccc00000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000cccccccccccc000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc0000000000000000ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc0000000000000ccc00cccccccccccc00ccc000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc00000000000000cc0cccccccccccccc0cc0000000000000000000000000000000000000000000000000000000000000000000000cccccccc
cccccccccccccccc000000000000000cccccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000cccccccc
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
77000000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
70000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77000000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
