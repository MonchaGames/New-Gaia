local class = require 'middleclass'
local bump = require 'bump'
local State = require 'State'
local TileLoader = require 'TileLoader'
local Camera = require 'Camera'

require 'MakeEntity'

OverworldState = class('OverworldState', State)

function OverworldState:initialize()
    self.world = bump.newWorld(32)
    self.tile = TileLoader("maps/example.lua", self.world) 
end

function OverworldState:enter(params, parent)
    self.player = params.player or make.make_player(self.world)
    self.parent = parent
    self.camera = Camera:new(self.player)
end

function OverworldState:return_params()
    params = {}
    params.player = self.player
    return params
end

function OverworldState:update(dt)
    self.camera:update(dt)
    self.player:update(dt)
    self.tile:track(self.player)
    if love.keyboard.isDown(' ') then
        self.parent:switch('State')
    end
end

function OverworldState:draw()
    self.camera:set()

    self.tile:draw()
    self.player:draw()

    self.camera:pop()
end

function OverworldState:keypressed(key)
    self.player:handle_input(key, true)
end

function OverworldState:keyreleased(key)
    self.player:handle_input(key, false)
end

return OverworldState
