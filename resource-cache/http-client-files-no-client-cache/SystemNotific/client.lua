local sx,sy = guiGetScreenSize()
local resW,resH = 1366,768
local sW,sH =  (sx/resW), (sy/resH)

local messages = {}
local last_msg = ""
local display_time_ms 	= 5000

function Draw(text) 	
	local tick = getTickCount()
	if text == last_msg then return end
	table.insert(messages, {text, true, tick + display_time_ms, 170, 255, 255, 255 })
	last_msg = text
	setTimer(function() last_msg = "" end, 2000, 0)
end
addEvent("addText", true)
addEventHandler("addText", root, Draw)

function render_topbar( )
	local tick = getTickCount()

	if #messages > 1 then table.remove(messages, 1) end


	for k,data in ipairs(messages) do

		dxDrawImage(471*sW, 36*sH, 425*sW, 58*sH, "files/bg.png", 0, 0, 0, tocolor(255, 255, 255, data[4]), true)
		dxDrawText(data[1], 475*sW, 40*sH, 420*sW, 55*sH, tocolor(255, 255, 255, data[4]+75), 1.00, "default-bold", "left", "top", true, true, true, true, true)

		if tick >= data[3] then
			messages[k][4] = data[4]-2
			if data[4] <= 25 then table.remove(messages, k) end
		end
	end
end
addEventHandler("onClientRender", root, render_topbar)

local img = dxCreateTexture("files/bg.png")
