function extract_links(text_string)
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


cls()
extract_links(
    "There are some links in this text object\nThis is a [[Link 1]]\nThis is also a [[Link 2]]"
)