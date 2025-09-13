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
        if n1.data then
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
        end
    end
    create_node_functions()
    -- Remove all notes that are empty
    local nodes_to_delete = {}
    for n in all(notes.nodes) do
        if n.name == "" or n.name == " " then
            add(nodes_to_delete, n)
        end
    end
    for n in all(nodes_to_delete) do
        del(notes.nodes, n)
    end
end

function create_node_functions()
    for n1 in all(notes.nodes) do
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

function init_menu()
    return new_menu("Settings")
end

function close_menu()
    _update60 = menu.last_update_function
    _draw     = menu.last_draw_function
end

function open_menu()
end

function insert_link(note_name)
    local row_i, index_in_row = cursor_index_to_position_in_list_of_strings(text_rows, cursor_index)
    local text_row = text_rows[row_i]
    local string_to_insert = "[["..note_name.."]]"
    text_rows[row_i] = sub(text_row, 1, index_in_row - 1)..string_to_insert..sub(text_row, index_in_row - 1)
    cursor_index += #string_to_insert
end