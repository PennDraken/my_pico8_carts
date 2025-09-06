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

    menu.get_option_rect = function(this, index)
        local option = this.options[index]
        return this.x, this.y + index * 8, this.width, 8
    end

    menu.draw = function(this)
        rectfill(this.x, this.y, this.x + this.width, this.y + this.height, theme.pc)
        rectfill(this.x+1, this.y+1, this.x + this.width-1, this.y + this.height-1, theme.bgc)
        centered_print(reverse_case(this.title), 64, this.y + 3, theme.boldc)
        for i,option in ipairs(this.options) do
            local text = reverse_case(option.text)
            local x, y, w, h = this:get_option_rect(i)
            if i == this.option_index then
                print("> "..text, x + 4, y, theme.boldc)
            else
                print(text, x + 4, y, theme.pc)
            end
        end
    end

    menu.update = function(this)
        disable_pause_on_enter()
        mouse.object_hovered = nil
        for i=1,#this.options do
            local x, y, w, h = this:get_option_rect(i)
            if mouse.enabled and in_bounds(mouse.y, y, y + h) and in_bounds(mouse.x, x, x + w) then
                mouse.object_hovered = this.options[i]
                if mouse.left_held_time == 1 then
                    this.options[i]:func()
                else
                    this.option_index = i
                end
            end
        end

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
    mouse = init_mouse()
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
            open_insert_link_menu()
        end)
    end
    _update60 = update_menu
    _draw     = draw_menu
end

function open_insert_link_menu()
    -- Create new menu with note options
    mouse = init_mouse()
    local last_upd = menu.last_update_function
    local last_drw = menu.last_draw_function
    menu = new_menu("Choose note to insert")
    menu.last_update_function = last_upd
    menu.last_draw_function = last_drw
    for note in all(notes.nodes) do
        menu:add_option(note.name, function()
            insert_link(note.name)
        end)
    end
end

function insert_link(note_name)
    local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
    local text_row = text_rows[row_i]
    local string_to_insert = "[["..note_name.."]]"
    text_rows[row_i] = sub(text_row, 1, index_in_row - 1)..string_to_insert..sub(text_row, index_in_row - 1)
    cursor_index += #string_to_insert
    close_menu()
end

function update_menu()
    menu:update()
    mouse:update()

end

function draw_menu()
    menu:draw()
    mouse:draw()
end

