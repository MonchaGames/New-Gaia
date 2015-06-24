local class = require 'middleclass'
local State = require 'State'

StateMachine = class("StateMachine")

function StateMachine:initialize()
    self.states = {}
    self.current_state = State:new()
    self.current_state_name = 'state'
end

function StateMachine:add(name, state)
    --Lua may not be a statically typed language, but damnit
    --I'll try
    assert(type(name) == 'string')
    assert(type(state) == 'table')

    self.states[name] = state
end

function StateMachine:change(name)
    assert(type(name) == 'string')
    if (name == self.current_state_name) then return end
    
    local params = self.current_state:return_state()
    
    self.current_state = self.states[name]
    self.current_state:enter(params)
    self.current_state_name = name
end

function StateMachine:draw()
    self.current_state:draw()
end

function StateMachine:update(dt)
    self.current_state:update(dt)
end

return StateMachine
