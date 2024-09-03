local pause = require("src.game_config.pause")
local movement = require("./src/movement")
local speeder = require("./src/items/speeder")
local invader = require("src.npc.invader")

require("src.settings.pressed_buttons")

function love.load()
    Player = { x = 300, y = 300, speed = 3, w = 20, h = 20, attack = 5 }
end

function love.update(dt)
    if not pause.isPaused() then
        movement.handleInput(Player);
        invader.update()
        -- speeder.update();
    end
end

function love.draw()
    if pause.isPaused() then
        love.graphics.print("Game Paused", 150, 100)
    else
        love.graphics.setColor(255,255,255)
        love.graphics.rectangle("fill", Player.x, Player.y, Player.w, Player.h)
        love.graphics.setColor(0,0,0)
        love.graphics.print(Player.attack, Player.x, Player.y)
        invader.draw()
        if speeder.list then
            for index, value in ipairs(speeder.list) do
                love.graphics.setColor(255,0,0)
                love.graphics.rectangle("fill", value.x, value.y, value.w, value.h)
            end
        end
    end
end
