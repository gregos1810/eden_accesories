local used ={
	clip = 0,
  suppressor = 0,
  flashlight = 0,
  scope = 0,
  grip = 0,
  varmod = 0
}
ESX          = nil
local IsDead = false
local HasRadio = false

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



function GetName(hash)
	local name ='null'
	for k,v in pairs(Config.weapon) do
			if GetHashKey(k) == hash then
				name = k
			end
	end
	return name
end
RegisterNetEvent('eden_accesories:OnUseRadio')
AddEventHandler('eden_accesories:OnUseRadio', function()
	if HasRadio == false then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			if skin.sex == 0 then
					SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			else
					SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			end
			HasRadio = true
		end)
	else
		ClearPedProp(GetPlayerPed(-1), 2)
		HasRadio = false
	end
end)


RegisterNetEvent('eden_accesories:OnUse')
AddEventHandler('eden_accesories:OnUse', function(types,labels,bddname)
		local type = types
		local label = labels
		local inventory = ESX.GetPlayerData().inventory
		local amount = 0
		for i=1, #inventory, 1 do
			if inventory[i].name == bddname then
				amount = inventory[i].count
			end
		end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		local name = GetName(currentWeaponHash)
			if name ~= 'null' then
				if Config.weapon[name][type] ~= nil and Config.weapon[name][type] ~= '' then
					if HasPedGotWeaponComponent(GetPlayerPed(-1),currentWeaponHash,Config.weapon[name][type] ) then
						RemoveWeaponComponentFromPed(GetPlayerPed(-1),currentWeaponHash,Config.weapon[name][type])
						used[type] = used[type] - 1
						ESX.ShowNotification(("Vous venez de retirer : ~r~"..label))
					else
						if used[type] < amount then
							GiveWeaponComponentToPed(GetPlayerPed(-1),currentWeaponHash, Config.weapon[name][type] )
							ESX.ShowNotification(("Vous venez d'équiper l'arme avec :~g~ "..label ))
							used[type] = used[type] + 1
						else
							ESX.ShowNotification(("Vous n'avez plus de : ~r~"..label))
						end
					end
				else
				ESX.ShowNotification(("Cette arme ne peut pas etre equipée avec : ~r~"..label))
				end
			else
				ESX.ShowNotification(("~r~Vous ne pouvez pas modifier cette arme."))
			end
end)
