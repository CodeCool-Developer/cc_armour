ESX = Config.Framework()
local isAnimation = false
local isArmour = false

local itemNameList = {}

Citizen.CreateThread(function()
    for k, v in pairs(Config.ItemUse) do
        itemNameList[v.ItemName] = v
    end
end)

exports('OnUseItem', function(ItemName)
    if Config.ClientUseItem == nil or Config.ClientUseItem == false then
        return false
    end

    local item = itemNameList[ItemName]

    if item == nil then
        return false
    end

    if isAnimation then
        local status, err = pcall(function()
            Config.ClientOnNotify('warning', 4000, Config.Locale.GAME.message_error[4].title, Config.Locale.GAME.message_error[4].description)
        end)
        logError('ClientOnNotify', err)
        return false
    end

    if not CheckItemPermission(item) then
        return false
    end

    if not checkZone(item) then
        return false
    end

    Citizen.CreateThread(function()
        OnUseItem(item)
    end)

    return true
end)

RegisterNetEvent(script_name .. ':onUseItem', function(item)
    OnUseItem(item)
end)

function OnUseItem(item)
    isArmour = false
    isAnimation = true

    TriggerServerEvent(script_name .. ':removeItem', item)

    local status, err = pcall(function()
        Config.CustomProgressbarOnUseItem(item)
    end)
    logError('CustomProgressbarOnUseItem', err)

    local playerPed = PlayerPedId()
    ESX.Streaming.RequestAnimDict(Config.Animation.Dict, function()
        TaskPlayAnim(playerPed, Config.Animation.Dict, Config.Animation.Name, 3.0, 3.0, item.AnimDuration, 51, 0, false, false, false)
    end)
    Citizen.Wait(item.AnimDuration)

    SetPedArmour(playerPed, item.ArmourHealth)
    isAnimation = false
    if item.Uniforms.enable then
        local uniforms = item.Uniforms.default
        if ESX.GetPlayerData().job.name ~= 'unemployed' then
            uniforms = item.Uniforms.jobs[ESX.GetPlayerData().job.name]
            if uniforms == nil then
                uniforms = item.Uniforms.default
            end
        end

        TriggerEvent(Config.EventRoute['getSkin'], function(skin)
            local sex = skin.sex == 0 and 'male' or 'female'
            TriggerEvent(Config.EventRoute['loadClothes'], skin, {
                ["bproof_1"] = uniforms[sex].Bproof_1,
                ["bproof_2"] = uniforms[sex].Bproof_2
            })
            log('update skin')
        end)
        isArmour = true
        while isArmour do
            local pedArmour = GetPedArmour(PlayerPedId())
            if pedArmour <= 0 then
                isArmour = false
                TriggerEvent(Config.EventRoute['getSkin'], function(skin)
                    TriggerEvent(Config.EventRoute['loadClothes'], skin, {
                        bproof_1 = 0,
                        bproof_2 = 0
                    })
                end)
            end
            Citizen.Wait(500)
        end
    end
end

function CheckItemPermission(item)
    local isPass = false
    if item.Jobs.type == 'whitelist' then
        if item.Jobs.list[ESX.GetPlayerData().job.name] then
            isPass = true
        end
    elseif item.Jobs.type == 'blacklist' then
        if not item.Jobs.list[ESX.GetPlayerData().job.name] then
            isPass = true
        end
    else
        local status, err = pcall(function()
            Config.ClientOnNotify('warning', 4000, Config.Locale.GAME.message_error[3].title, Config.Locale.GAME.message_error[3].description)
        end)
        logError('ClientOnNotify', err)
        return
    end

    if not isPass then
        local status, err = pcall(function()
            Config.ClientOnNotify('warning', 4000, Config.Locale.GAME.message_error[2].title, Config.Locale.GAME.message_error[2].description)
        end)
        logError('ClientOnNotify', err)
    end

    return isPass
end

function checkZone(item)
    local zoneUse = item.Zone.list

    local isPass = false
    if item.Zone.type == 'whitelist' then
        if isPlayerInZone(zoneUse) then
            isPass = true
        end
    elseif item.Zone.type == 'blacklist' then
        if not isPlayerInZone(zoneUse) then
            isPass = true
        end
    else
        local status, err = pcall(function()
            Config.ClientOnNotify('warning', 4000, Config.Locale.GAME.message_error[9].title, Config.Locale.GAME.message_error[9].description)
        end)
        logError('ClientOnNotify', err)
        return
    end

    if not isPass then
        local status, err = pcall(function()
            Config.ClientOnNotify('warning', 4000, Config.Locale.GAME.message_error[8].title, Config.Locale.GAME.message_error[8].description)
        end)
        logError('ClientOnNotify', err)
    end

    return isPass
end

function isPlayerInZone(zone)
    if #zone == 0 then
        return false
    end

    for k, v in pairs(zone) do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local distance = GetDistanceBetweenCoords(coords, v[1], false)
        if distance <= v[2] then
            return true
        end
    end
    return false
end