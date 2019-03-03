Stachli = {}
Stachli.__index = 

setmetatable(Stachli, {
  __index = Creature, 
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

Stachli.jumpforce = 4500
Stachli.damage = 50
Stachli.impulse = 8000
Stachli.hp = 100
Stachli.mass = 70

function Stachli:_init(world,x,y)
  Creature._init(self, world, x, y, 16, 8, Stachli.mass, Stachli.hp)
  self.fixture:setFriction(0.6)
  self.image = love.graphics.newImage("assets/stachli.png")
  self.imageorigin = {8, 14}
  self.bounce = Ability(0.5)
  self.sting = Ability(0.5)
end

function Stachli:_initShape(w, h)
  return love.physics.newPolygonShape(-w/2, 0, -w/4, -h, w/4, -h, w/2, 0)
end

function Stachli:_updateBehaviour(dt)
  -- init stuff
  self.stuck = self.stuck or 0
  vx, vy = self.body:getLinearVelocity()
  
  local dir = (self.faceright and 1 or -1)
  
  self.velo = (self.velo or 0.0) * 0.5 + vx * 0.5 * dir
  
  if self.velo < 2 then
    self.stuck = self.stuck + dt
  end
  
  if self.stuck > 2.0 then
    self.faceright = not self.faceright
    self.stuck = 0
  end
  self.bounce:update(dt)
  if self.onGround and self.onGround > 0.2 and self.bounce:activate() then
    self.body:applyLinearImpulse(0.5 * self.jumpforce * dir,-self.jumpforce)
  end
  
  self.sting:update(dt)
  if self.enemycontact and self.sting:activate() then
    local contact = self.enemycontact
    contact.enemy:hit(self.damage)
    contact.enemy.body:applyLinearImpulse(contact.nx * Stachli.impulse, contact.ny * Stachli.impulse)
    self.contact = nil
  end

end

return Stachli