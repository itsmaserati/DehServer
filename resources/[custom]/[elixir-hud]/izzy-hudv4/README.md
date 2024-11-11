leaked by krienius

# Notification

function QBCore.Functions.Notify(text, texttype, length)
	texttype = texttype == "success" and "success" or texttype == "error" and "error" or "inform"
	length = length or 5000
	if type(text) == 'table' then
		local ttext = text.text or 'Placeholder'
		local caption = text.caption or 'Placeholder'
		exports['izzy-hudv4']:addNotification(type, caption, length)
	else
		exports['izzy-hudv4']:addNotification(type, caption, length)
	end
end

# Stress Events (client side)

TriggerEvent("izzy-hudv4:client:gainStress", math.random(1, 3))
TriggerEvent("izzy-hudv4:client:relieveStress", math.random(1, 3))
