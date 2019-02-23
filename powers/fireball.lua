require "powers/power"

local objects = {}

Fireball = {}
Fireball.__index = Fireball
setmetatable(Fireball, {
  __index = Power,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

Fireball.cooldown = 0.5

function Fireball:_init(owner)
  self.ability = Ability(Fireball.cooldown)
  self.owner = owner
end

function Fireball:update(dt)
  self.ability:update(dt)
end

function Fireball:activate(dx, dy)
  if self.ability:activate() then
    local projectile = FireballProjectile(self.owner, self.owner.body:getX(), self.owner.body:getY(), dx, dy)
    return true
  end
  return false
end

require 'objects/projectile'

FireballProjectile = {}
FireballProjectile.__index = FireballProjectile
setmetatable(FireballProjectile, {
  __index = Projectile,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

FireballProjectile.mass = 5
FireballProjectile.velocity = 32 * 4
FireballProjectile.size = 4
FireballProjectile.image = love.graphics.newImage("assets/Fireball.png")

function FireballProjectile:_init(owner, x, y, dx, dy)
    local shape = love.physics.newCircleShape(self.size)
  
  Projectile._init(self, owner, shape, x, y, dx, dy)
  self.body:setGravityScale(0)
end

function FireballProjectile:draw()
  love.graphics.draw(self.image, math.floor(self.body:getX()+0.5), math.floor(self.body:getY()+0.5), self.body:getAngle(), 1, 1, 12, 4)
end
