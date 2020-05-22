local voice = false
local time = 5000

AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)
    if isTalking then
        voice = true
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(time)

        if not voice then
            OpenAlertscreen()
            break
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if voice then
            CloseAlertscreen()
            break
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
