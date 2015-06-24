class = require 'middleclass'

MenuOption = class("MenuOption")

function MenuOption:initialize(label, width, height, x, y)
    assert(type(label) == 'string')
    
    self.width = width or 100
    self.height = height or 30
    self.x = x or 0
    self.y = y or 0
    self.text = label
    self.on = false
end

function MenuOption:draw()
    if not self.on then

        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.printf(self.text, self.x + 10, self.y + 10, 200, "left")
        love.graphics.setColor(255, 255, 255, 255)
    else

        love.graphics.setColor(100, 225, 255, 255)
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.printf(self.text, self.x + 10, self.y + 10, 200, "left")
        love.graphics.setColor(255, 255, 255, 255)
    end
end

function MenuOption:turn_on()
    self.on = true
end

function MenuOption:turn_off()
    self.on = false
end

Menu = class("Menu")

function Menu:initialize()
    self.options = {}
    table.insert(self.options, MenuOption:new("Attack", 200, 30, 30, 30))
    table.insert(self.options, MenuOption:new("Run", 200, 30, 30, 60))
    self.current_option = 1
    self.change = false
end

function Menu:draw()
    for k, v in pairs(self.options) do
        v:draw()
    end
end

function Menu:update(dt)
    if (love.keyboard.isDown("up")) then
        self.options[self.current_option]:turn_off()
        self.current_option = math.max(1, self.current_option - 1)
    elseif (love.keyboard.isDown("down")) then
        self.options[self.current_option]:turn_off()
        self.current_option = math.min(#self.options, self.current_option + 1)
    end
    self.options[self.current_option]:turn_on()


    if(love.keyboard.isDown("return")) then
        if (self.option[self.current_option].text == "Run") then
           self.change = true
       end
   end
end

return Menu
