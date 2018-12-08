--Jmaniacs
--Dont Remove Credits, Please :)
local screenW, screenH = guiGetScreenSize()
hud = 1


function mainhHud()
	health = math.floor (getElementHealth(getLocalPlayer()))
	name = getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", "")
	armor =  math.floor(getPedArmor(localPlayer))
	skin = getElementModel(localPlayer)
	money = getPlayerMoney(localPlayer)
      if hud == 1 and health >= 1 then
		dxDrawLine((screenW * 0.8646) - 1, (screenH * -0.0022) - 1, (screenW * 0.8646) - 1, screenH * 0.3000, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.8646) - 1, screenH * 0.2989, screenW * 1.0000, screenH * 0.2989, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 1.0000, screenH * 0.3000, screenW * 1.0000, (screenH * -0.0022) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.8646, screenH * -0.0033, screenW * 0.1354, screenH * 0.3022, tocolor(0, 0, 0, 184), false)
        dxDrawLine((screenW * 0.7528) - 1, (screenH * -0.0011) - 1, (screenW * 0.7528) - 1, screenH * 0.1422, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine((screenW * 0.7528) - 1, screenH * 0.1411, screenW * 0.8646, screenH * 0.1411, tocolor(254, 254, 254, 255), 1, false)
        dxDrawLine(screenW * 0.8646, screenH * 0.1422, screenW * 0.8646, (screenH * -0.0011) - 1, tocolor(254, 254, 254, 255), 1, false)
        dxDrawRectangle(screenW * 0.7528, screenH * -0.0022, screenW * 0.1118, screenH * 0.1433, tocolor(0, 0, 0, 184), false)
		dxDrawLine(screenW * 0.7528, screenH * 0.0344, screenW * 0.8632, screenH * 0.0344, tocolor(255, 255, 255, 255), 1, false)
        dxDrawText(name, screenW * 0.7597, screenH * 0.0089, screenW * 0.8549, screenH * 0.0244, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Skin: "..skin, screenW * 0.7597, screenH * 0.0567, screenW * 0.8549, screenH * 0.0722, tocolor(255, 255, 255, 255), 0.90, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Armor: "..armor, screenW * 0.7597, screenH * 0.0833, screenW * 0.8549, screenH * 0.0989, tocolor(255, 255, 255, 255), 0.90, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Money: "..money, screenW * 0.7597, screenH * 0.1100, screenW * 0.8549, screenH * 0.1256, tocolor(255, 255, 255, 255), 0.90, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawText("Health: "..health, screenW * 0.8715, screenH * 0.2678, screenW * 0.9931, screenH * 0.2944, tocolor(255, 254, 254, 255), 1.60, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.8715, screenH * 0.0133, screenW * 0.1215, screenH * 0.0322, tocolor(254, 254, 254, 130), false)
        dxDrawRectangle(screenW * 0.8715, screenH * 0.0567, screenW * 0.1215, screenH * 0.0322, tocolor(254, 254, 254, 130), false)
        dxDrawRectangle(screenW * 0.8715, screenH * 0.1000, screenW * 0.1215, screenH * 0.0322, tocolor(254, 254, 254, 130), false)
		dxDrawRectangle(screenW * 0.8715, screenH * 0.1433, screenW * 0.1215, screenH * 0.0322, tocolor(254, 254, 254, 130), false)
		dxDrawRectangle(screenW * 0.8715, screenH * 0.1866, screenW * 0.1215, screenH * 0.0322, tocolor(254, 254, 254, 130), false)
		dxDrawRectangle(screenW * 0.8715, screenH * 0.2299, screenW * 0.1215, screenH * 0.0322, tocolor(254, 254, 254, 130), false)
		--
		if health <= 10 then
		dxDrawRectangle(screenW * 0.8743, screenH * 0.0178, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		elseif health <=25 then
		dxDrawRectangle(screenW * 0.8750, screenH * 0.0611, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.0178, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		elseif health <=40 then
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1044, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8750, screenH * 0.0611, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.0178, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		elseif health <=60 then
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1044, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8750, screenH * 0.0611, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.0178, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1477, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		elseif health <=80 then
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1044, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8750, screenH * 0.0611, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.0178, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1477, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1910, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		elseif health == 100 then
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1044, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8750, screenH * 0.0611, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.0178, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1477, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.1910, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		dxDrawRectangle(screenW * 0.8743, screenH * 0.2343, screenW * 0.1153, screenH * 0.0233, tocolor(254, 254, 254, 171), false)
		end
	  end
    end
addEventHandler("onClientRender", root,mainhHud)

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function ()
	setPlayerHudComponentVisible ( "all", false )
	setPlayerHudComponentVisible ( "radar", true )
	outputDebugString("[Minimalist-Hud] The Hud has been succesfully charged!")
	outputDebugString("[Minimalist-Hud] Maked by Jmaniacs!")
end)

bindKey("F5", "down", function()
	if hud == 1 then
		hud = 0
		setPlayerHudComponentVisible ( "all", true )
	else
		hud = 1 
		setPlayerHudComponentVisible ( "all", false )
		setPlayerHudComponentVisible ( "radar", true )
	end
end)


function getPedMaxHealth(ped)
  assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ 'getPedMaxHealth' [Expected ped/player at argument 1, got " .. tostring(ped) .. "]")
  local stat = getPedStat(ped, 24)
  local maxhealth = 100 + (stat - 569) / 4.31
  return math.max(1, maxhealth)
end