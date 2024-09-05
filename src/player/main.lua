local movement = require("src.player.movement")
local anim8 = require("libs.anim8")
Player = {}

function Player.load()
    Player = { x = 300, y = 300, speed = 3, w = 20, h = 20, attack = 5 }
    Player.spriteSheet = love.graphics.newImage("assets/sprites/good_cell_rounded.png")
    Player.grid = anim8.newGrid(32,32, Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight())
    
    Player.animation = {
        speed = {
            onMovement = 0.05,
            idle = 0.25,
            default = 0.25,
        }
    }
    
    Player.animation.top = anim8.newAnimation(Player.grid('1-3',1), Player.animation.speed.default)
    Player.animation.right = anim8.newAnimation(Player.grid('1-3',2), Player.animation.speed.default)
    Player.animation.topRight = anim8.newAnimation(Player.grid('1-3',5), Player.animation.speed.default)
    Player.animation.topLeft = anim8.newAnimation(Player.grid('1-3',8), Player.animation.speed.default)
    Player.animation.bottom = anim8.newAnimation(Player.grid('1-3',3), Player.animation.speed.default)
    Player.animation.left = anim8.newAnimation(Player.grid('1-3',4), Player.animation.speed.default)
    Player.animation.bottomRight = anim8.newAnimation(Player.grid('1-3',6), Player.animation.speed.default)
    Player.animation.bottomLeft = anim8.newAnimation(Player.grid('1-3',7), Player.animation.speed.default)
    Player.animation.default = Player.animation.bottom
end


function Player.update(dt)
    movement.handleInput(Player)
    Player.animation.default:update(dt)
end

function Player.draw()
    Player.animation.default:draw(Player.spriteSheet, Player.x-64, Player.y-32,nil, 4)
end

return Player;