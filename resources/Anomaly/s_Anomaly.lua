function createAnomalyArt(x, y, z, idPickup, typeA)
    local pickup = createPickup(x, y, z, 3, idPickup, 1000)  --1213
    setElementData(pickup, "AnomalyType", typeA)
    setElementData(pickup, "CoolDown", false)
    local kd = setTimer(function () setElementData(pickup, "CoolDown", false) end, 10000, 1)
    setElementData(pickup, "Timer", kd)
end
addEvent("createAnomalyArt", true)
addEventHandler("createAnomalyArt", root, createAnomalyArt)

local function pickupCoolDown(pickup)
    timer = getElementData(pickup, "Timer")
    if isTimer(timer) then 
        outputChatBox("Anomaly kd")
    else 
        setElementData(pickup, "CoolDown", true)
        outputChatBox("Anomaly no kd")
        timer = setTimer(function () setElementData(pickup, "CoolDown", false) end, 10000, 1)
        setElementData(pickup, "Timer", timer)
    end
end

addEventHandler("onPickupUse", root, function(hitElement)
    if not getElementData(source ,"AnomalyType") then return end
    if getElementType(hitElement) ~= "player" or getPedOccupiedVehicle(hitElement) then return end
    
    anomaly = tostring(getElementData(source ,"AnomalyType"))
    pedWeaponID = getPedWeapon(hitElement)
    acc = getPlayerAccount(hitElement)
    pickup = source
    
    if pedWeaponID == 40 then 
        local team = getPlayerTeam(hitElement)
        if team == getAccountData(acc,"Team") and team == "Сталкеры" then
            outputChatBox("This is Meduza")
        end
        pickupCoolDown(pickup)             
    else 
        local x, y, z = getElementPosition(pickup)
        outputChatBox("Lol2")
        --createExplosion(x, y, z, 8)           
        return
    end
    

    outputChatBox("Lol")
end)