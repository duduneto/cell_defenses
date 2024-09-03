local pause = {};
local isPaused = false;

function pause.isPaused()
    return isPaused;
end

function pause.forcePause()
    isPaused = not isPaused;
end

return pause;