local movement = {};

function movement.handleInput(player)
    if love.keyboard.isDown("d") then
        movement.right(player)
    end
    if love.keyboard.isDown("s") then
        movement.down(player)
    end
    if love.keyboard.isDown("w") then
        movement.top(player)
    end
    if love.keyboard.isDown("a") then
        movement.left(player)
    end
end

function movement.right(player)
    player.x = player.x + player.speed
end

function movement.down(player)
    player.y = player.y + player.speed
end

function movement.top(player)
    player.y = player.y - player.speed
end

function movement.left(player)
    player.x = player.x - player.speed
end

return movement;
