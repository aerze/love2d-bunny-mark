local BunnyMark = require 'BunnyMark'


function love.load() 
  math.randomseed(os.time())
end

function love.draw()
  love.graphics.print("Bunnies:" .. BunnyMark.count, BunnyMark.bounds.left + 20, BunnyMark.bounds.bottom - 20)
end
