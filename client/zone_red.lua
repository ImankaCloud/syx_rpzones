local isMessageSent = false
local playerPed = PlayerPedId()

CreateThread(function()
    while true do
        Wait(10)

        local pedCoords = GetEntityCoords(playerPed)
        local isInZone = false

        for _, zoneData in pairs(Config.Redzones) do
            local distance = Vdist(zoneData.Coords.x, zoneData.Coords.y, zoneData.Coords.z, pedCoords.x, pedCoords.y,
                pedCoords.z)

            if distance < zoneData.Radius then
                isInZone = true
                break
            end
        end

        if isInZone then
            if not isMessageSent then
                isMessageSent = true
                SendRedZoneNotification(true)
            end
        elseif isMessageSent then
            isMessageSent = false
            EnableActions()
            SendRedZoneNotification(false)
        end
    end
end)

if Config.RadiusBlip and Config.RedRadiusBlipDisable then
    CreateThread(function()
        for _, zone in pairs(Config.Redzones) do
            local radiusBlip = AddBlipForRadius(zone.Coords.x, zone.Coords.y, zone.Coords.z, zone.Radius)
            SetBlipRotation(radiusBlip, 0)
            SetBlipColour(radiusBlip, 1)
            SetBlipAlpha(radiusBlip, 80)
        end
    end)
end

function SendRedZoneNotification(isInZone)
    if Config.RedZoneUiEnable then
        if isInZone then
            TriggerEvent('rred:on', true)
        else
            TriggerEvent('rred:off', true)
        end
    end
end

RegisterNetEvent('rred:on')
AddEventHandler('rred:on', function()
    SendNUIMessage({ type = "ui", state = "r" })
end)

RegisterNetEvent('rred:off')
AddEventHandler('rred:off', function()
    SendNUIMessage({ type = "ui", state = "n" })
end)