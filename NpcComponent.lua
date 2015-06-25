local class = require 'middleclass'

NpcGraphicsComponent = class("NpcGraphicsComponent")

function NpcGraphicsComponent:initialize()
    self.x = 0
    self.y = 0
    self.size_x = 0
    self.size_y = 0
end

function NpcGraphicsComponent:update(dt, Entity)
    assert(type(Entity) == 'table')

    self.x = Entity.x
    self.y = Entity.y

    self.size_x = Entity.size_x
    self.size_y = Entity.size_y

    self.color_r = Entity.color_r
    self.color_g = Entity.color_g
    self.color_b = Entity.color_b

end

function NpcGraphicsComponent:draw()
    love.graphics.setColor(self.color_r, self.color_g, self.color_b)
    love.graphics.rectangle('fill', self.x, self.y, self.size_x, self.size_y)
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
