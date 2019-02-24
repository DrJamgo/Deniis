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
  self.y = y
  self.shiftX = math.floor(-x+0.5) + love.graphics.getWidth()/2 / self.scaleX
  self.shiftY = math.floor(-y+0.5) + love.graphics.getHeight()/2 / self.scaleY
  
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
end

function Camera:getTransform()
  self.transform = love.math.newTransform()
  self.transform:scale(self.scaleX, self.scaleY)
  self.transform:translate(self.shiftX , self.shiftY )
  return self.transform
end