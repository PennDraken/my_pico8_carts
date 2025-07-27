function combine_tables(table1, table2)
    for elem in all(table2) do
        add(table1, elem)
    end
    return table1
end

function in_bounds(val, start, stop)
    return val >= start and val <= stop
end

function show_cpu(y)
  ?"\#0"..stat(1),0,y,7
end

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

function is_marker_visible()
    return t % 50 < 25
end