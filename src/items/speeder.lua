local speeder = {}
local timeSettings = {
    start = os.date("%s", os.time()),
    gap = 1,
};

speeder.list = {}

function speeder.getTime()
    return timeSettings.start;
end

function speeder.update()
    for index, value in ipairs(speeder.list) do
        if speeder.checkCollision(Player, value) then
            table.remove(speeder.list, index)
            speeder.giveSpeedToPlayer()
        end
    end
    if love.keyboard.isDown("l") then
        speeder.new()
    end
    if speeder.timeNow() - timeSettings.gap >= (timeSettings.start + 0) then
        speeder.new()
        timeSettings.start = speeder.timeNow()
    end
end

function speeder.timeNow() 
    return os.date("%s", os.time());
end

function speeder.new()
    
    table.insert(speeder.list, {
        x = math.random(100, 400),
        y = math.random(100, 400),
        w = 5,
        h = 5,
    });
end

function speeder.checkCollision(a, b)
    return not (a.x > b.x + b.w or
                a.x + a.w < b.x or
                a.y > b.y + b.h or
                a.y + a.h < b.y)
end

function speeder.giveSpeedToPlayer()
    Player.speed = Player.speed+1;
    Player.w = Player.w+1;
    Player.h = Player.h+1;
end

return speeder;