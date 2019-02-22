Creature = {}
Creature.__index = Creature
setmetatable(Creature, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Creature:_init(world,x,y,w,h,m)
  self.body = love.physics.newBody(world, x, y, "dynamic" )
  self.body:setFixedRotation(true)
  self.body:setLinearDamping(0.2)
  self.shape = love.physics.newRectangleShape(w or 12,h or 32)
  self.fixture = love.physics.newFixture( self.body, self.shape, 1 )
  self.fixture:setRestitution(0)
  self.fixture:setFriction(0.05)
  self.body:setMass(m or 80)
  
  --self.body:setFixedRotation(false)
end

function Creature:updateContacts(dt)
  local contacts = self.body:getContacts()
  local groundobject
  for k, contact in pairs(contacts) do
    local x1, y1, x2, y2 = contact:getPositions()
    local f1, f2 = contact:getFixtures()
    nx, ny = contact:getNormal()
    if f1 == self.fixture and ny > 0.1 then
      groundobject = f2 break
    elseif f2 == self.fixture and ny < -0.1 then
      groundobject = f1 break
    end
  end
  
  if groundobject then
    self.groundFixture = groundobject
    self.onGround = (self.onGround or 0.0) + dt
    self.inAir = nil
  else
    self.groundFixture = nil
    self.inAir = (self.inAir or 0.0) + dt
    self.onGround = nil
  end
end

function Creature:update(dt)
  self:updateContacts(dt)
  --self.body:setAngle(0)
  --self.body:setAngularVelocity(0)
end

function Creature:draw()
  if self.onGround then
    love.graphics.print(string.format("onGround:%0.2f", self.onGround), self.body:getPosition())
  else
    love.graphics.print(string.format("inAir:%0.2f", (self.inAir or 0)), self.body:getPosition())
  end
end

function Creature:getPosition()
  return self.body:getPosition()
end