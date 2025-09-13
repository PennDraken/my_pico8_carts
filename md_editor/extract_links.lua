function extract_links(text_string)
    -- string -> list of strings
    local links = {}
    for string in all(split(text_string, "[[", false)) do
        local string_list = split(string, "]]", false)
        if string_list[1] != string and string_list[1] != " " then
            add(links, string_list[1])
        end
    end
    return links
end