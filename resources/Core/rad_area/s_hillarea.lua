function hill_Enter(thePlayer, matchingDimension)
    if getElementType(thePlayer) == "player" then
        outputChatBox('TyT')
        triggerEvent('killThisPlayer',thePlayer)
    end
end
addEventHandler("onColShapeHit", hillArea[1], hill_Enter)