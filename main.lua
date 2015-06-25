require 'MakeEntity'

function love.load()
    Player = make.make_player(0, 0, 25, 25, 255, 255, 255)
    NPC1 = make.make_npc(210, 210, 10, 10, 0, 255, 0)
    NPC2 = make.make_npc(400, 150, 10, 10, 255, 255, 0)
end

function love.update(dt)
    Player:update(dt)
    NPC1:update(dt)
    NPC2:update(dt)
end

function love.draw()
    Player:draw()
    NPC1:draw()
    NPC2:draw()
end

function love.keypressed(key)
    Player:handle_input(key, true)
end

function love.keyreleased(key)
    Player:handle_input(key, false)
end
