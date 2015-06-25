require 'MakeEntity'

function love.load()
    Player = make.make_player()
end

function love.update(dt)
    Player:update(dt)
end

function love.draw()
    Player:draw()
end

function love.keypressed(key)
    Player:handle_input(key, true)
end

function love.keyreleased(key)
    Player:handle_input(key, false)
end
