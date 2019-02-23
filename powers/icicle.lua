require "powers/power"

local objects = {}

Icicle = {}
Icicle.__index = Icicle
setmetatable(Icicle, {
  __index = Power,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

Icicle.cooldown = 1.0

function Icicle:_init(owner)
  self.ability = Ability(Icicle.cooldown)
  self.owner = owner
end

function Icicle:update(dt)
  self.ability:update(dt)
end

function Icicle:activate(dx, dy)
  if self.ability:activate() then
    local projectile = IcicleProjectile(self.owner, self.owner.body:getX(), self.owner.body:getY(), dx, dy)
    return true
  end
  return false
end

require 'objects/projectile'

IcicleProjectile = {}
IcicleProjectile.__index = IcicleProjectile
setmetatable(IcicleProjectile, {
  __index = Projectile,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

IcicleProjectile.mass = 15
IcicleProjectile.velocity = 32 * 10
IcicleProjectile.impulefactor = 0.4
IcicleProjectile.sizex = 16
IcicleProjectile.sizey = 6
IcicleProjectile.decaytime = 5.0

function IcicleProjectile:_init(owner, x, y, dx, dy)
    local shape = love.physics.newPolygonShape(
  self.sizex/2,0,
  -self.sizex/2,self.sizey/2,
  -self.sizex/2,-self.sizey/2)
  
  Projectile._init(self, owner, shape, x, y, dx, dy)
end


