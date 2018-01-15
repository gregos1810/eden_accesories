ESX          = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

local used = 0


function GetName(hash)
	local name ='null'
	for k,v in pairs(Config.weapon) do
			if GetHashKey(k) == hash then
				name = k
			end
	end
	return name
end



RegisterNetEvent('eden_accesories:silencieux')
AddEventHandler('eden_accesories:silencieux', function(duration)
		local inventory = ESX.GetPlayerData().inventory
		local silencieux = 0
		for i=1, #inventory, 1 do
			if inventory[i].name == 'silencieux' then
				silencieux = inventory[i].count
			end
		end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
			local name = GetName(currentWeaponHash)
			--print(currentWeaponHash)
			--print (Config.weapon[GetName(currentWeaponHash)].suppressor)
			if name ~= 'null' then
				if Config.weapon[GetName(currentWeaponHash)].suppressor ~= nil and Config.weapon[GetName(currentWeaponHash)].suppressor ~= '' then
					if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].suppressor ) then
						RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].suppressor)
						used = used - 1
						ESX.ShowNotification(("Vous venez de retirer ~r~le silencieux."))
					else
						if used < silencieux then
							GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[GetName(currentWeaponHash)].suppressor )
							ESX.ShowNotification(("Vous venez de vous équiper d'un silencieux. Il faudra le rééquiper a chaques retours en ville."))
							used = used + 1
						else
							ESX.ShowNotification(("Vous avez utiliser tout vos silencieux."))
						end
					end
				else
				ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de silencieux."))
				end
			else
				ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de silencieux."))
			end
end)

local used2 = 0

RegisterNetEvent('eden_accesories:flashlight')
AddEventHandler('eden_accesories:flashlight', function(duration)
				local inventory = ESX.GetPlayerData().inventory
				local flashlight = 0
				for i=1, #inventory, 1 do
				  if inventory[i].name == 'flashlight' then
					flashlight = inventory[i].count
				  end
				end
				local ped = PlayerPedId()
				local currentWeaponHash = GetSelectedPedWeapon(ped)

				if Config.weapon[GetName(currentWeaponHash)].flashlight ~= nil and Config.weapon[GetName(currentWeaponHash)].flashlight ~= '' then
					if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].flashlight ) then
						RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].flashlight)
						used2 = used2 - 1
						ESX.ShowNotification(("Vous venez de retirer ~r~la lampe."))
					else
						if used2 < flashlight then
							GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[GetName(currentWeaponHash)].flashlight )
							ESX.ShowNotification(("Vous venez de vous équiper d'une lampes. Il faudra le rééquiper a chaques retours en ville."))
							used2 = used2 + 1
						else
							ESX.ShowNotification(("Vous avez utiliser toutes vos lampes."))
						end
					end
				else
				ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de lampe."))
				end

end)

local used3 = 0
RegisterNetEvent('eden_accesories:grip')
AddEventHandler('eden_accesories:grip', function(duration)
	local inventory = ESX.GetPlayerData().inventory
	local grip = 0
		for i=1, #inventory, 1 do
		  if inventory[i].name == 'grip' then
			grip = inventory[i].count
		  end
	end
	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)

	if Config.weapon[GetName(currentWeaponHash)].grip ~= nil and Config.weapon[GetName(currentWeaponHash)].grip ~= '' then
		if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].grip ) then
			RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].grip)
			used3 = used3 - 1
			ESX.ShowNotification(("Vous venez de retirer ~r~la poignée."))
		else
			if used3 < grip then
				GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[GetName(currentWeaponHash)].grip )
				ESX.ShowNotification(("Vous venez de vous équiper d'une poignée. Il faudra le rééquiper a chaques retours en ville."))
				used3 = used3 + 1
			else
				ESX.ShowNotification(("Vous avez utiliser toutes vos poignée."))
			end
		end
	else
	ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de poignée."))
	end
end)

local used4 = 0

RegisterNetEvent('eden_accesories:varmod')
AddEventHandler('eden_accesories:varmod', function(duration)
			local inventory = ESX.GetPlayerData().inventory
			local varmod = 0
			for i=1, #inventory, 1 do
				  if inventory[i].name == 'varmod' then
					varmod = inventory[i].count
			  end
			end

			local ped = PlayerPedId()
			local currentWeaponHash = GetSelectedPedWeapon(ped)

			if Config.weapon[GetName(currentWeaponHash)].varmod ~= nil and Config.weapon[GetName(currentWeaponHash)].varmod ~= '' then
				if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].varmod ) then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].varmod)
					used4 = used4 - 1
					ESX.ShowNotification(("Vous venez de retirer ~r~le skin."))
				else
					if used4 < varmod then
						GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[GetName(currentWeaponHash)].varmod )
						ESX.ShowNotification(("Vous venez de vous équiper d'un skins. Il faudra le rééquiper a chaques retours en ville."))
						used4 = used4 + 1
					else
						ESX.ShowNotification(("Vous avez utiliser toutes vos skins."))
					end
				end
			else
				ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de skins."))
			end
end)

local used5 = 0

RegisterNetEvent('eden_accesories:scope')
AddEventHandler('eden_accesories:scope', function(duration)
			local inventory = ESX.GetPlayerData().inventory
			local scope = 0
			for i=1, #inventory, 1 do
				  if inventory[i].name == 'scope' then
					scope = inventory[i].count
			  end
			end

			local ped = PlayerPedId()
			local currentWeaponHash = GetSelectedPedWeapon(ped)

			if Config.weapon[GetName(currentWeaponHash)].scope ~= nil and Config.weapon[GetName(currentWeaponHash)].scope ~= '' then
				if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].scope ) then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].scope)
					used5 = used5 - 1
					ESX.ShowNotification(("Vous venez de retirer ~r~le scope."))
				else
					if used5 < scope then
						GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[GetName(currentWeaponHash)].scope )
						ESX.ShowNotification(("Vous venez de vous équiper d'un scope. Il faudra le rééquiper a chaques retours en ville."))
						used5 = used5 + 1
					else
						ESX.ShowNotification(("Vous avez utiliser toutes vos scope."))
					end
				end
			else
				ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de scope."))
			end
end)

local used6 = 0

RegisterNetEvent('eden_accesories:clip')
AddEventHandler('eden_accesories:clip', function(duration)
			local inventory = ESX.GetPlayerData().inventory
			local clip = 0
			for i=1, #inventory, 1 do
				  if inventory[i].name == 'clipG' then
					clip = inventory[i].count
			  end
			end

			local ped = PlayerPedId()
			local currentWeaponHash = GetSelectedPedWeapon(ped)

			if Config.weapon[GetName(currentWeaponHash)].clip ~= nil and Config.weapon[GetName(currentWeaponHash)].clip ~= '' then
				if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].clip ) then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[GetName(currentWeaponHash)].clip)
					used6 = used6 - 1
					ESX.ShowNotification(("Vous venez de retirer ~r~le chargeur."))
				else
					if used6 < clip then
						GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[GetName(currentWeaponHash)].clip )
						ESX.ShowNotification(("Vous venez de vous équiper d'un chargeur. Il faudra le rééquiper a chaques retours en ville."))
						used6 = used6 + 1
					else
						ESX.ShowNotification(("Vous avez utiliser toutes vos chargeur."))
					end
				end
			else
				ESX.ShowNotification(("Vous n'avez pas d'arme en main ou votre arme ne peux pas supporter de chargeur."))
			end
end)
