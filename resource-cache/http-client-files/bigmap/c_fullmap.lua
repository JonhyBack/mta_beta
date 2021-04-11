toggleControl("radar", false)

local screenW,screenH = guiGetScreenSize() 
local pX,pY = screenW/1366,screenH/768
local stateMap = false

local function draw()
    local _,_, playerRot = getElementRotation(localPlayer)
    local stableRot = 360-playerRot
    local x, y = getElementPosition(localPlayer)
    dxDrawImage((screenW - 768) / 2, 0, screenH,screenH, "image/radar_mapV2.png",0,0,0, tocolor(255,255,255,100))
    if getElementInterior(localPlayer) == 0 then
        dxDrawImage(screenW/2 + (x*(screenH/6300)), screenH/2 - (y*(screenH/6300)) ,15*pX, 15*pY, "image/player.png", stableRot)
    end
end

local function showFullMap()
    if not stateMap then 
        addEventHandler("onClientRender", root, draw)
        stateMap = true
    elseif stateMap then 
        removeEventHandler("onClientRender", root, draw)
        stateMap = false
    end
end
bindKey('f11', 'down', showFullMap)