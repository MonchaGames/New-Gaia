local Entity = require 'Entity'
local Component = require 'Component'

make = {}

function make.make_player()
    return Entity:new(PlayerGraphicsComponent:new(),
    PlayerInputComponent:new())
end


