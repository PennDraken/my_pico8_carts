-- This is where users should input their slide data
function init_slides()
    local slide_manager = new_slide_manager()
    local margin = 10
    local padding = 8
    local width = 128 - margin * 2
    local text_spacing = 8
    local sx = padding
    local sy = padding
    slide_manager:add_slides({
        new_slide(1, {
            new_text("Working With External Pico-8 Files", sx, sy, 7, width),
            new_text("A Pico-8 Tutorial", sx, sy + text_spacing * 2, 13, width),
            new_text("by penndraken", sx, sy + text_spacing * 4, 12, width)
        }),
        new_slide(1, {
            new_text("Overview", sx, sy, 13, width),
            new_text("- Demo\n- Why\n- Exporting\n- Importing In Unexported Form\n- Importing In Executable\n- Live coding", sx, sy + text_spacing * 2, 14, width),
        }),
        new_slide(1, {
            new_text("Demo", sx, sy, 13, width)
        }),
        new_slide(1, {
            new_text("Why?", sx, sy, 13, width),
            new_text("- Users want to build on previous work\n- Writing to cart memory wont work\n- Too much data", sx, sy + text_spacing * 2, 7, width),
        }),
        new_slide(1, {
            new_text("Rough program Flow (non-exported)", sx, sy, 13, width),
            new_text("1. If no user data => export user data\n\n2. If user data => import user data\n\n3. Allow users to save data (automatic/ non-automatic)", sx, sy + text_spacing * 2, 7, width),
        }),
        new_slide(1, {
            new_text("Rough program Flow (exported)", sx, sy, 13, width),
            new_text("Can't read from file memory, but can write", sx, sy + text_spacing * 2, 8, width),
            new_text("1. Prompt user to init/ load/ view data\n\n2a. Write file to memory\n\n2b. Let user drop file\n\n2c. View (open file browser)\n\n3. Ocasionally save data as file", sx, sy + text_spacing * 4, 7, width),
        }),
        new_slide(1, {
            new_text("Exporting", sx, sy, 7, width),
            new_text("Same for executable\n\nWe use printh() function", sx, sy + text_spacing * 2, 7, width),
        }),
        new_slide(1, {
            new_text("Non-Exported-Cart", sx, sy, 13, width),
            new_text("Load by #include", sx, sy + text_spacing * 2, 7, width),
        }),
        new_slide(1, {
            new_text("Exported-Cart", sx, sy, 13, width),
            new_text(".exe don't support loading from file system", sx, sy + text_spacing * 2, 7, width),
            new_text("User needs to drop from file manager", sx, sy + text_spacing * 4, 14, width),
        }),
        new_slide(1, {
            new_text("Opening Project Folder", sx, sy, 13, width),
            new_text("FOLDER", sx, sy + text_spacing * 2, 14, width),
            new_text("EXTCMD(\"FOLDER\")", sx, sy + text_spacing * 3, 14, width),
        }),


    })
    return slide_manager
end