local class = require 'middleclass'

require 'misc'

BuildingGraphicsComponent = class("BuildingGraphicsComponent")

function BuildingGraphicsComponent:initialize()
    self.sprite = love.graphics.newImage("assets/building.png")
    self.x = 0
    self.y = 0
    assert(self.sprite)
end

function BuildingGraphicsComponent:update(dt, Entity)
    self.x = Entity.x
    self.y = Entity.y
end

function BuildingGraphicsComponent:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end


