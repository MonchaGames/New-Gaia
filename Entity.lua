local class = require 'middleclass'
local Component = require 'Component'

Entity = class('Entity')

function Entity:initialize(GraphicsComponent, InputComponent, pos_x, pos_y, size_x, size_y, color_r, color_g, color_b)
    self.x = pos_x
    self.y = pos_y

    self.size_x = size_x
    self.size_y = size_y

    self.color_r = color_r
    self.color_g = color_g
    self.color_b = color_b

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
