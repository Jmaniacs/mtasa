--JMANIACS
local pg = 0

function PlayerLogin(username,password,checksave)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount ( username, password )
			if ( account ~= false ) then
				logIn(source, account, password)
				triggerClientEvent (source,"hideLoginWindow",getRootElement())
				triggerClientEvent (source,"ShowMenuWindow",getRootElement())
				outputChatBox("#ffb872Buenas! #c9c9c9Te  #fc7474Saludo:3",source, 255,255,255, true)
				outputChatBox("#ffb872Bienvenido #c9c9c9Al server #fc7474Mas molon #c9c9c9por #fc7474Jmaniacs",source, 255,255,255, true)
				exports["notices"]:addNotification(source,"[LOGIN] You have sucessfuly Logged in! ","success")	
				
					if checksave == true then
						triggerClientEvent(source,"saveLoginToXML",getRootElement(),username,password)
					else
						triggerClientEvent(source,"resetSaveXML",getRootElement(),username,password)
					end
				
			else
				exports["notices"]:addNotification(source,"[ LOGIN ] Wrong username and/or password!",'error')
			end
		else
					exports["notices"]:addNotification(source,"[ LOGIN ] Please enter your password!!",'error')
		end
	else
			exports["notices"]:addNotification(source,"[ LOGIN ] Please enter your username!",'error')

	end
end
addEvent("onRequestLogin",true)
addEventHandler("onRequestLogin",getRootElement(),PlayerLogin)

--
local spawns = {
--x, y, z, rotZ
{ -12.0908203125, 1022.1513671875, 19.7421875, 90.0 },
{ -279.498046875, 1196.974609375, 19.74218758 },
{ -953.6103515625, 1034.251953125, 24.567481994629 },
{ -1550.666015625, 483.21484375, 7.1796875 },
{ -1994.2734375, -1848.8515625, 40.473342895508 },
{ -2386.5546875, -2208.2646484375, 33.2890625 },
{ -1621.6357421875, -2696.888671875, 48.5390625 },
{ 14.205078125, -2634.865234375, 40.32373046875 },
{ -580.7001953125, -227.1328125, 70.394302368164 },

}

function spawn(player)
local rnd = math.random(  #spawns )
spawnPlayer( player, spawns[rnd][1], spawns[rnd][2], spawns[rnd][3], spawns[rnd][4] )
setElementDimension(source, 0)
end


function PlayerSpawn ()
	local rnd = math.random(  #spawns )
	spawnPlayer( source, spawns[rnd][1], spawns[rnd][2], spawns[rnd][3], spawns[rnd][4] )
	fadeCamera (source, true)
	setElementDimension(source, 0)
	setCameraTarget (source, source)
	triggerClientEvent (source,"spawn",getRootElement())
	triggerClientEvent (source,"hideMenuWindow",getRootElement())
	exports["notices"]:addNotification(source,"[LOGIN] You Spawned, Enjoy! ","success")
end
addEvent ("onRequestSpawn", true)
addEventHandler("onRequestSpawn", getRootElement(),PlayerSpawn)

addEventHandler("onPlayerWasted", root,
function()
setTimer(spawn, 3000, 1, source)
end
)
--


function PlayerLogout(player)
	logOut ( player ) 
	triggerClientEvent (source,"hideMenuWindow",getRootElement())
	triggerClientEvent (source,"showLoginWindow",getRootElement())
	exports["notices"]:addNotification(source,"[LOGIN] Loggin Out...! ","success")
end
addEvent ("onRequestLogout", true)
addEventHandler ("onRequestLogout",getRootElement(), PlayerLogout)


--


function registerPlayer(username,password,passwordConfirm)
	if not (username == "") then
		if not (password == "") then
			if not (passwordConfirm == "") then
				if password == passwordConfirm then
					local account = getAccount (username,password)
					if (account == false) then
						local accountAdded = addAccount(tostring(username),tostring(password))
						if (accountAdded) then
				exports["notices"]:addNotification(source,"[REGISTER] You have sucessfuly registered! ","success")	
				else
											exports["notices"]:addNotification(source,"[ LOGIN ] An unknown error has occured! Please choose a different username/password and try again.",'error')

						end
					else
																	exports["notices"]:addNotification(source,"[ LOGIN ] An account with this username already exists!",'error')

					end
				else
			exports["notices"]:addNotification(source,"[ LOGIN ] Passwords do not match!",'error')

				end
			else
							exports["notices"]:addNotification(source,"[ LOGIN ] Please confirm your password!",'error')

			end
		else
			
										exports["notices"]:addNotification(source,"[ LOGIN ] Please enter a password!",'error')

		end
	else
												exports["notices"]:addNotification(source,"[ LOGIN ] Please enter a username you would like to register with!",'error')

	end
end
addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",getRootElement(),registerPlayer)

addEventHandler("onPlayerQuit",root,function ()
local account = getPlayerAccount(source)
	if (account and not isGuestAccount(account)) then
	end

end
)


addEventHandler("onPlayerLogin",root,function (prevAcc, currAcc, autoLogin)
local account = getPlayerAccount(source)

	if account then
	end
end

)

addEventHandler("onPlayerLogout", getRootElement(),
	function (prevAcc, currAcc)
	end )

	


