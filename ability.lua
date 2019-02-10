Ability = {}
Ability.__index = Ability
setmetatable(Ability, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Ability:_init(cooldown, duration, trigger)
  
  self.cooldown = cooldown or 0
  self.duration = duration or 0
  self.trigger = trigger or 0
  
  self.time = 0
  self.active = false
  
  return self
end

function Ability:update(dt)
  local trigger = self.time > self.trigger
  
  if self.active then
    self.time = self.time + dt
  end
  
  trigger = (trigger == false) and (self.time > self.trigger)
  
  if self.time > self.cooldown then
    self.active = false
    self.time = self.time - self.cooldown
  end
  
  return trigger
end

function Ability:isReady()
  return self.active == false
end

--
-- Activates ability (starts cooldown)
-- @return true if ability was ready and is now acive, false otherwise
--
function Ability:activate()
  local isReady = self:isReady()
  if isReady then
    self.active = true
  end
  return isReady
end

function Ability:deactivate()
  self.time = self.duration
end

function Ability:isActive()
  return self.active and self.time < self.duration
end

function Ability:getProgress()
  if self.active == false or self.time >= self.duration then
    return 0
  end
  return self.time / math.max(self.duration, 0.0001)
end