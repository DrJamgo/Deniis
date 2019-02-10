require "ability"

Power = {}
Power.__index = Power
setmetatable(Power, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Power:update(dt)
  
end

function Power:activate(dx, dy)
  
end

function Power:deactivate()
  
end