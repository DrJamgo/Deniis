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

function Player:_init(world,x,y)
  Creature._init(self, world, x, y, 10, 24, 70, 100)
  self.fixture:setGroupIndex(Group.player)
  
  self.jumpforce = 13000
  self.runforce = 10000
  self.jump = Ability(0.5)
    
  self.elements = {
    fire = Fire(self),
    earth = Fire(self), --FIXME
    ice = Ice(self),
    air = Air(self),
  }
  
  self.element = "fire"
  self.image = love.graphics.newImage("assets/Deniis.png")
  self.imageoffset = {15, 16}
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
  
  self.jump:update(dt)
  
  if self.onGround then
    if w and self.onGround > 0.2 and self.jump:activate() then
      body:applyLinearImpulse(0,-jumpforce)
    else
      if d then
        body:applyForce(runforce,0)
      end
      if a then
        body:applyForce(-runforce,0)
      end
    end
  else
    if w and self.inAir < 0.4 then
      body:applyForce(0,-jumpforce)
    end
    if d then
      body:applyForce(runforce*0.5,0)
    end
    if a then
      body:applyForce(-runforce*0.5,0)
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
