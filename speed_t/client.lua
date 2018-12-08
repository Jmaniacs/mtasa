local sx,sy = guiGetScreenSize()

function speed()
	local veh = getPedOccupiedVehicle(localPlayer)
	local fuel = math.floor(getElementData(veh,"fuel") or 11)
	local hpcar = math.floor(getElementHealth(veh) /10)
	local getspeed = math.floor(getElementSpeed(veh,"km/h"))
	if not veh then return end	
	dxDrawImage(sx-310,sy-193,307,177,"files/fon_speed.png")
	dxDrawImage(sx-235,sy-90,26,26,"files/light_r_off.png")
	dxDrawImage(sx-300,sy-90,26,26,"files/light_l_off.png")
	if(getElementData(veh,"rightflash")) then
		if (getTickCount() % 1400 >= 600) then
			dxDrawImage(sx-235,sy-90,26,26,"files/light_r_on.png")
		end
	end
	if(getElementData(veh,"leftflash")) then
		if (getTickCount() % 1400 >= 600) then
			dxDrawImage(sx-300,sy-90,26,26,"files/light_l_on.png")
		end
	end	
	if(getElementData(veh, "allflash")) then
		if(getTickCount() % 1400 >= 600) then
			dxDrawImage(sx-235,sy-90,26,26,"files/light_r_on.png")
			dxDrawImage(sx-300,sy-90,26,26,"files/light_l_on.png")
		end
	end	
	if(getVehicleEngineState(veh) == true) then	
		dxDrawImage(sx-125,sy-49,26,26,"files/engine_on.png")
	elseif(getVehicleEngineState(veh) == false) then
		dxDrawImage(sx-125,sy-49,26,26,"files/engine_off.png")
	end	
	if(getVehicleOverrideLights(veh) == 2) then	
		dxDrawImage(sx-180,sy-49,26,26,"files/lights_on.png")
	else
		dxDrawImage(sx-180,sy-49,26,26,"files/lights_off.png")
	end	
	if(isVehicleLocked(veh) == true) then	
		dxDrawImage(sx-70,sy-49,26,26,"files/door_close.png")
	elseif(isVehicleLocked(veh) == false) then
		dxDrawImage(sx-70,sy-49,26,26,"files/door_open.png")
	end		
	if(getspeed >= 100) then
		dxDrawText(string.format("%s",getspeed),sx-283,sy-145,sx-315,70,tocolor(255,255,255,255),2.5,"default-bold")
	elseif(getspeed >= 10) then
		dxDrawText(string.format("%s",getspeed),sx-273,sy-145,sx-315,70,tocolor(255,255,255,255),2.5,"default-bold")		
	elseif(getspeed <= 9) then
		dxDrawText(string.format("%s",getspeed),sx-265,sy-145,sx-315,70,tocolor(255,255,255,255),2.5,"default-bold")	
	end
	if(fuel >= 100) then
		dxDrawRectangle(sx-167,sy-146,fuel*1.4,3,tocolor(225, 150, 48, 255))
		dxDrawText(string.format("%s",fuel),sx-75,sy-173,15,15,tocolor(255,255,255,255),1.8)	
	elseif(fuel <= 15) then
		dxDrawRectangle(sx-167,sy-146,fuel*1.4,3,tocolor(213, 38, 38, 255))
		dxDrawText(string.format("%s",fuel),sx-60,sy-173,15,15,tocolor(255,255,255,255),1.8)		
	elseif(fuel <= 25) then
		dxDrawRectangle(sx-167,sy-146,fuel*1.4,3,tocolor(218,207, 96, 255))
		dxDrawText(string.format("%s",fuel),sx-60,sy-173,15,15,tocolor(255,255,255,255),1.8)				
	elseif(fuel <= 9) then
		dxDrawRectangle(sx-167,sy-146,fuel*1.4,3,tocolor(213, 38, 38, 255))
		dxDrawText(string.format("%s",fuel),sx-50,sy-173,15,15,tocolor(255,255,255,255),1.8)		
	elseif(fuel >= 10) then
		dxDrawRectangle(sx-167,sy-146,fuel*1.4,3,tocolor(225, 150, 48, 255))
		dxDrawText(string.format("%s",fuel),sx-60,sy-173,15,15,tocolor(255,255,255,255),1.8)		
	end
	if(hpcar >= 100) then
		dxDrawRectangle(sx-167,sy-87,hpcar*1.4,3,tocolor(210, 255, 0, 255))
		dxDrawText(string.format("%s",hpcar),sx-80,sy-114,15,15,tocolor(255,255,255,255),1.8)
	elseif(hpcar <= 50) then
		dxDrawRectangle(sx-167,sy-87,hpcar*1.4,3,tocolor(213, 38, 38, 255))
		dxDrawText(string.format("%s",hpcar),sx-70,sy-114,15,15,tocolor(255,255,255,255),1.8)	
	elseif(hpcar <= 65) then
		dxDrawRectangle(sx-167,sy-87,hpcar*1.4,3,tocolor(218,207, 96, 255))
		dxDrawText(string.format("%s",hpcar),sx-70,sy-114,15,15,tocolor(255,255,255,255),1.8)			
	elseif(hpcar <= 9) then
		dxDrawRectangle(sx-167,sy-87,hpcar*1.4,3,tocolor(213, 38, 38, 255))
		dxDrawText(string.format("%s",hpcar),sx-60,sy-114,15,15,tocolor(255,255,255,255),1.8)
	elseif(hpcar >= 10) then
		dxDrawRectangle(sx-167,sy-87,hpcar*1.4,3,tocolor(210, 255, 0, 255))
		dxDrawText(string.format("%s",hpcar),sx-70,sy-114,15,15,tocolor(255,255,255,255),1.8)		
	end	
end
addEventHandler("onClientRender",root,speed)



















































function getElementSpeed(theElement, unit)
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    return (Vector3(getElementVelocity(theElement)) * mult).length
end