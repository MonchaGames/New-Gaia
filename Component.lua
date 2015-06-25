local class = require 'middleclass'

PlayerGraphicsComponent = class("PlayerGraphicsComponent")

function PlayerGraphicsComponent:initialize()
    self.x = 0
    self.y = 0
end

function PlayerGraphicsComponent:update(dt, Entity)
    assert(type(Entity) == 'table')

    self.x = Entity.x
    self.y = Entity.y

end

function PlayerGraphicsComponent:draw()
    love.graphics.rectangle('fill', self.x, self.y, 30, 30)
end

PlayerInputComponent = class("PlayerInputComponent")

function PlayerInputComponent:initialize()
    self.up = false
    self.down = false
    self.left = false
    self.right = false
end

function PlayerInputComponent:update(dt, Entity)
    assert(type(dt) == 'number')
    assert(type(Entity) == 'table')

    local speed = 100.

    if self.up then
        Entity.y = Entity.y - speed * dt
    end
    if self.down then
        Entity.y = Entity.y + speed * dt
    end
    if self.left then
        Entity.x = Entity.x - speed * dt
    end
    if self.right then
        Entity.x = Entity.x + speed * dt
    end
end

function PlayerInputComponent:handle_input(key, is_pressed)
    assert(type(key) == 'string')
    assert(type(is_pressed) == 'boolean')

    if key == 'w' then
        self.up = is_pressed
    elseif key == 'a' then
        self.left = is_pressed
    elseif key == 'd' then
        self.right = is_pressed
    elseif key == 's' then
        self.down = is_pressed
    end

end




