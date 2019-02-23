require "objects/fixtures"

Projectile = {}
Projectile.__index = Projectile
setmetatable(Projectile, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Projectile:_init(owner, shape, x, y, dx, dy)
  self.world = owner.body:getWorld()
  self.body = love.physics.newBody(self.world, x, y, "dynamic")
  self.fixture = love.physics.newFixture(self.body, shape, 1)
  
  self.body:setFixedRotation(true)
  self.body:setBullet(true)
  self.body:setMass(self.mass)
  self.body:setLinearVelocity(self.velocity * dx, self.velocity * dy)
  
  owner.body:applyLinearImpulse(
    -self.velocity * dx * self.mass * self.impulefactor,
    -self.velocity * dy * self.mass * self.impulefactor)
  
  self.fixture:setFriction(0.0)
  self.fixture:setUserData(self)
  self.fixture:setFilterData(1,65535,-1)
  
  addFixture(self.fixture)
end

function Projectile:postSolve(fixture, other, collision, normalimpulse, tangentimpulse)
  local userdata = other:getUserData()
  
  if userdata.hit then
    self.hitother = userdata
    self.impulse = normalimpulse
  elseif self.alive == nil then
    self.glue = other
    self.x, self.y = collision:getPositions()
  end
end

function Projectile:update(dt)
  if self.hitother then
    self.hitother:hit(normalimpulse)
    destroyFixture(self.fixture)
  elseif self.glue and not self.alive then
    local joint = love.physics.newWeldJoint( self.body, self.glue:getBody(), self.x, self.y, false )
    self.alive = self.decaytime
    self.other = nil
    self.fixture:setFilterData(1,65535,0)
    --self.body:setFixedRotation(false)
  end
  if self.alive ~= nil then
    self.alive = self.alive - dt
    if self.alive < 0 then
      destroyFixture(self.fixture)
    end
  else
    local x,y = self.body:getLinearVelocity()
    self.body:setAngle(math.atan2(y,x))
  end
end

