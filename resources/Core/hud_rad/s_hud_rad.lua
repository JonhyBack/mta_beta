local maxSaveStat = 90

addEventHandler("onPlayerLogin", root, function (_,account)	
	setElementData(source, "RAD", tonumber(getAccountData(account, "RAD")) or 0)
	setElementData(source, "VIR", tonumber(getAccountData(account, "VIR")) or 0)
    setElementData(source, "GOL", tonumber(getAccountData(account, "GOL")) or 0)
    triggerClientEvent(source,'startUpdateHUD',source)
end)

addEventHandler("onPlayerQuit", root, function()
local account = getPlayerAccount(source)
if isGuestAccount(account) then 
	return
end
if (getElementData(source, "RAD") > maxSaveStat) then  
	setAccountData(account, "RAD" , maxSaveStat)
else
	setAccountData(account, "RAD", getElementData(source, "RAD"))
end

if getElementData(source, "VIR") > maxSaveStat then  
	setAccountData(account, "VIR", maxSaveStat)
else
	setAccountData(account, "VIR", getElementData(source, "VIR"))
end

if getElementData(source,"GOL") > maxSaveStat then  
	setAccountData(account, "GOL" , maxSaveStat)
else
	setAccountData(account, "GOL", getElementData(source,"GOL"))
end	
end )

