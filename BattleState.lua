local class = require 'middleclass'
local player = require 'Player'
local menu = require 'Menu'

require 'State'

BattleState = class("BattleState")

function BattleState:enter(params)
    assert(type(params) == 'table')
    assert(not (params.player == nil))
    self.player = params.player
    self.menu = menu:new()
end

function BattleState:draw()
    love.graphics.rectangle('fill', 10, 480, 80, 80)
    self.menu:draw()
end

function BattleState:update(dt)
    self.menu:update(dt) 
end

function BattleState:return_state()
    return {}
end

return BattleState
