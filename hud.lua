HUD = {}
HUD.__index = HUD
setmetatable(HUD, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function HUD:_init(game)
  self.game = game
  self.colors = {}
  self.colors[1] = {150/255,0,0}
  self.colors[2] = {150/255,75/255,0}
  self.colors[3] = {0,75/255,100}
  self.colors[4] = {170/255,210/255,255/255}
  self.elements = {}
  self.elements[1] = "fire"
  self.elements[2] = "earth"
  self.elements[3] = "ice"
  self.elements[4] = "air"
end

function HUD:update(dt)
  
end

function HUD:draw()
  local transform = love.math.newTransform()
  love.graphics.replaceTransform(transform)
  
  for i = 1,4 do
    love.graphics.setColor(unpack(self.colors[i]))
    local style = "line"
    if self.elements[i] == self.game.player.element then
      style = "fill"
    end
    love.graphics.rectangle(style, (i-1) * 64, 0, 64, 64)
  end
  
  love.graphics.setColor(1,1,1,1)
  
  love.graphics.print("Health:"..self.game.player.hp, love.graphics.getWidth() - 100, 0)

  
  if game.finaltime then
    love.graphics.setColor(1,0,0,1)
    love.graphics.print("Final Time:\n"..string.format("%.2f",self.game.finaltime), love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 3, 3, 10, 10)
  end
    love.graphics.print("Time:"..string.format("%.2f",self.game.time), love.graphics.getWidth() - 100, 30)
end