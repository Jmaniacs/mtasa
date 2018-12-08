local connection = exports.mysql:conexion()

function sendR(player, target, reason, situacion)
	local time = getRealTime()
	local year = time.year
	local month = time.month
	local day = time.monthday
	local hour = time.hour
	
	local insert = dbQuery(connection, "INSERT INTO `reports` (fecha, reportante, reportado, razon, situacion) VALUES (?,?,?,?,?)", year.."/"..month.."/"..day, getPlayerName(source), getPlayerName(target), reason, situacion)
	local result = dbPoll(insert, -1)
end
addEvent("sendReport", true)
addEventHandler("sendReport", root, sendR)


function getR(player)
	local getAll = dbQuery(connection, "SELECT * FROM `reports` ORDER BY ID ASC")
	local result = dbPoll(getAll, -1)
	triggerClientEvent("agregarColumnas", root, result)
end
addEvent("triggerR", true)
addEventHandler("triggerR", root, sendR)
