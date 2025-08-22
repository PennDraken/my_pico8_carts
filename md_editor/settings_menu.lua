function new_menu(title)
    menu = {}
    menu.x = 20
    menu.y = 20
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
        rectfill(this.x, this.y, this.x + this.width, this.y + this.height, theme.pc)
        rectfill(this.x+1, this.y+1, this.x + this.width-1, this.y + this.height-1, theme.bgc)
        centered_print(reverse_case(this.title), 64, this.y + 3, theme.boldc)
        for i,option in ipairs(this.options) do
            local text = reverse_case(option.text)
            if i == this.option_index then
                print("> "..text, this.x + 4, this.y + i * 8, theme.boldc)
            else
                print(text, this.x + 4, this.y + i * 8, theme.pc)
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
            this.options[this.option_index]:func()
        end
    end

    return menu
end

function set_visible_text(new_text_rows)
    text_rows = new_text_rows
end

function save_note(new_text_rows)
    local name  = new_text_rows[1]
    local data  = new_text_rows
    -- Create or update the last node
    if not last_node then
        last_node = new_node(name, nil, data)
        add(notes.nodes, last_node)
        -- stop()
    else
        last_node.name = name
        last_node.data = data
    end
    -- Clear all links
    for n in all(notes.nodes) do
        n.nodes = {}
    end
    -- Remove auto-notes
    local to_delete = {}
    for n in all(notes.nodes) do
        if n.data == nil then
            add(to_delete, n)
        end
    end
    for n in all(to_delete) do
        del(notes.nodes, n)
    end
    -- Safe add helper (avoid duplicate links)
    local function safe_add(t, v)
        for x in all(t) do
            if x == v then return end
        end
        add(t, v)
    end
    -- Create new links
    for n1 in all(notes.nodes) do
        local links = extract_links(string_list_to_string(n1.data))
        local outgoing_nodes = {}
        for link in all(links) do
            local node = nil
            -- Check if node already exists
            for n2 in all(notes.nodes) do
                if n2.name == link then
                    node = n2
                    break
                end
            end
            -- If not found, create new node
            if not node then
                node = new_node(link, nil, nil)
                add(notes.nodes, node)
            end
            safe_add(outgoing_nodes, node)
        end
        -- Set links bidirectionally
        for n2 in all(outgoing_nodes) do
            safe_add(n1.nodes, n2)
            safe_add(n2.nodes, n1)
        end
        -- Create our loading function
        n1.func = function(this)
            cursor_index = 1
            text_rows = this.data
            if not text_rows then text_rows = {this.name} end
            load_text_editor()
            last_node = this
        end
    end
end
-------------------------------------------------------------------------------------------------------------
function init_menu()
    return new_menu("Settings")
end

function close_menu()
    _update60 = menu.last_update_function
    _draw     = menu.last_draw_function
end

function open_menu()
    -- Save currently open note
    save_note(text_rows)
    menu = new_menu("Settings")
    menu:add_option("New Note", new_note)
    menu:add_option("Close", close_menu)
    -- for note in all(notes.nodes) do
    --     menu:add_option(note.name, function()
    --         note:func()  -- calls with 'this' set to 'note'
    --     end)
    -- end
    menu:add_option("Graph View", open_graph_view)
    menu:add_option("Toggle Theme", function()
        toggle_theme(menu.last_draw_function)
    end)
    menu:add_option("Export Project", export_notes)
    menu:add_option("Import From Clipboard", import_notes)
    -- menu:add_option("Toggle Fonts (TODO)")
    menu.last_update_function = _update60
    menu.last_draw_function   = _draw
    if _update60 == update_text_editor then
        menu:add_option("Create Link", function()
            local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
            local text_row = text_rows[row_i]
            text_rows[row_i] = sub(text_row, 1, index_in_row - 1).."[[]]"..sub(text_row, index_in_row - 1)
            cursor_index += 4
            close_menu()
        end)
    end
    _update60 = update_menu
    _draw     = draw_menu
end

function update_menu()
    menu:draw()
end

function draw_menu()
    menu:update()
end

