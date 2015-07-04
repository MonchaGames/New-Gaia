local class = require 'middleclass'

EntityManager = class('EntityManager')

function EntityManager:initialize()
    self.entities = {}

end

function EntityManager:update(dt)
    for k, v in pairs(self.entities) do
        v:update(dt)
    end
end

function EntityManager:draw()
    for k, v in pairs(self.entities) do
        v:draw()
    end
end

function EntityManager:add(Entity)
    assert(type(Entity) == 'table', "Incorrect arguments to EntityManager:add()")

    table.insert(self.entities, Entity)
end

return EntityManager
