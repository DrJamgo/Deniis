require "elements/element"
require "powers/firewalk"

Fire = {}
Fire.__index = Fire
setmetatable(Fire, {
  __index = Element,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Fire:_init(owner)

  self.powers = {
    fireball = Ability(1),
    duplicate = Ability(1),
    firewalk = Firewalk(owner)
  }
  self.buttons = {
      "fireball",
      "firewalk",
      "duplicate"
  }
end

