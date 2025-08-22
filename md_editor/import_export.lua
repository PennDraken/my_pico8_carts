function export_notes(graph)
    local combined_text = ""
    for node in all(graph.nodes) do
        local string = string_list_to_string(node.data)
        combined_text = combined_text.."ウウウ"..string
    end
    printh(combined_text, '@clip')
    cls()
    ?combined_text
    stop()
end

function import_notes()
    if stat(4) != user_string then
        user_string = stat(4)
    else
        return
    end
    if (user_string == "") return
    local string_list = split(user_string, "ウウウ", false)
    local text_row_list = {}
    for string in all(string_list) do
        if string != "" then
            add(text_row_list, string_to_text_rows(string))
        end
    end
    notes = new_graph_manager()
    for text_rows in all(text_row_list) do
        local node = new_node(text_rows[1], nil, text_rows)
        add(notes.nodes, node)
    end
    text_rows = notes.nodes[1].data
    open_menu() -- To link nodes
    open_graph_view()
end

