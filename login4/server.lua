addEvent("loginPlayer", true)
addEventHandler("loginPlayer", root, function(player, login, pass, types)

	if not isGuestAccount(getPlayerAccount(player)) then 
		triggerClientEvent(player, "hideLogin", player)
	else 
		local acc = getAccount(login)
		if acc then
			if types == "Register" then
				triggerClientEvent(player, "errorLogin", player, "Аккаунт существует")
			else
				acc = getAccount(login, pass)
				if acc then
					logIn(player, acc, pass)
				else
					triggerClientEvent(player, "errorLogin", player, "Неверный пароль")
				end
			end
		else
			if types == "Login" then
				triggerClientEvent(player, "errorLogin", player, "Аккаунта не существует")
			else
				acc = addAccount(login, pass)
				if acc then
					logIn(player, acc, pass)
				else
					triggerClientEvent(player, "errorLogin", player, "Ошибка регистрации")
				end
			end
		end
	end

end)

addEventHandler("onPlayerLogin", root, function()
	triggerClientEvent(source, "hideLogin", source)
	for i=1, 20 do
		outputChatBox(" ", source)
	end
	outputChatBox("Bienvenido, al servidor mas molon de #ffffff'¡Jmaniacs!'#ff6400.", source, 255, 100, 0, true)
	outputChatBox("Te has logeado con la cuenta #ffffff"..getAccountName(getPlayerAccount(source)), source, 255, 100, 0, true)
end)