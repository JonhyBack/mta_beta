local screenW,screenH = guiGetScreenSize() 
local pX,pY = screenW/1366,screenH/768

local DGS = exports.dgs

local lenLogin= 3
local lenPass= 5
local sound = false
local sexPlayer = 'NaN'

local font = DGS:dgsCreateFont( "LoginForm/fonts/1.ttf", 13*pX )

local background = DGS:dgsCreateImage(0,0,1366*pX,768*pY,"LoginForm/images/02.jpg",false)
DGS:dgsSetVisible(background, false)
-------Login Window-------
local windowLogin = DGS:dgsCreateWindow((screenW - 226) / 2, (screenH - 232) / 2, 226, 250, "Аутентификация", false)
DGS:dgsWindowSetSizable(windowLogin,false)
DGS:dgsWindowSetMovable(windowLogin,false)
DGS:dgsSetVisible(windowLogin, false)
DGS:dgsSetLayer (windowLogin,"top")
DGS:dgsSetFont(windowLogin,font)
DGS:dgsWindowSetCloseButtonEnabled(windowLogin, false)

local loginEditLogin = DGS:dgsCreateEdit(58, 50, 115, 29, "", false, windowLogin) 
DGS:dgsSetFont(loginEditLogin,font)
DGS:dgsEditSetPlaceHolder(loginEditLogin,"Login")

local passwordEditLogin = DGS:dgsCreateEdit(58, 90, 115, 29, "", false, windowLogin) 
DGS:dgsSetFont(passwordEditLogin,font)
DGS:dgsEditSetMasked (passwordEditLogin, true )
DGS:dgsEditSetPlaceHolder(passwordEditLogin,"Password")

local buttonLogin = DGS:dgsCreateButton(73, 147, 81, 26, "Войти", false,windowLogin)
DGS:dgsSetFont(buttonLogin,font)

local buttonCreateAccount = DGS:dgsCreateButton(40, 185, 150, 28, "Создать аккаунт", false,windowLogin)
DGS:dgsSetFont(buttonCreateAccount,font)
-------Login Window-------

-------Register Window-------
local windowRegister = DGS:dgsCreateWindow((screenW - 255) / 2, (screenH - 379) / 2, 255, 400, "Аутентификация", false)
DGS:dgsWindowSetSizable(windowRegister,false)
DGS:dgsWindowSetMovable(windowRegister,false)
DGS:dgsSetVisible(windowRegister, false)
DGS:dgsSetLayer (windowRegister,"top")
DGS:dgsSetFont(windowRegister,font)
DGS:dgsWindowSetCloseButtonEnabled(windowRegister, false)

local nickEdit = DGS:dgsCreateEdit(60, 40, 136, 29, "", false, windowRegister) 
DGS:dgsSetFont(nickEdit,font)
DGS:dgsEditSetPlaceHolder(nickEdit,"Nickname")

local loginEditRegister = DGS:dgsCreateEdit(60, 90, 136, 29, "", false, windowRegister) 
DGS:dgsSetFont(loginEditRegister,font)
DGS:dgsEditSetPlaceHolder(loginEditRegister,"Login")

local passwordEditRegister = DGS:dgsCreateEdit(60, 140, 136, 29, "", false, windowRegister) 
DGS:dgsSetFont(passwordEditRegister,font)
DGS:dgsEditSetMasked (passwordEditRegister, true )
DGS:dgsEditSetPlaceHolder(passwordEditRegister,"Password")

local passwordEditR = DGS:dgsCreateEdit(60, 190, 136, 29, "", false, windowRegister) 
DGS:dgsSetFont(passwordEditR,font)
DGS:dgsEditSetMasked ( passwordEditR, true ) 
DGS:dgsEditSetPlaceHolder(passwordEditR,"Repeat")

local emailEdit = DGS:dgsCreateEdit(60, 240, 136, 29, "", false, windowRegister) 
DGS:dgsSetFont(emailEdit,font)
DGS:dgsEditSetPlaceHolder(emailEdit,"Email")

local buttonRegister = DGS:dgsCreateButton(21, 294, 213, 35, "Зарегестрироваться", false,windowRegister)
DGS:dgsSetFont(buttonRegister,font)

local buttonBack = DGS:dgsCreateButton(78, 339, 100, 30,  "Назад", false,windowRegister)
DGS:dgsSetFont(buttonBack,font)
-------Register Window-------
-------Choose Window-------
local windowChoose = DGS:dgsCreateWindow((screenW - 270) / 2, (screenH - 153) / 2, 270, 153, "Аутентификация", false)
DGS:dgsWindowSetSizable(windowChoose,false)
DGS:dgsWindowSetMovable(windowChoose,false)
DGS:dgsSetVisible(windowChoose, false)
DGS:dgsSetLayer (windowChoose,"top")
DGS:dgsSetFont(windowChoose,font)
DGS:dgsWindowSetCloseButtonEnabled(windowChoose, false)

local buttonFemale = DGS:dgsCreateButton(20, 75, 105, 36, "Женщина", false,windowChoose)
DGS:dgsSetFont(buttonFemale,font)

local buttonMale = DGS:dgsCreateButton(146, 75, 105, 36, "Мужчина", false,windowChoose)
DGS:dgsSetFont(buttonMale,font)

local labelChoose = DGS:dgsCreateLabel(77, 29, 126, 36, "Виберите пол", false,windowChoose)
DGS:dgsSetFont(labelChoose,font)
-------Choose Window-------

local function successRegister()
    DGS:dgsSetVisible(windowChoose, false)
    DGS:dgsSetVisible(windowLogin, true)
    call(getResourceFromName("SystemNotific"),"Draw","Успешно зарегестрирован!")
end

local function openPanel()
    DGS:dgsSetVisible(background, true)
    DGS:dgsSetVisible(windowLogin, true)
    DGS:dgsFocus(loginEditLogin)
    showCursor(true)
    showChat(false)
    DGS:dgsSetInputMode("no_binds_when_editing")
    sound = playSound('LoginForm/music/music.mp3')
    setSoundVolume(sound, 0.2)
end
addEvent('openPanel',true)
addEventHandler('openPanel',root,openPanel)

local function closePanel()
    DGS:dgsSetVisible(background, false)
    DGS:dgsSetVisible(windowLogin, false)
    showCursor(false)
    showChat(true)
    setSoundPaused(sound,true)
    stopSound(sound)
    DGS:dgsSetInputMode("allow_binds")
    setElementFrozen(localPlayer, false)
    unbindKey("enter","down",onPressedEnter)
end
addEvent('closePanel',true)
addEventHandler('closePanel',root,closePanel)

local function chooseLogin()
    local resultLogin = DGS:dgsGetText(loginEditLogin)
    local resultPassword = DGS:dgsGetText(passwordEditLogin)
    if (not (string.find(resultLogin,'%s'))) and string.len(resultLogin) >= lenLogin and (string.find(resultLogin,'%a')) then  
        if (not (string.find(resultPassword,'%s'))) and string.len(resultPassword) >= lenPass and (string.find(resultLogin,'%w')) then 
            triggerServerEvent('loginPlayer',localPlayer,resultLogin,resultPassword, sexPlayer)
        else 
            call(getResourceFromName("SystemNotific"),"Draw","Пароль введен неправильно")
            return
        end
    else 
        call(getResourceFromName("SystemNotific"),"Draw","Логин введен неправильно. Можно использовать только английскую раскладку")       
        return
    end
end

local function transformToChooseCreateAccount()
    DGS:dgsSetVisible(windowLogin, false)
    DGS:dgsSetVisible(windowRegister, true)
    DGS:dgsFocus(nickEdit)
end

local function chooseRegister()
    local result_nickEdit= DGS:dgsGetText(nickEdit)
    local result_loginEditRegister= DGS:dgsGetText(loginEditRegister)
    local result_passwordEditRegister= DGS:dgsGetText(passwordEditRegister)
    local result_passwordEditR= DGS:dgsGetText(passwordEditR)
    local result_emailEdit= DGS:dgsGetText(emailEdit)

    if not (result_passwordEditRegister == result_passwordEditR) then 
        call(getResourceFromName("SystemNotific"),"Draw","Пароли не совпадают")
        return
    end

    local nick = not (string.find(result_nickEdit,'%s')) and string.len(result_nickEdit) >= lenLogin and string.find(result_nickEdit,'%a')
    if not nick then
        call(getResourceFromName("SystemNotific"),"Draw","Ник введен неправильно")
        return
    end

    local login = not (string.find(result_loginEditRegister,'%s')) and string.len(result_loginEditRegister) >= lenLogin and (string.find(result_loginEditRegister,'%w'))
    if not login then
        call(getResourceFromName("SystemNotific"),"Draw","Логин введен неправильно. Можно использовать только английскую раскладку")
        return
    end

    local pass = not (string.find(result_passwordEditRegister,'%s')) and string.len(result_passwordEditRegister) >= lenPass and (string.find(result_passwordEditRegister,'%w'))
    if not pass then  
        call(getResourceFromName("SystemNotific"),"Draw","Пароль введен неправильно")
        return
    end
        
    local passR = not (string.find(result_passwordEditR,'%s')) and string.len(result_passwordEditR) >= lenPass and (string.find(result_passwordEditR,'%w'))
    if not passR then  
        call(getResourceFromName("SystemNotific"),"Draw","Пароль введен неправильно")
        return
    end
        
    local email = not (string.find(result_emailEdit,'%s')) and string.len(result_emailEdit) >= lenPass and (string.find(result_emailEdit,'@')) and (string.find(result_emailEdit,'.'))
    if not email then  
        call(getResourceFromName("SystemNotific"),"Draw","Емеил введен неправильно")
        return
    end

    triggerServerEvent('registerPlayer',localPlayer,result_nickEdit, result_loginEditRegister, result_passwordEditRegister, result_emailEdit)
end

local function onPressedEnter() 
    if DGS:dgsGetVisible(windowLogin) then
        chooseLogin()
    elseif DGS:dgsGetVisible(windowRegister) then
        chooseRegister()
    end
end
bindKey("enter","down",onPressedEnter)

local function transformToChooseBack()
    DGS:dgsSetVisible(windowRegister, false)
    DGS:dgsSetVisible(windowLogin, true)
end

local function mouseClick(button)
    if button == "left" then
        if source == buttonLogin then 
            chooseLogin()
        elseif source == buttonCreateAccount then 
            transformToChooseCreateAccount()
        elseif source == buttonRegister then 
            chooseRegister()
        elseif source == buttonBack then 
            transformToChooseBack()
        elseif source == buttonFemale then 
            sexPlayer = 'Female'
            successRegister()
        elseif source == buttonMale then
            sexPlayer = 'Male'
            successRegister()
        end
    end
end
addEventHandler("onDgsMouseClickDown", root, mouseClick)

addEventHandler("onClientResourceStart",getResourceRootElement(),function()
    setElementFrozen(localPlayer, true)   
    openPanel()
end)

local function transformToChooseSex() 
    DGS:dgsSetVisible(windowRegister, false)
    DGS:dgsSetVisible(windowChoose, true)
end
addEvent('transformToChooseSex',true)
addEventHandler("transformToChooseSex", root, transformToChooseSex)
