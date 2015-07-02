local class = require 'middleclass'

require 'misc'

PlayerGraphicsComponent = class("PlayerGraphicsComponent")

function PlayerGraphicsComponent:initialize()
    self.x = 0
    self.y = 0
    self.width = 30
    self.height = 30
end

function PlayerGraphicsComponent:update(dt, Entity)
    assert(type(Entity) == 'table')

    self.x = Entity.x
    self.y = Entity.y

end

function PlayerGraphicsComponent:draw()
    love.graphics.rectangle('fill', self.x, self.y, 50, 50)
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

    local speed = Entity.speed or 50.

    if self.up then
        Entity.vy = Entity.vy - speed * dt
    end
    if self.down then
        Entity.vy = Entity.vy + speed * dt
    end
    if self.left then
        Entity.vx = Entity.vx - speed * dt
    end
    if self.right then
        Entity.vx = Entity.vx + speed * dt
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

PlayerPhysicsComponent = class("PlayerPhysicComponent")

function PlayerPhysicsComponent:initialize(world)
    self.max_accel = 200
    self.width = 50
    self.height = 50
    self.world = world
end

function PlayerPhysicsComponent:add_world(Entity)
    self.world:add(self, Entity.x, Entity.y, self.width, self.height)
end

function PlayerPhysicsComponent:update(dt, Entity)
    local friction = Entity.friction or 5

    --clamp velocity
    Entity.vx = clamp(Entity.vx, -self.max_accel, self.max_accel)
    Entity.vy = clamp(Entity.vy, -self.max_accel, self.max_accel)

    --smooth velocity
    Entity.vx = smooth(Entity.vx, dt, friction)
    Entity.vy = smooth(Entity.vy, dt, friction)

    --calculate new position
    local new_x = Entity.x + Entity.vx
    local new_y = Entity.y + Entity.vy

    local true_x, true_y, cols, len = self.world:move(self, new_x, new_y)
    Entity.x = true_x
    Entity.y = true_y
end
