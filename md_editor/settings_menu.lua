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
        add(this.options, {text = text, func = func})
    end

    menu.draw = function(this)
        rectfill(this.x, this.y, this.x + this.width, this.y + this.height, this.background_color)
        centered_print(this.title, 64, this.y, this.passive_text_color)
        for i,option in ipairs(this.options) do
            if i == this.option_index then
                print("> "..option.text, this.x + 4, this.y + i * 8, this.highlight_text_color)
            else
                print(option.text, this.x + 4, this.y + i * 8, this.passive_text_color)
            end
        end
    end

    menu.update = function(this)
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
    end

    return menu
end

-------------------------------------------------------------------------------------------------------------
function _init()
    menu = new_menu("sETTTINGS")
    menu:add_option("close")
    menu:add_option("new note")
    menu:add_option("toggle theme")
    menu:add_option("toggle fonts")
end

function _draw()
    draw_menu()
end

function _update()
    update_menu()
end

function draw_menu()
    menu:draw()
end

function update_menu()
    menu:update()
end

