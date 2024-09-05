-- src/animation.lua

local animation = {}

-- Create a new animation object
function animation.new(imagePath, frameWidth, frameHeight, duration)
    local anim = {}
    anim.spriteSheet = love.graphics.newImage(imagePath)
    anim.quads = {}  -- Table to store each frame's quad
    anim.duration = duration or 1  -- Duration of the animation cycle
    anim.currentTime = 0

    -- Get the total width and height of the sprite sheet
    local sheetWidth = anim.spriteSheet:getWidth()
    local sheetHeight = anim.spriteSheet:getHeight()

    -- Calculate the number of frames in the spritesheet
    for y = 0, sheetHeight - frameHeight, frameHeight do
        for x = 0, sheetWidth - frameWidth, frameWidth do
            table.insert(anim.quads, love.graphics.newQuad(x, y, frameWidth, frameHeight, sheetWidth, sheetHeight))
        end
    end

    return anim
end

-- Update the animation (cycle through frames)
function animation.update(anim, dt)
    anim.currentTime = anim.currentTime + dt
    if anim.currentTime >= anim.duration then
        anim.currentTime = anim.currentTime - anim.duration
    end
end

-- Draw the current frame of the animation
function animation.draw(anim, x, y, scale)
    scale = scale or 1
    local frame = math.floor((anim.currentTime / anim.duration) * #anim.quads) + 1
    love.graphics.draw(anim.spriteSheet, anim.quads[frame], x, y, 0, scale, scale)
end

return animation
