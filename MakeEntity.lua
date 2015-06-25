local Entity = require 'Entity'
local PlayerComponent = require 'PlayerComponent'

make = {}

function make.make_player()
    return Entity:new(PlayerGraphicsComponent:new(),
    PlayerInputComponent:new())
end


