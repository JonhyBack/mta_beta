for _,v in ipairs(pos) do
    local entry = createPickup(v[1],v[2],v[3],3,1318, 0)
    local col = createColSphere(v[1],v[2],v[3], 1)  
    setElementData(entry, "TargetPos", {v[4],v[5],v[6]})
    setElementData(col, "Object", entry)
    setElementData(col, "Location", v[7])
    col = createColSphere(v[4],v[5],v[6], 1)  
    entry = createPickup(v[4],v[5],v[6],3,1318, 0)
    setElementData(entry, "TargetPos", {v[1],v[2],v[3]})
    setElementData(col, "Object", entry)
    setElementData(col, "Location", v[7])
end

addEventHandler("onColShapeHit", getRootElement(), function(hitElement)
    if getElementData(source ,"Location") ~= "NIK_Entry" then return end
    if getElementType(hitElement) ~= "player" or getPedOccupiedVehicle(hitElement) then return end

    local obj = getElementData(source, "Object")
    local x, y, z = unpack(getElementData(obj, "TargetPos"))

    bindKey(hitElement, "f", "down", function()
        setElementPosition(hitElement, x, y, z)
    end)
end)

addEventHandler("onColShapeLeave", getRootElement(), function(hitElement)
    if getElementType(hitElement) ~= "player" and isPedInVehicle(hitElement) then return end
    if not getElementData(source ,"Location") == "NIK_Entry" then return end
    unbindKey(hitElement, "f", "down")
end)