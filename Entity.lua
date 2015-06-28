local class = require 'middleclass'
local Component = require 'Component'

Entity = class('Entity')

function Entity:initialize(GraphicsComponent, InputComponent, PhysicsComponent)
    self.x = 0
    self.y = 0
    self.vx = 0
    self.vy = 0
    self.friction = 12
    self.speed = 60

    self.GraphicsComponent = GraphicsComponent or Component:new()
    self.InputComponent = InputComponent or Component:new()
    self.PhysicsComponent = PhysicsComponent or Component:new()
    
    --add to bump world
    self.PhysicsComponent:add_world(self)
end

function Entity:update(dt)
    assert(type(dt) == 'number')

    self.GraphicsComponent:update(dt, self)
    self.InputComponent:update(dt, self)
    self.PhysicsComponent:update(dt, self) 

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
