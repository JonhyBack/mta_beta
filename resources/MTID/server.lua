call(getResourceFromName("scoreboard"), "scoreboardAddColumn", "ID", root, 15, "ID", 1)
call(getResourceFromName("scoreboard"), "scoreboardRemoveColumn", "Country")

local playerIDs = {}

addEventHandler('onPlayerJoin',root,function()
	local player = source
	setID(player)
end)

addEventHandler('onPlayerQuit',root,function()
	local player = source
	local ID = getElementData(player,'ID')
	restoreID(ID)
end)

function setID(player)
	if player and getElementType(player) == 'player' then 
		local ID = #playerIDs+1
		playerIDs[ID] = player
		setElementData(player,'ID',ID)
	end
end

function restoreID(ID)
	ID = tonumber(ID) 
	local players = getElementsByType("player")
	if #players <=1 then
		table.remove(playerIDs, ID)
		return
	end
	if ID then 
		if playerIDs[ID] then 
			for i = 1, #playerIDs do
				if i >= ID then 
					playerIDs[i] = playerIDs[i+1]
					setElementData(playerIDs[i+1],'ID',i)
				end
			end
		end
	end
end

addCommandHandler('id',function(player)
	outputChatBox('#FFFFFFВаш ID - #FF0000'..getPlayerID(player),player,255,255,255,true)
end)

