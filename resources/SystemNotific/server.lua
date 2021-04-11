function Draw(text, plr)
	if not plr or not isElement(plr) or getElementType(plr) ~= "player" then return end
	triggerClientEvent(plr, "addText", root, text)
	playSoundFrontEnd(plr, 1)
end
