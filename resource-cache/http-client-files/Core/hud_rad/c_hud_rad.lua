local screenW,screenH = guiGetScreenSize() 
local pX,pY = screenW/1366,screenH/768

local Stats = {}

local function startRender()
addEventHandler("onClientRender", root,function( )
    dxDrawText(tostring(Stats.RAD), 989, 236, 1032, 273, tocolor(167, 253, 0, 255), 2.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(tostring(Stats.VIR), 1114, 236, 1157, 273, tocolor(254, 0, 0, 255), 2.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(tostring(Stats.GOL), 1234, 236, 1277, 273, tocolor(0, 41, 251, 255), 2.00, "default", "center", "center", false, false, false, false, false)
   
    dxDrawImage(1037, 236, 40, 35, "hud_rad/files/Rad.png")
    dxDrawImage(1161, 236, 40, 35, "hud_rad/files/Vir.png")
    dxDrawImage(1279, 236, 40, 35, "hud_rad/files/Gol.png")
end)
end

local function startUpdateHUD()
    Stats.RAD = getElementData(localPlayer, "RAD")
    Stats.VIR = getElementData(localPlayer, "VIR")
    Stats.GOL = getElementData(localPlayer, "GOL")
    startRender()
    local function updateStats(stat)
            if not(isPedDead(localPlayer)) then    
                Stats[stat] = Stats[stat] + 1
                setElementData(localPlayer, stat, Stats[stat])
            end  
            if Stats[stat] >= 100 then 
                Stats[stat] = 0             
                triggerServerEvent("killThisPlayer",localPlayer) 
            end
        end
    setTimer(updateStats, 60*1000,0,"RAD")
    setTimer(updateStats, 60*1000,0, "GOL")
    setTimer(updateStats, 1000*1000,0, "VIR")
end
addEvent("startUpdateHUD", true)
addEventHandler("startUpdateHUD",root,startUpdateHUD)

local function getElementSpeed(theElement, unit)
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    return (Vector3(getElementVelocity(theElement)) * mult).length
end

local function speedometr()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then 
		local speed = math.floor(getElementSpeed(vehicle,1))
		dxDrawText(speed, 107, 466, 178, 512, tocolor(255, 255, 255, 255), 2.00, "pricedown", "left", "top", false, false, false, false, false)
	end
end

addEventHandler('onClientVehicleEnter',root,function(thePlayer,seat)
	addEventHandler('onClientRender',root,speedometr)
end)

addEventHandler('onClientVehicleExit',root,function(thePlayer,seat)
	removeEventHandler('onClientRender',root,speedometr)
end)