function dxDrawAnimWindow(text,height,width,color,font,anim)
    local x,y = guiGetScreenSize()
 
    btwidth = width
    btheight = height/20
 
    local now = getTickCount()
    local elapsedTime = now - start
    local endTime = start + 1500
    local duration = endTime - start
    local progress = elapsedTime / duration
    local x1, y1, z1 = interpolateBetween ( 0, 0, 0, width, height, 255, progress, anim)
    local x2, y2, z2 = interpolateBetween ( 0, 0, 0, btwidth, btheight, btheight/11, progress, anim)
 
    posx = (x/2)-(x1/2)
    posy = (y/2)-(y1/2)
 
    dxDrawRectangle ( posx, posy-y2, x2, y2, color )
    dxDrawRectangle ( posx, posy, x1, y1, tocolor ( 45, 45, 45, 200 ) )
    dxDrawText ( text, 0, -(y1)-y2, x, y, tocolor ( 255, 255, 255, 255 ), z2,font,"center","center")   
 
 
end
show = true
showR =  true
local screenW, screenH = guiGetScreenSize()
name = getPlayerName(getLocalPlayer()):gsub("#%x%x%x%x%x%x", "")

addEventHandler("onClientResourceStart", root,
	function ()
	fadeCamera(false, 1)
	setTimer(function()
	fadeCamera(true)
	end, 2500, 1)
	local cam = getCamera()
	setElementPosition( cam, 90,90,0 )
	local car = createVehicle (500, 1805.47607, 873.46252, 10.33269, 0, 0, 0)
	local driver = createPed (124, 1805.47607, 883.46252, 10.33269 )
	warpPedIntoVehicle(driver, car, 0)
	attachElements(cam, car, -7,-6,3, -20,0,-35)
	setTimer(function()
	setPedControlState(driver, "accelerate", true)
	end, 1000, 1)
	setTimer(function()
	setPedControlState(driver, "accelerate", false)
	end, 40000, 1)
	--
	setTimer(function()
	fadeCamera(true)
	end, 41000, 1)
	--
	setTimer(function()
		destroyElement(car)
		destroyElement(driver)
		fadeCamera(true)
		local driver = createPed (124, 1805.47607, 883.46252, 10.33269 )
		local airplane = createVehicle (511, 2024.56982, -2109.48438, 140.63921, 0, 0, 0)
		attachElements(cam, airplane, -14,-17,3, -20,0,-35)
		warpPedIntoVehicle(driver, airplane, 0)
		setTimer(function()
			setPedControlState(driver, "accelerate", true)
			setPedControlState(driver, "special_control_up", true)
		end, 1000, 1)
	end, 43000, 1)
	setPlayerHudComponentVisible("all", false)
	function content()
		local color = tocolor ( 0, 0, 0, 200 )
			if show then
					dxDrawAnimWindow ( "Welcome, "..name, 520, 600, color, "default-bold", "OutBounce")
					Remember = guiCreateCheckBox(0.431, 0.505, 0.01, 0.02, "", true, true)
					Username = guiCreateEdit(0.46, 0.368, 0.1, 0.05, "Username", true)
					Password = guiCreateEdit(0.46, 0.45, 0.1, 0.05, "", true)   
					setElementAlpha (Remember, 0.20)
					guiSetProperty(Username,"NormalTextColour","FF000000")
					guiEditSetMaxLength(Username, 25)
					guiSetProperty(Password,"NormalTextColour","FF000000")
					guiEditSetMaxLength(Password, 25) 
					guiEditSetMasked ( Password, true )					
					remembertext = guiCreateLabel(0.44, 0.51, 0.07, 0.02, "Remember me", true)
					usernametext = guiCreateLabel(0.39, 0.38, 0.06, 0.02, "Username: ", true)
					guiSetFont(usernametext, "default-bold-small")
					guiLabelSetVerticalAlign(usernametext, "center")
					PasswordText = guiCreateLabel(0.39, 0.47, 0.05, 0.02, "Password:", true)
					guiSetFont(PasswordText, "default-bold-small")
					guiLabelSetVerticalAlign(PasswordText, "center")    
					showCursor(true)
					
					--local user, pw = loadLoginFromXML()
	
				if not( user == "" or pw == "") then
					guiCheckBoxSetSelected ( Remember, true )
					--guiSetText ( Username, tostring(user))
					--guiSetText ( Password, tostring(pw))
				else
					guiCheckBoxSetSelected ( Remember, false )
					--guiSetText ( Username, tostring(user))
					--guiSetText ( Password, tostring(pw))
				end
			end
			if not show then
				showCursor(false)
				destroyElement(Username)
				destroyElement(Password)
				destroyElement(Remember)
				destroyElement(usernametext)
				destroyElement(remembertext)
				destroyElement(PasswordText)
			end
	end
	
	--
	setTimer(function()
			start = getTickCount()
			addEventHandler ( "onClientRender", getRootElement(), content )
	end, 5000,1)
	--
	--outputChatBox ( "Starting GM", 255, 0, 0)
	
	end
)