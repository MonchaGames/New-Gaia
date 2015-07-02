local StateMachine = require 'StateMachine'
local OverworldState = require 'OverworldState'

require 'MakeEntity'

function love.load()
    SM = StateMachine:new()
    SM:add("Overworld", OverworldState:new())
    SM:switch("Overworld")
    love.window.setTitle( "New Gaia" )
end

function love.update(dt)
    SM:update(dt)
end

function love.draw()
    SM:draw()
end

function love.keypressed(key)
    SM:keypressed(key)
end

function love.keyreleased(key)
    SM:keyreleased(key)
end
