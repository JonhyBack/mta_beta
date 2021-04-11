function spawn (thePlayer)
    if (isElement( thePlayer ) and getElementType( thePlayer ) == "player") then
        local x,y,z,r = unpack(spawnpoints[math.random(1,#spawnpoints)])
        local account = getPlayerAccount(thePlayer)
        local skin = tonumber(getAccountData(account,"Skin"))
        spawnPlayer(thePlayer,x+math.random(-3,3),y+math.random(-3,3),z,r,skin,0,0)
    end
end

local function onWasted()
    local time = tonumber(get('playerRespawnTime')) or 1000
    outputChatBox('LOL')
	setTimer(spawn,time,1,source)
end
addEventHandler("onPlayerWasted",root,onWasted)

function killThisPlayer()
    if (isElement( source ) and getElementType( source ) == "player") then
        outputChatBox("KILL") 
        killPed(source)
    end

end
addEvent('killThisPlayer',true)
addCommandHandler('killThisPlayer',killThisPlayer)
addEventHandler('killThisPlayer',root,killThisPlayer)




	
	
	

