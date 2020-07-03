local voice = false
local check = false

AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)
    if isTalking then
        voice = true
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

		if IsControlJustPressed(0, 0x8FD015D8) then
			check = true
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		
		if check then 
			if not voice then
				OpenAlertscreen()
				break
			end
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

		if check then 
			if voice then
				CloseAlertscreen()
				break
			end
		end
    end
end)

function OpenAlertscreen()
    SetNuiFocus(true, false)
    SendNUIMessage({ display = true })
    FreezeEntityPosition(GetPlayerPed(), true)
end

function CloseAlertscreen()
    SetNuiFocus(false, false)
    SendNUIMessage({ display = false })
    FreezeEntityPosition(GetPlayerPed(), false)
end
