local menu = require("src.game_config.menu")
local pause = require("src.game_config.pause")
local invader = require("src.npc.invader")

local pressedButtons = {}

function love.keypressed(key)
    if key == "escape" then
        menu.openClose()
        pause.forcePause()
    end
    if key == "p" then
        pause.forcePause()
    end
    if key == "i" then
        invader.new()
    end
end

return pressedButtons;