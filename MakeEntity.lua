local Entity = require 'Entity'
local PlayerComponent = require 'PlayerComponent'
local NpcComponent = require 'NpcComponent'

make = {}

function make.make_player(x, y)
    return Entity:new(PlayerGraphicsComponent:new(), PlayerInputComponent:new(), x, y)
end

function make.make_npc(x, y)
	return Entity:new(NpcGraphicsComponent:new(), nil , x, y)
end


