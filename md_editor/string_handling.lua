function get_first_word(string)
  --gets first word in string (note no spaces allowed)
  local nstring = ""
  local word_end_i
  for i=1,#string do
    if sub(string, i, i) !=' ' then
      nstring = nstring..sub(string, i, i)
    else
      word_end_i = i + 1
      break
    end
  end
  return nstring, word_end_i
end

function reverse_case(str)
  -- used to make text more pretty and readable
  local result = ""
  for i=1, #str do
    local c = sub(str, i, i)
    local code = ord(c)

    if code >= 65 and code <= 90 then
      -- uppercase A-Z -> lowercase a-z
      result = result .. chr(code + 32)
    elseif code >= 97 and code <= 122 then
      -- lowercase a-z -> uppercase A-Z
      result = result .. chr(code - 32)
    else
      -- non-alphabetic characters unchanged
      result = result .. c
    end
  end
  return result
end

function string_to_text_rows(str)
--splits a string with line breaks into a list of strings
  local rows = {}
  for line in all(split(str, "\n", false)) do
    add(rows, line)
  end
  return rows
end

function split_string_with_character(str, char)
  local rows = {}
  for line in all(split(str, char, true)) do
    add(rows, ""..line)--Ensures numbers are still cast as strings. Note that 1. will be cast to 1 (NOT GOOD)
  end
  return rows
end

function string_to_list_of_words(str)
  local words = {}
  local i = 1
  local len = #str
  while i <= len do
    -- skip spaces
    while i <= len and sub(str, i, i) == " " do
      i = i + 1
    end

    if i > len then break end

    -- find word end
    local start_i = i
    while i <= len and sub(str, i, i) ~= " " do
      i = i + 1
    end

    local word = sub(str, start_i, i - 1)
    add(words, word)
  end
  return words
end

function string_to_list_of_words_with_index(str, start_index)
  local words   = {}
  local indexes = {}
  local i = 1
  local len = #str
  while i <= len do
    -- skip spaces
    while i <= len and sub(str, i, i) == " " do
      i = i + 1
    end

    if i > len then break end

    -- find word end
    local start_i = i
    while i <= len and sub(str, i, i) ~= " " do
      i = i + 1
    end

    local word = sub(str, start_i, i - 1)
    add(words, word)
    add(indexes, start_i + start_index)
  end
  return words, indexes
end

function space_pad_symbol(symbol, space_count)
  --Returns a string with spaces and a square marker at index
  local string = ""
  for i=0,space_count do
    string = string.." "
  end
  string = string..symbol
  return string
end