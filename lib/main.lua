function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius

    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color)
        --dxDrawRectangle(x, y - radius, rx, radius, color)
        dxDrawRectangle(x, y + ry, rx, radius, color)
        dxDrawRectangle(x - radius, y, radius, ry, color)
        dxDrawRectangle(x + rx, y, radius, ry, color)

        --dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        --dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
    end
end

function isMouseIn(x,y,w,h)
	local cx,cy = getCursorPosition()
	local sw,sh = 1366,768
	if cx and cy then
		cx,cy = cx*sw,cy*sh
		if cx > x and cx < x+w and cy > y and cy < y+h then
			return true
		end
	end
	return false
end

local window = {
    barColor = tocolor(239, 92, 23, 200),
	barLineColor = tocolor(239, 0, 0, 200),
    barText="Jmaniacs Library!",
    bodyColor = tocolor(0, 0, 0, 180),
}

local button = {
	bodyColor = tocolor(255, 111, 28, 255),
	clickColor = tocolor(122, 147, 186, 220),
	bodyText = "Jmaniacs Button!"
}

local editbox = {
	bodyColor = tocolor(255, 255, 255, 220),
	text = "Jmaniacs Editbox!"
}

function drawWindow (x, y, w, h, text, type)
	--Draw
	if type == 1 or type == nil then
	dxDrawRoundedRectangle(x, y, w, h, window.bodyColor, 10)
	dxDrawRectangle(x,y +10, w, 30, window.barColor)
	dxDrawRoundedRectangle(x, y+35, w, 10, window.barLineColor, 5)
	--dxDrawText(text or window.barText, x+x-x, y+y-y, w, h, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "center", "center")
	elseif type == 2 then
	dxDrawRectangle(x, y, w, h, window.bodyColor)
	dxDrawRectangle(x, y, w, 30, window.barColor)
	dxDrawRectangle(x, y+30, w, 10, window.barLineColor)
	--dxDrawText(text or window.barText, x+x-x, y+y-y, w, h, tocolor ( 255, 255, 255, 255 ), 1, "default-bold", "center", "center")
	elseif type == 3 then
	dxDrawRoundedRectangle(x, y, w, h, window.bodyColor, 10)
	end
end

function drawButton (x, y, w, h, text, type)
	--Draw
	if type == 1 or type == nil then
	dxDrawRoundedRectangle(x, y, w, h, button.bodyColor, 10)
	--dxDrawText(text or button.bodyText, x+x-x, y+y-y, w, h, tocolor ( 255, 255, 255, 255 ), 1, "default-bold")
	function onClick(button, state)
		if (button == "left") and (state == "up") then
			if isMouseIn(x,y,w,h) then
				outputChatBox("Clicked", 255, 255, 255)
			end
		end
	end
	addEventHandler("onClientClick", root, onClick)
	elseif type== 2 then
	dxDrawRectangle ( x, y, w, h, button.bodyColor )
	--dxDrawText(text or button.bodyText, x+x-x, y+y-y, w, h, tocolor ( 255, 255, 255, 255 ), 1, "default-bold")
	end
end
--EXAMPLES
local screenW, screenH = guiGetScreenSize()

--addEventHandler("onClientRender", root,
--	function()
		--drawWindow((screenW - 438) / 2, (screenH - 302) / 2, 438, 302, "Testing panel")
		--drawButton((screenW - 200) / 2, (screenH - 50) / 2, 200, 50, "Button")
		--showCursor(true)
--	end
--)

