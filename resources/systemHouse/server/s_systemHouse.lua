handler = dbConnect("sqlite", "houses.db")
dbPollTime = 500

houses = {}

local function createHouse(id,X,Y,Z,intX,intY,intZ,INT, Owner, Price, Rent, Locked)
    local entry
    if Owner == 'free' then
        entry = createPickup(X,Y,Z,3, 1273, 0)
    else
        entry = createPickup(X,Y,Z,3, 1272, 0)
    end

    setElementInterior(entry,0)
    setElementDimension(entry, 0)
    setElementData(entry, "House: id", id)
    setElementData(entry, "ownerHouse", Owner)
    setElementData(entry, "Price", Price)
    setElementData(entry, "Rent", Rent)

    local colOutHouse = createColSphere(X,Y,Z, 1.5)
    setElementDimension(colOutHouse, 0)
    setElementData(colOutHouse, "House: id", id)
    setElementData(colOutHouse, "ownerHouse", Owner)

    addEventHandler("onPlayerLogin", root, function()
        triggerClientEvent(source,"createHouse3DText", root, id, X, Y, Z, Owner, Price, Rent, entry)
    end)

    if Locked then 
        setElementData(entry, "statusLock", true) 
    else
        setElementData(entry, "statusLock", false) 
    end

    addEventHandler("onColShapeHit", colOutHouse, function(element, dimension)
        if dimension == true then
            if getElementType(element) == "player" and not getPedOccupiedVehicle(element) then                
                bindKey(element,'f','down',function()
                    local idHouse = getElementData(colOutHouse,"House: id")
                    outputChatBox(idHouse)                    
                    setElementData(element, "LastIdHouse",idHouse)
                    local owner = getElementData(colOutHouse, "ownerHouse")
                    if owner == "free" then
                        triggerClientEvent(element, "openPanelBuyHouse", element)
                    elseif getPlayerName(element) == owner then
                        triggerClientEvent(element, "openPanelHouse", element)
                    elseif not getElementData(colOutHouse,"statusLock") then
                        triggerClientEvent(element, "openPanelHouse", element)                     
                    else
                        outputChatBox("Закрыто", element)
                    end      
                end)               
            end
        end
    end)

    addEventHandler("onColShapeLeave", colOutHouse, function(element, dimension)
        if dimension == true then
            if getElementType(element) == "player" and not getPedOccupiedVehicle(element) then
                setElementData(element, "LastIdHouse",false)
                unbindKey(element,'f','down')   
            end
        end
    end)

    local colInHouse = createColSphere(intX,intY,intZ, 1.5)
    setElementDimension(colInHouse, id)
    local exit = createPickup(intX,intY,intZ,3,1318, 0)
    setElementDimension(exit, id)
    setElementInterior(exit,INT)
    setElementData(colInHouse,"House: id",id)

    addEventHandler("onColShapeHit", colInHouse, function(element, dimension)
        if dimension == true then
            if getElementType(element) == "player" then
                bindKey(element,'f','down',function()
                    setElementFrozen(element,true)
                    setElementDimension(element, 0)
                    setElementInterior(element, 0)
                    setElementPosition(element, X,Y,Z)
                    setTimer(function()
                        setElementFrozen(element,false)
                    end,1000,1)
                end)
            end
        end
    end)

    addEventHandler("onColShapeLeave", colInHouse, function(element, dimension)
        if dimension == true then
            if getElementType(element) == "player" then
                unbindKey(element,'f','down')
            end
        end
    end)
end

local function createNewHome(X,Y,Z,intX,intY,intZ,INT,Price, Rent)
    local id = 1
    if houses == not nil then        
        id = houses[#houses]['id'] + 1
    end

    createHouse(id,X,Y,Z,intX,intY,intZ,INT, "free", Price, Rent, true)
    local query = dbExec(handler, "INSERT INTO 'houses'(X,Y,Z,intX,intY,intZ,INT,Price, Rent) VALUES(?,?,?,?,?,?,?,?,?)",
    X,Y,Z,intX,intY,intZ,INT,Price, Rent)
end
addEvent("createNewHome", true)
addEventHandler("createNewHome", root,createNewHome )

local function pedBuyHouse()
    local id = getElementData(source, "LastIdHouse")
    local account = getPlayerAccount(source)

    if not id then 
        return
    end

    local accHouseID = getAccountData(account, 'HouseID')
    if accHouseID  then
        if accHouseID >= 0 then 
            outputChatBox("You a have another home")
        end
        outputChatBox("ErrorDB")
        return
    end

    local moneyAcc = getAccountData(account, 'Money') 
    setAccountData(account, 'Money', 10000)
    if moneyAcc - houses[id].Price < 0 then
        outputChatBox("You don`t have required money")
        return
    end

    for _ ,house in ipairs(houses) do

        if house.id == id then          
            house.Owner = getPlayerName(source)
            dbExec(handler, "UPDATE 'houses' SET Owner = ?", house.Owner," WHERE id = ?", house.id)
            local pickups = getElementsByType('pickup')
            local colshapes = getElementsByType('colshape')
            if colshapes and pickups then 
                outputChatBox('Yes')
                for _, colshape in ipairs(colshapes) do
                    if getElementData(colshape, 'House: id') == id then

                        setElementData(colshape, "ownerHouse", house.Owner) 

                        local result = setAccountData(getPlayerAccount(source), 'HouseID', house.id)

                        if result then
                            outputChatBox('Yes1')
                        end

                        triggerClientEvent(source, "closePanelBuyHouse", source)
                        break
                    end
                end

                for _, pickup in ipairs(pickups) do
                    if getElementData(pickup, 'House: id') == id then
                        setElementData(pickup, "ownerHouse", house.Owner) 
                        local X, Y, Z = getElementPosition(pickup)
                        destroyElement(pickup)
                        local newPickup = createPickup(X,Y,Z,3, 1272, 0)
                        local players = getElementsByType('player')

                        for _, player in ipairs(players) do
                            triggerClientEvent(source,"createHouse3DText", root, id, X, Y, Z, house.Owner,
                            house.Price, house.Rent, newPickup)
                        end
                        
                        outputChatBox('Yes2')
                        triggerClientEvent(source, "closePanelBuyHouse", source)
                        break
                    end
                end               
            end
        end
    end
end
addEvent("pedBuyHouse", true)
addEventHandler("pedBuyHouse",root, pedBuyHouse)

local function pedEntryHouse()
    local id = getElementData(source, "LastIdHouse")

    if not id then 
        return
    end

    local accHouseID = getAccountData(getPlayerAccount(source), 'HouseID')

    if not accHouseID or accHouseID == -1 then
        outputChatBox("This is not you home")
        return 
    end

    for _ ,house in ipairs(houses) do
        if house.id == id and house.id == accHouseID then
            outputChatBox("This is you home")
            unbindKey(source,'f','down')
            setElementInterior(source, house.INT)
            setElementDimension(source, house.id)
            setElementPosition(source, house.intX,house.intY,house.intZ)
            triggerClientEvent(source, "closePanelHouse", source)
            break
        end
    end
end
addEvent("pedEntryHouse", true)
addEventHandler("pedEntryHouse",root, pedEntryHouse)

function spawnInHome(account)
    local accHouseID = getAccountData(account, 'HouseID')
    local skin = tonumber(getAccountData(account,"Skin"))
    for _ ,house in ipairs(houses) do 
        if accHouseID == house.id then
            local source = getAccountPlayer(account)
            spawnPlayer(source, house.intX,house.intY,house.intZ, _, skin, house.INT, house.id)           
        end
    end
end

addEventHandler("onPlayerRegister", root, function(account) 
    setAccountData(account, 'HouseID', -1)
end)

addEventHandler("onResourceStart", getResourceRootElement(), function()
    local query = dbQuery(handler, "SELECT * FROM houses;" )
    local numrows
    houses, numrows = dbPoll(query, dbPollTime)
    if not (houses and numrows > 0) then
        outputServerLog("BD house false or null")
        return
    end
    for i,house in ipairs(houses) do
        createHouse(house["id"],house["X"],house["Y"],house["Z"],house["intX"], house["intY"],
        house["intZ"],house["INT"],house["Owner"], house["Price"], house["Rent"], house["Locked"])
    end

end)

addEventHandler("onResourceStop", getResourceRootElement(), function()
    destroyElement(handler)
end)


