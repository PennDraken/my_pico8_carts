function new_font(char_width, char_height, string)
  local o = {
    font_data = decompress(string),
    char_width  = char_width,
    char_height = char_height,
    load = function(this)
      char_width = this.char_width
      char_height = this.char_height
      poke(0x5600, unpack(this.font_data))
      return char_width, char_height
    end
  }
  return o
end

function decompress(string)
  local list = split(string)
  local data_list = {}
  for val in all(list) do
    number = val % 256
    count = (val - number)\256
    for i=1,count+1 do
      add(data_list, number)
    end
  end
  return data_list
end
