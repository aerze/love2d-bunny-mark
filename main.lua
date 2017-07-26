local width = 480
local height = 320
love.window.setMode(width, height)

local bunniesImage = nil

local bunnies = {}
local gravity = 0.5

local maxX = width
local minX = 0
local maxY = height
local minY = 0

local bunnyWidth = 26
local bunnyHeight = 37

local startBunnyCount = 2
local maxBunnyCount = 100
local isAdding = false
local count = 0
local amount = 10

local osName = love.system.getOS()
local cores = love.system.getProcessorCount()
local major, minor, rev = love.getVersion()
local title = 'Bunnymark v3, ' .. osName .. '-' .. cores .. ' CPUs, LÖVE v' .. major .. '.' .. minor .. '.' .. rev
love.window.setTitle(title)

local bunny1 = nil
local bunny2 = nil
local bunny3 = nil
local bunny4 = nil
local bunny5 = nil
local bunnyQuads = nil
local bunnyType = nil
local currentQuad = nil

function makeBunny(image, quad)
        return {
                image = bunniesImage,
                quad = currentQuad,
                width = bunnyWidth,
                height = bunnyHeight,
                position = {
                        x = 0,
                        y = 0
                },
                rotation = 0,
                speed = {
                        x = 1,
                        y = 1
                },
                scale = {
                        x = 1,
                        y = 1
                },
                anchor = {
                        x = 0,
                        y = 0
                }
        }
end

function love.load()
        math.randomseed(os.time())
        love.graphics.setBackgroundColor(255, 255, 255)

        bunniesImage = love.graphics.newImage('bunnys.png');

        bunny1 = love.graphics.newQuad(2, 47, bunnyWidth, bunnyHeight, bunniesImage:getDimensions())
        bunny2 = love.graphics.newQuad(2, 86, bunnyWidth, bunnyHeight, bunniesImage:getDimensions())
        bunny3 = love.graphics.newQuad(2, 125, bunnyWidth, bunnyHeight, bunniesImage:getDimensions())
        bunny4 = love.graphics.newQuad(2, 164, bunnyWidth, bunnyHeight, bunniesImage:getDimensions())
        bunny5 = love.graphics.newQuad(2, 2, bunnyWidth, bunnyHeight, bunniesImage:getDimensions())

        bunnyQuads = {bunny1, bunny2, bunny3, bunny4, bunny5}
        bunnyType = 3
        currentQuad = bunnyQuads[bunnyType]

        for i=1,startBunnyCount do
                local bunny = makeBunny()
                bunny.speed.x = math.random() * 10
                bunny.speed.y = (math.random() * 10) - 5
                bunny.anchor.x = 0.5
                bunny.anchor.y = 1

                count = count + 1
                bunnies[count] = bunny
        end
end

function love.update()
        if (isAdding) then
                if (count < maxBunnyCount) then
                        for i=1,amount do
                                local scale = 0.5 + math.random() * 0.5
                                local bunny = makeBunny()
                                bunny.speed.x = math.random() * 10
                                bunny.speed.y = (math.random() * 10) - 5
                                bunny.anchor.y = 1

                                bunny.scale.x = scale
                                bunny.scale.y = scale

                                bunny.rotation = math.random() - 0.5

                                count = count + 1
                                bunnies[count] = bunny
                        end
                end
        end

        for i,v in ipairs(bunnies) do
                local bunny = bunnies[i]

                bunny.position.x = bunny.position.x + bunny.speed.x
                bunny.position.y = bunny.position.y + bunny.speed.y
                bunny.speed.y = bunny.speed.y + gravity

                if (bunny.position.x > maxX) then
                        bunny.speed.x = bunny.speed.x * -1
                        bunny.position.x = maxX
                elseif (bunny.position.x < minX) then
                        bunny.speed.x = bunny.speed.x * -1
                        bunny.position.x = minX
                end

                if (bunny.position.y > maxY) then
                        bunny.speed.y = bunny.speed.y * -0.85
                        bunny.position.y = maxY
                        if (math.random() > 0.5) then
                                bunny.speed.y = bunny.speed.y - math.random() * 6
                        end
                elseif (bunny.position.y < minY) then
                        bunny.speed.y = 0
                        bunny.position.y = minY
                end
        end
end

function love.draw()
        love.graphics.setColor(255, 255, 255)
        for i,v in ipairs(bunnies) do
                local bunny = bunnies[i]
                love.graphics.draw(bunny.image, bunny.quad, bunny.position.x, bunny.position.y, bunny.rotation, bunny.scale.x, bunny.scale.y, bunny.anchor.x, bunny.anchor.y)
        end

        love.graphics.setColor(0, 0, 0, (255 * 0.9))
        love.graphics.rectangle('fill', 0, 0, 58, 20)
        love.graphics.setColor(16, 92, 182, (255 * 0.9))
        love.graphics.rectangle('fill', 0, 21, 110, 20)

        love.graphics.setColor(0, 255, 255, 255)
        love.graphics.print(tostring(love.timer.getFPS()) .. ' FPS', 3, 3)
        love.graphics.print(tostring(count) .. ' BUNNIES', 3, 24)
end

function love.mousepressed(x, y, button)
        isAdding = true
end

function love.mousereleased(x, y, button)
        bunnyType = bunnyType + 1
        if (bunnyType > 5) then bunnyType = 1 end
        currentQuad = bunnyQuads[bunnyType]
        isAdding = false
end
