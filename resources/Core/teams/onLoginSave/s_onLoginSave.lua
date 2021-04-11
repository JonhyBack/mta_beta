Teams.teamless = createTeam("Неизвестный",239, 242, 228)

addEventHandler("onPlayerLogin",root,function(_, theCurrentAccount)
    if getElementType(source) == "player" then       
        setPlayerTeam(source, "Неизвестный")        
    end
end)
	
function setTeamPlayer(_,_,id, newTeam)
    local account = getAccountByID(tonumber(id)) 
    local thePlayer = getAccountPlayer(account)
    local currTeam = getAccountData(account,"Team") or "Неизвестный"
    if getElementType(thePlayer) == "player" then
        if (currTeam == newTeam) then
        outputChatBox("You are already a member this team")
        elseif currTeam ~= newTeam then 
            for _, v in pairs(Teams) do
                local teamName = getTeamName(v)
                if teamName == newTeam then
                    outputChatBox("You state new team")
                    setAccountData(account, "Team", newTeam)
                    setElementData(thePlayer, "Team", newTeam)
                    setPlayerTeam(thePlayer,v)
                    break
                end
            end
        end
    end
end
addCommandHandler("setTeamPlayer",setTeamPlayer)
