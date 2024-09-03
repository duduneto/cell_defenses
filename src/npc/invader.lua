-- src/invader.lua

local invader = {}
invader.list = {}
-- Create a new hostile invader
function invader.new()
    table.insert(invader.list, {
        x = math.random(100,400),
        y = math.random(100,400),
        width = 20,
        height = 20,
        speed = 2,
        attack = math.random(1, 10),
        isHostile = true,
        minDistToMoveAway = math.random(50, 100)
    })
end

-- Calculate distance between two points
local function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

-- Move invader away from the player
function invader.moveAwayFromPlayer(inv, player)
    -- Calculate direction away from player
    local dx = inv.x - player.x
    local dy = inv.y - player.y
    local dist = distance(inv.x, inv.y, player.x, player.y)

    -- Normalize direction vector
    if (dist > 0) then
        dx = dx / dist
        dy = dy / dist
    end

    -- Update invader position away from the player
    if (dist > 0 and dist < inv.minDistToMoveAway) then
        inv.x = inv.x + dx * inv.speed
        inv.y = inv.y + dy * inv.speed
    end
end

-- Move invader to the player position
function invader.moveToPlayer(inv, player)
    -- Calculate direction away from player
    local dx = inv.x - player.x
    local dy = inv.y - player.y
    local dist = distance(inv.x, inv.y, player.x, player.y)

    -- Normalize direction vector
    if (dist > 0) then
        dx = dx / dist
        dy = dy / dist
    end

    -- Update invader position near to player
    if (dist > 0 and dist < inv.minDistToMoveAway) then
        inv.x = inv.x - dx * inv.speed
        inv.y = inv.y - dy * inv.speed
    end
end

-- Update invader's behavior
function invader.update()
    for index, inv in ipairs(invader.list) do
        if inv.isHostile then
            if inv.attack < Player.attack then
                invader.moveAwayFromPlayer(inv, Player)
            else
                invader.moveToPlayer(inv, Player)
            end
        end
    end
end

-- Draw the invader
function invader.draw()
    for index, inv in ipairs(invader.list) do
        love.graphics.setColor(1, 1, 0) -- Hostile invaders in red
        love.graphics.rectangle("fill", inv.x, inv.y, inv.width, inv.height)
        love.graphics.setColor(0, 0, 0) -- Hostile invaders in red
        love.graphics.print(inv.attack, inv.x, inv.y)
    end
end

return invader
