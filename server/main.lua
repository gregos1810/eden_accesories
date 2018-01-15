ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUse', source,'suppressor','sliencieux','silencieux')
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUse', source,'flashlight','flashlight','flashlight')
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUse', source,'grip','grip','grip')
end)


ESX.RegisterUsableItem('varmod', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUse', source,'varmod','Kit skin','varmod')
end)

ESX.RegisterUsableItem('clipG', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUse', source,'clip','Magasin grande capacité','clipG')
end)
ESX.RegisterUsableItem('scope', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUse', source,'scope','Viseur','scope')
end)

ESX.RegisterUsableItem('radio', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('eden_accesories:OnUseRadio', source)
end)
