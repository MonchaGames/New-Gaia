local Entity = require 'Entity'
local PlayerComponent = require 'PlayerComponent'
local NpcComponent = require 'NpcComponent'

make = {}

function make.make_player(world)
    assert(world, "Need to provide bump world!")
    return Entity:new(PlayerGraphicsComponent:new(),
    PlayerInputComponent:new(),
    PlayerPhysicsComponent:new(world))
end
