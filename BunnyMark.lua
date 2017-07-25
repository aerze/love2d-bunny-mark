local BunnyMark = {}

BunnyMark.bunnies = {}

BunnyMark.bounds = {
  left = 0,
  top = 0,
  right = 800,
  bottom = 600
}

BunnyMark.isAdding = false

BunnyMark.count = 0

BunnyMark.maxCount = 200000

BunnyMark.amount = 100

BunnyMark.renderer = nil

BunnyMark.stage = nil

BunnyMark.stats = nil

BunnyMark.textures = nil

BunnyMark.counter = nil

function BunnyMark:ready (startBunnyCount)
  startBunnyCount = 100000

  -- get bunny textures

  if startBunnyCount > 0 then
    self.addBunnies(startBunnyCount)
  end
end

function BunnyMark:addBunnies (num)

end

return BunnyMark
