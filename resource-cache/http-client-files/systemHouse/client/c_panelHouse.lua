local window = CustomWindow.create((screenW - 222) / 2, (screenH - 131) / 2, 222, 131, "Покупка дома")
window:setVisible(false)
window:setMovable(false)
window:setSizable(false)
window:setCloseEnabled(false)

local buttonYes = CustomButton.create(23, 78, 69, 28, "Да",false, window)
local buttonNo = CustomButton.create(124, 78, 69, 28, "Нет",false, window)

local labelQuestion = CustomLabel.create(50, 32, 130, 24, "Хотите ввойти в дом?", false,window)

buttonYes:addEvent("onClientGUIClick", function()
	triggerServerEvent("pedEntryHouse",localPlayer)
end)

buttonNo:addEvent("onClientGUIClick", function()
	triggerEvent("closePanelHouse",localPlayer)
end)

addEvent("openPanelHouse",true)
addEventHandler("openPanelHouse",root, function()
    window:setVisible(true)
    setElementFrozen(localPlayer, true)
    showCursor(true)
end)

addEvent("closePanelHouse",true)
addEventHandler("closePanelHouse",root, function()
    window:setVisible(false)
    setElementFrozen(localPlayer, false)
    showCursor(false)
end)