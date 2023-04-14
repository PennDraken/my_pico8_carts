-- Code from https://www.lexaloffle.com/bbs/?pid=84674
function choose_weighted(opts)
    -- given opts that looks like {
    --  {ch_ground,3},
    --  {ch_key,1},
    --  {ch_ladder,6},
    -- }, returns one of the first elements,
    -- weighted based on the second elements
    local sum=0
    for e in all(opts) do
        sum+=e[2]
    end
    if sum==0 then
        return nil
    end
    local rng=rnd(sum)
    for e in all(opts) do
        rng-=e[2]
        if rng<0 then
        return e[1]
        end
    end
    assert(false) --it should be impossible to execute this line
end