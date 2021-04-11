local DGS = exports.dgs

local screenW,screenH = guiGetScreenSize() 
local pX,pY = screenW/1366,screenH/768

local font = DGS:dgsCreateFont( "inventory/fonts/1.ttf", 10*pX )

-------- Main ---------
local invGrid = DGS:dgsCreateGridList((screenW - 207) / 2, (screenH - 309) / 2, 207, 309, false)
DGS:dgsSetVisible(invGrid, false)
DGS:dgsSetFont(invGrid,font)

local nameGridColumn = DGS:dgsGridListAddColumn(invGrid, "Инвентарь", 10)

local containGridRow = DGS:dgsGridListAddRow(invGrid, _,"Содержимое")
--------- Main ---------------


local function onOpenInventory()
    DGS:dgsSetVisible(invGrid, true)
    showCursor(true)
end
bindKey("i","down",onOpenInventory)

addEventHandler( "onDgsGridListItemDoubleClick", root, function(button,state,item)
    if state == "down" and button == "left" then
        local nameCell = DGS:dgsGridListGetItemText(invGrid, item, nameGridColumn)
        if nameCell == "Содержимое" then
            DGS:dgsSetVisible(invGrid, false)
            showCursor(false)
        end
    end
end)