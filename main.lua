if arg[#arg] == "-debug" then require("mobdebug").start() end

local sti = require "STI/sti"
require "camera"
require "player"
require "hud"
require "collisions"
require "objects/fixtures"

game = {}

game.world = nil
game.camera = Camera()
game.map = nil
game.player = nil
game.hud = HUD(game)

local box2d_draw = false
local pause = false

function love.load()
  --initial graphics setup
  love.graphics.setBackgroundColor(0.6, 0.5, 0.5) --set the background color to a nice blue
  love.window.setMode(640, 640) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing
  
  love.physics.setMeter(32) --the height of a meter our worlds will be 64px
  game.world = love.physics.newWorld(0, 9.81 * 32, true)
  
  game.world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  game.map = sti("map01.lua", { "box2d" })
  game.map:box2d_init(game.world)
  
  local spawnlayer = game.map.layers["spawn"]
  setLayer(spawnlayer)
  for k, object in pairs(spawnlayer.objects) do
    if object.name == "player" then
      game.player = Player(game.world, object.x + object.width / 2, object.y + object.height / 2)
      --spawnlayer.objects[#spawnlayer.objects+1] = game.player
    end
  end
  
  game.map.layers["spawn"].draw = drawFixtures
  game.camera:follow(game.player)
  game.camera:setScale(4.0)
end

function love.update(dt)
  if pause then return end
  updateFixtures(dt)
  game.map:update(dt)
  game.world:update(dt)
  game.camera:update(dt)
  game.hud:update(dt)
  
  for k, layer in pairs(game.map.layers) do
    if layer.properties.offsetx then
      layer.x = layer.properties.offsetx * -game.camera.shiftX + layer.offsetx
    end
    if layer.properties.offsety then
      layer.y = layer.properties.offsety * -game.camera.shiftY + layer.offsety
    end
  end
end

function love.keypressed( key, scancode, isrepeat )
  if scancode == "b" then box2d_draw = not box2d_draw end
  if scancode == "p" then pause = not pause end
end

function love.draw()
  local camera = game.camera
  love.graphics.replaceTransform(camera:getTransform())
  love.graphics.setColor(255, 255, 255)
  
	game.map:draw(camera.shiftX, camera.shiftY, camera.scaleX, camera.scaleY)
  
  
  if box2d_draw then

    bodies = game.world:getBodies()
    for k,b in pairs(bodies) do
      local fixtures = b:getFixtures( )
      for k2, f in pairs(fixtures) do
        local userdata = f:getUserData()
        if f == game.player.groundFixture then
          love.graphics.setColor(255, 0, 0)
        elseif f:getUserData().update ~= nil then
          love.graphics.setColor(255, 255, 0)
        else
          love.graphics.setColor(255, 255, 255)
        end
        
        local s = f:getShape( )
        if s.getPoints then
          love.graphics.polygon("line", b:getWorldPoints(s:getPoints()))
        elseif s:getType() == "circle" then
          love.graphics.circle("line", b:getX(), b:getY(), s:getRadius())
        end
      end
    end
    
    local contacts = game.world:getContacts()
    love.graphics.setColor(255, 0, 0)
    local contact = false
    for k,v in pairs(contacts) do
      local x1, y1, x2, y2 = v:getPositions()
      local f1, f2 = v:getFixtures()
      if x1 and y1 then
        love.graphics.circle( "line", x1, y1, 1.5 )
        nx, ny = v:getNormal()
        love.graphics.line(x1, y1, x1 + nx * 6, y1 + ny*6)
      end
    end
  end

  game.hud:draw()
  
  love.graphics.replaceTransform(camera:getTransform())
end

function love.mousepressed(x, y, button, istouch)
  local wx, wy = love.graphics.inverseTransformPoint( x, y )
  local px, py = game.player:getPosition()
  local dir = math.atan2(wy - py, wx - px)
  local dx, dy = math.cos(dir), math.sin(dir)
  game.player:mousepressed(dx, dy, button)
end

function love.mousereleased(x, y, button, istouch)
  local wx, wy = love.graphics.inverseTransformPoint( x, y )
  local px, py = game.player:getPosition()
  local dir = math.atan2(wy - py, wx - px)
  local dx, dy = math.cos(dir), math.sin(dir)
  game.player:mousereleased(dx, dy, button)
end