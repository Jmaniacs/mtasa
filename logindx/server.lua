local connection = exports.mysql:conexion()

addEventHandler("onPlayerJoin", root, function()
	triggerClientEvent("onJoin", source)
	local name = getPlayerName(source):gsub("#%x%x%x%x%x%x", "")
	setPlayerName(source, name)
	outputChatBox("Welcome to "..getServerName(), source, 255, 255, 255)
end)

function sendLogin(username, password)
	local account = getAccount (username, password)
	if ( account ~= false ) then
		logIn(client, account, password)
		fadeCamera(client, false)
		triggerClientEvent("loginSucces", client)
		spawnPlayer(client, 1675.3729248047, 1447.8293457031, 10.787599563599, 270, math.random(7, 312) or 0)
	else
		outputChatBox("Wrong Username/Password", client, 255, 255, 255)
	end
end
addEvent("sendLogin", true)
addEventHandler("sendLogin", root, sendLogin)


function sendRegister(username, password)
	local account = getAccount (username, password)
	if (account == false) then
		local accountAdded = addAccount(username, password)
		if (accountAdded) then	
			outputChatBox("You have sucessfuly registered!", client, 255, 255, 255)
			triggerClientEvent("hideRegister", client)
		else
			outputChatBox("An error has occured! Please choose a different username/password and try again", client, 255, 255, 255)
		end
	else
		outputChatBox("An account with this username already exists!", client, 255, 255, 255)
	end
end
addEvent("sendRegister", true)
addEventHandler("sendRegister", root, sendRegister)