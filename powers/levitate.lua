require "powers/power"

Levitate = {}
Levitate.__index = Levitate
setmetatable(Levitate, {
  __index = Power,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

Levitate.cooldown = 5
Levitate.duration = 1
Levitate.gravity  = 0.5

function Levitate:_init(owner)
  self.ability = Ability(Firewalk.cooldown, Firewalk.duration)
  self.owner = owner
end

function Levitate:update(dt)
  self.ability:update(dt)
  
  if self.ability:isActive() then
    self.owner.body:setGravityScale(Firewalk.gravity)
  else
    self.owner.body:setGravityScale(1.0)
  end
end

function Levitate:activate()
  return self.ability:activate()
end