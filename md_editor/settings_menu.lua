function new_menu(title)
    menu = {}
    menu.x = 4
    menu.y = 4
    menu.width  = 128 - menu.x * 2
    menu.height = 128 - menu.y * 2
    menu.background_color = 1
    menu.passive_text_color = 7
    menu.highlight_text_color = 10
    menu.title = title
    menu.options = {}
    menu.option_index = 2

    menu.add_option = function(this, text, func)
        if func == nil then
            func = function() end
        end
        add(this.options, {text = text, func = func})
    end

    menu.draw = function(this)
        rectfill(this.x, this.y, this.x + this.width, this.y + this.height, theme.bgc)
        centered_print(this.title, 64, this.y, theme.boldc)
        for i,option in ipairs(this.options) do
            if i == this.option_index then
                print("> "..option.text, this.x + 4, this.y + i * 8, theme.boldc)
            else
                print(option.text, this.x + 4, this.y + i * 8, theme.pc)
            end
        end
    end

    menu.update = function(this)
        disable_pause_on_enter()
        if btnp(2) then
            this.option_index = this.option_index - 1
            if this.option_index <= 0 then
                this.option_index = #this.options
            end
        elseif btnp(3) then
            this.option_index = this.option_index + 1
            if this.option_index > #this.options then
                this.option_index = 1
            end
        end
        local key = stat(31)
        if key == chr(13) then
            -- Enter key
            this.options[this.option_index].func()
        end
    end

    return menu
end

-------------------------------------------------------------------------------------------------------------
function init_menu()
    local menu = new_menu("sETTTINGS")
    menu:add_option("close", close_menu)
    menu:add_option("new note")
    menu:add_option("graph view")
    menu:add_option("toggle theme", toggle_theme)
    menu:add_option("toggle fonts")
    return menu
end

function close_menu()
    _update60 = update_text_editor
    _draw     = draw_text_editor
end

function open_menu()
    menu.option_index = 2
    _update60 = update_menu
    _draw     = draw_menu
end

function update_menu()
    menu:draw()
end

function draw_menu()
    menu:update()
end