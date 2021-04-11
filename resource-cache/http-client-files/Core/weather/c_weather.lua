addEventHandler("onClientResourceStart",getResourceRootElement(), function()
    setAmbientSoundEnabled( "gunfire", false )
    
    local result = isWorldSoundEnabled(0, 27)
    outputChatBox("Go")
    if result then
        outputChatBox("okey")
        outputChatBox(tostring(result))
    else
        outputChatBox("No okey")
    end
    setWorldSoundEnabled(0, 27, false, true)

    result = isWorldSoundEnabled(0, 27)
    outputChatBox(tostring(result))

    setWorldSoundEnabled(0, 28, false, true)
    setWorldSoundEnabled(0, 0, false, true)
    setWorldSoundEnabled(0, 29, false, true)
    setWorldSoundEnabled(0, 30, false, true)
end)