ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

---- FUNCTION 

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(config.GetESX, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        local pNear = false

        for k,v in pairs(config.kaitowash) do 
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v)
            local marker = config.marker
            local prix = 100
            local plyPedCoords = GetEntityCoords(plyPed)
            local car = GetVehiclePedIsIn(plyPed, false)

            if distance <= 2.0 then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                pNear = true
                if marker.haveMarker then
                    DrawMarker(marker.ID, v+0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.Size, marker.Size, marker.Size, marker.Color[1], marker.Color[2], marker.Color[3], marker.Alpha, 0, 1, 2, 0, nil, nil, 0)
                end
                ESX.ShowHelpNotification("Appuyer sur [E] pour laver votre voiture")
                if IsControlJustReleased(0, 38) then
                DoScreenFadeOut(3000)
                Citizen.Wait(3000)
                DoScreenFadeIn(3000)
                TriggerServerEvent('KaitoWashhhh', prix)
                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                SetVehicleDirtLevel(vehicle, 0.1)
                end
                end
            end
        end
        if pNear then
            Wait(1)
        else
            Wait(250)
        end
    end
end)


---- BLIPS -----

local pos = vector3(28.36, -1391.59, 28.20)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(pos)

    SetBlipSprite (blip, 100)
    SetBlipScale  (blip, 0.7)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Station de lavage')
    EndTextCommandSetBlipName(blip)
end)


local pos = vector3(167.1034, -1719.4704, 27.2916)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(pos)

    SetBlipSprite (blip, 100)
    SetBlipScale  (blip, 0.7)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Station de lavage')
    EndTextCommandSetBlipName(blip)
end)

local pos = vector3(-699.6325, -932.7043, 17.0139)
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(pos)

    SetBlipSprite (blip, 100)
    SetBlipScale  (blip, 0.7)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Station de lavage')
    EndTextCommandSetBlipName(blip)
end)