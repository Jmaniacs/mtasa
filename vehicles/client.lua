local screenW, screenH = guiGetScreenSize()

function draw()
	local vehicle = getPedOccupiedVehicle ( localPlayer )
	dxDrawRectangle(screenW * 0.3333, screenH * 0.8478, screenW * 0.3340, screenH * 0.0444, tocolor(0, 0, 0, 175), false)
    dxDrawRectangle(screenW * 0.3292, screenH * 0.8144, screenW * 0.3424, screenH * 0.0289, tocolor(0, 0, 0, 209), false)
    dxDrawText("Bueno "..getPlayerName(localPlayer):gsub('#%x%x%x%x%x%x', '')..", Has ingresado a un nuevo vehiculo", screenW * 0.3285, screenH * 0.8133, screenW * 0.6715, screenH * 0.8433, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText(getVehicleName(vehicle) or "¡Mis bugeos han encendido!", screenW * 0.3333, screenH * 0.8478, screenW * 0.6674, screenH * 0.8922, tocolor(255, 255, 255, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
end

function join()
	addEventHandler("onClientRender", root, draw)
	setTimer(function()
	removeEventHandler("onClientRender", root, draw)
	end, 6000, 1)
end
addEvent("onJoin", true)
addEventHandler("onJoin", root, join)

function playerZone()
	local playerX, playerY, playerZ = getElementPosition ( localPlayer ) 
    local playerZoneName = getZoneName ( playerX, playerY, playerZ ) 
	
	dxDrawText(playerZoneName, (screenW * 0.2667) - 1, (screenH * 0.9433) - 1, (screenW * 0.7333) - 1, (screenH * 1.0000) - 1, tocolor(0, 0, 0, 67), 1.5, "bankgothic", "center", "bottom", false, false, false, false, false)
    dxDrawText(playerZoneName, (screenW * 0.2667) + 1, (screenH * 0.9433) - 1, (screenW * 0.7333) + 1, (screenH * 1.0000) - 1, tocolor(0, 0, 0, 67), 1.5, "bankgothic", "center", "bottom", false, false, false, false, false)
    dxDrawText(playerZoneName, (screenW * 0.2667) - 1, (screenH * 0.9433) + 1, (screenW * 0.7333) - 1, (screenH * 1.0000) + 1, tocolor(0, 0, 0, 67), 1.5, "bankgothic", "center", "bottom", false, false, false, false, false)
    dxDrawText(playerZoneName, (screenW * 0.2667) + 1, (screenH * 0.9433) + 1, (screenW * 0.7333) + 1, (screenH * 1.0000) + 1, tocolor(0, 0, 0, 67), 1.5, "bankgothic", "center", "bottom", false, false, false, false, false)
    dxDrawText(playerZoneName, screenW * 0.2667, screenH * 0.9433, screenW * 0.7333, screenH * 1.0000, tocolor(254, 254, 254, 128), 1.5, "bankgothic", "center", "bottom", false, false, false, false, false)
end


addEventHandler("onClientResourceStart", root, function()
	setPlayerHudComponentVisible("vehicle_name", false)
	setPlayerHudComponentVisible("area_name", false)
	if getElementData(localPlayer, "logged") then
		addEventHandler ( "onClientRender", root, playerZone)
	end
end)
maked = 0
function onClickVehicle ( button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement )
		if (state == "up") and (button == "right") then
			if getElementType(clickedElement) == "vehicle" then
				local cx, cy, cz = getElementPosition (clickedElement)
				local x, y, z = getElementPosition (localPlayer)
				if getDistanceBetweenPoints3D(cx, cy, cz, x, y, z) <= 5 then
					if maked == 0 then
						addEventHandler("onClientRender", root, function()
							dxDrawRectangle(absoluteX, absoluteY, screenW * 0.0861, screenH * 0.0278, tocolor(3, 0, 0, 211), false)
							dxDrawRectangle(absoluteX, absoluteY, screenW * 0.0861, screenH * 0.1111, tocolor(3, 0, 0, 122), false)
							dxDrawText("Vehicle", absoluteX, absoluteY, screenW * 0.0861, screenH * 0.0278, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
							dxDrawText("Informacion", absoluteX, absoluteY, screenW * 0.5306, screenH * 0.5344, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
							dxDrawText("Ver Maletero", absoluteX, absoluteY, screenW * 0.5306, screenH * 0.5633, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
							dxDrawText("Ver Mejoras", absoluteX, absoluteY, screenW * 0.5306, screenH * 0.5922, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
							dxDrawText("Cerrar Ventana", absoluteX, absoluteY, screenW * 0.5306, screenH * 0.6211, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
						end)
						maked = 1
					end
				end
			end
		end
end
addEventHandler ( "onClientClick", root, onClickVehicle )


