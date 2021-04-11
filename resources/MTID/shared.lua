
function getPlayerID(player)
	if player and getElementType(player) == 'player' then 
		if getElementData(player,'ID') then
			return tonumber(getElementData(player,'ID'));
		end
	end
end

function getPlayerByID(id)
	if id and type(id) == 'number' then 
		local players = getElementsByType('player')
		local player = false 
		for i,v in ipairs(players) do
			if tonumber(getElementData(v,'ID')) == id then 
				player = v
				break
			end
		end
		return player
	end
end