local fixturelist

function setLayer(layer)
  fixturelist = layer.objects
end

function drawFixtures(self)
  local bodies = game.world:getBodies()
  for i, body in pairs(bodies) do
    local fixtures = body:getFixtures()
    for k, object in pairs(fixtures) do
      if object.getUserData and object:getUserData().draw then
        object:getUserData():draw()
      else
        local points = {body:getWorldPoints(object:getShape():getPoints())}
        love.graphics.setColor( 0, 0, 0, 1 )
        love.graphics.polygon("fill", points)
      end
    end
  end
end

function updateFixtures(dt)
  local bodies = game.world:getBodies()
  for i, body in pairs(bodies) do
    local fixtures = body:getFixtures()
    for k, fixture in pairs(fixtures) do  
      local userdata = fixture:getUserData()
      if userdata and userdata.update then
        userdata:update(dt)
      end
      if userdata and userdata.destroyme then
        fixture:setUserData(nil)
        fixture:destroy()
      end
    end
  end
  
  collectgarbage()
end

function destroyFixture(fixture)
  if fixture:getUserData() then
    fixture:getUserData().destroyme = true
  else
    fixture:setUserData({destroyme=true})
  end
end

Cat = {}
Cat.static      = 2^1
Cat.dynamic     = 2^2
Cat.projectile  = 2^3
Cat.creature    = 2^4
Cat.item        = 2^5
Cat.all         = 65535

Group = {}
Group.enemy     = 0
Group.player    = -1




