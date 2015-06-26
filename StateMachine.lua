local class = require 'middleclass'
local State = require 'State'

StateMachine = class("StateMachine")

function StateMachine:initialize()
    self.table_states = {}
    
    --Sets up some defaults
    self.table_states['State'] = State:new()
    self.current_state = self.table_states['State']
    self.current_state_name = 'State'

end

function StateMachine:add(name, state)
    assert(type(name) == 'string')
    assert(type(state) == 'table')
    
    --using lua tables as dictionaries
    self.table_states[name] = state
end

function StateMachine:switch(name)
    assert(type(name) == 'string')
    --check if attempting to change to current_state and
    --aborting if so
    if (name == self.current_state_name) then return end
    
    local params = self.current_state:return_params()
    assert(params)
    
    self.current_state = self.table_states[name]
    assert(self.current_state)
    
    self.current_state:enter(params, self)
    self.current_state_name = name
end

function StateMachine:update(dt)
    self.current_state:update(dt)
end

function StateMachine:draw()
   self.current_state:draw() 
end

function StateMachine:keypressed(key)
    self.current_state:keypressed(key)
end

function StateMachine:keyreleased(key)
    self.current_state:keyreleased(key)
end

return StateMachine
