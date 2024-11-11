local nitros = {}

RegisterServerEvent('baseevents:enteredVehicle', function()
    TriggerClientEvent('izzy-hudv4:enteredVehicle', source)
end)

RegisterServerEvent('baseevents:leftVehicle', function()
    TriggerClientEvent('izzy-hudv4:leftVehicle', source)
end)

izzy.registerCallback("izzy-hudv4:getVehicleNitro", function(src, cb, plate)
    cb(nitros[plate])
end)

RegisterNetEvent('izzy-hudv4:setVehicleNitro', function(plate, count)
    nitros[plate] = count
end)

RegisterNetEvent("izzy-hudv4:removeNitroItem", function()
    removeItem(source, cfg.nitroItem, 1)
end)