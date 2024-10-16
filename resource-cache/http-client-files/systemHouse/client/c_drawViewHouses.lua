function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font,...)
	local x, y, z = getElementPosition(TheElement)
	local x2, y2, z2 = getCameraMatrix()
	local distance = distance or 20
	local height = height or 1

	if (isLineOfSightClear(x, y, z+2, x2, y2, z2, ...)) then
		local sx, sy = getScreenFromWorldPosition(x, y, z+height)
		if(sx) and (sy) then
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if(distanceBetweenPoints < distance) then
				dxDrawText(text, sx+2, sy+2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center")
			end
		end
	end
end

addEvent("createHouse3DText", true)
addEventHandler("createHouse3DText", root, function(id, x, y, z, Owner, Price, Rent, pickup)
    addEventHandler("onClientRender", root, function()
    dxDrawTextOnElement( pickup, 
    ' ID:'..id..'\n Владелец: '..Owner..'\n Price: '..Price..'\n Rent: '..Rent..'', 0.75,20, _,_,_,_,1.5)
    end)
end)