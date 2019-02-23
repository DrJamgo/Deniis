require "elements/element"
require "powers/fireball"
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
    fireball = Fireball(owner),
    duplicate = Ability(1),
    firewalk = Firewalk(owner)
  }
  self.buttons = {
      "fireball",
      "firewalk",
      "duplicate"
  }
end

