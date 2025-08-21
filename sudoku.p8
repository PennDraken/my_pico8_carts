pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--init
function _init()
	gridsize=12
	selectedsquare={x=1,y=1}
	selectedguesstile=nil
	posguess={x=1,y=1}
	viewerrors=false
	--states
	choosetile   =0
	inputnumbers=1
	currstate=choosetile
	
	board={
	{4,0,0, 9,1,3, 0,0,8},
	{9,0,5, 0,0,0, 3,0,2},
	{6,0,0, 2,0,4, 1,9,7},
	
	{0,0,1, 0,0,0, 0,0,0},
	{2,5,0, 8,0,0, 4,7,3},
	{3,0,9, 7,0,6, 8,5,0},
	
	{1,0,2, 4,7,9, 0,8,0},
	{5,9,8, 0,0,0, 0,0,0},
	{0,0,0, 0,0,0, 2,0,0},
	}
	guesstiles={}
end

function guesstile(x,y)
	local guesstile={}--each tile should
												--correspond to
												--each number
	guesstile.numbers={
		false,false,false,
		false,false,false,
		false,false,false,
	}
	guesstile.x=x
	guesstile.y=y
	guesstile.toggle=function(this,num)
		this.numbers[num]=not this.numbers[num]
	end
	guesstile.draw=function(this, sel)
		local x=64-gridsize*4.5+(this.x-1)*gridsize
		local y=64-gridsize*4.5+(this.y-1)*gridsize
		rectfill(x+1,y+1,x+gridsize-2,y+gridsize-2,15)
		local c=0
		local tempnum=0
		for num=1,#this.numbers do
			local bool=this.numbers[num]
			if bool then
				c+=1
				tempnum=num
			end
		end
		if not sel and c==1 then
			--draw centered text
			print(tempnum,x+gridsize/2-flr(3/2),y+gridsize/2-flr(5/2),13)
			return
		end
		for num=1,9 do
			local i=(num-1)%3
			local j=flr((num-1)/3)
			if sel and i==posguess.x-1 and j==posguess.y-1then
				rect(x+i*gridsize/3,y+j*gridsize/3,x+(i+1)*gridsize/3,y+(j+1)*gridsize/3,7)
			end
			if this.numbers[num] then
				print(num,x+i*gridsize/3,y+j*gridsize/3,13)
			end
		end
		--draw enter
		if sel then
			if posguess.y==4 then
				rectfill(x,y+gridsize,x+gridsize,y+gridsize+4,11)
			else
				rectfill(x,y+gridsize,x+gridsize,y+gridsize+4,3)
			end
		end
	end
	return guesstile
end
-->8
--draw
function _draw()
	if currstate==choosetile then
		draw_choosetile()
	elseif currstate==inputnumbers then
		draw_inputnumbers()
	end
end

function draw_choosetile()
	cls(15)
	draw_board()
	draw_selectedsquare()
	draw_guesstiles()
end

function draw_inputnumbers()
	cls(15)
	draw_board()
	draw_guesstiles()
	selectedguesstile:draw(true)
end

function draw_board()
	local startx=64-gridsize*4.5
	local starty=startx
	for i=0,8 do
		for j=0,8 do
			local x=startx+i*gridsize
			local y=starty+j*gridsize
			rect(x,y,x+gridsize,y+gridsize,6)
			--draw number
			if board[i+1][j+1]!=0 then
				local xoffs=gridsize/2-flr(3/2)
				local yoffs=gridsize/2-flr(5/2)
				print(board[i+1][j+1],x+xoffs,y+yoffs,1)
			end
		end
	end
	for i=0,2 do
		for j=0,2 do
			local x=startx+i*gridsize*3
			local y=starty+j*gridsize*3
			rect(x,y,x+gridsize*3,y+gridsize*3,7)
		end
	end
end

function draw_selectedsquare()
	local startx=64-gridsize*4.5
	local starty=startx
	for i=0,8 do
		for j=0,8 do
			if i+1==selectedsquare.x and j+1==selectedsquare.y then
				local x=startx+i*gridsize
				local y=starty+j*gridsize
				rect(x,y,x+gridsize,y+gridsize,3)
			end
		end
	end
end

function draw_guessbox()
	local x=64-gridsize*4.5+(selectedsquare.x-1)*gridsize
	local y=64-gridsize*4.5+(selectedsquare.y-1)*gridsize
	rectfill(x,y,x+gridsize,y+gridsize,13)
	local x=x+(posguess.x-1)*gridsize/3
	local y=y+(posguess.y-1)*gridsize/3
	--todo: make y=4 wider
	rectfill(x,y,x+gridsize/3,y+gridsize/3,1)
end

function draw_guesstiles()
	for tile in all(guesstiles) do
		tile:draw()
	end
end
-->8
--update
function _update60()
	if currstate==choosetile then
		update_choosetile()
	elseif currstate==inputnumbers then
		update_inputnumbers()
	end
end

function update_choosetile()
	if btnp(⬅️) then
		selectedsquare.x=decrement(selectedsquare.x,1,9)
	elseif btnp(➡️) then
		selectedsquare.x=increment(selectedsquare.x,1,9)
	elseif btnp(⬆️) then
		selectedsquare.y=decrement(selectedsquare.y,1,9)
	elseif btnp(⬇️) then
		selectedsquare.y=increment(selectedsquare.y,1,9)
	end
	if btnp(❎) then
		--if were not hovering over
		local num=board[selectedsquare.x][selectedsquare.y]
		if num==0 then
			currstate=inputnumbers
			--lets load or init new guesstiles
			--check if guess tile in guesstiles
			local foundtile=nil
			for tile in all(guesstiles) do
				if tile.x==selectedsquare.x and tile.y==selectedsquare.y then
					foundtile=tile
					break
				end
			end
			--if tile wasnt already found we add it
			if not foundtile then
				foundtile=guesstile(selectedsquare.x,selectedsquare.y)
				add(guesstiles,foundtile)
			end
			selectedguesstile=foundtile
			posguess={x=1,y=1}
		end
	end
	--toggle view incorrect tiles
	if btnp(🅾️) then
		if not viewerrors then
			viewerrors=true
			--create a temp board state
			boardcopy={}
			for row_i,row in ipairs(board) do
				for col_i,num in ipairs(row) do
					boardcopy[row_i]={}
					boardcopy[row_i][col_i]=num
				end
			end
			--add single guesses to boardstate
			for tile in all(guesstiles) do
				local c=0
				local tempnum=0
				for num,bool in ipairs(tile.nmumbers) do
					if bool then
						c+=1
						tempnum=num
					end
				end
				if c==1 then
					boardcopy[tile.x][tile.y]=tempnum
				end
			end
			--check all tiles to find errors
			invalidgrids={}
			for row_i,row in ipairs(board) do
				for col_i,num in ipairs(row) do
					if not is_valid(num,row_i,col_i,boarcopy) then
						add(invalidgrids,{row_i,col_i})
					end
				end
			end
		end	
	end
end

function update_inputnumbers()
	if btnp(⬅️) then
		posguess.x=decrement(posguess.x,1,3)
	elseif btnp(➡️) then
		posguess.x=increment(posguess.x,1,3)
	elseif btnp(⬆️) then
		posguess.y=decrement(posguess.y,1,3)
	elseif btnp(⬇️) then
		posguess.y=increment(posguess.y,1,4)
	end
	if btnp(❎) then
		--toggle number
		local row=posguess.y-1
		local num=posguess.x+row*3
		if num<=9 then
			selectedguesstile:toggle(num)
		else
			--exit guess here
			currstate=choosetile
		end
	end
end


-->8
--util
function decrement(val,minval,maxval)
	val=val-1
	if val<minval then
		val=maxval
	end
	return val
end

function increment(val,minval,maxval)
	local val=val+1
	if val>maxval then
		val=minval
	end
	return val
end

--sudoku specific
function num_in_row(num,i,j,boardcopy)
	--returns true if num in row
	local y=j
	for x=1,9 do
		if boardcopy[x][y]==num and x!=i and y!=j then
			return true
		end
	end
	return false
end

function num_in_col(num,i,j,boardcopy)
	--returns true if num in col
	local x=i
	for y=1,9 do
		if boardcopy[x][y]==num and x!=i and y!=j then
			return true
		end
	end
	return false
end

function num_in_box(num,i,j,boardcopy)
	--returns true if num in 3x3box
	local x=flr(i/3)*3
	local y=flr(j/3)*3
	for x=x,x+2 do
		for y=y,y+2 do
			if boardcopy[x][y]==num and x!=i and y!=j then
				return true
			end
		end
	end
	return false
end

function is_valid(num,i,j,board)
	--checks all conditions at once
	num_in_row(num,i,j,board)
	num_in_col(num,i,j,board)
	num_in_box(num,i,j,board)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007007077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700077070007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000007077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700070070070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077007077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000070077007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
