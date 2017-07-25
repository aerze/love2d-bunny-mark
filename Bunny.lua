local Bunny = {}

Bunny.gravity = 0.75

Bunny.speedX = math.random() * 10

Bunny.speedY = (math.random() * 10) - 5

Bunny.bounds = nil

Bunny.anchor = {
  x = 0.5,
  y = 1
}

function Bunny:update () 
  
end

return Bunny
