require 'objects/fixtures'

Creature = {}
Creature.__index = Creature
setmetatable(Creature, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Creature:_init(world,x,y,w,h,m,hp)
  self.body = self:_initBody(world, x, y)
  self.shape = self:_initShape(w, h)
  self.fixture = self:_initFixture()
  self.hp = hp or 10
end

function Creature:_initBody(world, x, y)
  local body = love.physics.newBody(world, x, y, "dynamic" )
  body:setFixedRotation(true)
  body:setLinearDamping(0.4)
  return body
end

function Creature:_initShape(w, h)
  return love.physics.newRectangleShape(w, h)
end

function Creature:_initFixture(m)
  local fixture = love.physics.newFixture( self.body, self.shape, 1 )
  fixture:setRestitution(0)
  fixture:setFriction(0.2)
  
  self.body:setMass(m or 80)
  
  fixture:setUserData(self)
  fixture:setFilterData(Cat.creature, Cat.all, Group.enemy)
  return fixture
end

function Creature:die()
  destroyFixture(self.fixture)
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
end

function Creature:draw()
  if self.image then
    love.graphics.draw(self.image, math.floor(self.body:getX()-14.5), math.floor(self.body:getY()-15.5))
  end
end

function Creature:getPosition()
  return self.body:getPosition()
end

function Creature:hit(damage)
  self.hp = self.hp - damage
  if self.hp <= 0 then
    self:die()
  end
end