local isMessageSent = false
local playerPed = PlayerPedId()

CreateThread(function()
    while true do
        Wait(10)

        local pedCoords = GetEntityCoords(playerPed)
        local isInZone = false

        for _, zoneData in pairs(Config.Greenzones) do
            local distance = Vdist(zoneData.Coords.x, zoneData.Coords.y, zoneData.Coords.z, pedCoords.x, pedCoords.y,
                pedCoords.z)

            if distance < zoneData.Radius then
                isInZone = true
                break
            end
        end

        if isInZone then
            if Config.DisableCombat then
                DisableActions()
            end
            if not isMessageSent then
                isMessageSent = true
                SendGreenZoneNotification(true)
            end
        elseif isMessageSent then
            isMessageSent = false
            EnableActions()
            SendGreenZoneNotification(false)
        end
    end
end)

if Config.RadiusBlip then
    CreateThread(function()
        for _, zone in pairs(Config.Greenzones) do
            local radiusBlip = AddBlipForRadius(zone.Coords.x, zone.Coords.y, zone.Coords.z, zone.Radius)
            local RadiusColor = zone.BlipColour
            SetBlipRotation(radiusBlip, 0)
            SetBlipColour(radiusBlip, RadiusColor)
            SetBlipAlpha(radiusBlip, 80)
        end
    end)
end

function SendGreenZoneNotification(isInZone)
    if Config.UiEnable then
        if isInZone then
            TriggerEvent('ggreen:on', true)
        else
            TriggerEvent('ggreen:off', true)
        end
    end
end

function DisableActions()
    DisablePlayerFiring(PlayerId(), true)
    SetPlayerInvincible(PlayerId(), true)
    SetPlayerCanDoDriveBy(PlayerId(), false)
    DisableControlAction(0, 140, true)
    if Config.UnArmPlayer then
        SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
    end
end

function EnableActions()
    DisablePlayerFiring(PlayerId(), false)
    SetPlayerInvincible(PlayerId(), false)
    SetPlayerCanDoDriveBy(PlayerId(), true)
end

RegisterNetEvent('ggreen:on')
AddEventHandler('ggreen:on', function()
    SendNUIMessage({ type = "ui", state = "g" })
end)

RegisterNetEvent('ggreen:off')
AddEventHandler('ggreen:off', function()
    SendNUIMessage({ type = "ui", state = "n" })
end)
