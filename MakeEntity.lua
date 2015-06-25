local Entity = require 'Entity'
local PlayerComponent = require 'PlayerComponent'
local NpcComponent = require 'NpcComponent'

make = {}

function make.make_player(pos_x, pos_y, size_x, size_y, color_r, color_g, color_b)
    return Entity:new(PlayerGraphicsComponent:new(), PlayerInputComponent:new(), pos_x, pos_y, size_x, size_y, color_r, color_g, color_b)
end

function make.make_npc(pos_x, pos_y, size_x, size_y, color_r, color_g, color_b)
	return Entity:new(NpcGraphicsComponent:new(), NpcInputComponent:new(), pos_x, pos_y, size_x, size_y, color_r, color_g, color_b)
end


