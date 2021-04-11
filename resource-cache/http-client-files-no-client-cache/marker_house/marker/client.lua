standartR, standartG, standartB, standartH = 191, 32, 32, 150

local canClick = false
local material = dxCreateTexture("marker/files/images/ping_teleporting.png")
local material2 = dxCreateTexture("marker/files/images/ping_baseattacked.png")
local material3 = dxCreateTexture("marker/files/images/ping_kreis.png")
local sx,sy
local DEFAULT_SIZE = 7
local MINIMUM_SIZE = 3
local SIZE_STEPS = 0.3
local MAXIMUM_DISTANCE = 50

pointer = {}
pointer.__index = pointer
local pointerInstances = {}

function pointer:create(worldX, worldY, worldZ)
	local renderTarget = dxCreateRenderTarget(1024, 1024, true)
	local renderTarget2 = dxCreateRenderTarget(1024, 1024, true)
	local array = {}
	array.worldX = worldX
	array.worldY = worldY
	array.worldZ = worldZ
	array.rotation = 0
	array.size = DEFAULT_SIZE
	array.texture = renderTarget
	array.renderTarget = renderTarget2
	array.doneTick = 0
	
	dxSetRenderTarget(renderTarget, true)
	local width, height = dxGetMaterialSize(material)
	dxDrawImage(400, 400, width-400*2, height-400*2, material, 0, 0, 0, tocolor(255, 255, 255, 255))
	local width, height = dxGetMaterialSize(material2)
	dxDrawImage(250, 250, width-250*2, height-250*2, material2, 180, 0, 0, tocolor(255, 255, 255, 255))
	local width, height = dxGetMaterialSize(material2)
	dxDrawImage(0, 0, width, height, material2, 0, 0, 0, tocolor(255, 255, 255, 255))
	dxSetRenderTarget()
	
	setmetatable(array, pointer)
	table.insert(pointerInstances, array)
end

function pointer:destroy()
	self = nil
end
sizes = 0
-- - зн +
statSize = false
-- Draw the pointers...
addEventHandler("onClientRender", root, function()
	local CRL = getElementData(localPlayer, "ColorR") or standartR
	local CGL = getElementData(localPlayer, "ColorG") or standartG
	local CBL = getElementData(localPlayer, "ColorB") or standartB
	
	for k, v in ipairs(pointerInstances) do
		v.rotation = v.rotation + 1
		if v.rotation > 360 then v.rotation = 0 end
		--v.with = v.with + 1
		--if v.with > 80 then v.with = 0 end

		
		if statSize == false then
			sizes = sizes - 0.1
			if sizes <= 0 then
				sizes = 0
				statSize = true
			end
		else
			sizes = sizes + 0.1
			if sizes >= 20 then
				sizes = 20
				statSize = false
			end
		end
		
		--if v.with > 80 then
		--v.with = v.with - 1
		--end
		
		local x, y, z = v.worldX, v.worldY-v.size, v.worldZ+0.1
		local x2, y2, z2 = v.worldX, v.worldY+v.size, v.worldZ+0.1

		
		local width, height = dxGetMaterialSize( v.texture )
		dxSetRenderTarget(v.renderTarget, true)
		local sX, sY = getScreenFromWorldPosition(v.worldX, v.worldY, v.worldZ+2)
		if sX then
			local x2, y2, z2 = getCameraMatrix()
			local distance = getDistanceBetweenPoints3D(v.worldX, v.worldY, v.worldZ+2, x2, y2, z2)
			local size = 200*(1-distance/MAXIMUM_DISTANCE)
			if size < MAXIMUM_DISTANCE then
			else
				dxDrawImage(0, 0, width, height, v.texture, v.rotation, 0, 0,  tocolor(CRL, CGL, CBL, 255))
			end
		end
		
		dxSetRenderTarget()
		dxDrawMaterialLine3D(x, y, z, x2, y2, z2, v.renderTarget, v.size*2, tocolor(CRL, CGL, CBL, 255), v.worldX, v.worldY, v.worldZ+500000000)

		--[[local sX, sY = getScreenFromWorldPosition(v.worldX, v.worldY, v.worldZ+2)
		if sX then
			local x2, y2, z2 = getCameraMatrix()
			local distance = getDistanceBetweenPoints3D(v.worldX, v.worldY, v.worldZ+2, x2, y2, z2)
			local size = 200*(1-distance/MAXIMUM_DISTANCE)
			if size < MAXIMUM_DISTANCE then
			else
				dxDrawImage(sX-size/2 - sizes / 2, sY-size/2 - sizes / 2, size + sizes, size + sizes, material4, 0, 0, 0, tocolor(255,255,255,255))
			end
		end]]
		
		if v.size > MINIMUM_SIZE then 
			v.size = v.size - SIZE_STEPS
		else
			if v.doneTick==0 then
				v.doneTick = getTickCount()
			end
		end
		
	end

end)

function create_marker_customr (x,y,z)
	pointer:create(x,y,z + 0.1)
end
addEvent("ddffgg", true)
addEventHandler("ddffgg", root, create_marker_customr)

