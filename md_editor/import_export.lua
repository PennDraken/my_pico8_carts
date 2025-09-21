function export_notes()
    local combined_text = ""
    for node in all(notes.nodes) do
        if node.data then
            local string = string_list_to_string(node.data)
            combined_text = combined_text.."ウウウ"..string
        end
    end
    if (not project_title) project_title = "first_project"
    printh(project_title.."\n"..combined_text, project_title..".txt",1)
end

function import_notes()
    local string_list = split(project_string, "ウウウ", false)
    local text_row_list = {}
    for string in all(string_list) do
        if string != "" then
            add(text_row_list, string_to_text_rows(string))
        end
    end
    init_notes_from_text_rows(text_row_list)
end

function init_notes_from_text_rows(text_row_list)
    notes = new_graph_manager()
    for text_rows in all(text_row_list) do
        local node = new_node(text_rows[1], nil, text_rows)
        add(notes.nodes, node)
    end
    create_node_functions()
    text_rows = notes.nodes[1].data
    last_node = notes.nodes[1]
    save_note(text_rows)
end

function import_notes_file()
    cls()
    local full_string = ""
    repeat
        local size = serial(0x800,0x4300,0x1000)
        local i = 0
        while i < size do
            local byte = peek(0x4300+i)
            if (byte == 227) then
                full_string = full_string.."ウ"
                i += 3
            elseif (byte == 13) then
                i += 1
            else
                full_string = full_string..chr(byte)
                i += 1
            end
        end
    until(size == 0)
    for i=1,#full_string do
        local char = full_string[i]
        if char == "\n" then
            project_title = sub(full_string, 1, i-1)
            full_string = sub(full_string, i+1)
            break
        end
    end
    project_string = full_string
    import_notes()
    init_text_editor()
end