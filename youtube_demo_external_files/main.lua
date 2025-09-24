-- USEFUL COMMANDS
-- if (stat(120)) import_notes_file()
-- printh(project_title.."\n"..combined_text, project_title..".txt",1)
-- 

-- IMPORT/EXPORT
function load_dropped_file()
    local string = ""
    local size = serial(0x800,0x4300,0x1000)
    for i=0,size-1 do
        local byte = peek(0x4300+i)
        local char = chr(byte)
        string = string..char
    end
    return string
end

function open_project_folder()
    extcmd("folder")
end

function save_project(file_name, file_data)
    printh(file_data, file_name..".txt", true)
end


-- DEFAULT FUNCTIONS
function _init()
    poke(0x5f2d, 1)  -- kb input
    file_name = "my_file"
    file_data = ""
end

function _draw()
    cls(1)
    print(file_data, 10,10,7)
end

function _update()
    poke(24368,1) -- disable pause
    if (stat(120)) file_data = load_dropped_file()
    key = stat(31)
    if key == "s" then
        save_project(file_name, file_data)
    elseif key == "o" then
        open_project_folder()
    elseif ord(key) == 8 then
        file_data = sub(file_data, 1, -2)
    elseif key then
        file_data = file_data..key
    end
end
