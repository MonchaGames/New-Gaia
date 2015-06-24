class = require 'middleclass'

Player = class("Player")

function Player:initialize()
    self.pos = {x = 0, y = 0}
    self.velocity = {x = 0, y = 0}
   
end

function Player:update(player, dt)

    assert(type(player) == 'table')
    
    speed = 120.

    if love.keyboard.isDown('w') then
        player.pos.y = player.pos.y - speed * dt
    end
    if love.keyboard.isDown('s') then
        player.pos.y = player.pos.y + speed * dt
    end
    if love.keyboard.isDown('a') then
        player.pos.x = player.pos.x - speed * dt
    end
    if love.keyboard.isDown('d') then
        player.pos.x = player.pos.x + speed * dt
    end

end

return Player
