function getTableAllVehicles( startedMap )        
vehicleElements = getElementsByType ( "vehicle" ) 
assert(vehicleElements,"Error: getElementsByType (vehicle); core_s ")
end
addEventHandler("onResourceStart", root, getTableAllVehicles)

function setRespawnVehicles(  )
    outputChatBox('Allo1')
    for _, theVehicle in ipairs(vehicleElements) do
    if ( theVehicle ) then
        toggleVehicleRespawn ( theVehicle, true ) 
        setVehicleIdleRespawnDelay ( theVehicle, 2000 ) 
        setVehicleRespawnDelay( theVehicle, 2000 )
        setVehicleEngineState(theVehicle, false)
    end
end
end
addEventHandler("onVehicleExit",root,setRespawnVehicles)