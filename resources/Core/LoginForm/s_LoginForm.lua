local function loginPlayer(login, pass, sexPlayer)
    local account = getAccount(login, pass)
    if account and source then 
        if sexPlayer == 'NaN' then 
            spawnOnLogin(source,account,pass)
        elseif sexPlayer == 'Female' then 
            setAccountData(account,"Sex",sexPlayer or 'Female')
            setAccountData(account,"Skin",get('skinOnRegisterFemale') or 193)
            spawnOnLogin(source,account,pass)
        elseif sexPlayer == 'Male' then
            setAccountData(account,"Sex",sexPlayer or 'Male')
            setAccountData(account,"Skin",tonumber(get('skinOnRegisterMale')) or 250)
            spawnOnLogin(source,account,pass)
        end
    elseif getAccount(login) then
        call(getResourceFromName("SystemNotific"),"Draw","Пароль неверный",source)
    else
        call(getResourceFromName("SystemNotific"),"Draw","Такого аккаунта не существует",source)
    end
end
addEvent('loginPlayer',true)
addEventHandler('loginPlayer',root,loginPlayer)

local function registerPlayer(nick, login, pass, email)
    local account = getAccount(login, pass)
    if not account then 
        local newAccount = addAccount(login,pass)
        setAccountData(newAccount,"Nickname", nick)
        setAccountData(newAccount,"Email", email)
        setAccountData(newAccount,"Money", 0)
        triggerClientEvent(source,'transformToChooseSex',source)
    else
        call(getResourceFromName("SystemNotific"),"Draw","Такой аккаунт уже существует",source)
    end
end
addEvent('registerPlayer',true)
addEventHandler('registerPlayer',root,registerPlayer)
 
function spawnOnLogin (source ,account ,pass)
    local money = getAccountData(account,"Money") or 0
    setPlayerMoney(source, money)
    setPlayerName(source,getAccountData(account,"Nickname"))    
    local x,y,z,r = unpack(spawnpoints[math.random(1,#spawnpoints)])
    logIn(source,account,pass)

    local accHouseID = getAccountData(account, 'HouseID')
    if accHouseID then 
        call(getResourceFromName ( "systemHouse" ), 'spawnInHome', account)
    else
        local skin = tonumber(getAccountData(account,"Skin"))
        spawnPlayer(source,x+math.random(-3,3),y+math.random(-3,3),z,r, skin or 250,0,0)
    end

    setPlayerHudComponentVisible(source,'area_name',false)
	setPlayerHudComponentVisible(source,'vehicle_name',false)
    setPlayerHudComponentVisible(source,'radio',false)
    fadeCamera (source, true)
    setCameraTarget (source, source)
    triggerClientEvent(source,'closePanel',source)  
end
