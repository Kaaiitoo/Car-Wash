ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('KaitoWashhhh')
AddEventHandler('KaitoWashhhh', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= prix then
        xPlayer.removeMoney(prix)
		TriggerClientEvent('esx:showNotification', source, "~g~Vous avez lavé votre véhicule")
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez !")
	end
end)