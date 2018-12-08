--Jmaniacs
--Dont Remove Credits, Please :)

local lp = getLocalPlayer()
local screenW, screenH = guiGetScreenSize()
local font = dxCreateFont("files/font.otf", 11)
local font2 = dxCreateFont("files/font2.otf", 11)
hud = 1
texto = 1

local text1 = {
	text = "Retrieving Info from the J.A.R.V.I.S. Server.  Waiting.. Waiting... Waiting... Connection: [FAILED]",
	text2 = "Typing Errors to the database of the J.A.R.V.I.S Server, Please Contact to the Developer."
}

function mainhHud()
	health = math.floor (getElementHealth(lp))
	name = getPlayerName(getLocalPlayer()):gsub("#%x%x%x%x%x%x", "")
	armor =  math.floor(getPedArmor(lp))
	weapon = getPedWeapon(getLocalPlayer())
	ammo = getPedTotalAmmo(getLocalPlayer())
	oxygen = math.floor(getPedOxygenLevel (lp))
	weaponT = getPedWeaponSlot (lp)
	local time = getRealTime()
    local hours = time.hour
    local minutes = time.minute
	pedSlot = getPedWeaponSlot (lp)
      if hud == 1 then
		if health <=50 then
			dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "files/image.png", 0, 0, 0, tocolor(255, 10, 10, 220), false)
		else
			dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0000, screenH * 1.0000, "files/image.png", 0, 0, 0, tocolor(160, 255, 160, 220), false)
		end
		dxDrawText("Hour: "..hours..":"..minutes, screenW * 0.8215, screenH * 0.0111, screenW * 0.9931, screenH * 0.0511, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, false, false, false)
        dxDrawText("Year: 2032", screenW * 0.8215, screenH * 0.0622, screenW * 0.9931, screenH * 0.1022, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, false, false, false)
        dxDrawText("Console:", screenW * 0.8215, screenH * 0.1133, screenW * 0.9931, screenH * 0.1533, tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, false, false, false)
		dxDrawText(text1.text, screenW * 0.8215, screenH * 0.1644, screenW * 0.9931, screenH * 0.2111, tocolor(255, 255, 255, 255), 0.70, font2, "left", "top", true, true, false, false, false)
		dxDrawText(text1.text2, screenW * 0.8215, screenH * 0.2111, screenW * 0.9931, screenH * 0.2578, tocolor(255, 255, 255, 255), 0.70, font2, "left", "top", true, true, false, false, false)
		dxDrawText("Jmaniacs", 1358, 875, 1434, 885, tocolor(255, 255, 255, 125), 1.20, "default", "right", "center", false, false, false, false, false)
		dxDrawText(name, screenW * 0.3278, screenH * 0.9144, screenW * 0.6736, screenH * 0.9889, tocolor(255, 255, 255, 255), 3.50, font, "center", "center", false, false, false, false, false)
			dxDrawText(health, screenW * 0.0103, screenH * 0.9150, screenW * 0.0771, screenH * 0.9433, tocolor(0, 0, 0, 255), 2.00, font, "center", "center", false, false, false, false, false)
        dxDrawText(health, screenW * 0.0153, screenH * 0.9056, screenW * 0.0771, screenH * 0.9433, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText("Health", screenW * 0.0153, screenH * 1.000, screenW * 0.0771, screenH * 0.9433, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
			dxDrawText(armor, screenW * 0.1035, screenH * 0.9059, screenW * 0.1701, screenH * 0.9433, tocolor(0, 0, 0, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText(armor, screenW * 0.1085, screenH * 0.8959, screenW * 0.1701, screenH * 0.9433, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText("Armor", screenW * 0.1085, screenH * 0.990, screenW * 0.1701, screenH * 0.9433, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
			dxDrawText(oxygen, screenW * 0.1944, screenH * 0.8889, screenW * 0.2653, screenH * 0.9378, tocolor(0, 0, 0, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText(oxygen, screenW * 0.1994, screenH * 0.8789, screenW * 0.2653, screenH * 0.9378, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText("Oxygen", screenW * 0.1994, screenH * 0.9889, screenW * 0.2653, screenH * 0.9378, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
		if (pedSlot == 0) then
				dxDrawText("0", screenW * 0.7477, screenH * 0.9011, screenW * 0.8125, screenH * 0.9400, tocolor(0, 0, 0, 255), 2.00, font, "center", "center", false, false, false, false, false)
			dxDrawText("0", screenW * 0.7417, screenH * 0.8911, screenW * 0.8125, screenH * 0.9400, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, false, false)
		else
				dxDrawText(ammo, screenW * 0.7477, screenH * 0.9011, screenW * 0.8125, screenH * 0.9400, tocolor(0, 0, 0, 255), 2.00, font, "center", "center", false, false, false, false, false)
			dxDrawText(ammo, screenW * 0.7417, screenH * 0.8911, screenW * 0.8125, screenH * 0.9400, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, false, false)
		end
		dxDrawText("Ammo", screenW * 0.7417, screenH * 0.980, screenW * 0.8125, screenH * 0.9400, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
			dxDrawText(weaponT, screenW * 0.8553, screenH * 0.9099, screenW * 0.9201, screenH * 0.9400, tocolor(0, 0, 0, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText(weaponT, screenW * 0.8493, screenH * 0.8999, screenW * 0.9201, screenH * 0.9400, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, false, false)
		dxDrawText("Weapon Type", screenW * 0.8493, screenH * 0.9970, screenW * 0.9201, screenH * 0.9400, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
      end
    end
addEventHandler("onClientRender", root,mainhHud)

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function ()
	setPlayerHudComponentVisible ( "all", false )
	outputDebugString("[Modern-Hud] The Hud has been succesfully charged!")
	outputDebugString("[Modern-Hud] Maked by Jmaniacs!")
end)

bindKey("F5", "down", function()
	if hud == 1 then
		hud = 0
		setPlayerHudComponentVisible ( "all", true )
	else
		hud = 1 
		setPlayerHudComponentVisible ( "all", false )
	end
end)


function getPedMaxHealth(ped)
  assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ 'getPedMaxHealth' [Expected ped/player at argument 1, got " .. tostring(ped) .. "]")
  local stat = getPedStat(ped, 24)
  local maxhealth = 100 + (stat - 569) / 4.31
  return math.max(1, maxhealth)
end