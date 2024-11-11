mathfloor, mathrandom, mathceil, mathround = math.floor, math.random, math.ceil, math.round
current = {
    initialized = false,
	inVehicle = false,
	settings = {},
	stress = 0
}

function SendReactMessage(action, data)
	SendNUIMessage({
		action = action,
		data = data,
	})
end

function initialize()
	Wait(1000)
	izzy.debug("Langs initializing!")
	SendReactMessage("setLang", cfg.locales[cfg.locale])
	izzy.debug("Langs initialized!")
	Wait(100)
	izzy.debug("Server details and player settings initializing!")
	local isDefault = GetResourceKvpString("settings") == nil or GetResourceKvpString("settings") == 'nil' or GetResourceKvpString("settings") == {}
	local settings = not isDefault and json.decode(GetResourceKvpString("settings")) or cfg.defaultSettings

    SendReactMessage("setConfig", {
		serverNameBold = cfg.serverNameBold,
		serverName = cfg.serverName,
		colors = cfg.colors,
		notifyPosition = cfg.notifyPosition,
		useRealTime = cfg.useRealTime
	})
	Wait(100)
	current.settings = settings
	SendReactMessage("updateSettings", settings)
	izzy.debug("Server details and player settings initialized!")
	Wait(100)
    current.initialized = true
    SendReactMessage("HandleDisplay", current.initialized)
	Wait(100)
	izzy.debug("Status initializing!")
	for i = 1, #cfg.status do
		cfg.status[i].value = getStatus(cfg.status[i].name)
	end
	SendReactMessage("setStatus", cfg.status)
	izzy.debug("Status initialized!")
	Wait(100)
	izzy.debug("Top infos initializing!")
	for i = 1, #cfg.topInfos do
		cfg.topInfos[i] = getTopInfo(cfg.topInfos[i])
	end
	SendReactMessage("setTopInfos", cfg.topInfos)
	izzy.debug("Top infos initialized!")
	Wait(100)
	map(current.settings.mapType)
end

function unloadData()
	current.initialized = false
	SendReactMessage('HandleDisplay', current.initialized)
end

function calculateTime()
	local hour = GetClockHours()
    local minute = GetClockMinutes()
	if hour <= 9 then hour = "0" .. hour end
	if minute <= 9 then minute = "0" .. minute end

    return hour .. ":" .. minute
end

CreateThread(function()
	SetTextChatEnabled(false)
	SetNuiFocus(false)
	while true do
		if current.initialized then
			local pPed = PlayerPedId()
			local pWeapon = GetSelectedPedWeapon(pPed)
			local pCoords = GetEntityCoords(pPed)
			for i = 1, #cfg.status do
				local tempStatus = cfg.status[i]
				if tempStatus.name == "mic" then
					local vState = getVoiceState()
					if vState.talking then
						if not tempStatus.defaultColor then
							tempStatus.defaultColor = tempStatus.color
						end
						tempStatus.color = "#78FC4A"
					else
						tempStatus.color = tempStatus.defaultColor or tempStatus.color
					end
					tempStatus.rangeLabel = vState.rangeLabel
				end
				cfg.status[i].value = mathfloor(getStatus(tempStatus.name))
			end

			for i = 1, #cfg.topInfos do
				cfg.topInfos[i] = getTopInfo(cfg.topInfos[i])
			end
            
			if pWeapon and pWeapon ~= `weapon_unarmed` and izzy.weapons[pWeapon] then
				local _, tempCurrentAmmo = GetAmmoInClip(pPed, pWeapon)
				local weapon = izzy.weapons[pWeapon]
				SendReactMessage('setWeapon', {
					current = tempCurrentAmmo,
					total = (GetAmmoInPedWeapon(pPed, pWeapon) - tempCurrentAmmo),
					name = weapon and weapon.name or 'WEAPON_ASSAULTRIFLE',
					label = weapon and weapon.label or "Assault Rifle"
				})
			else
				SendReactMessage('setWeapon', {})
			end
			SetRadarBigmapEnabled(false, false)
			SetRadarZoom(cfg.minimapScale)
			SendReactMessage("setStatus", cfg.status)
			SendReactMessage("setTopInfos", cfg.topInfos)
			
			if not cfg.useRealTime then
				SendReactMessage("setTime", calculateTime())
			end
		end
		Wait(cfg.updateInterval)
	end
end)

local previousStreet = ""
CreateThread(function()
	while true do
		Wait(1000)
		if current.initialized then
			local pCoords = GetEntityCoords(PlayerPedId())
			local _, streetHash = GetStreetNameAtCoord(pCoords.x, pCoords.y, pCoords.z)
			streetHash = GetStreetNameFromHashKey(streetHash)
			if previousStreet ~= streetHash and streetHash ~= '' then
				previousStreet = streetHash
			end
			SendReactMessage("setLocation", {
				inVehicle = current.inVehicle,
				street = previousStreet,
				direction = getDirection()
			})
			SendReactMessage("setVisibility", not IsPauseMenuActive())
		end
	end
end)

RegisterCommand(cfg.settingsCommand, function()
	SendReactMessage("setLang", cfg.locales[cfg.locale])
	SendReactMessage("HandleSettingsDisplay", true)
	SetNuiFocus(true, true)
end)

RegisterNUICallback("save", function(data, cb)
	current.settings = data
	map(data.mapType)
	SetResourceKvp("settings", json.encode(data))
	cb({ 'ok' })
end)

RegisterNUICallback("defaultAll", function(_, cb)
	current.settings = cfg.defaultSettings
	SendReactMessage("setSettings", cfg.defaultSettings)
	SetResourceKvp("settings", "nil")
	cb({ 'ok' })
end)

RegisterNUICallback("updateMap", function(type, cb)
	map(type)
	cb({ 'ok' })
end)

RegisterNUICallback("close", function(_, cb)
	SendReactMessage("HandleSettingsDisplay", false)
	SetNuiFocus(false, false)
	if not IsPedInAnyVehicle(PlayerPedId(), false) then
		SendReactMessage("setCarDisplay", false)
	end
	cb({ 'ok' })
end)

function addNotification(type, str, duration)
	SendReactMessage("addNotification", {color = cfg.notifyTypes[type] or "pink", str = str, duration = duration or 5000})
end
exports("addNotification", addNotification)
RegisterNetEvent("izzy-hudv3:client:addNotification", addNotification)

RegisterCommand("notify", function()
	addNotification("success", "Izzy Shop")
	Wait(100)
	addNotification("inform", "Izzy Shop")
	Wait(100)
	addNotification("error", "Izzy Shop")
end)