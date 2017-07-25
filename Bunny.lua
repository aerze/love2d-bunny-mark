local Bunny = {}

Bunny.gravity = 0.75

Bunny.speedX = math.random() * 10

Bunny.speedY = (math.random() * 10) - 5

Bunny.bounds = nil

Bunny.anchor = {
  x = 0.5,
  y = 1
}

Bunny.position = {
  x = 0,
  y = 0
}

Bunny.gravity = 0

function Bunny:update ()
  self.position.x += self.speedX

  self.position.y += self.speedY

  self.speedY += self.gravity

end

return Bunny
