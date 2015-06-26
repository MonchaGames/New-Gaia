local class = require 'middleclass'

State = class('State')

function State:initialize()

end

function State:enter()

end

function State:return_params()
    return {}
end

function State:update(dt)

end

function State:draw()

end

function State:keypressed(key)

end

function State:keyreleased(key)

end

return State
