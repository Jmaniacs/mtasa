local window = {
	text = "Default Text",
	barColor = tocolor(0, 0, 0, 230),
	bodyColor = tocolor(0, 0, 0, 110),
	bodyInsideColor = tocolor(0, 0, 0, 170),
}

local buttonn = {
	text = "Default Text",
	bodyColor = tocolor(0, 0, 0, 220),
	hoverColor = tocolor(200, 200, 200, 220),
	clickedColor = tocolor(244, 78, 66, 220),
	clickedText = "Clicked!",
}

local editBox = {
	text = "Default Text",
	color = tocolor(0, 0, 0, 220),
	color2 = tocolor(200, 200, 200, 220),
}

local draw = {}

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

-- Modified version for DX Text
function isCursorOverText(posX, posY, sizeX, sizeY)
    if(isCursorShowing()) then
        local cX, cY = getCursorPosition()
        local screenWidth, screenHeight = guiGetScreenSize()
        local cX, cY = (cX*screenWidth), (cY*screenHeight)
        if(cX >= posX and cX <= posX+(sizeX - posX)) and (cY >= posY and cY <= posY+(sizeY - posY)) then
            return true
        else
            return false
        end
    else
        return false	
    end
end

function drawWindow(x, y, w, h, text, font)
	if draw then
		bar = dxDrawRectangle(x, y, w, 30, window.barColor)
		barText = dxDrawText(text or window.text, x+x, y+y, w, 30, tocolor(255, 255, 255), 0.7, "bankgothic" or font, "center", "center")
		body = dxDrawRectangle(x, y+30, w, h, window.bodyColor)
		bodyInside = dxDrawRectangle(x+5, y+30, w-10, h-5, window.bodyInsideColor)
	end
end

local screenW, screenH = guiGetScreenSize()

function dx()
	drawWindow(screenW * 0.5840, screenH * 0.3611, screenW * 0.2882, screenH * 0.4633, "This is a testing text")
end

function bind()
	state = not state
	if state then
	addEventHandler("onClientRender", root, dx)
	elseif not state then
	removeEventHandler("onClientRender", root, dx)
	end
end
bindKey("F1", "down", bind)