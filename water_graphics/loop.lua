function init_wave_data(speed)
    local n_waves = 30
    local data = {}
    local var = 3
    local base_phase = rnd(1)
    for i=0,10 do
        add(data,
            {phase = rnd(1) + base_phase,
            speed = rnd(speed * var) - speed * var / 2 + speed
        })
    end
    return data
end 


function water_layer(d, c, speed, r, flip_x)
    local o = {
        d = d,
        c = c,
        speed = speed,
        wave_data = init_wave_data(speed),
        r = r,
        flip_x = flip_x,
        draw = function(this)
            for i, data in ipairs(this.wave_data) do
                for x=0,128 do
                    local y = this.d * sin(data.phase + t * data.speed + x*0.01) + i*d
                    y += (rnd(1) - 0.5)*2
                    y += this.d * sin(data.phase + t * data.speed * 0.5 + x*0.01) + i*d
                    y = y % 128
                    -- pset(x, y, this.c)
                    -- pset(y, x, this.c)
                    if i > #this.wave_data/2 then
                        circfill(x, y, rnd(this.r/2)+this.r/2, this.c)
                    else
                        circfill(y, x, rnd(this.r/2)+this.r/2, this.c)
                    end
                end
            end
        end,
        update = function(this)

        end
    }
    return o
end

function _init()
    pal = {0,1,12,6,7}
    layers = {
        -- water_layer( 10*3, pal[1], 0.4, 7),
        water_layer( 10*1, pal[2], 0.4, 3),
        water_layer( 10*1, pal[3], 0.5, 2),
        water_layer( 10*1, pal[3], 0.5, 1),
        -- water_layer( 10*1, pal[3], 0.3, 2),
        water_layer( 10*1, pal[4], 0.5, 1),
        water_layer( 10*1, pal[5], 0.5, 1),
    }
    t = 0
end

function _draw()
    cls(1)
    for l in all(layers) do
        l:draw()
    end
end

function _update60()
    for l in all(layers) do
        l:update()
    end
    t += 0.01
end