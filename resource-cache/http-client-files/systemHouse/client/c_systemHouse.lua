DGS = exports.dgs

screenW,screenH = guiGetScreenSize() 
pX,pY = screenW/1366,screenH/768
local statusWindow = false

local window = DGS:dgsCreateWindow(457, 199, 512, 322, "Редактор домов", false)
DGS:dgsSetVisible(window, false)
DGS:dgsWindowSetSizable(window,false)
DGS:dgsWindowSetCloseButtonEnabled(window, false) 

local buttonCreate = DGS:dgsCreateButton(363, 250, 127, 33, "Создать дом",false, window)

local labelX = DGS:dgsCreateLabel(11, 56, 31, 24, "X:", false,window)
local labelY = DGS:dgsCreateLabel(11, 100, 31, 24, "Y:", false,window)
local labelZ = DGS:dgsCreateLabel(11, 146, 31, 24, "Z:", false,window)

local editXout = DGS:dgsCreateEdit(52, 54, 118, 26, "", false,window)
local editYout = DGS:dgsCreateEdit(52, 98, 118, 26, "", false,window)
local editZout = DGS:dgsCreateEdit(52, 144, 118, 26, "", false,window)

local buttonGetOut = DGS:dgsCreateButton(34, 195, 106, 34, "Получить Out",false, window)

local editXin = DGS:dgsCreateEdit(180, 54, 118, 26, "", false,window)
local editYin = DGS:dgsCreateEdit(180, 98, 118, 26, "", false,window)
local editZin = DGS:dgsCreateEdit(180, 144, 118, 26, "", false,window)

local labelOut = DGS:dgsCreateLabel(84, 28, 51, 16, "Out", false,window)
local labelIn = DGS:dgsCreateLabel(211, 25, 45, 19, "In", false,window)

local buttonGetIn = DGS:dgsCreateButton(186, 195, 102, 34,  "Получить In",false, window)

local editINT = DGS:dgsCreateEdit(372, 54, 118, 26, "1", false,window)
local editPrice = DGS:dgsCreateEdit(372, 98, 118, 26, "10000", false,window)
local editRent = DGS:dgsCreateEdit(372, 144, 118, 26, "1000", false,window)

local labelINT = DGS:dgsCreateLabel(325, 54, 37, 26, "INT", false,window)
local labelPrice = DGS:dgsCreateLabel(324, 94, 38, 30, "Price", false,window)
local labelRent = DGS:dgsCreateLabel(328, 143, 34, 27, "Rent", false,window)


local function openPanel()
    if not statusWindow then 
        DGS:dgsSetVisible(window, true)
        statusWindow = true
        showCursor(true)
    elseif statusWindow then
        DGS:dgsSetVisible(window, false)
        showCursor(false)
        statusWindow = false
    end
end
addCommandHandler("rehome",openPanel)

addEventHandler("onDgsMouseClickDown",root, function(button) 
    if button == "left" then
        if source == buttonCreate then 
            local intX = tonumber(DGS:dgsGetText(editXin))
            local intY =tonumber(DGS:dgsGetText(editYin))
            local intZ =tonumber(DGS:dgsGetText(editZin))
            local X =tonumber(DGS:dgsGetText(editXout))
            local Y =tonumber(DGS:dgsGetText(editYout))
            local Z =tonumber(DGS:dgsGetText(editZout))
            local INT = tonumber(DGS:dgsGetText(editINT))
            local Price =tonumber(DGS:dgsGetText(editPrice))
            local Rent =tonumber(DGS:dgsGetText(editRent))
            triggerServerEvent("createNewHome",root,X,Y,Z,intX,intY,intZ,INT,Price, Rent)
        elseif source == buttonGetIn then 
            local x,y,z = getElementPosition(localPlayer)
            DGS:dgsEditClearText(editXin)
            DGS:dgsEditClearText(editYin)
            DGS:dgsEditClearText(editZin)
            DGS:dgsEditInsertText(editXin, 0, tostring(x))
            DGS:dgsEditInsertText(editYin, 0, tostring(y))
            DGS:dgsEditInsertText(editZin, 0, tostring(z))
        elseif source == buttonGetOut then 
            local x,y,z = getElementPosition(localPlayer)
            DGS:dgsEditClearText(editXout)
            DGS:dgsEditClearText(editYout)
            DGS:dgsEditClearText(editZout)
            DGS:dgsEditInsertText(editXout, 0, tostring(x))
            DGS:dgsEditInsertText(editYout, 0, tostring(y))
            DGS:dgsEditInsertText(editZout, 0, tostring(z))
        end
    end
end)

