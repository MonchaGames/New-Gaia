local class = require 'middleclass'

State = class("State")

function State:enter(params)
    assert(type(params) == 'table')
end

function State:exit(params)
    assert(type(params) == 'table')
end

function State:draw()
    
end

function State:update(dt)

end

function State:return_state()
    return {}
end

return State
