call(getResourceFromName("scoreboard"), "scoreboardAddColumn", "Level", root, 50, "Уровень", 3)
local coef = 10

function updateExperience (thePlayer, differenceExp)
	local exp = tonumber(getElementData(thePlayer, "Exp"))
	local lvl = tonumber(getElementData(thePlayer, "Level"))
    if (exp+differenceExp >= lvl*coef) and (exp+differenceExp >= 0) then
        setElementData(thePlayer, "Level", lvl+1)
        setElementData(thePlayer, "Exp", 0)
    elseif not(exp+differenceExp >= lvl*coef) and (exp+differenceExp >= 0) then   
        setElementData(thePlayer, "Exp", exp+differenceExp)
    elseif not(exp+differenceExp >= lvl*coef) and (exp+differenceExp < 0) then
        setElementData(thePlayer, "Exp", 0)
    end
end


addEventHandler("onPlayerLogin", root, 
function(_, currAccount)
	local lvl = getAccountData(currAccount, "Level")
	local exp = getAccountData(currAccount, "Exp")
	if lvl and exp then
		setElementData(source, "Level", lvl)
		setElementData(source, "Exp", exp)
	else
		setElementData(source, "Level", 1)
		setElementData(source, "Exp", 0)
		setAccountData(currAccount, "Exp", 0)
		setAccountData(currAccount, "Level", 1)
	end
end)

addEventHandler("onPlayerQuit", root, 
function()
	local account = getPlayerAccount(source)
	if account and not isGuestAccount(account) then
		local lvl = getElementData(source, "Level")
		local exp = getElementData(source, "Exp")
		if lvl and exp then
			setAccountData(account, "Exp", exp)
			setAccountData(account, "Level", lvl)
		else
			setAccountData(account, "Exp", 0)
			setAccountData(account, "Level", 1)
		end
	end
end)

addCommandHandler("setlevel", 
function(player, cmd, target, amount)
	local accName = getAccountName(getPlayerAccount(player))
	if not isObjectInACLGroup ("user."..accName, aclGetGroup("Admin")) then
		outputChatBox("Вы не имеете доступа к данной команде!", player, 255, 0, 0)
		return
	end
	if target then
		if tonumber(amount) then
			local targetplayer = getPlayerFromName(target)
			if targetplayer then
				setElementData(targetplayer, "Level", amount)
				setElementData(targetplayer, "Exp", 0)
				outputChatBox(getPlayerName(player).." установил Вам "..amount.." уровень!", targetplayer, 0, 255, 0, true)
				outputChatBox("Вы успешно установили "..amount.." уровень игроку "..getPlayerName(targetplayer).."!", player, 0, 255, 0, true)
			else
				outputChatBox("Ошибка: Игрок не найден", player, 255, 0, 0)
			end
		else
			outputChatBox("Используйте: /setlevel [Ник] [Уровень]", player, 255, 0, 0)
		end
	else 
		outputChatBox("Используйте: /setlevel [Ник] [Уровень]", player, 255, 0, 0)
	end
end)