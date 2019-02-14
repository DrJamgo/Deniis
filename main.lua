if arg[#arg] == "-debug" then require("mobdebug").start() end

local sti = require "STI/sti"
require "camera"
require "player"
require "hud"
require "collisions"

local game = {}
game.camera = Camera()
game.hud = HUD(game)
game.world = nil
game.map = nil
game.player = nil

function love.load()
  --initial graphics setup
  love.graphics.setBackgroundColor(0.0, 0.0, 0.0) --set the background color to a nice blue
  love.window.setMode(640, 640) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing
  
  love.physics.setMeter(32) --the height of a meter our worlds will be 64px
  game.world = love.physics.newWorld(0, 9.81 * 32, true)
  
  game.world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  game.map = sti("map01.lua", { "box2d" })
  game.map:box2d_init(game.world)
  
  local spawnlayer = game.map.layers["spawn"]
  for k, object in pairs(spawnlayer.objects) do
    if object.name == "player" then
      game.player = Player(game.world, object.x + object.width / 2, object.y + object.height / 2)
    end
  end

  game.camera:follow(game.player)
  game.camera:setScale(2.0)
end

function love.update(dt)
  for k,v in pairs(game) do
    if v.update then
      v:update(dt)
    end
  end
end

function love.draw()
  local camera = game.camera
  love.graphics.replaceTransform(camera:getTransform())
  love.graphics.setColor(255, 255, 255)
  
	game.map:draw(camera.shiftX, camera.shiftY, camera.scaleX, camera.scaleY)

  bodies = game.world:getBodies()
  for k,b in pairs(bodies) do
    local fixtures = b:getFixtures( )
    for k2, f in pairs(fixtures) do
      if f == game.player.groundFixture then
        love.graphics.setColor(255, 0, 0)
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
  
  game.player:draw()
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