local class = require 'middleclass'
local Component = require 'Component'

Entity = class('Entity')

function Entity:initialize(GraphicsComponent, InputComponent, x, y)
    self.x = x
    self.y = y

    self.GraphicsComponent = GraphicsComponent or Component:new()
    self.InputComponent = InputComponent or Component:new()
end

function Entity:update(dt)
    assert(type(dt) == 'number')

    self.GraphicsComponent:update(dt, self)
    self.InputComponent:update(dt, self)

end

function Entity:draw()
    self.GraphicsComponent:draw()
end

function Entity:handle_input(key, is_pressed)
    assert(type(key) == 'string')
    assert(type(is_pressed) == 'boolean')

    self.InputComponent:handle_input(key, is_pressed)

end

return Entity
