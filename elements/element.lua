Element = {}
Element.__index = Element
setmetatable(Element, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})


function Element:update(dt)
  for k, power in pairs(self.powers) do
    power:update(dt)
  end
end

function Element:activate(dx, dy, button)
  local power = self.buttons[button]
  if power then
    return self.powers[power]:activate(dx, dy)
  end
end

function Element:deactivate(button)
  local power = self.buttons[button]
  if power and self.powers[power].deactivate then
    return self.powers[power]:deactivate()
  end
end