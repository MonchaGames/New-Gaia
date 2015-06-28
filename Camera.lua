local class = require 'middleclass'

Camera = class("Camera")

empty = {x = 0, y = 0}

function Camera:initialize(Player, x, y)

    self.x = x or 0
    self.y = y or 0
    self.player = Player
end

function Camera:update(dt)
    local height = love.window.getHeight()
    local width = love.window.getWidth()
    self.x = math.floor(self.player.x - width/2)
    self.y = math.floor(self.player.y - height/2)
end

function Camera:set()
    love.graphics.push()
    love.graphics.translate(-self.x, -self.y) 
end

function Camera:pop()
    love.graphics.pop()
end

function Camera:move(x, y)
    self.x = self.x + x
    self.y = self.y + y
end

function Camera:set_position(x, y)
    self.x = x
    self.y = y
end

return Camera
