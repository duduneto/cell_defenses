local colllision = {}

function colllision.check(a, b)
    return not (a.x > b.x + b.w or
                a.x + a.w < b.x or
                a.y > b.y + b.h or
                a.y + a.h < b.y)
end

return colllision