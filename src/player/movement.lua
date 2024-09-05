local movement = {};

function movement.handleInput(player)
    local defaultMovement = {
        right = false,
        top = false,
        bottom = false,
        left = false,
    }
    movement.pressedKeys = defaultMovement;

    if love.keyboard.isDown("d") then
        movement.right(player)
        player.animation.default = player.animation.left;
        movement.pressedKeys.right = true
    end
    if love.keyboard.isDown("s") then
        movement.down(player)
        player.animation.default = player.animation.top;
        movement.pressedKeys.bottom = true
    end
    if love.keyboard.isDown("w") then
        movement.top(player)
        player.animation.default = player.animation.bottom;
        movement.pressedKeys.top = true
    end
    if love.keyboard.isDown("a") then
        movement.left(player)
        player.animation.default = player.animation.right;
        movement.pressedKeys.left = true
    end

    if (movement.pressedKeys.right and movement.pressedKeys.top) then
        player.animation.default = player.animation.topRight;
    end
    if (movement.pressedKeys.right and movement.pressedKeys.bottom) then
        player.animation.default = player.animation.bottomRight;
    end
    if (movement.pressedKeys.left and movement.pressedKeys.top) then
        player.animation.default = player.animation.topLeft;
    end
    if (movement.pressedKeys.left and movement.pressedKeys.bottom) then
        player.animation.default = player.animation.bottomLeft;
    end

    movement.pressedKeys = defaultMovement;
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
