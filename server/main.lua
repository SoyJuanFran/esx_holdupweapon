local rob = false
local robbers = {}
ESX = nil
apagon = false
notificacion = false
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('blackout:apagon', function(apagon1)

apagon = apagon1
end)

RegisterServerEvent('esx_holdupweapon:tooFar')
AddEventHandler('esx_holdupweapon:tooFar', function(currentStore)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' then
		if apagon == false then
			if not notificacion then
			TriggerClientEvent('pNotify:SendNotification',  xPlayers[i], {
				text = _U('robbery_cancelled_at', Stores[currentStore].nameOfStore),
				type = "error",
				timeout = (4000),
				layout = "bottomLeft",
				queue = "global"
			})
			notificacion = true
			Citizen.Wait(4000)
			notificacion = false
		end
			
			
		end
			TriggerClientEvent('esx_holdupweapon:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('esx_holdupweapon:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('esx:showNotification', _source, _U('robbery_cancelled_at', Stores[currentStore].nameOfStore))
		sendDiscord('Robos', '**Ammunation |  **OOC: ' .. GetPlayerName(_source) .. ' IC: ' ..xPlayer.name.. '** | Ha **cancelado** el robo al Ammunation')
	end
end)

RegisterServerEvent('esx_holdupweapon:robberyStarted')
AddEventHandler('esx_holdupweapon:robberyStarted', function(currentStore)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	if Stores[currentStore] then
		local store = Stores[currentStore]

		if (os.time() - store.lastRobbed) < Config.TimerBeforeNewRob and store.lastRobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - store.lastRobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		if not rob then
			if cops >= Config.PoliceNumberRequired then
				rob = true
			if apagon == false then
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' then
						TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog', store.nameOfStore))
						TriggerClientEvent('esx_holdupweapon:setBlip', xPlayers[i], Stores[currentStore].position)
					end
				end
			end
				TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob', store.nameOfStore))
				TriggerClientEvent('esx:showNotification', _source, _U('alarm_triggered'))
				
				TriggerClientEvent('esx_holdupweapon:currentlyRobbing', _source, currentStore)
				TriggerClientEvent('esx_holdupweapon:startTimer', _source)
				
				Stores[currentStore].lastRobbed = os.time()
				robbers[_source] = currentStore

				SetTimeout(store.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						if xPlayer then
							TriggerClientEvent('esx_holdupweapon:robberyComplete', _source)

								local number = math.random(1,7)
								
								if number == 1 then
									xPlayer.addInventoryItem('snspistol', 1)
									xPlayer.addInventoryItem('pistol_ammo', 80)
									xPlayer.addInventoryItem('MedArmor', 1)
									xPlayer.addInventoryItem('yusuf', 1)
									xPlayer.addInventoryItem('knife', 1)
								elseif number == 2 then
									xPlayer.addInventoryItem('combatpistol', 2)
									xPlayer.addInventoryItem('pistol_ammo', 60)
									xPlayer.addInventoryItem('suppressor', 1)
									xPlayer.addInventoryItem('flashlight', 2)
								elseif number == 3 then
									xPlayer.addInventoryItem('snspistol', 1)
									xPlayer.addInventoryItem('pistol_ammo', 20)
									xPlayer.addInventoryItem('smg_ammo', 40)
									xPlayer.addInventoryItem('wrench', 1)
									xPlayer.addInventoryItem('smg', 1)
								elseif number == 4 then
									xPlayer.addInventoryItem('heavypistol', 2)
									xPlayer.addInventoryItem('pistol_ammo', 40)
									xPlayer.addInventoryItem('yusuf', 2)
									xPlayer.addInventoryItem('knuckle', 1)
								elseif number == 5 then
									xPlayer.addInventoryItem('pumpshotgun', 1)
									xPlayer.addInventoryItem('snspistol', 1)
									xPlayer.addInventoryItem('shotgun_ammo', 80)
									xPlayer.addInventoryItem('yusuf', 1)
									xPlayer.addInventoryItem('knife', 1)
								elseif number == 6 then
									xPlayer.addInventoryItem('snspistol', 2)
									xPlayer.addInventoryItem('pistol_ammo', 50)
									xPlayer.addInventoryItem('rifle_ammo', 30)
									xPlayer.addInventoryItem('grip', 2)
								elseif number == 7 then
									xPlayer.addInventoryItem('vintagepistol', 1)
									xPlayer.addInventoryItem('pistol_ammo', 50)
									xPlayer.addInventoryItem('microsmg', 1)
									xPlayer.addInventoryItem('smg_ammo', 40)
								end
								
							sendDiscord('Robos', 'Ammunation | **OOC: ' .. GetPlayerName(_source) .. ' IC: ' ..xPlayer.name.. '**| Mensaje:  Ha robado un ammunation. Numero: **' .. number .. '**')

							local xPlayers, xPlayer = ESX.GetPlayers(), nil
							for i=1, #xPlayers, 1 do
								xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				
								if xPlayer.job.name == 'police' then
								if apagon == false then
									TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at', store.nameOfStore))
								end
									TriggerClientEvent('esx_holdupweapon:killBlip', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('min_police', Config.PoliceNumberRequired))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('robbery_already'))
		end
	end
end)


webhookurl = '' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end