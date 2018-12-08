show = true
showR =  true
showM = true
showP = true
showRP = true
name = getPlayerName(getLocalPlayer()):gsub("#%x%x%x%x%x%x", "")
function editLogin()
if show then
			
			
		Remember = guiCreateCheckBox(0.431, 0.505, 0.01, 0.02, "", true, true)
        Username = guiCreateEdit(0.46, 0.368, 0.1, 0.05, "Username", true)
        Password = guiCreateEdit(0.46, 0.45, 0.1, 0.05, "", true)   
		setElementAlpha (Remember, 0.20)
		guiSetProperty(Username,"NormalTextColour","FF000000")
		guiEditSetMaxLength(Username, 25)
		guiSetProperty(Password,"NormalTextColour","FF000000")
		guiEditSetMaxLength(Password, 25) 
		guiEditSetMasked ( Password, true )					
		
			
			
	

local user, pw = loadLoginFromXML()
	
	if not( user == "" or pw == "") then
		guiCheckBoxSetSelected ( Remember, true )
		guiSetText ( Username, tostring(user))
		guiSetText ( Password, tostring(pw))
	else
		guiCheckBoxSetSelected ( Remember, false )
		guiSetText ( Username, tostring(user))
		guiSetText ( Password, tostring(pw))
	end
end
if not show then

destroyElement(Username)
	destroyElement(Password)
	destroyElement(Remember)
	

end
end

function editRegister()
if showR then
	UsernameRegister = guiCreateEdit(0.46, 0.368, 0.1, 0.05, "Username", true)
    PasswordRegister = guiCreateEdit(0.46, 0.45, 0.1, 0.05, "Password", true)
    ConfirmPasswordRegister = guiCreateEdit(0.46, 0.53, 0.1, 0.05, "Password", true)
	guiEditSetMaxLength(PasswordRegister, 25) 
	guiEditSetMasked ( PasswordRegister, true )	
	guiEditSetMaxLength(ConfirmPasswordRegister, 25) 
	guiEditSetMasked ( ConfirmPasswordRegister, true )	
end			
if not showR then

	destroyElement(UsernameRegister)
	destroyElement(PasswordRegister)
	destroyElement(ConfirmPasswordRegister)
end
end

function editMenu()
if showM then 
end			
if not showR then

end
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

local screenW, screenH = guiGetScreenSize()
local sx,sy = screenW/1440,screenH/900

 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  LOGIN PAGE  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 
 
 myFont = dxCreateFont( "images/Dosis.ttf", 20 )
 
    function loginPage()

show = true
	----
	dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "images/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "images/LoginP.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   end

 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  MENU PAGE  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	function menuPage ()
	showM = true
   --
	dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "images/Menu.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawText("#-*Name: "..name, (screenW * 0.2000) - 1, (screenH * 0.0067) - 1, (screenW * 0.4757) - 1, (screenH * 0.0567) - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
    dxDrawText("#-*Name: "..name, (screenW * 0.2000) + 1, (screenH * 0.0067) - 1, (screenW * 0.4757) + 1, (screenH * 0.0567) - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
    dxDrawText("#-*Name: "..name, (screenW * 0.2000) - 1, (screenH * 0.0067) + 1, (screenW * 0.4757) - 1, (screenH * 0.0567) + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
    dxDrawText("#-*Name: "..name, (screenW * 0.2000) + 1, (screenH * 0.0067) + 1, (screenW * 0.4757) + 1, (screenH * 0.0567) + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
    dxDrawText("#-*Name: "..name, screenW * 0.2000, screenH * 0.0067, screenW * 0.4757, screenH * 0.0567, tocolor(255, 254, 254, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
   end
   
   
  --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  PAGE  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	function page ()
	showP = true
   --
   dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "images/Pa.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   end
    
  
 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  REGISTER PAGE  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    function registerPage()
	showR = true
	dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "images/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "images/RegisterP.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end


--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function onClickBtnLogin(_,state) --При нажатии на кнопку Login
	if state == "up" then
	if isMouseInPosition(screenW * 0.4354, screenH * 0.5611, screenW * 0.1250, screenH * 0.0489) then
		--- LOGIN BUTTON
		showM = true
			username = guiGetText(Username)
			
			password = guiGetText(Password)
				if guiCheckBoxGetSelected ( Remember ) == true then
					checksave = true
				else
					checksave = false
				end
			triggerServerEvent("onRequestLogin",getLocalPlayer(),username,password,checksave)
		
	end
	
	if isMouseInPosition(screenW * 0.4354, screenH * 0.6256, screenW * 0.1250, screenH * 0.0478) then
	show =  false
	-- REGISTER BUUTTON
	removeEventHandler( "onClientRender",root, loginPage ) 	
	editLogin()
    removeEventHandler( "onClientClick", root, onClickBtnLogin )
	editRegister()
	addEventHandler("onClientRender", root,registerPage)
	
	addEventHandler( "onClientClick", root, onClickBtnRegister )

	end
end
end

function onClickBtnSpawn(_,state) --При нажатии на кнопку Login
	if state == "up" then
	if isMouseInPosition(screenW * 0.0000, screenH * 0.0000, screenW * 0.1958, screenH * 0.1367) then
		--- SPAWN BUTTON
		showM = false
			
		
		triggerServerEvent("onRequestSpawn",getLocalPlayer())
		
	end
end
end

function onClickBtnLogout(_,state) --goes to the login and logout the account
	if state == "up" then
	if isMouseInPosition(screenW * 0.2076, screenH * 0.9300, screenW * 0.1062, screenH * 0.0700) then
		--- LOGOUT BUTTON
		showM = false
		showL = true
		
		editLogin()
		triggerServerEvent("onRequestLogout",getLocalPlayer())
	end
end
end


function onClickBtnRegister(_,state) --При нажатии на кнопку Register and Cofirm
	if state == "up" then
	--REGISTER
		if isMouseInPosition(screenW * 0.4361, screenH * 0.6000, screenW * 0.1243, screenH * 0.0500)then
				
			username = guiGetText(UsernameRegister)
			password = guiGetText(PasswordRegister)
			passwordConfirm = guiGetText(ConfirmPasswordRegister)
			triggerServerEvent("onRequestRegister",getLocalPlayer(),username,password,passwordConfirm)
		end
		--- BACK
		if isMouseInPosition(screenW * 0.4361, screenH * 0.6611, screenW * 0.1243, screenH * 0.0500) then
		showR = false
	editRegister()
	removeEventHandler("onClientRender", root,registerPage)

	removeEventHandler( "onClientClick", root, onClickBtnRegister )
show = true
editLogin()

addEventHandler("onClientRender", root,loginPage)
addEventHandler( "onClientClick", root, onClickBtnLogin )
		
			
		end
	end
end

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function loadLoginFromXML() --Загрузка логина и пароля из XML
	local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
    local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
    local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
    if usernameNode and passwordNode then
        return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
    else
		return "", ""
    end
    xmlUnloadFile ( xml_save_log_File )
end
 
 
function saveLoginToXML(username, password) --Сохрание логина и пароля в XML
    local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
	if (username ~= "") then
		local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
		if not usernameNode then
			usernameNode = xmlCreateChild(xml_save_log_File, "username")
		end
		xmlNodeSetValue (usernameNode, tostring(username))
	end
	if (password ~= "") then
		local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
		if not passwordNode then
			passwordNode = xmlCreateChild(xml_save_log_File, "password")
		end		
		xmlNodeSetValue (passwordNode, tostring(password))
	end
    xmlSaveFile(xml_save_log_File)
    xmlUnloadFile (xml_save_log_File)
end
addEvent("saveLoginToXML", true)
addEventHandler("saveLoginToXML", getRootElement(), saveLoginToXML)



function resetSaveXML() --Сохрание логина и пароля в XML
		local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
		if not xml_save_log_File then
			xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
		end
		if (username ~= "") then
			local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
			if not usernameNode then
				usernameNode = xmlCreateChild(xml_save_log_File, "username")
			end
		end
		if (password ~= "") then
			local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
			if not passwordNode then
				passwordNode = xmlCreateChild(xml_save_log_File, "password")
			end		
			xmlNodeSetValue (passwordNode, "")
		end
		xmlSaveFile(xml_save_log_File)
		xmlUnloadFile (xml_save_log_File)
end
addEvent("resetSaveXML", true)
addEventHandler("resetSaveXML", getRootElement(), resetSaveXML)

function showLogin()
	setPlayerHudComponentVisible ("radar", false)
	exports["notices"]:addNotification("[ LOGIN ] Welcome to Surviving Zone",'info')
	editLogin()
	addEventHandler("onClientRender", root,loginPage)
	sound = playSound( "images/music.mp3" )
	addEventHandler( "onClientClick", root, onClickBtnLogin )
	
	guiSetInputEnabled(true)
			showChat(false)
			showCursor(true)
end
addEvent("showLoginWindow", true)
addEventHandler("showLoginWindow", getRootElement(), showLogin)
addEventHandler("onClientResourceStart",resourceRoot,showLogin)

function showMenu()

	setPlayerHudComponentVisible ("radar", false)
	fadeCamera(true, 2)
	-- set the player's camera to a fixed position, looking at a fixed point
	local cam = setCameraMatrix( 96.05954, -51.78603, 3.25764, 87.75751, -30.85929, 0.66423)
	local pj = createPed ( 0, 88.67029, -42.73542, 0.86604, 220 )
	local pj2 = createPed ( 7, 89.7029, -39.73542, 0.86604, 220 )
	local veh = createVehicle ( 422, 88.67029, -37.73542, 0.86604, 0, 0, 130 )
	setPedAnimation(pj, "Crack", "Bbalbat_Idle_01")
	setPedAnimation(pj2, "dancing", "dance_loop")
	addPedClothes ( pj, "moto", "moto", 16 ) 
	addPedClothes ( pj, "player_torso", "torso", 0 ) 
	addPedClothes ( pj, "player_legs", "legs", 2) 
	setPedStat(pj, 23, 1000)
	setElementDimension ( pj, 666 )
	setElementDimension ( pj2, 666 )
	setElementDimension ( veh, 666 )
	setElementDimension (source, 666)	
	editMenu()
	addEventHandler("onClientRender", root,menuPage)
	addEventHandler( "onClientClick", root, onClickBtnSpawn )
	addEventHandler( "onClientClick", root, onClickBtnLogout )
	
	guiSetInputEnabled(true)
			showChat(false)
			showCursor(true)
end

addEvent("ShowMenuWindow", true)
addEventHandler("ShowMenuWindow", getRootElement(), showMenu)

function spawn()

	setPlayerHudComponentVisible ("radar", true)
	guiSetInputEnabled(false)
			showChat(true)
			showCursor(false)
end

addEvent("spawn", true)
addEventHandler("spawn", getRootElement(), spawn)


function hideMenuWindow() --Функция закрытия логин панели
	setPlayerHudComponentVisible ("radar", true)
showM = false
	if (pj == 1) then
	destroyElement(pj)
	end
	guiSetInputEnabled(false)
	showCursor(false)
	showChat(true)
	removeEventHandler( "onClientRender",root, menuPage ) 	
	removeEventHandler( "onClientClick",root, onClickBtnSpawn ) 	
	removeEventHandler( "onClientClick",root, onClickBtnLogout ) 
end

addEvent("hideMenuWindow", true)
addEventHandler("hideMenuWindow", getRootElement(), hideMenuWindow)

function showPage()
	if showP == false then
	showP = true
	addEventHandler("onClientRender", root,page)
	else
	showP = false
	RemoveEventHandler("onClientRender", root,page)
	end
end

bindKey ("F10", "down", showPage)

function hideLoginWindow() --Функция закрытия логин панели
	setPlayerHudComponentVisible ("radar", false)
	show = false
	guiSetInputEnabled(false)
	showCursor(true)
	showChat(false)
	stopSound( sound)
	removeEventHandler( "onClientRender",root, loginPage ) 	
	editLogin()
    removeEventHandler( "onClientClick", root, onClickBtnLogin )	
	removeEventHandler( "onClientClick", root, onClickBtnRegister )

end
addEvent("hideLoginWindow", true)
addEventHandler("hideLoginWindow", getRootElement(), hideLoginWindow)

