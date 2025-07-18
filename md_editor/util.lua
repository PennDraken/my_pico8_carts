function combine_tables(table1, table2)
    for elem in all(table2) do
        add(table1, elem)
    end
    return table1
end

function in_bounds(val, start, stop)
    return val >= start and val <= stop
end