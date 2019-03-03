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
  self.imageorigin = {0,0}
  self.faceright = false
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
  self.enemycontact = nil
  for k, contact in pairs(contacts) do
    local x1, y1, x2, y2 = contact:getPositions()
    if x1 and y1 then
      local f1, f2 = contact:getFixtures()
      nx, ny = contact:getNormal()

      -- swap enerything if we are f2
      local me, other = f1, f2
      if self.fixture == f2 then 
        me, other, nx, ny = f2, f1, -nx, -ny
      end
      
      if other:getGroupIndex() ~= me:getGroupIndex() and other:getUserData() and other:getUserData().hit then
        --local dx, dy = other:getBody():getX() - me:getBody():getX() , other:getBody():getY() - me:getBody():getY()
        --local dist = math.sqrt(dx*dx+dy*dy)
        
        self.enemycontact = {enemy=other:getUserData(), ny=ny, nx=nx}
      end
      if ny > 0.1 then
        groundobject = other
      end
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
  if game.camera:isVisible(self.body:getX(), self.body:getY(), 0,0) then
    self:_updateBehaviour(dt)
  end
end

function Creature:_updateBehaviour(dt)
  -- do nothing
end

function Creature:draw()
  if self.image then
    local ox = self.imageorigin[1]
    local oy = self.imageorigin[2]
    sx = 1
    if self.faceright == false then
      sx = -1
    end
    love.graphics.draw(self.image, math.floor(self.body:getX()), math.floor(self.body:getY()),0,sx,1,ox,oy)
  else
    local s = self.fixture:getShape()
    local b = self.fixture:getBody()
    if s.getPoints then
      love.graphics.polygon("line", b:getWorldPoints(s:getPoints()))
    elseif s:getType() == "circle" then
      love.graphics.circle("line", b:getX(), b:getY(), s:getRadius())
    end
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