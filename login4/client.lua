local screenWidth, screenHeight = guiGetScreenSize()
local background = "images/background.jpg"
local pane = "images/pane.png"
local top = "images/top.png"
local whiteform = "images/whiteform.png"
local greenform = "images/greenform.png"

local Fonts = 
{
	["Bold"] = "fonts/Roboto-Bold.ttf",
	["Medium"] = "fonts/Roboto-Medium.ttf",
	["Regular"] = "fonts/Roboto-Regular.otf"
}


local Bold = guiCreateFont(Fonts["Bold"], 16)
local Medium = guiCreateFont(Fonts["Medium"], 12)
local Regular = guiCreateFont(Fonts["Regular"], 16)
local Regular12 = guiCreateFont(Fonts["Regular"], 12)

local info = "images/logoprovince.png"

local _guiCreateEdit = guiCreateEdit
function guiCreateEdit(x, y, w, h, ...)

	local Edit = _guiCreateEdit(x, y, w, h, ...)

	guiCreateStaticImage(0, 0, w, 5, pane, false, Edit)
	guiCreateStaticImage(0, 0, 3, h, pane, false, Edit)
	guiCreateStaticImage(w-3, 0, 3, h, pane, false, Edit)
	guiCreateStaticImage(0, h-3, w, 3, pane, false, Edit)
    guiSetFont(Edit, Regular)
	guiSetProperty(Edit, "NormalTextColour", "FF727272")
    guiSetProperty(Edit, "ActiveSelectionColour", "FF545454")
	return Edit
end



local _guiCreateMemo = guiCreateMemo
function guiCreateMemo(x, y, w, h, ...)
	local Memo = _guiCreateMemo(x, y, w, h, ...)
	memo = guiCreateStaticImage(0, 0, w, 5, pane, false, Memo)
	memo2 = guiCreateStaticImage(0, 0, 3, h, pane, false, Memo)
	memo3 = guiCreateStaticImage(w-3, 0, 3, h, pane, false, Memo)
	memo4 = guiCreateStaticImage(0, h-3, w, 3, pane, false, Memo)
    setColor(memo, "ffFFFF")
	setColor(memo2, "ffFFFF")
	setColor(memo3, "ffFFFF")
	setColor(memo4, "ffFFFF")
	guiMemoSetReadOnly( Memo, true )
    guiSetEnabled(Memo, false)
    guiSetFont(Memo, Regular)
    guiSetProperty(Memo, "NormalTextColour", "FF727272")
    guiSetProperty(Memo, "ActiveSelectionColour", "FFF1B26D")
	return Memo
end

function guiCreateUnBtn(x, y, w, h, text, rood)
local UnBtn = guiCreateStaticImage(x, y, w, h, pane, false, rood)
local UnLabel = guiCreateLabel(0, 0, w, h, text, false, UnBtn)
guiLabelSetVerticalAlign(UnLabel, "center")
guiLabelSetHorizontalAlign(UnLabel, "center")
setColor(UnBtn, "545454")
guiSetFont(UnLabel, Regular)
end

function setColor(element, color)
guiSetProperty(element, "ImageColours", "tl:FF"..color.." tr:FF"..color.." bl:FF"..color.." br:FF"..color)
end


backgroundImage = guiCreateStaticImage(0, 0, screenWidth, screenHeight, background, false)
guiSetEnabled(backgroundImage, false)

topBackground = guiCreateStaticImage((screenWidth/2)-(400/2), (screenHeight/2)-(400/2), 400, 500, top, false)

infoMemo = guiCreateStaticImage(150, 20, 100, 100, info, false, topBackground)
infoMemo2 = guiCreateStaticImage(15, 180, 370, 40, whiteform, false, topBackground)
infoMemo3 = guiCreateStaticImage(15, 260, 370, 40, whiteform, false, topBackground)

local loginEdit = guiCreateEdit(35, 180, 330, 40, "Usuario", false, topBackground)
local passEdit = guiCreateEdit(35, 260, 330, 40, "*****", false, topBackground)
guiEditSetMasked(passEdit, true)
local loginBtn = guiCreateStaticImage(5, 320, 390, 70, greenform, false, topBackground)
local lblLoginBtn = guiCreateLabel(0, 0, 370, 65, "Logear", false, loginBtn)
guiLabelSetVerticalAlign(lblLoginBtn, "center")
guiLabelSetHorizontalAlign(lblLoginBtn, "center")
setColor(loginBtn, "3cb371")

	addEventHandler("onClientMouseEnter", root, function()
	if source == lblLoginBtn then
	setColor(loginBtn, "616161")
	end
	end)
	
	addEventHandler("onClientMouseLeave", root, function()
	if source == lblLoginBtn then
	setColor(loginBtn, "3cb371")
	end
	end)
    guiSetFont(lblLoginBtn, Regular)


local regLbl = guiCreateLabel(15, 455, 370, 25, "Registrarse", false, topBackground)
guiLabelSetVerticalAlign(regLbl, "center")
guiLabelSetHorizontalAlign(regLbl, "center")
guiSetFont(regLbl, Bold)
guiLabelSetColor(regLbl, 128, 128, 128)

local RegisterLine = guiCreateStaticImage(15*7, 480, 360/2, 1, pane, false, topBackground)
setColor(RegisterLine, "666666")


--local InfoLabel = guiCreateLabel(15, 755, 1650, 25, "Нет аккаунта?", false, topBackgroundDown)
--guiLabelSetVerticalAlign(InfoLabel, "center")
--guiLabelSetHorizontalAlign(InfoLabel, "center")
--guiSetFont(InfoLabel, Regular12)
--guiLabelSetColor(InfoLabel, 128, 128, 128)
--guiSetEnabled(InfoLabel, false)


addEventHandler("onClientMouseEnter", root, function()
	if source == regLbl then
		guiLabelSetColor(regLbl, 255, 255, 255)
	end
end)
addEventHandler("onClientMouseLeave", root, function()
	guiLabelSetColor(regLbl, 128, 128, 128)
end)

	
	function visibleLoginPanel(bool)
	showCursor(bool)
	guiSetVisible(topBackgroundDown, bool)
	guiSetVisible(topBackground, bool)
	guiSetVisible(shadowBackground, bool)
	guiSetVisible(backgroundImage, bool)
    end

    visibleLoginPanel(false)

function showLoginError(title)
	guiSetText(InfoLabel, title)
	setTimer(function()
		guiSetText(InfoLabel, "No cuenta?")
	end, 2000, 1)
end



addEventHandler("onClientGUIClick", root, function()
	if source == loginBtn or source == lblLoginBtn then
    triggerServerEvent("loginPlayer", localPlayer, localPlayer, guiGetText(loginEdit), guiGetText(passEdit), "Login")
	elseif source == regLbl or source == RegisterLine then 
	triggerServerEvent("loginPlayer", localPlayer, localPlayer, guiGetText(loginEdit), guiGetText(passEdit), "Register")
	end

end)

bindKey("enter", "down", function()
triggerServerEvent("loginPlayer", localPlayer, localPlayer, guiGetText(loginEdit), guiGetText(passEdit), "Login")
end)


addEvent("hideLogin", true)
addEventHandler("hideLogin", root, function() visibleLoginPanel(false) end)

addEvent("showLogin", true)
addEventHandler("showLogin", root, function() visibleLoginPanel(true) end)

addEventHandler("onClientResourceStart", resourceRoot, function() 
if not getElementData(localPlayer, "onLogin") then
visibleLoginPanel(true) 
end
end)

addEvent("errorLogin", true)
addEventHandler("errorLogin", root, function(title) showLoginError(title) end)
