require "powers/power"

Firewalk = {}
Firewalk.__index = Firewalk
setmetatable(Firewalk, {
  __index = Power,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

Firewalk.cooldown = 5
Firewalk.duration = 0.4
Firewalk.speed    = 250
Firewalk.endspeed = 32

function Firewalk:_init(owner)
  self.ability = Ability(Firewalk.cooldown, Firewalk.duration)
  self.owner = owner
end

function Firewalk:update(dt)
  local wasactive = self.ability:isActive()
  self.ability:update(dt)
  local isactive = self.ability:isActive()
  
  if not isactive and wasactive then
    self.owner.body:setLinearVelocity(self.dx * Firewalk.endspeed, self.dy * Firewalk.endspeed)
  end
end

function Firewalk:activate(dx, dy)
  if self.ability:activate() then
    local dist = math.sqrt(dx*dx+dy*dy)
    self.dx = dx / dist
    self.dy = dy / dist
    self.owner.body:setLinearVelocity(self.dx * Firewalk.speed, self.dy * Firewalk.speed)
    return true
  end
  return false
end

function Firewalk:deactivate()
  self.ability:deactivate()
  self.owner.body:setLinearVelocity(self.dx * Firewalk.endspeed, self.dy * Firewalk.endspeed)
end