function new_graph_manager()
    local o = {}
    -- PARAMETERS
    o.edge_force   = 0.05
    o.repel_force  = 20
    o.center_force = 0.002
    -- GRAPH DATA
    o.nodes = {}

    -- FUNCTIONS
    o.get_node_index = function(this, node)
        for i,n in ipairs(this.nodes) do
            if n.name == node.name then
                return i
            end
        end
        return nil
    end

    o.add_node = function(this, node, links)
        local node_index = this:get_node_index(node)
        if not node_index then
            add(this.nodes, node)
        else
            this.nodes[node_index] = node
        end
        if links == nil then links = node.nodes end
        this:update_links(node, links)
    end

    o.update_links = function(this, node, links)
        if not links then links = {} end
        local node_index = this:get_node_index(node)
        if not node_index then return end
        -- set the node’s links
        this.nodes[node_index].nodes = {}
        for l in all(links) do
            this.nodes[node_index]:add_link(l)
        end
        -- ensure bidirectional connections
        for node_to_update in all(this.nodes) do
            if node_to_update != node then
                if in_list(links, node_to_update) then
                    node_to_update:add_link(node)
                else
                    node_to_update:delete_link(node)
                end
            end
        end
    end

    o.add_links = function(this, node, links)
        if not links then links = {} end
        local node_index = this:get_node_index(node)
        if not node_index then return end
        for l in all(links) do
            this.nodes[node_index]:add_link(l)
            l:add_link(this.nodes[node_index])
        end
    end

    o.delete_node = function(this, node)
        del(this.nodes, node)
        for n in all(this.nodes) do
            n:delete_link(node)
        end
    end

    o.update_nodes = function(this)
        -- Mouse interaction
        -- Move selected node
        if not mouse.object_selected then
            mouse.object_hovered = nil
            for n in all(this.nodes) do
                if n:contains_point(mouse.x, mouse.y) then
                    mouse.object_hovered = n
                end
            end
        end

        -- Center force
        -- Calculate center of all node positions
        local cx, cy = 64, 64
        for n in all(this.nodes) do
            if n != mouse.object_selected then
                local dx = cx - n.x
                local dy = cy - n.y
                n.dx += dx * this.center_force
                n.dy += dy * this.center_force
            end
        end

        -- Repel force
        for n1 in all(this.nodes) do
            for n2 in all(this.nodes) do
                if n1 != mouse.object_selected or n2 != mouse.object_selected then
                    if n1 != n2 then
                        local dx = n2.x - n1.x
                        local dy = n2.y - n1.y
                        local angle = atan2(dx, dy)
                        local d2 = dx^2 + dy^2
                        local force = 1/(d2) * this.repel_force
                        local ax = cos(angle) * force
                        local ay = sin(angle) * force
                        n1.dx -= ax
                        n1.dy -= ay
                    end
                end
            end
        end

        -- Edge force
        for n1 in all(this.nodes) do
            for n2 in all(n1.nodes) do
                if n1 != mouse.object_selected or n2 != mouse.object_selected then
                    local dx = n2.x - n1.x
                    local dy = n2.y - n1.y
                    local angle = atan2(dx, dy)
                    local d2 = dx^2 + dy^2
                    if d2 > 20 then
                        local force = 1/(d2) * this.edge_force
                        local ax = cos(angle) * -force
                        local ay = sin(angle) * -force
                        n1.dx -= ax
                        n1.dy -= ay
                    end
                end
            end
        end

        -- Update positions
        for n in all(this.nodes) do
            if n != mouse.object_selected then
                n:update_position()
            end
        end
    end

    return o
end

function in_list(list, item)
    for i in all(list) do
        if item == i then
            return true
        end
    end
    return false
end

function new_node(name, nodes, data)
    local node = {}
    node.name = name
    node.data = data
    node.r = 4
    node.x  = rnd(32)+32
    node.y  = rnd(32)+32
    node.dx = 0
    node.dy = 0
    node.draggable = true
    if not nodes then nodes = {} end
    node.nodes = nodes

    -- FUNCTIONS
    node.add_link = function(this, n)
        if not in_list(this.nodes, n) then
            add(this.nodes, n)
        end
    end

    node.add_links = function(this, nodes)
        for n in all(nodes) do
            this:add_link(n)
        end
    end

    node.delete_link = function(this, n)
        if in_list(this.nodes, n) then
            del(this.nodes, n)
        end
    end

    node.update_position = function(this, n)
        local f = 0.9
        this.x += this.dx
        this.y += this.dy
        this.dx = this.dx * f
        this.dy = this.dy * f
    end

    node.contains_point = function(this, x, y)
        local dist = (x - this.x)^2 + (y - this.y)^2
        return dist < this.r^2
    end

    return node
end

-- GAME LOOP ----------------------------------------------------------------------------------
function init_graph()
    graph = notes
    -- random_graph(graph, 10, 4)
end

function draw_graph()
    cls(theme.bgc)
    local y = 0
    for n1 in all(graph.nodes) do
        for n2 in all(n1.nodes) do
            line(n1.x, n1.y, n2.x, n2.y, theme.pc)
        end
    end
    for n in all(graph.nodes) do
        if n.data then
            circfill(n.x, n.y, n.r, theme.pc)
        else
            circfill(n.x, n.y, n.r, theme.bgc)
            circ(n.x, n.y, n.r, theme.pc)
        end
    end
    for n in all(graph.nodes) do
        local name = reverse_case(n.name)
        centered_print(name, n.x, n.y - n.r * 2, theme.pc)
    end
    mouse:draw()
end

function update_graph()
    disable_pause_on_enter()
    local key = stat(31)
    if (key == "\t") open_menu()
    graph:update_nodes()
    mouse:update()
end

function open_graph_view()
    close_menu()
    init_graph()
    _draw = draw_graph
    _update60 = update_graph
end