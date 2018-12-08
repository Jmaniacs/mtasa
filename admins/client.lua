local screenW, screenH = guiGetScreenSize()

function getPosition(player, cmd, pos)
	local x,y,z = getElementPosition(localPlayer)
	local _,_,r = getElementRotation(localPlayer)
	outputChatBox("XYZ: "..x..", "..y..", "..z, 255, 130, 20)
	outputChatBox("ROT: "..r, 255, 130, 20)
	outputChatBox("SKIN: "..getElementModel(localPlayer), 255, 130, 20)
	outputChatBox("Dimension: "..getElementDimension(localPlayer).." Interior: "..getElementInterior(localPlayer), 255, 130, 20)
	setClipboard(x..", "..y..", "..z)
end
addCommandHandler("getpos", getPosition)

function dxadmbar()
	if getElementData(localPlayer, "onDuty") or getElementData(localPlayer, "onDutySupport") then
	local players = getElementsByType("player")
	local vehicles = getElementsByType("vehicle")
	local peds = getElementsByType("ped")
	local objects = getElementsByType("object")
	dxDrawRectangle(screenW * 0.3236, screenH * 0.0000, screenW * 0.3535, screenH * 0.0333, tocolor(0, 0, 0, 165), false)
    dxDrawRectangle(screenW * 0.4007, screenH * 0.0333, screenW * 0.2000, screenH * 0.0333, tocolor(0, 0, 0, 165), false)
    dxDrawText("Jugadores: "..tostring(#players), screenW * 0.3257, screenH * 0.0000, screenW * 0.4007, screenH * 0.0289, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
    dxDrawText("Vehiculos: "..tostring(#vehicles), screenW * 0.4076, screenH * 0.0000, screenW * 0.4826, screenH * 0.0289, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
    dxDrawText("Objetos: "..tostring(#objects), screenW * 0.4896, screenH * 0.0000, screenW * 0.5646, screenH * 0.0289, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
    dxDrawText("Peds Totales: "..tostring(#peds), screenW * 0.5715, screenH * 0.0000, screenW * 0.6465, screenH * 0.0289, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
    --dxDrawText("Staff Level:"..triggerServerEvent("getRank", localPlayer), screenW * 0.4076, screenH * 0.0333, screenW * 0.5938, screenH * 0.0622, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
end

function admbar()
	state = not state
	if not state then
	addEventHandler("onClientRender", root, dxadmbar)
	elseif state then
	removeEventHandler("onClientRender", root, dxadmbar)
	end
end
addCommandHandler("admbar", admbar)

addEventHandler("onClientResourceStart", root, function()
	addEventHandler("onClientRender", root, dxadmbar)
end)

function toggleCursor () 
showCursor(not isCursorShowing()) 
end 
bindKey("m", "down", toggleCursor) 

addEventHandler("onClientPreRender",root,
	function ()
    local block, animation = getPedAnimation(localPlayer)
	if animation then
		dxDrawText("Presiona \"Espacio\" para detener la animacion", (screenW * 0.6229) - 1, (screenH * 0.8700) - 1, (screenW * 0.8833) - 1, (screenH * 0.9889) - 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, true, false, false, false)
		dxDrawText("Presiona \"Espacio\" para detener la animacion", (screenW * 0.6229) + 1, (screenH * 0.8700) - 1, (screenW * 0.8833) + 1, (screenH * 0.9889) - 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, true, false, false, false)
		dxDrawText("Presiona \"Espacio\" para detener la animacion", (screenW * 0.6229) - 1, (screenH * 0.8700) + 1, (screenW * 0.8833) - 1, (screenH * 0.9889) + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, true, false, false, false)
		dxDrawText("Presiona \"Espacio\" para detener la animacion", (screenW * 0.6229) + 1, (screenH * 0.8700) + 1, (screenW * 0.8833) + 1, (screenH * 0.9889) + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, true, false, false, false)
		dxDrawText("Presiona \"Espacio\" para detener la animacion", screenW * 0.6229, screenH * 0.8700, screenW * 0.8833, screenH * 0.9889, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "top", false, true, false, false, false)
	end
end )