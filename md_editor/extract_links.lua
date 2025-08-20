function extract_links(text_string)
    -- Returns a list of strings
    local candidates = split(text_string, "[[", false)
    local links = {}
    for string in all(candidates) do
        local string_list = split(string, "]]", false)
        if string_list[1] != string then
            add(links, string_list[1])
        end
    end
    return links
end