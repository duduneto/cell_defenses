local pause = require("src.game_config.pause")
local speeder = require("./src/items/speeder")
local invader = require("src.npc.invader")
local player = require("src.player.main")

require("src.settings.pressed_buttons")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    invader.load()
    player.load()

end

function love.update(dt)
    if not pause.isPaused() then
        player.update(dt);
        invader.update(dt);
        -- speeder.update();
    end

end

function love.draw()
    if pause.isPaused() then
        love.graphics.print("Game Paused", 150, 100)
    else
        love.graphics.print(Player.attack, Player.x, Player.y)
        player.draw()
        invader.draw()
        if speeder.list then
            for index, value in ipairs(speeder.list) do
                love.graphics.setColor(255,0,0)
                love.graphics.rectangle("fill", value.x, value.y, value.w, value.h)
            end
        end
    end
end
