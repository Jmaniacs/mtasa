local players = getElementsByType("player")
local screenW, screenH = guiGetScreenSize()
local reasons =  {
	"DeathMatch/DM",
	"NRE",
	"NRA",
	"NRH",
	"CJ",
	"RK",
	"IOOC",
	"MG",
}

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

window = guiCreateWindow(0.36, 0.32, 0.27, 0.38, "Panel de Reportes", true)
guiWindowSetMovable(window, false)
guiWindowSetSizable(window, false)
guiSetVisible(window, false)

playerlist = guiCreateComboBox(0.03, 0.17, 0.43, 0.31, "", true, window)
for i, v in ipairs(players) do
	guiComboBoxAddItem(playerlist, getPlayerName(v))
end
label = guiCreateLabel(0.03, 0.09, 0.43, 0.07, "Selecciona un jugador", true, window)
guiSetFont(label, "default-bold-small")
guiLabelSetVerticalAlign(label, "center")
razones = guiCreateComboBox(0.54, 0.17, 0.43, 0.31, "", true, window)
for i, v in ipairs(reasons) do
	guiComboBoxAddItem(razones, v)
end
label2 = guiCreateLabel(0.54, 0.09, 0.43, 0.07, "Selecciona una razon", true, window)
guiSetFont(label2, "default-bold-small")
guiLabelSetHorizontalAlign(label2, "right", false)
guiLabelSetVerticalAlign(label2, "center")
situation = guiCreateMemo(10, 175, 366, 103, "", false, window)
send = guiCreateButton(0.03, 0.87, 0.44, 0.09, "Enviar Reporte", true, window)
guiSetProperty(send, "NormalTextColour", "FFAAAAAA")
cancel = guiCreateButton(0.52, 0.87, 0.44, 0.09, "Cancelar Reporte", true, window)
guiSetProperty(cancel, "NormalTextColour", "FFAAAAAA")
label3 = guiCreateLabel(0.03, 0.46, 0.31, 0.06, "Describe la situacion", true, window)
guiSetFont(label3, "default-bold-small")
guiLabelSetVerticalAlign(label3, "center")    


function create()
	if getElementData(localPlayer, "logged") then
		guiSetVisible(window, true)
		addEventHandler("onClientGUIClick", send, enviar)
		addEventHandler("onClientGUIClick", cancel, cerrar)
		showCursor(true)
	end
end
addCommandHandler("report", create)
addCommandHandler("reportar", create)
bindKey("F2", "down", create)

function cerrar()
	guiSetVisible(window, false)
	removeEventHandler("onClientGUIClick", send, enviar)
	removeEventHandler("onClientGUIClick", cancel, cerrar)
	showCursor(false)
end

function sendAdmin(player, target)
	if getElementData(localPlayer, "admin") or getElementData(localPlayer, "support") then
		outputChatBox("#00ff00--------------------------Admin Notification----------------------------", 255, 255, 255, true)
		outputChatBox("Nuevo reporte, #ffffffEl jugador #00ff00"..player.." #ffffffHa reportado al jugador #00ff00"..target, 255, 255, 255, true)
		outputChatBox("#00ff00--------------------------------------------------------------------------------", 255, 255, 255, true)
	end
end

function enviar(thePlayer)
	local situacion = guiGetText(situation)
	local itemP = guiComboBoxGetSelected(playerlist)
	local player = guiComboBoxGetItemText(playerlist, itemP)
	if #situacion >=15 then
		outputChatBox("Has reportado al Jugador "..player, 255, 255, 255)
		local target = getPlayerFromPartialName(player)
		local itemR = guiComboBoxGetSelected(razones)
		local reason = guiComboBoxGetItemText(razones, itemR)
		triggerServerEvent("sendReport", localPlayer, thePlayer, target, reason, situacion)
		cerrar()
		sendAdmin(getPlayerName(localPlayer), player)
	else
		outputChatBox("Oh, Vamos, ¿Encerio crees que enviare un reporte con tan poca informacion?, ¡Dame un poco mas de ella!", 255, 255, 255)
	end
end


window2 = guiCreateWindow(0.20, 0.26, 0.60, 0.47, "Admins Reports", true)
guiWindowSetSizable(window2, false)
guiSetVisible(window2, false)
		
gridlist = guiCreateGridList(0.01, 0.07, 0.79, 0.91, true, window2)
guiGridListAddColumn(gridlist, "ID", 0.2)
guiGridListAddColumn(gridlist, "Reportante", 0.2)
guiGridListAddColumn(gridlist, "Reportado", 0.2)
guiGridListAddColumn(gridlist, "Situacion", 0.2)
addEvent("agregarColumnas", true)
addEventHandler("agregarColumnas", root, function(result)
	for i, v in ipairs(result) do
        local row = guiGridListAddRow(gridlist)
        guiGridListSetItemText(gridlist, row, 1, v.ID, false, false)
        guiGridListSetItemText(gridlist, row, 2, v.reportante, false, false)
        guiGridListSetItemText(gridlist, row, 3, v.reportado, false, false)
        guiGridListSetItemText(gridlist, row, 4, v.situacion, false, false)
    end
end)
label = guiCreateLabel(0.81, 0.07, 0.18, 0.22, "Para inspeccionar un reporte, haz doble click en el y podras ver los detalles", true, window2)
guiSetFont(label, "default-bold-small")
guiLabelSetHorizontalAlign(label, "left", true)    
botonCerrar = guiCreateButton(0.81, 0.88, 0.18, 0.10, "Cerrar", true, window2)
guiSetProperty(botonCerrar, "NormalTextColour", "FFAAAAAA")

function create()
	if getElementData(localPlayer, "logged") and getElementData(localPlayer, "support") or getElementData(localPlayer, "admin") then
		guiSetVisible(window2, true)
		addEventHandler("onClientGUIClick", botonCerrar, cerrar2)
		showCursor(true)
	end
end
addCommandHandler("reportes", create)

function cerrar2()
	guiSetVisible(window2, false)
	removeEventHandler("onClientGUIClick", botonCerrar, cerrar2)
	showCursor(false)
end
