pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	--layouts
	settings_layout=new_layout(10,30)
	home_layout=new_layout(10,30)
	--buttons
	slomo_btn=new_button("slow motion",false)
	immersive_btn=new_button("immersive",false)
	b3=new_button("immersive",false)
	back_btn=new_button("back",home_layout)
	settings_layout.title="settings"
	settings_layout.list={slomo_btn,immersive_btn,b3,back_btn}

	start_btn=new_button("start game")
	start_btn.click=function(this)
		cls()
		print("game started")
		stop()
	end
	settings_btn=new_button("settings",settings_layout)
	home_layout.list={start_btn,settings_btn}

	--set layout to be shown on screen
	screen_layout=home_layout
end

function _draw()
	cls()
	print("slowmo="..tostr(slomo_btn.var),0,0,1)
	print("immersive="..tostr(immersive_btn.var),0,8,1)
	draw_menu()
end

function _update()
	update_menu()
end
-->8
--draw
function draw_menu()
	--settings_layout:draw()	
	screen_layout:draw()
end
-->8
--update
function update_menu()
	--settings_layout:update()
	screen_layout:update()
end
-->8
--objects
--list of buttons, selected n
function new_layout(x,y)
	o={title="",
				list=list,
				seln=1,--button index to show
				x=x,
				y=y}
	
	o.draw=function(this)
  local ofs=0
  if this.title~="" then
   print(this.title,this.x+4,this.y,6)
   ofs=8
  end

  for i,b in ipairs(this.list) do
   local x,y=this.x+4,this.y+i*8-8+ofs
   if i==this.seln then
    line(x,y+5,x+#b.text*4,y+5,6)
   end
   b:draw(x,y)
  end
	end

	o.update=function(this)
		if (btnp(⬆️))	this.seln=(this.seln-2+#this.list)%#this.list+1
		if (btnp(⬇️)) this.seln=(this.seln%#this.list)+1
		if (btnp(❎)) this.list[this.seln]:click()
	end
	
	return o
end

function new_button(text,var)
	o={text=text,var=var,c=7}
	
	o.click=function(this)
		--toogle boolean
		if (type(this.var)=="boolean") this.var=not this.var	
		--change layout
		if (type(this.var)=="table") screen_layout=var
	end
	
	o.draw=function(this,x,y)
		print(this.text,x,y,this.c)
		if type(this.var)=="boolean" then
			draw_toggle(x+60,y,40,5,this.var)
		end
	end
	
	return o
end

function draw_toggle(x,y,w,h,var)
	rect(x,y+1,x+w,y+h-1,1)
	local xmid=x+w/2
	if var then
		rectfill(xmid,y,x+w,y+5,3)
	else
		rectfill(x,y,xmid,y+5,8)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
