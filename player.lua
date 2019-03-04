require "creature"
require "ability"

require "elements/air"
require "elements/fire"
require "elements/ice"

Player = {}
Player.__index = 

setmetatable(Player, {
  __index = Creature, -- this is what makes the inheritance work
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

Player.hpmax = 100
Player.mass = 70

function Player:_postInit()
  self.fixture:setGroupIndex(Group.player)
  self.fixture:setFriction(0.4)
  
  self.jumpforce = 13500
  self.runforce = 25000
  self.maxspeed = 48
  self.jump = Ability(0.5)
    
  self.elements = {
    fire = Fire(self),
    earth = Fire(self), --FIXME
    ice = Ice(self),
    air = Air(self),
  }
  
  self.element = "fire"
  self.image = love.graphics.newImage("assets/Deniis.png")
  self.imageorigin = {16, 16}
  self.faceright = true
  
  self.quadindex = 0
end

function Creature:_initShape()
  return love.physics.newRectangleShape(10, 24)
end

function Player:beginContact(fixture, other, collision)

end

function Player:update(dt)
  Creature.update(self, dt)
  
  for k, element in pairs(self.elements) do
    element:update(dt)
  end
  
  local runforce = self.runforce
  local jumpforce = self.jumpforce

  local w = love.keyboard.isDown( 'w' )
  local a = love.keyboard.isDown( 'a' )
  local s = love.keyboard.isDown( 's' )
  local d = love.keyboard.isDown( 'd' )
  
  local body = self.body
  
  vx, vy = body:getLinearVelocity()
  
  self.jump:update(dt)
  
  if self.onGround or self.inAir < 0.2 then
    if w and self.jump:activate() then
      body:applyLinearImpulse(self.groundnx * -jumpforce / 2,self.groundny * -jumpforce)
    else
      if d and vx < self.maxspeed then
        body:applyForce(runforce,0)
        body:setY(body:getY()-1)
        self.faceright = true
      end
      if a and vx > -self.maxspeed then
        body:applyForce(-runforce,0)
        body:setY(body:getY()-1)
        self.faceright = false
      end
    end
  else
    if w and self.inAir < 0.4 then
      body:applyForce(0,-jumpforce)
    end
    if d and vx < self.maxspeed then
      body:applyForce(runforce*0.5,0)
      self.faceright = true
    end
    if a and vx > -self.maxspeed then
      body:applyForce(-runforce*0.5,0)
      self.faceright = false
    end
  end
  
  if self.onGround or self.inAir < 0.2 then
    if math.abs(vx) < 2 then
      self.quadindex = 0
    else
      self.quadindex = self.quadindex + math.abs(vx) * dt  / 4
      if self.quadindex > 8 then self.quadindex = self.quadindex - 8 end
      if self.quadindex < 1 then self.quadindex = self.quadindex + 8 end
    end
  end
  
  local element = self.elements[self.element]
  if not element or not element.locked then
    if love.keyboard.isDown( '1' ) then self.element = "fire" end
    if love.keyboard.isDown( '2' ) then self.element = "earth" end
    if love.keyboard.isDown( '3' ) then self.element = "ice" end
    if love.keyboard.isDown( '4' ) then self.element = "air" end
  end
end

function Player:draw()
  local ox = self.imageorigin[1]
  local oy = self.imageorigin[2]
  local image = self.image
  local dir = (self.faceright and 1 or -1)
    
  local quad = love.graphics.newQuad(math.floor(self.quadindex)*32, 0, 32, 32, image:getWidth(), image:getHeight())
  love.graphics.draw(self.image, quad, math.floor(self.body:getX()+0.5), math.floor(self.body:getY()+0.5), 0, dir, 1, ox, oy)
end

function Player:mousepressed(dx,dy,button)
  local element = self.elements[self.element]
  if element then
    element:activate(dx,dy, button)
  end
end

function Player:mousereleased(dx,dy,button)
  local element = self.elements[self.element]
  if element then
    element:deactivate(button)
  end
end
