
function register_func ( player, username, passwort)
        local acc = addAccount(username,passwort)
	    if acc then
	           logIn(player,acc,passwort)
	           outputChatBox("#FFFFFF[INFO]#FF9900Te Has Registrado Con Exito!",player,255,255,255,true)
	           triggerClientEvent(player,"closeLoginPanel",player)
	   
	    else
	
	           outputChatBox("#FFFFFF[INFO]#FF9900Una Cuenta Ya Existe Con Este Nombre, Porfavor Elija Otra!",player,255,255,255,true)
		
        end
	 
end
addEvent("register",true)
addEventHandler("register", getRootElement(),register_func)


function login_func ( player, username, passwort)

        local acc = getAccount(username,passwort)
   if acc then
        logIn(player,acc,passwort)
	    outputChatBox("#FFFFFF[INFO]#FF9900Has Inciado Sesion Correctamente!",player,255,255,255,true)
	    outputChatBox("#FFFFFF[INFO]#FF9900Bienvenido Nuevamente: "..getPlayerName(player),player,255,255,255,true)
	    triggerClientEvent(player,"closeLoginPanel",player)
	   
    else
   
        outputChatBox("#FFFFFF[INFO]#FF9900Tu Contraseña Introducida o Nombre de Usuario es incorrecto,Verifique MAYUSCULAS!",player,255,255,255,true)
		
    end
   
end
addEvent("login",true)
addEventHandler("login",getRootElement(),login_func)