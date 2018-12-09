local screenW, screenH = guiGetScreenSize()

local sm = {}
sm.moov = 0
sm.object1,sm.object2 = nil,nil
 
local function removeCamHandler()
	if(sm.moov == 1)then
		sm.moov = 0
	end
end
 

function loginButton(button, state)
	if (button == "left") and (state == "up") then
		if isMouseInPosition(screenW * 0.0729, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344) then
			sendLogin()
		end
	end
end

function registerButton(button, state)
	if (button == "left") and (state == "up") then
		if isMouseInPosition(screenW * 0.1806, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344) then
			showRegister()
		end
	end
end

function drawLogin()
	--Title Bar
	dxDrawRectangle(screenW * 0.0681, screenH * 0.3333, screenW * 0.2062, screenH * 0.0278, tocolor(59, 108, 186, 240))
	dxDrawText("Login", screenW * 0.0660, screenH * 0.3333, screenW * 0.2743, screenH * 0.3611, tocolor(255, 255, 255, 255), 1.60, "default-bold", "center", "center")
	--Body Bar
	dxDrawRectangle(screenW * 0.0681, screenH * 0.3611, screenW * 0.2062, screenH * 0.2800, tocolor(0, 0, 0, 220))
	dxDrawText("Your Username", 105, 382, 245, 412, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "center")
	dxDrawText("Your Password", 105, 473, 245, 503, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "center")
	--Buttons
	--Login Button
	if isMouseInPosition(screenW * 0.0729, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344) then
		dxDrawRectangle(screenW * 0.0729, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344, tocolor(59, 108, 186, 255))
		dxDrawText("Login", screenW * 0.0729, screenH * 0.5933, screenW * 0.1632, screenH * 0.6278, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
		local cX, cY = getCursorPosition()
		dxDrawText("Click this button to login into your account", screenW * cX, screenH * cY - screenH * 0.06, screenW * 0.1632, screenH * 0.6278, tocolor(255, 255, 255, 255), 0.9, "arial", "left", "center")
	else
		dxDrawRectangle(screenW * 0.0729, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344, tocolor(53, 53, 53, 255))
		dxDrawText("Login", screenW * 0.0729, screenH * 0.5933, screenW * 0.1632, screenH * 0.6278, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
	end
	--Register Button
	if isMouseInPosition(screenW * 0.1806, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344) then
		dxDrawRectangle(screenW * 0.1806, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344, tocolor(59, 108, 186, 255))
		dxDrawText("Register", screenW * 0.1806, screenH * 0.5933, screenW * 0.2708, screenH * 0.6278, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
		local cX, cY = getCursorPosition()
		dxDrawText("Click this button to register a new account", screenW * cX, screenH * cY - screenH * 0.06, screenW * 0.1632, screenH * 0.6278, tocolor(255, 255, 255, 255), 0.9, "arial", "left", "center")
	else
		dxDrawRectangle(screenW * 0.1806, screenH * 0.5933, screenW * 0.0903, screenH * 0.0344, tocolor(53, 53, 53, 255))
		dxDrawText("Register", screenW * 0.1806, screenH * 0.5933, screenW * 0.2708, screenH * 0.6278, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
	end
	--	
end

usernameEdit = guiCreateEdit(0.07, 0.38, 0.20, 0.04, "", true)
guiEditSetMaxLength(usernameEdit, 15)
guiSetVisible(usernameEdit, false)


passwordEdit = guiCreateEdit(0.07, 0.48, 0.20, 0.04, "", true)
guiEditSetMasked(passwordEdit, true)
guiEditSetMaxLength(passwordEdit, 15)  
guiSetVisible(passwordEdit, false)


function showLogin()
	addEventHandler("onClientClick", root, loginButton)
	addEventHandler("onClientClick", root, registerButton)
	addEventHandler("onClientRender", root, drawLogin)
	--
	guiSetVisible(usernameEdit, true)
	guiSetVisible(passwordEdit, true)
end

function hideLogin()
	removeEventHandler("onClientClick", root, loginButton)
	removeEventHandler("onClientClick", root, registerButton)
	removeEventHandler("onClientRender", root, drawLogin)
	--
	guiSetVisible(usernameEdit, false)
	guiSetVisible(passwordEdit, false)
end



--Register

function reqRegisterButton(button, state)
	if (button == "left") and (state == "up") then
		if isMouseInPosition(screenW * 0.4028, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344) then
			reqRegister()
		end
	end
end

function cancelButton(button, state)
	if (button == "left") and (state == "up") then
		if isMouseInPosition(screenW * 0.5056, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344) then
			hideRegister()
		end
	end
end

function drawRegister()
	--Title Bar
	dxDrawRectangle(screenW * 0.3972, screenH * 0.3378, screenW * 0.2056, screenH * 0.0278, tocolor(59, 108, 186, 240))
	dxDrawText("Create An Account", screenW * 0.3972, screenH * 0.3378, screenW * 0.6028, screenH * 0.3656, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
	--Body Bar
	dxDrawRectangle(screenW * 0.3972, screenH * 0.3656, screenW * 0.2056, screenH * 0.3200, tocolor(0, 0, 0, 220))
	dxDrawText("Your Username", screenW * 0.4028, screenH * 0.4133, screenW * 0.5188, screenH * 0.4467, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "center")
	dxDrawText("Your Password", screenW * 0.4028, screenH * 0.5044, screenW * 0.5188, screenH * 0.5378, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "center")
	dxDrawText("Confirm Your Password", screenW * 0.4028, screenH * 0.5900, screenW * 0.5569, screenH * 0.6233, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "center")
	--Buttons
	if isMouseInPosition(screenW * 0.4028, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344) then
		dxDrawRectangle(screenW * 0.4028, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344, tocolor(59, 108, 186, 240))
		dxDrawText("Register", screenW * 0.4028, screenH * 0.6344, screenW * 0.4931, screenH * 0.6689, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
		local cX, cY = getCursorPosition()
		dxDrawText("Click this button to Register your new account", screenW * cX, screenH * cY - screenH * 0.03, screenW * 0.1632, screenH * 0.6278, tocolor(255, 255, 255, 255), 0.9, "arial", "left", "center")
	else
		dxDrawRectangle(screenW * 0.4028, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344, tocolor(53, 53, 53, 240))
		dxDrawText("Register", screenW * 0.4028, screenH * 0.6344, screenW * 0.4931, screenH * 0.6689, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
	end
	
	if isMouseInPosition(screenW * 0.5056, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344) then
		dxDrawRectangle(screenW * 0.5056, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344, tocolor(59, 108, 186, 240))
		dxDrawText("Cancel", screenW * 0.5056, screenH * 0.6344, screenW * 0.5958, screenH * 0.6689, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
		local cX, cY = getCursorPosition()
		dxDrawText("Click this button to cancel the account registration and close this window", screenW * cX, screenH * cY - screenH * 0.03, screenW * 0.1632, screenH * 0.6278, tocolor(255, 255, 255, 255), 0.9, "arial", "left", "center")
	else
		dxDrawRectangle(screenW * 0.5056, screenH * 0.6344, screenW * 0.0903, screenH * 0.0344, tocolor(53, 53, 53, 240))
		dxDrawText("Cancel", screenW * 0.5056, screenH * 0.6344, screenW * 0.5958, screenH * 0.6689, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center")
	end
end

usernameRegEdit = guiCreateEdit(0.40, 0.37, 0.20, 0.04, "", true)
guiSetVisible(usernameRegEdit, false)

passwordRegEdit = guiCreateEdit(0.40, 0.46, 0.20, 0.04, "", true)
guiEditSetMasked(passwordRegEdit, true)
guiSetVisible(passwordRegEdit, false)

passwordConfirmRegEdit = guiCreateEdit(0.40, 0.55, 0.20, 0.04, "", true)
guiEditSetMasked(passwordConfirmRegEdit, true)  
guiSetVisible(passwordConfirmRegEdit, false)


function showRegister()
	addEventHandler("onClientClick", root, reqRegisterButton)
	addEventHandler("onClientClick", root, cancelButton)
	addEventHandler("onClientRender", root, drawRegister)
	--
	guiSetVisible(usernameRegEdit, true)
	guiSetVisible(passwordRegEdit, true)
	guiSetVisible(passwordConfirmRegEdit, true)
end

function hideRegister()
	removeEventHandler("onClientClick", root, reqRegisterButton)
	removeEventHandler("onClientClick", root, cancelButton)
	removeEventHandler("onClientRender", root, drawRegister)
	--
	guiSetVisible(usernameRegEdit, false)
	guiSetVisible(passwordRegEdit, false)
	guiSetVisible(passwordConfirmRegEdit, false)
end
addEvent("hideRegister", true)
addEventHandler("hideRegister", localPlayer, hideRegister)


--Functions
function onJoin()
	showLogin()
	showCursor(true)
	fadeCamera(true, 3)
	setPlayerHudComponentVisible("all", false)
	smoothMoveCamera(1534.4621582031, 806.92742919922, 42.38240814209, 1595.5474853516, 931.59997558594, 17.697834014893, 1880.904296875, 1362.5452880859, 81.62922668457, 2239.3386230469, 1377.1484375, 23.209138870239, 40000)
end
addEvent("onJoin", true)
addEventHandler("onJoin", localPlayer, onJoin)


function sendLogin()
	local usernameText = guiGetText(usernameEdit)
	local passwordText = guiGetText(passwordEdit)
	if #usernameText >= 4 then
		if #passwordText >= 4 then
			triggerServerEvent("sendLogin", localPlayer, usernameText, passwordText)
		else
			outputChatBox("The Password Is Too Short")
		end
	else
		outputChatBox("The Usename Is Too Short")
	end
end

function reqRegister()
	local usernameRegText = guiGetText(usernameRegEdit)
	local passwordRegText = guiGetText(passwordRegEdit)
	local passwordConfirmRegText = guiGetText(passwordConfirmRegEdit)
	if #usernameRegText >= 4 then
		if #passwordRegText >= 4 then
			if passwordRegText == passwordConfirmRegText then
				triggerServerEvent("sendRegister", localPlayer, usernameRegText, passwordRegText)
			else
				outputChatBox("The Passwords Don't Match!")
			end
		else
			outputChatBox("The Password Is Too Short")
		end
	else
		outputChatBox("The Usename Is Too Short")
	end
end


function loginSucces()
	hideLogin()
	showCursor(false)
	removeCamHandler()
	setTimer(function()
		fadeCamera(true, 5)
		setCameraTarget(localPlayer)
		setPlayerHudComponentVisible("all", true)
	end, 5000, 1)
end
addEvent("loginSucces", true)
addEventHandler("loginSucces", localPlayer, loginSucces)







































local function camRender()
	if (sm.moov == 1) then
		local x1,y1,z1 = getElementPosition(sm.object1)
		local x2,y2,z2 = getElementPosition(sm.object2)
		setCameraMatrix(x1,y1,z1,x2,y2,z2)
	else
		removeEventHandler("onClientPreRender",root,camRender)
	end
end

function smoothMoveCamera(x1,y1,z1,x1t,y1t,z1t,x2,y2,z2,x2t,y2t,z2t,time)
	if(sm.moov == 1)then
		destroyElement(sm.object1)
		destroyElement(sm.object2)
		killTimer(timer1)
		killTimer(timer2)
		killTimer(timer3)
		removeEventHandler("onClientPreRender",root,camRender)
	end
	sm.object1 = createObject(1337,x1,y1,z1)
	sm.object2 = createObject(1337,x1t,y1t,z1t)
	setElementAlpha(sm.object1,0)
	setElementAlpha(sm.object2,0)
	setObjectScale(sm.object1,0.01)
	setObjectScale(sm.object2,0.01)
	moveObject(sm.object1,time,x2,y2,z2,0,0,0,"InOutQuad")
	moveObject(sm.object2,time,x2t,y2t,z2t,0,0,0,"InOutQuad")
	sm.moov = 1
	timer1 = setTimer(removeCamHandler,time,1)
	timer2 = setTimer(destroyElement,time,1,sm.object1)
	timer3 = setTimer(destroyElement,time,1,sm.object2)
	addEventHandler("onClientPreRender",root,camRender)
	return true
end

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