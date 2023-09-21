ESX = Config.Framework()

if not Config.ClientUseItem then
    for k, v in ipairs(Config.ItemUse) do
        ESX.RegisterUsableItem(v.ItemName, function(source)
            log('user item REVIVE: ' .. v.ItemName)
            local xPlayer = ESX.GetPlayerFromId(source)
            local isPass = false

            if v.Jobs.type == 'whitelist' then
                if v.Jobs.list[xPlayer.job.name] then
                    isPass = true
                end
            elseif v.Jobs.type == 'blacklist' then
                if not v.Jobs.list[xPlayer.job.name] then
                    isPass = true
                end
            else
                local status, err = pcall(function()
                    Config.ServerOnNotify(xPlayer, 'warning', 4000, Config.Locale.GAME.message_error[3].title, Config.Locale.GAME.message_error[3].description)
                end)
                logError('ServerOnNotify', err)
                return
            end

            if isPass then
                TriggerClientEvent(script_name .. ':onUseItem', xPlayer.source, v)
                xPlayer.removeInventoryItem(v.ItemName, 1)
            else
                local status, err = pcall(function()
                    Config.ServerOnNotify(xPlayer, 'warning', 4000, Config.Locale.GAME.message_error[2].title, Config.Locale.GAME.message_error[2].description)
                end)
                logError('ServerOnNotify', err)
            end
        end)
    end
end

RegisterServerEvent(script_name .. ':removeItem')
AddEventHandler(script_name .. ':removeItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
        
    if xPlayer == nil then
        return
    end
        
    if item.ItemName ~= nil and item.ItemName ~= '' and item.ItemCount > 0 then
        xPlayer.removeInventoryItem(item.ItemName, item.ItemCount)
    end
end)
