local fixturelist = {}

function updateFixtures(dt)
  for k, fixture in pairs(fixturelist) do  
    if fixture then
      local userdata = fixture:getUserData()
      if userdata and userdata.update then
        userdata:update(dt)
      end
      if userdata and userdata.destroyme then
        fixture:setUserData(nil)
        fixturelist[k]:getBody():destroy()
        fixturelist[k] = nil
      end
    end
  end
end

function addFixture(fixture)
  fixturelist[#fixturelist+1] = fixture
end

function destroyFixture(fixture)
  fixture:getUserData().destroyme = true
end

