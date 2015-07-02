local class = require 'middleclass'

TileLoader = class('TileLoader')

--[[
TODO:

--]]
function TileLoader:initialize(path, world)
   
    self.world = world or nil
    
    --Loads the tiled lua file
    local chunk = love.filesystem.load(path)
    assert(chunk, "Tilemap load failure")
    self.tile_data = chunk()
    assert(self.tile_data, "Tilemap contains no data")

    --Set some variables for convenience
    self.width = self.tile_data.width
    self.height = self.tile_data.height
    self.tile_width = self.tile_data.tilewidth
    self.tile_height = self.tile_data.tileheight
   
    --Get a table of all the textures used in the tilemap.
    --Table is local because each quad knows what
    --texture it uses
    local textures = {}
    self:generate_textures(textures)
    --P.S, tables in lua are passed by reference, which is this works
    
    --Generates the quads for each texture.
    self.quads = {}
    for k, v in ipairs(textures) do
        self:generate_quads(v)
    end
    
    self:generate_collision()
end

function TileLoader:generate_textures(textures)
    for k, v in pairs(self.tile_data.tilesets) do
        local image = love.graphics.newImage(v.image)
        table.insert(textures, image)
    end
end

function TileLoader:generate_collision()
    if not self.world then
        return
    end
    
    --find collision layer; both a tile one and potentially an
    --object one
    local coll = nil
    local obj_coll = nil
    for k, v in pairs(self.tile_data.layers) do
        if v.name == 'coll' then
            if v.type == 'tilelayer' then
                coll = v
            elseif v.type == 'objectgroup' then
                obj_coll = v
            end
        end
    end
    
    if coll then
    --loop through and create a new box for each tile not empty
        for i=1, coll.height do
            for x=1, coll.width do
                local index = ((i-1) * coll.width) + (x-1) + 1
                if (coll.data[index] > 0) then
                    local x = (x-1) * self.tile_width
                    local y = (i-1) * self.tile_height
                    local rect = {type = 'block', x = x, y = y, 
                    width = self.tile_width, height = self.tile_height}

                    self.world:add(rect, x, y, self.tile_width, self.tile_height) 
                end
            end
        end
    end

    if obj_coll then
        for k, v in pairs(obj_coll.objects) do
            if v.shape == 'rectangle' then
                --for some reason the test map had rectangles of width zero
                if (v.width <= 0 or v.height <= 0) then return end

                local rect = {type = 'objcoll', x = v.x, y = v.y, width = v.width, 
                height = v.height}
                self.world:add(rect, v.x, v.y, v.width, v.height)
            end
        end
    end
end

function TileLoader:generate_quads(texture)

   local height = texture:getHeight()
   local width = texture:getWidth()

   --This gets the number of rows and columns of tiles that
   --can be generated from the given texture
   local y_iter = math.floor(height / self.tile_height)
   local x_iter = math.floor(width / self.tile_width)
    
   for i=1, y_iter do
       for x=1, x_iter do
            
            local x = (x-1) * self.tile_width
            local y = (i-1) * self.tile_height 

            local quad_raw = love.graphics.newQuad(x, y,
            x + self.tile_width, y + self.tile_width,
            width, height)
           
            --The quads are wrapped in a table so that each quad knows
            --what texture it uses. This does not have an effect on 
            --memory uses, as love.graphics.newImage returns a pointer
            --to the actual image data in C++.
            local quad_wrap = {
            quad_raw, texture
            }
            table.insert(self.quads, quad_wrap)
       end
   end
    
end

function TileLoader:draw()
    --placeholder
    self:draw_layer(3)
    --self:draw_layer(2)
    --self:draw_layer(3)
end

--Drawing is layer-based so that depth and z-layers can be simulated.
function TileLoader:draw_layer(layer)
    local data = self.tile_data.layers[layer]
    
    if data.type ~= 'tilelayer' then return end

    for i=1, data.height do
        for x=1, data.width do
            local index = ((i-1) * data.width) + (x-1) + 1
            local tile = data.data[index]
            if tile > 0 then
                local quad = self.quads[tile][1]
                local texture = self.quads[tile][2] 
                
                love.graphics.draw(texture, quad, (x-1) * self.tile_width, 
                (i-1) * self.tile_height)
            end
        end
    end

end

return TileLoader
