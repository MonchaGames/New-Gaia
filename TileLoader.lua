local class = require 'middleclass'

TileLoader = class('TileLoader')

function TileLoader:initialize(path)

    self.tile_data = dofile(path) 
    self.width = self.tile_data.width
    self.height = self.tile_data.height
    self.tile_width = self.tile_data.tilewidth
    self.tile_height = self.tile_data.tileheight
    
    self.texture = love.graphics.newImage(self.tile_data.tilesets[1].image)
    self.quads = {}
    self:generate_quads()
end

function TileLoader:generate_quads()
   local height = self.texture:getHeight()
   local width = self.texture:getWidth()

   local y_iter = math.floor(height / self.tile_height)
   local x_iter = math.floor(width / self.tile_width)
    
   for i=1, y_iter do
       for x=1, x_iter do
            local x = (x-1) * self.tile_width
            local y = (i-1) * self.tile_height 

            local quad = love.graphics.newQuad(x, y,
            x + self.tile_width, y + self.tile_width,
            width, height)
            
            table.insert(self.quads, quad)
       end
   end

end

function TileLoader:draw()
    local data = self.tile_data.layers[1]
    
    for i=1, data.height do
        for x=1, data.width do
            local index = ((i-1) * data.width) + (x-1) + 1
            print(index)
            local tile = data.data[index]
            if tile > 0 then
                local quad = self.quads[tile]
                love.graphics.draw(self.texture, quad, (x-1) * self.tile_width, 
                (i-1) * self.tile_height)
            end
        end
    end

end

return TileLoader
