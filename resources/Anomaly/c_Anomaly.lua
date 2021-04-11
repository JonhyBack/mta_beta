local screenW,screenH = guiGetScreenSize() 
local pX,pY = screenW/1366,screenH/768

local DGS = exports.dgs

local state = false

local window = DGS:dgsCreateWindow((screenW - 359) / 2, (screenH - 234) / 2, 359, 234, "Anomaly", false)
DGS:dgsWindowSetSizable(window,false)
DGS:dgsWindowSetMovable(window,false)
DGS:dgsSetVisible(window, false)
DGS:dgsSetLayer (window,"top")
DGS:dgsWindowSetCloseButtonEnabled(window, false)

local buttonMeduza = DGS:dgsCreateButton(197, 37, 108, 26, "Медуза", false, window)
local buttonJarka = DGS:dgsCreateButton(40, 37, 108, 26, "Жарка", false, window)
local buttonGaz = DGS:dgsCreateButton(40, 91, 108, 26, "Газировка", false, window)
local buttonTramp = DGS:dgsCreateButton(197, 91, 108, 26, "Трамплин", false, window)
local buttonElectra = DGS:dgsCreateButton(40, 145, 108, 26, "Электра", false, window)
local buttonRad = DGS:dgsCreateButton(197, 145, 108, 26, "Радиация", false, window)    

addEventHandler("onClientResourceStart", getRootElement(getThisResource()), function()
    outputChatBox("Ok")
    bindKey( "f", "down", function()
        outputChatBox("Go")
        if not state then
            showCursor(true)
            DGS:dgsSetVisible(window, true)            
            state = not state
        else
            showCursor(false)
            state = not state
            DGS:dgsSetVisible(window, false)
        end
    end)
end) 

local function createAnomaly(idPickup, strEffect, typeA) 
    if type(idPickup) ~= 'number' and type(strEffect) ~= 'string' and not idPickup then return end      
    local x, y, z = getElementPosition(localPlayer)

    if effectNames[39] == strEffect then
        createEffect(tostring(strEffect), x, y, z+1, 0, 0, 0, 30, true) 
        triggerServerEvent("createAnomalyArt", localPlayer, x, y, z, idPickup, typeA) 
        return
    end
    
    createEffect(tostring(strEffect), x, y, z, 0, 0, 0, 30, true) 

    triggerServerEvent("createAnomalyArt", localPlayer, x, y, z, idPickup, typeA)  
end

addEventHandler("onDgsMouseClickDown", root, function()
    outputChatBox('btn')
    if source == buttonMeduza then
        outputChatBox(effectNames[38])
        createAnomaly(1602, effectNames[51], "Meduza") --1 effectNames[20] жарка  effectNames[25]  трамплин effectNames[39]
    elseif source == buttonJarka then
        createAnomaly(1213, effectNames[25], "Jarka") --1
    elseif source == buttonGaz then
        createAnomaly(1213, effectNames[58], "Gaz") --1
    elseif source == buttonTramp then
        createAnomaly(1213, effectNames[39], "Tramp") -- 1
    elseif source == buttonElectra then
        createAnomaly(1213, effectNames[85], "Electra")
    elseif source == buttonRad then
        createAnomaly(1213, effectNames[86], "Rad")
    end
end)

