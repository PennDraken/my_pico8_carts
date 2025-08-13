pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include string_handling.lua
#include settings_menu.lua

function _init()
	init_menu()
end

function _draw()
 menu:draw()
end

function _update()
 menu:update()
end
