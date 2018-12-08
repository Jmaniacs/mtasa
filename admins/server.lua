function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

function isPedDrivingVehicle(ped)
    assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ isPedDrivingVehicle [ped/player expected, got " .. tostring(ped) .. "]")
    local isDriving = isPedInVehicle(ped) and getVehicleOccupant(getPedOccupiedVehicle(ped)) == ped
    return isDriving, isDriving and getPedOccupiedVehicle(ped) or nil
end

local connection = exports.mysql:conexion()

-- /setserverpassword - Cambia la contraseña del servidor
function changePw(player, cmd, password)
	if getElementData(player, "admin") then
		if (password) then
			setServerPassword(password)
			outputChatBox("#00FF00H#FFFFFFas cambiado la contraseña del servidor a "..password, player, 255, 255, 255, true)
		else
			setServerPassword("")
			outputChatBox("#00FF00H#FFFFFFas removido la contraseña del servidor", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("setserverpassword", changePw)

-- /goto - Ir a un jugador
function teleportToPlayer(player, cmd, target)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
			local x, y, z = getElementPosition(getPlayerFromPartialName(target))
			setElementPosition(player, x+1, y, z+1)
		else
			outputChatBox("#00FF00P#FFFFFForfavor, introduce un nombre valido (o su nombre parcial)", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("goto", teleportToPlayer, false, false)

-- /get - Trae un jugador a ti
function teleportHerePlayer(player, cmd, target)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
			local x,y,z = getElementPosition(player)
			setElementPosition(getPlayerFromPartialName(target), x+1, y, z+1)
		else
			outputChatBox("#00FF00P#FFFFFForfavor, introduce un nombre valido (o su nombre parcial)", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("get", teleportHerePlayer, false, false)

-- /settime - Cambia la hora del juego
function changeTime(player, cmd, hour, minute )
	if getElementData(player, "admin") or getElementData(player, "support") then
		if tonumber(hour) and tonumber(minute) then
			setTime (hour, minute)
			outputChatBox("#00FF00H#FFFFFFas cambiado el tiempo al #00FF00"..hour.."#FFFFFF:#00FF00"..minute, player, 255, 255, 255, true)
		else
			outputChatBox("#00FF00N#FFFFFFo reconozco ese horario", player, 255, 255, 255, true)
			outputChatBox("#00FF00SINTAXIS#FFFFFF: /"..cmd.." [hora] [minutos]", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("settime", changeTime)

-- /darvip - Dar Privilegios VIP a un jugador
function gVip(player, cmd, target)
	if getElementData(player, "admin") then
		if getElementData(getPlayerFromPartialName (target), "logged") then
			if (target) then
				local user = getElementData(getPlayerFromPartialName (target), "IDA")
				local query = dbQuery(connection, "UPDATE `accounts` SET `vip` = 1 WHERE ID =?", user)
				local result = dbPoll(query, -1)
				setElementData(getPlayerFromPartialName (target), "isVip", true, true)
				outputChatBox("#00FF00L#FFFFFFe has dado privilegios VIP al jugador "..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
				outputChatBox("#00FF00E#FFFFFFl Staff "..getPlayerName(player).." Te ha dado privilegios VIP", getPlayerFromPartialName (target), 255, 255, 255, true)
			else
				outputChatBox("#00FF00P#FFFFFForfavor, introduce un nombre valido (o su nombre parcial)", player, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("darvip", gVip)

-- /quitarvip - Quitar Privilegios VIP a un jugador
function qVip(player, cmd, target)
	if getElementData(player, "admin") then
		if (target) then
			local user = getElementData(getPlayerFromPartialName (target), "IDA")
			local query = dbQuery(connection, "UPDATE `accounts` SET `vip` = 0 WHERE ID =?", user)
			local result = dbPoll(query, -1)
			removeElementData(getPlayerFromPartialName (target), "isVip")
			outputChatBox("#00FF00L#FFFFFFe has quitado privilegios VIP al jugador "..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
			outputChatBox("#00FF00E#FFFFFFl Staff "..getPlayerName(player).." Te ha quitado privilegios VIP", getPlayerFromPartialName (target), 255, 255, 255, true)
		else
			outputChatBox("#00FF00P#FFFFFForfavor, introduce un nombre valido (o su nombre parcial)", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("quitarvip", qVip)

-- /staff - Verifica si hay staffs Online
function getStaffs(player, cmd)
	for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "admin") or getElementData(v, "support") then
		outputChatBox("|--------------Staff List----------------|", player, 255, 255, 255, true)
		outputChatBox("|- ["..getElementData(v, "ID").."] "..getPlayerName(v), player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("staff", getStaffs)
addCommandHandler("staffs", getStaffs)
addCommandHandler("admins", getStaffs)

-- /freeze - congela un jugador
function freezePlayer(player, cmd, target)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
			freezed = not freezed
			if freezed then
				setElementFrozen(getPlayerFromPartialName (target), true)
				outputChatBox("#00FF00H#FFFFFFas congelado al jugador #00FF00"..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
				outputChatBox("#00FF00H#FFFFFFas sido congelado por el Staff #00FF00"..getPlayerName(player), getPlayerFromPartialName (target), 255, 255, 255, true)
			elseif not freezed then
				setElementFrozen(getPlayerFromPartialName (target), false)
				outputChatBox("#00FF00H#FFFFFFas descongelado al jugador #00FF00"..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
				outputChatBox("#00FF00H#FFFFFFas sido descongelado por el Staff #00FF00"..getPlayerName(player), getPlayerFromPartialName (target), 255, 255, 255, true)
			end
		else
			outputChatBox("#00FF00P#FFFFFForfavororfavor, introduce un nombre valido (o su nombre parcial)", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("freeze", freezePlayer, false, false)

function consoleGive (player, cmd, weaponID, ammo)
	if getElementData(player, "admin") or getElementData(player, "support") then
			giveWeapon ( player, weaponID, ammo, true )   -- attempt to give the weapon, forcing it as selected weapon
	end
end
addCommandHandler ( "give", consoleGive )

-- /setskin - cambiale la skin a un jugador
function setSkin(player, cmd, target, skin)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
			if (skin) then
				setElementModel(getPlayerFromPartialName (target), skin)
				outputChatBox("#00FF00L#FFFFFFe has cambiado la skin del jugador #00FF00"..getPlayerName(getPlayerFromPartialName(target)).." #FFFFFFA la skin número #00FF00"..skin, player, 255, 255, 255, true)
				outputChatBox("#00FF00E#FFFFFFl Staff #00FF00"..getPlayerName(player).." #FFFFFFTe ha cambiado la skin a #00FF00"..skin, getPlayerFromPartialName (target), 255, 255, 255, true)
			else
				outputChatBox("#00FF00N#FFFFFFo puedo reconocer esa skin.", player, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setskin", setSkin, false, false)
addCommandHandler("ss", setSkin, false, false)

-- /setname - Cambiale el nombre a un jugador
function setName(player, cmd, target, name)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
			if (name) then
			setPlayerName(getPlayerFromPartialName (target), name)
			outputChatBox("#00FF00E#FFFFFFl Staff "..getPlayerName(player).." Te ha cambiado el nombre.", getPlayerFromPartialName (target), 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setname", setName, false, false)

-- /pm - Envia un mensaje privado a otro jugador
function pmHandler(player, cmd, target, ...)
    local recipient = getPlayerFromPartialName (target)
    if recipient then
		local query = dbQuery(connection, "SELECT * FROM `accounts`")
		local result = dbPoll(query, -1)
        local message = table.concat({...}, " ") 
        local recipientName = getPlayerName(recipient)
        local playerName = getPlayerName(player)
        outputChatBox("[PM] Enviado a " .. recipientName .. ": #FFFFFF" .. message, player, 255, 252, 79, true)
		outputDebugScript("[PM] Enviado a " .. recipientName .. ": #FFFFFF" .. message)
        outputChatBox("[PM] Recibido de " .. playerName .. ": #FFFFFF" .. message, recipient, 255, 252, 79, true)
    else
        outputChatBox("No encuentro la persona " .. recipientName, recipient, 255, 0, 0)
    end
end
addCommandHandler("pm", pmHandler)

local vehs = {}

-- /veh - Crea un vehiculo Temporal
function tempVeh(player, cmd, vehicle, color)
	if getElementData(player, "admin") or getElementData(player, "support") then
		local x, y, z = getElementPosition(player)
		local rx, ry, rz = getElementRotation(player)
		veh = createVehicle(vehicle, x, y, z, rx, ry, rz )
		setElementPosition(veh, x, y, z)
		warpPedIntoVehicle ( player, veh ) 
		--outputChatBox("Has creado el vehiculo temporal con la ID: ", player, 255, 255, 255)
		if color == nil then
			local r, g, b = math.random( 255 ), math.random( 255 ), math.random( 255 )
			setVehicleColor(veh, r, g, b)
		else
			setVehicleColor(veh, color)
		end
	end
end
addCommandHandler("veh", tempVeh)

-- /head - Quita o Coloca la cabeza a un jugador
function head(player, cmd, target)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
			headless = not headless
			if headless then
				setPedHeadless(getPlayerFromPartialName (target), true)
				outputChatBox("#00FF00L#FFFFFFe has descabezado a "..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
				outputChatBox("El Staff "..getPlayerName(player).." te ha descabezado totalmente!", getPlayerFromPartialName(target), 255, 255, 255, true)
			elseif not headless then
				setPedHeadless(getPlayerFromPartialName (target), false)
				outputChatBox("#00FF00L#FFFFFFe has colocado la cabeza a "..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
				outputChatBox("El Staff "..getPlayerName(player).." te ha colocado tu querida cabeza", getPlayerFromPartialName(target), 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("head", head)

-- /sethp - Cambia la vida de un jugador
function setHP(player, cmd, target, health)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if (target) then
				setElementHealth(getPlayerFromPartialName (target), health)
				outputChatBox("#00FF00L#FFFFFFe has colocado un porciento "..health.." de vida al jugador "..getPlayerName(getPlayerFromPartialName(target)), player, 255, 255, 255, true)
				outputChatBox("El Staff "..getPlayerName(player).." te ha cambiado tu vida a "..health, getPlayerFromPartialName(target), 255, 255, 255, true)
		end
	end
end
addCommandHandler("sethp", setHP)

-- /aheal - Cambia tu vida automaticamente al 100
function aHeal(player)
	if getElementData(player, "admin") or getElementData(player, "support") then
		outputChatBox("Te has curado tu vida a un 100%!", player, 255, 255, 255)
		setElementHealth(player, 100)
	end
end
addCommandHandler("aheal", aHeal)

-- /spec - Spectea un jugador
local lPos = { }
local specteando = { }
function spec(player, cmd, target)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if specteando[ player ] == true then
			if lPos[ player ] then
				local x, y, z = lPos[ player ].x, lPos[ player ].y, lPos[ player ].z
				setElementPosition( player, x, y, z )
				setCameraTarget( player, player )
				setElementFrozen( player, false )
				setElementAlpha( player, 255 )
			else
				setElementPosition( player, 0, 0, -0.9 )
				setElementFrozen( player, false )
				etElementAlpha( player, 255 )
			end
		else
			if target then
				local p_ = getPlayerFromPartialName(target)
				if p_ then
					local x, y, z = getElementPosition( player )
					lPos[ player ] = { x = x, y = y, z = z }
					specteando[ player ] = true	
					outputChatBox( "#00FF00A#FFFFFFhora estás specteando a #00FF00"..getPlayerName(getPlayerFromPartialName(target)), player, 0, 150, 0, true )
					setCameraTarget( player, p_ )
					setElementFrozen( player, true )
					setElementAlpha( player, 0 )
					setElementPosition( player, 0, 0, 0 )
				else
					outputChatBox( "#00FF00N#FFFFFFo se ha encontrado al jugador", player, 255, 0, 0, true )
				end
			else
				outputChatBox( "#00FF00/"..cmd.." #FFFFFF[nombre del jugador]", player, 255, 255, 255, true )
			end
		end
	end
end
addCommandHandler("spec", spec)

-- /x - Mover relativamente en x
function movex(player, cmd, x)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if not x then x = 1 end
		exports['core']:movePlayerRelative(player, x, 0, 0)
	end
end
addCommandHandler("x", movex, false, false)

-- /y - Mover relativamente en y
function movey(player, cmd, y)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if not y then y = 1 end
		exports['core']:movePlayerRelative(player, 0, y, 0)
	end
end
addCommandHandler("y", movey, false, false)

-- /z - Mover relativamente en z
function movez(player, cmd, z)
	if getElementData(player, "admin") or getElementData(player, "support") then
		if not z then z = 1 end
		exports['core']:movePlayerRelative(player, 0, 0, z)
	end
end
addCommandHandler("z", movez, false, false)