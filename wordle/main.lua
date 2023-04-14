-- initialize program
function _init()
    cls()
    printh("New loop!-----------")
    loop()
end

-- game loop
function loop()
    word = rnd_word(word_arr)
    printh(word)
    wrow = new_word_row("hljjo","hello",0)
    wrow:correct_letters()
    wrow:wrong_place_letters()
    wrow:draw()

    while false do
        -- print screen
        -- ask user for guess
        -- if user correct
            -- you win
        -- else
            -- calculate how accurate user was
    end
end



-- returns a random word to use for playthrough
function rnd_word(word_arr)
    return rnd(word_arr)
end

-- returns true or false when a guess is inside a word_arr
function is_word(guess, word_arr)
    for w in all(word_arr) do
        if guess == w then
            return true
        end
    end
    return false
end

word_arr = {"hello","there","fiver"}

function new_word_row(guessed_word, real_word, guess_no)
    word_row = {}
    word_row.real_word = real_word
    word_row.guessed_word = guessed_word
    word_row.guess_no = guess_no

    -- this returns a 5 letter array with the known letters, and nil where wrong
    word_row.correct_letters = function(this)
        letters_in_common={}
        for i=1,5 do
            guess_char = sub(this.guessed_word, i,i)
            real_char = sub(this.real_word, i,i)
            if guess_char == real_char then
                letters_in_common[i] = real_char
                printh(real_char)
            end
        end
        return letters_in_common
    end

    -- returns a table which marks the letters that were at the wrong place
    word_row.wrong_place_letters = function(this)
        letters_in_wrong_place={}
        for i=1,5 do
            guess=sub(this.guessed_word, i, i)
            --printh(guess)
            for j=1,5 do
                real=sub(this.real_word, j, j)
                if i!=j then
                    if guess==real then
                        letters_in_wrong_place[i]=guess
                        printh(guess)
                        break
                    end
                end
            end
        end
        return letters_in_wrong_place
    end

    word_row.draw = function(this)
        green_arr = this:correct_letters()
        yellow_arr = this:wrong_place_letters()
        for i=1,5 do
            s=24
            x = s*(i-1)
            y = s*this.guess_no
            if green_arr[i]!=nil then
                sspr(8+s*2,0,s,s,x,y)
                print_mid(sub(this.guessed_word, i, i), x, y, s)
            elseif yellow_arr[i]!=nil then
                sspr(8+s,0,s,s,x,y)
                print_mid(sub(this.guessed_word, i, i), x, y, s)
            else
                sspr(8,0,s,s,x,y)
                print_mid(sub(this.guessed_word, i, i), x, y, s)
            end
        end
    end

    return word_row
end

function print_mid(c, x, y, s)
    print(c, x+s/2, y+s/2)
end