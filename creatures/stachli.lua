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

function Stachli:_init(world,x,y)
  Creature._init(self, world, x, y, 16, 8, 70, 100)
  self.image = love.graphics.newImage("assets/stachli.png")
  self.imageoffset = {8, 16}
end

function Creature:_initShape(w, h)
  return love.physics.newPolygonShape(-w/2, 0, -w/4, -h, w/4, -h, w/2, 0)
end


return Stachli