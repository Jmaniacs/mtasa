function sendWindow ( vehicle, seat, jacked )
	triggerClientEvent(source, "onJoin", source)
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), sendWindow )