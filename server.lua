ESX = nil
TriggerEvent(Config.getSharedObject, function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        for k,players in pairs(GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(players)

			if xPlayer then
				local hasItem = xPlayer.getInventoryItem(Config.Item).count

				if hasItem then
					xPlayer.removeAccountMoney(Config.Account, Config.Price)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Translation[Config.Locale]['title'], Translation[Config.Locale]['subtitle'], Translation[Config.Locale]['message'], Config.Icon, 2)
				end
			end
        end

        Citizen.Wait(Config.Interval)
    end
end)