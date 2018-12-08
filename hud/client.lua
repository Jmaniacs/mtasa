local lp = getLocalPlayer()
local screenW, screenH = guiGetScreenSize()
local x, y = guiGetScreenSize()
local fonts1 = dxCreateFont("shared/1.otf", 11)
local fonts2 = dxCreateFont("shared/1.otf", 22)
local fonts = dxCreateFont("shared/1.otf", 10)
hud = 1
function mainhHud()
  local health,money = math.floor(getElementHealth(lp)), getPlayerMoney()
    local time = getRealTime()
    local hours = time.hour
    local minutes = time.minute
    local resW, resH = 1365, 767
local xe, ye =  (screenW/resW), (screenH/resH)
  armadura =  math.floor(getPedArmor(lp))
   weapon = getPedWeapon(getLocalPlayer())
    vida = getElementHealth ( getLocalPlayer() ) + 0.40000152596
   provida= (screenW * 0.150)*(health/100)
   porarmadura= (screenW * 0.150)*(armadura/100)
   getlevel = ( getElementData ( localPlayer, "En el server") or ("0 ★."))
   if minutes <= 9 then
   minutes = "0"..minutes
   end
      if hud == 1 then

        dxDrawImage( x - 371, -1, 377, 181, "shared/fon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawText("$ "..money,  x-310,126,x-310,126, tocolor(255, 255, 255, 255), 1, fonts1, "left", "center", false, true, true, false, false)
		dxDrawText("$ 0",  x-310,186,x-310,110, tocolor(255, 255, 255, 255), 1, fonts1, "left", "center", false, true, true, false, false)
        dxDrawText(hours..":"..minutes,x-90,45,x-90,45, tocolor(255, 255, 255, 255), 1, fonts2, "center", "center", false, true, true, false, false)
        dxDrawRectangle(x-199.5,92,155/getPedMaxHealth(localPlayer)*vida,ye*2, tocolor(242, 116, 116, 255), true)
        dxDrawText (getlevel,x-295,96,x-295,96, tocolor(255,255,255), 1, fonts, "center", "center", false, true, true, false, false)
      end
    end
addEventHandler("onClientRender", root,mainhHud)

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function ()
   setPlayerHudComponentVisible ( "all", false )
end)
bindKey("F6", "down", function()
if hud == 1 then
hud = 0
else
hud = 1 
end
end)

function getPedMaxHealth(ped)
  assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ 'getPedMaxHealth' [Expected ped/player at argument 1, got " .. tostring(ped) .. "]")
  local stat = getPedStat(ped, 24)
  local maxhealth = 100 + (stat - 569) / 4.31
  return math.max(1, maxhealth)
end