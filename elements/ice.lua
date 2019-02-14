require "elements/element"
require "powers/icicle"

Ice = {}
Ice.__index = Ice
setmetatable(Ice, {
  __index = Element,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Ice:_init(owner)

  self.powers = {
    icicle = Icicle(owner),
    liquify = Ability(1),
    todo = Ability(1)
  }
  self.buttons = {
      "icicle",
      "liquify",
      "todo"
  }
end

