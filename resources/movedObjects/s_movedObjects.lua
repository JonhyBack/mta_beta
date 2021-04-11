local function getElementsWithinMarker(marker)
	if (not isElement(marker) or getElementType(marker) ~= "marker") then
		return false
	end
	local markerColShape = getElementColShape(marker)
	local elements = getElementsWithinColShape(markerColShape, "player")
	return elements
end

for _,v in pairs(posBarrier) do
	local obj = createObject(968, v[1],v[2],v[3], 0, 270, v[4])	
    local marker = createMarker(v[1],v[2],v[3], "cylinder", 10, 255, 255, 255, 0)
    setElementData(obj,"Location", v[5])
    setElementData(marker, "Barrier", obj)

end

for _,v in pairs(posGate) do
	local obj = createObject(v[5],v[1],v[2],v[3], 0, 0, v[4])	
    local marker = createMarker(v[1],v[2],v[3], "cylinder", 10, 255, 255, 255, 0)
    setElementData(obj,"Location", v[6])
    setElementData(marker, "Gate", obj)    
end

addEventHandler("onMarkerHit", getRootElement(), function(hitElement)
    if getElementType (hitElement) ~= "player"  then return end	

    if  not getPedOccupiedVehicle(hitElement) then return end

    local obj = getElementData (source, "Barrier")
    if not obj or obj == nil then
        return
    end

    local x, y, z = getElementPosition(obj)
    local marker = source

    timerHit = setTimer(function()
        if not isTimer(timerTemp) then
            bindKey(hitElement, "h", "down", function() 
                unbindKey(hitElement, "h", "down")
                if getElementData(obj, "Location") == "Port" then
                    moveObject(obj, 1000, x, y, z, 0, 90, 0) 
                    setTimer(moveObject, 5000, 1 ,obj, 1000, x, y, z, 0, -90, 0)
                end
                timerTemp = setTimer(function() end, 7000, 1)
            end)
        end            
    end, 500, 0)
end)

addEventHandler("onMarkerHit", getRootElement(), function(hitElement)
    if getElementType (hitElement) ~= "player"  then return end	

    if  not getPedOccupiedVehicle(hitElement) then return end

    local obj = getElementData (source, "Gate")
    if not obj or obj == nil then
        return
    end

    local marker = source
    local x, y, z = getElementPosition(obj)

    timerHit = setTimer(function()
        if not isTimer(timerTemp) then
            bindKey(hitElement, "h", "down", function() 
                unbindKey(hitElement, "h", "down")
                if getElementData(obj, "Location") == "Bunker" then 
                    moveObject(obj, 1000, x+11, y, z, 0, 0, 0) 
                    outputChatBox("Base")
                    setTimer(moveObject, 5000, 1 ,obj, 1000, x, y, z, 0, 0, 0)
                elseif getElementData(obj, "Location") == "baseStalker" then
                    moveObject(obj, 1000, x+5, y, z, 0, 0, 0) 
                    outputChatBox("slalk")
                    setTimer(moveObject, 5000, 1 ,obj, 1000, x, y, z, 0, 0, 0)
                end
                timerTemp = setTimer(function() end, 7000, 1)
            end)
        end            
    end, 500, 0)
end)

addEventHandler("onMarkerLeave", getRootElement(), function(hitElement)
    if getElementType (hitElement) ~= "player"  then return end	

    if  not getPedOccupiedVehicle(hitElement) then return end

    unbindKey(hitElement, "h", "down")
    killTimer(timerHit)
end)