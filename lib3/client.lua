local window = {
	text = "Default Text",
	barColor = tocolor(0, 0, 0, 230),
	bodyColor = tocolor(0, 0, 0, 110),
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

function drawWindow(x, y, w, h, text, fontType)
	if draw then
		bar = dxDrawRectangle(x-15, y, w + 30, 30, window.barColor)
		if fontType == 1 or fontType == nil then
			barText = dxDrawText(text or window.text, x+x, y+y, w, 30, tocolor(255, 255, 255), 0.6, "bankgothic", "center", "center")
		elseif fontType == 2 then
			barText = dxDrawText(text or window.text, x+x, y+y, w, 30, tocolor(255, 255, 255), 1.2, "default-bold", "center", "center")
		end
		body = dxDrawRectangle(x, y+35, w, h, window.bodyColor)
		table.insert(draw, Panel)
	end
end

function drawButton(x, y, w, h, text)
	if draw then
		if isMouseInPosition(x, y, w, h) then
			hoverBody = dxDrawRectangle(x, y, w, h, buttonn.hoverColor)
			text = dxDrawText(text or buttonn.text, x+x, y+y, w, h, tocolor(66, 66, 66), 1.0, "default-bold", "center", "center")
		else
			body = dxDrawRectangle(x, y, w, h, buttonn.bodyColor)
			text = dxDrawText(text or buttonn.text, x+x, y+y, w, h, tocolor(255, 255, 255), 1.0, "default-bold", "center", "center")
		end
		table.insert(draw, Button)
	end
end

function drawEdit(x, y, w, h, text, button, state)
	--edit = guiCreateEdit(x, y, w, h, text or editBox.text, false)
	if draw then
		body = dxDrawRectangle(x, y, w, h, editBox.color2)
		outLine = dxDrawRectangle(x+3, y+3, w-6, h-6, editBox.color)
		--textt = guiGetText(edit)
		--guiSetAlpha(edit, 0)
		text = dxDrawText(text or editBox.text, x+3, y+6, w+w, h+h, tocolor(200, 200, 200), 1.0, "default-bold")
		if (button == "left") and (state == "up") then
			if isMouseInPosition( x, y, w, h) then
			--asd
			end
		end
	end
end
addEventHandler ( "onClientClick", root, drawEdit )

addEventHandler("onClientRender", root, function()
	drawWindow(455,200,300,300, "This is a testing text")
	--drawEdit(480,400,200,30, "Testing Edit")
	showCursor(true)
end)

