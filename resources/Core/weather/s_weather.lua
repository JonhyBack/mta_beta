idWeather = tonumber(get("weather")) or 7
addEventHandler("onResourceStart",getResourceRootElement(), function()
    setWeather(idWeather)
end)

local function TimeUpdate() 
    local tReal = getRealTime(); -- Получаем время 
    local tGameHour, tGameMins = getTime(); 
    if tGameHour ~= tReal.hour or tGameMins ~= tReal.minute then                 
        setTime( tReal.hour, tReal.minute ); -- при частом использовании setTime, мир будет "дёргаться", поэтому лучше сделать такую проверочку. 
    end 
end     
setTimer( TimeUpdate, 5000, 0 );
setMinuteDuration( 60000 );

addCommandHandler("devmode",
    function()
        local res = setDevelopmentMode(true)
        outputChatBox(tostring(res))
    end
) 