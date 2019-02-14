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
Icicle.speed = 32 * 10
Icicle.alive = 8.0

function Icicle:_init(owner)
  self.ability = Ability(Icicle.cooldown)
  self.owner = owner
end

function Icicle:update(dt)
  self.ability:update(dt)
  for k,v in pairs(objects) do
    if v.update then v:update(dt) end
  end
end

function Icicle:activate(dx, dy)
  if self.ability:activate() then
    self:createIcicle(dx, dy)
    return true
  end
  return false
end

function Icicle:createIcicle(dx, dy)
  local world = self.owner.body:getWorld()
  local body = love.physics.newBody(world, self.owner.body:getX() + dx*16, self.owner.body:getY() + dy*16, "dynamic" )
  body:setFixedRotation(true)
  local shape = love.physics.newRectangleShape(16,4)
  local fixture = love.physics.newFixture(body, shape, 1)
  body:setMass(20)
  body:setLinearVelocity(Icicle.speed * dx, Icicle.speed * dy)
  body:setBullet(true)
  
  local userdata = 
    { 
      body = body,
      fixture = fixture,
      destroy = function(self)
        self.body:destroy()
        self.body = nil
        self.update = nil
      end,

      beginContact = function(self, fixture, other, collision)
        if self.alive == nil then
          self.other = other
          self.x, self.y = collision:getPositions()
        end
      end,
      update = function(self, dt)
        if self.other then
          love.physics.newWeldJoint( self.body, self.other:getBody(), self.x, self.y, false )
          self.alive = Icicle.alive
          self.other = nil
          self.fixture:setFilterData(1,65535,0)
        end
        if self.alive ~= nil then
          self.alive = self.alive - dt
          if self.alive < 0 then
            self:destroy()
          end
        else
          local x,y = self.body:getLinearVelocity()
          self.body:setAngle(math.atan2(y,x))
        end
      end
    }
  fixture:setFriction(0.0)
  fixture:setUserData(userdata)
  fixture:setFilterData(1,65535,-1)
  objects[#objects+1] = userdata
end





