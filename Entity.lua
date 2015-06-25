local class = require 'middleclass'

Entity = class('Entity')

function Entity:initialize(GraphicsComponent, InputComponent)
    self.x = 0
    self.y = 0

    self.GraphicsComponent = GraphicsComponent
    self.InputComponent = InputComponent
end

function Entity:update(dt)
    assert(type(dt) == 'number')

    if self.GraphicsComponent then
        self.GraphicsComponent:update(dt, self)
    end

    if self.InputComponent then
        self.InputComponent:update(dt, self)
    end
end

function Entity:draw()
    if self.GraphicsComponent then
        self.GraphicsComponent:draw()
    end
end

function Entity:handle_input(key, is_pressed)
    assert(type(key) == 'string')
    assert(type(is_pressed) == 'boolean')

    if self.InputComponent then
        self.InputComponent:handle_input(key, is_pressed)
    end

end

return Entity
