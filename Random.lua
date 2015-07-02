

--[[
A random number generator that is really, really not random
--]]
local function shuffle(table)
    local rand = math.random
    assert(type(table) == 'table', "Shuffle() did not recieve a table")
    local x
    for i = #table, 2, -1 do
        x = rand(i)
        table[i], table[x] = table[x], table[i]
    end
end

function Random(table_range)
    local max = table_range or 64
    local i = 0
    local rng_table = {}
    for i = 1, max do
        table.insert(rng_table, i)
    end
    shuffle(rng_table) 
    local counter = 1
    
    return function()
        counter = counter + 1
        if counter == max then shuffle(rng_table) end
        return rng_table[(counter % max) + 1]
        end
end
