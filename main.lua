local SM = require 'StateMachine'
local O = require 'OverworldState'
local B = require 'BattleState'

function love.load()
    q = SM:new()
    q:add("Over", O:new())
    q:change("Over")
    q:add("Battle", B:new())
end

function love.update(dt)
    q:update(dt)
    if love.keyboard.isDown("y") then
       q:change("Battle") 
     end

end

function love.draw()
    q:draw()
end
