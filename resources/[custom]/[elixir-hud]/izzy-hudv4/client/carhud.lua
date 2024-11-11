
abs = false

RegisterNetEvent('izzy-hudv4:enteredVehicle', function()
    current.inVehicle = true
    SendReactMessage("setCarDisplay", true)
    repeat
        Wait(cfg.speedoInterval)
        local pPed = PlayerPedId()
        local pVehicle = GetVehiclePedIsIn(pPed, false)
        local speed = mathceil(GetEntitySpeed(pVehicle) * (current.settings.speedType == "kmh" and 3.6 or 2.236936))
        local fuel = mathround(getFuel(pVehicle))
        local gear = pVehicle ~= 0 and GetVehicleCurrentGear(pVehicle) or 0

        if IsControlPressed(0, 72) then
            if not abs then
                abs = true
            end
        else
            if abs then
                abs = false
            end
        end

        if pVehicle ~= 0 then
            SendReactMessage('updateCarHud', {
                speed = speed,
                fuel = fuel,
                headlights = (GetVehicleDashboardLights() == 128 or GetVehicleDashboardLights() == 256) and 1 or (GetVehicleDashboardLights() == 384 and 2 or 0),
                leftSignal = GetVehicleIndicatorLights(pVehicle) == 1 or GetVehicleIndicatorLights(pVehicle) == 3,
                rightSignal = GetVehicleIndicatorLights(pVehicle) == 2 or GetVehicleIndicatorLights(pVehicle) == 3,
                abs = abs,
                seatbelt = seatbeltOn,
                rpm = speed <= 3 and 0.0 or GetVehicleCurrentRpm(pVehicle) * 18,
                engine = GetVehicleEngineHealth(pVehicle) / 10,
                nitrous = vehicleNitro or 0,
                previousGear = gear == 0 and "R" or gear == 1 and "N" or gear - 1,
                gear = gear == 0 and "N" or gear,
                nextGear = gear + 1 <= GetVehicleHighGear(pVehicle) and gear + 1 or GetVehicleHighGear(pVehicle)
            })
        end
        DisplayRadar(1)
    until (not current.inVehicle)

    if current.settings.mapVisibility == "vehicle" then
        DisplayRadar(0)
    end
end)

RegisterNetEvent('izzy-hudv4:leftVehicle', function()
    current.inVehicle = false
    SendReactMessage('setCarDisplay', false)
    if current.settings.mapVisibility == "vehicle" then
        DisplayRadar(0)
    end
end)