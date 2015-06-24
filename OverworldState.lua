local class = require 'middleclass'
local player = require 'Player'

require 'State'

--honestly, the inheritnace is almost entirely pointless
OverworldState = class("OverworldState", State)

function OverworldState:enter(params)
    assert(type(params) == 'table')
    
    self.player = params.player or Player:new()
end

function OverworldState:draw()
    love.graphics.rectangle('fill', self.player.pos.x, self.player.pos.y, 50, 50)
end

function OverworldState:update(dt)
    player:update(self.player, dt)
end

function OverworldState:return_state()
    local params = {}
    params.player = self.player
    return params
end

return OverworldState
