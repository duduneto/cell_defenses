local menu = {
    isOpenned = false
}

MenuIsOpenned = false;

function menu.openClose()
    menu.isOpenned = not menu.isOpenned
end

return menu