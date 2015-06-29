--[[
Some random functions that are used throughout
--]]

function smooth(num, dt, factor)
    return num * (1 - math.min(factor * dt, 1))
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function clamp(val, lower, upper)
    if lower > upper then 
        lower, upper = upper, lower 
    end
    return math.max(lower, math.min(upper, val))
end
