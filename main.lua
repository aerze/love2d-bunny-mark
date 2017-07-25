local BunnyMark = require 'BunnyMark'


function love.load()
  math.randomseed(os.time())

  image = love.graphics.newImage('rabbitv3.png');
end

function love.draw()

  love.graphics.draw(image, 100, 100)

  love.graphics.print("Bunnies:" .. BunnyMark.count, BunnyMark.bounds.left + 20, BunnyMark.bounds.bottom - 20)
end
