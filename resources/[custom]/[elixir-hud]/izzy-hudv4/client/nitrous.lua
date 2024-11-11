if cfg.useNitro then
	local ped = PlayerPedId()
	local isDriver = false
	local vehicle = false
	local lastVehicle = false

	local particles = {}
	local lightTrailEnabled = false

	CreateThread(function()
		while true do
			ped = PlayerPedId()
			vehicle = GetVehiclePedIsIn(ped, false)

			if vehicle ~= 0 then 
				if not isDriver then
					isDriver = GetPedInVehicleSeat(vehicle, -1) == ped
                    vehicleNitro = 0
                    izzy.triggerCallback('izzy-hudv4:getVehicleNitro', function(name)
                        vehicleNitro = name
                    end, GetVehicleNumberPlateText(vehicle))
				end

				if not lastVehicle then
					lastVehicle = vehicle
				end
			else
				if lastVehicle then
					if DoesEntityExist(lastVehicle) then
						TriggerServerEvent("izzy-hudv4:setVehicleNitro", GetVehicleNumberPlateText(lastVehicle),
							vehicleNitro)
					end

					isDriver = false
					lastVehicle = false

					Wait(50)

					vehicleNitro = 0
				end
			end

			Wait(1000)
		end
	end)

	function CreateVehicleExhaustBackfire(veh, scale)
		local exhaustNames = {
			"exhaust",
			"exhaust_2",
			"exhaust_3",
			"exhaust_4",
			"exhaust_5",
			"exhaust_6",
			"exhaust_7",
			"exhaust_8",
			"exhaust_9",
			"exhaust_10",
			"exhaust_11",
			"exhaust_12",
			"exhaust_13",
			"exhaust_14",
			"exhaust_15",
			"exhaust_16"
		}

		for _, exhaustName in ipairs(exhaustNames) do
			local boneIndex = GetEntityBoneIndexByName(veh, exhaustName)

			if boneIndex ~= -1 then
				local pos = GetWorldPositionOfEntityBone(veh, boneIndex)
				local off = GetOffsetFromEntityGivenWorldCoords(veh, pos.x, pos.y, pos.z)

				UseParticleFxAssetNextCall('core')
				StartNetworkedParticleFxNonLoopedOnEntity('veh_backfire', veh, off.x, off.y, off.z, 0.0, 0.0, 0.0, scale,
					false,
					false, false)
			end
		end
	end

	function CreateVehiclePurgeSpray(veh, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
		UseParticleFxAssetNextCall('core')

		return StartNetworkedParticleFxNonLoopedOnEntity('ent_sht_steam', veh, xOffset, yOffset, zOffset, xRot, yRot,
			zRot,
			scale, false, false, false)
	end

	function StartVehicleLightTrail(veh, bone, scale)
		UseParticleFxAssetNextCall('core')

		local ptfx = StartNetworkedParticleFxLoopedOnEntityBone('veh_light_red_trail', veh, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
			GetEntityBoneIndexByName(veh, bone), scale, false, false, false)

		SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)

		return ptfx
	end

	function StopVehicleLightTrail(ptfx, duration)
		CreateThread(function()
			local startTime = GetGameTimer()
			local endTime = GetGameTimer() + duration

			while GetGameTimer() < endTime do
				local now = GetGameTimer()
				local scale = (endTime - now) / duration

				SetParticleFxLoopedScale(ptfx, scale)
				SetParticleFxLoopedAlpha(ptfx, scale)

				Wait(0)
			end

			StopParticleFxLooped(ptfx)
		end)
	end

	function SetVehicleLightTrailEnabled(veh, enabled)
		if (lightTrailEnabled == enabled) then
			return
		end

		if enabled then
			local leftTrail = StartVehicleLightTrail(veh, "taillight_l", 1.0)
			local rightTrail = StartVehicleLightTrail(veh, "taillight_r", 1.0)

			table.insert(particles, leftTrail)
			table.insert(particles, rightTrail)
		else
			for _, particle in ipairs(particles) do
				StopVehicleLightTrail(particle, 500)
			end
		end

		lightTrailEnabled = enabled
	end

	function SetVehicleNitroBoostEnabled(veh, enabled)
		SetVehicleBoostActive(veh, enabled)

		if enabled then
			StartScreenEffect('RaceTurbo', 0, false)
			SetTimecycleModifier('rply_motionblur')
			ShakeGameplayCam('SKY_DIVING_SHAKE', 0.30)
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "nitro", 0.5)
		else
			StopScreenEffect('RaceTurbo')
			StopGameplayCamShaking(true)
			SetTransitionTimecycleModifier('default', 0.35)
		end
	end

	local isPressing = false
	RegisterCommand('+togglenitro', function(src, args, raw)
		if not isDriver then
			return
		end

        if type(vehicleNitro) ~= "number" then return end
		isPressing = true
		if isDriver and vehicleNitro > 0 then
			SetVehicleNitroBoostEnabled(vehicle, true)
			SetVehicleLightTrailEnabled(vehicle, true)
			SetVehicleEnginePowerMultiplier(vehicle, cfg.nitroForce)

			while isDriver and isPressing and vehicleNitro > 0 do
				CreateVehicleExhaustBackfire(vehicle, 1.25)
				vehicleNitro = vehicleNitro - cfg.removeNitroOnMilliseconds
				Wait(100)
			end

			SetVehicleNitroBoostEnabled(lastVehicle, false)
			SetVehicleLightTrailEnabled(lastVehicle, false)
			SetVehicleEnginePowerMultiplier(lastVehicle, 1.0)
		end
	end)

	RegisterCommand('-togglenitro', function(src, args, raw)
		isPressing = false
	end)

	RegisterKeyMapping('+togglenitro', 'Toggle Nitros', 'keyboard', cfg.nitroKey)

	RegisterNetEvent('izzy-hudv4:setupNitro')
    AddEventHandler('izzy-hudv4:setupNitro', function()
		local playerCoords = GetEntityCoords(ped)
		local inDirection = GetOffsetFromEntityInWorldCoords(ped, 0.0, 5.0, 0.0)
		local rayHandle = StartShapeTestRay(playerCoords, inDirection, 10, ped, 0)
		local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
		local veh = hit == 1 and GetEntityType(entityHit) == 2 and entityHit

		if not IsPedInAnyVehicle(ped, false) then
			if veh and DoesEntityExist(veh) and IsPedOnFoot(ped) then
				TriggerServerEvent('izzy-hudv4:removeNitroItem')
				TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
				Wait(5000)
				ClearPedTasks(ped)
				TriggerServerEvent('izzy-hudv4:setVehicleNitro', GetVehicleNumberPlateText(veh), 100)
			end
		end
	end)
end