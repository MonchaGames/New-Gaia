local class = require 'middleclass'

Camera = class("Camera")

local height = love.window.getHeight()
local width = love.window.getWidth()

function Camera:initialize(Player, x, y)

    self.x = x or 0
    self.y = y or 0
    self.vx = 0
    self.vy = 0
    self.player = Player
end

function Camera:update(dt)
end

function Camera:set()
    love.graphics.push()
    love.graphics.translate(round(-self.x), round(-self.y)) 
    love.graphics.rotate(-0)

    self.x = self.player.x - width/2
    self.y = self.player.y - height/2
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
