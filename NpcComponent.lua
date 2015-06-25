local class = require 'middleclass'

NpcGraphicsComponent = class("NpcGraphicsComponent")

function NpcGraphicsComponent:initialize()
    self.x = 0
    self.y = 0
end

function NpcGraphicsComponent:update(dt, Entity)
    assert(type(Entity) == 'table')

    self.x = Entity.x
    self.y = Entity.y

end

function NpcGraphicsComponent:draw()
    love.graphics.rectangle('fill', self.x, self.y, 10, 10)
end

NpcInputComponent = class("NpcInputComponent")

function NpcInputComponent:initialize()
    self.moving_right = false
    self.moving_left = false
end

function NpcInputComponent:update(dt, Entity)

    local speed = 50

    if Entity.x > 200 then
        self.moving_right = false
        self.moving_left = true
    end
    if Entity.x < 30 then
        self.moving_right = true
        self.moving_left = false
    end

    if self.moving_right then
        Entity.x = Entity.x + speed * dt
    end
    
    if self.moving_left then
        Entity.x = Entity.x - speed * dt
    end

end

function NpcInputComponent:handle_input(key, is_pressed)

end
