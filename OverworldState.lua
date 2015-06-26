local class = require 'middleclass'
local State = require 'State'

require 'MakeEntity'

OverworldState = class('OverworldState', State)

function OverworldState:initialize()
     
end

function OverworldState:enter(params, parent) 
    self.player = params.player or make.make_player()
    self.parent = parent

end

function OverworldState:return_params()
    params = {}
    params.player = self.player
    return params
end

function OverworldState:update(dt)
    self.player:update(dt)
    if love.keyboard.isDown(' ') then
        self.parent:switch('State')
    end
end

function OverworldState:draw()
    self.player:draw()
end

function OverworldState:keypressed(key)
    self.player:handle_input(key, true)
end

function OverworldState:keyreleased(key)
    self.player:handle_input(key, false)
end

return OverworldState
