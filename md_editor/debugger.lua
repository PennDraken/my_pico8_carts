function new_debugger()
    local debug = {}
    debug.table = {}
    debug.draw=function(this)
        for elem in all(this.table) do
            local k = elem[1]
            local v = elem[2]
            ?"\#0"..k.." : "..v,7 -- Print with black outlnie
        end
    end
    debug.log=function(this, key, value)
        add(debug.table, {key, value})
    end
    return debug
end

debug = new_debugger()
