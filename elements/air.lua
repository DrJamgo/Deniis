require "elements/element"
require "powers/levitate"

Air = {}
Air.__index = Air
setmetatable(Air, {
  __index = Element,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function Air:_init(owner)

  self.powers = {
    airblast = Ability(),
    levitate = Levitate(owner),
    reflect = Ability()
  }
  self.buttons = {
      "airblast",
      "reflect",
      "levitate"
  }
  
  self.owner = owner
end

