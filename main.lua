require 'MakeEntity'

function love.load()
    Player = make.make_player(0, 0)
    NPC = make.make_npc(210, 210)
end

function love.update(dt)
    Player:update(dt)
    NPC:update(dt)
end

function love.draw()
    Player:draw()
    NPC:draw()
end

function love.keypressed(key)
    Player:handle_input(key, true)
end

function love.keyreleased(key)
    Player:handle_input(key, false)
end
