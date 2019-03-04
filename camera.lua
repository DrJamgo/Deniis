Camera = {}
Camera.__index = Camera
setmetatable(Camera, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Camera:_init()
  self.scaleX, self.scaleY = 1,1
  self.transform = love.math.newTransform()
end

function Camera:setFOV(hfov, vfov)
  local vfov = vfov or hfov / love.graphics.getWidth() * love.graphics.getHeight()
  self:setScale(love.graphics.getWidth() / hfov, love.graphics.getHeight() / vfov)
end

function Camera:setScale(scaleX, scaleY)
  self.scaleX = scaleX
  self.scaleY = scaleY or scaleX
  self.hfov = love.graphics.getWidth() / self.scaleX
  self.vfov = love.graphics.getHeight() / self.scaleY
end

function Camera:setWorldSize(width, height)
  self.worldWidth = width
  self.worldHeight = height
end

function Camera:setPosition(x, y)
  self.x = x
  self.y = y - 16
  self.shiftX = math.floor(-self.x+0.5) + love.graphics.getWidth()/2 / self.scaleX
  self.shiftY = math.floor(-self.y+0.5) + love.graphics.getHeight()/2 / self.scaleY
  
  self.shiftX = math.max(math.min(self.shiftX, 0), -self.worldWidth + self.hfov)
  self.shiftY = math.max(math.min(self.shiftY, 0), - self.worldHeight + self.vfov)
end

function Camera:follow(object)
  self.follow = object
end

function Camera:update(dt)
  if self.follow and self.follow.getPosition then
    self:setPosition(self.follow:getPosition())
  end
  self.transform:reset()
  self.transform:scale(self.scaleX, self.scaleY)
  self.transform:translate(self.shiftX , self.shiftY )
end

function Camera:getTransform()
  return self.transform
end

function Camera:isVisible(x,y,w,h)
  local x,y = self.transform:transformPoint(x,y)
  return x > 0 and x < love.graphics.getWidth() and y > 0 and y < love.graphics.getHeight()
end