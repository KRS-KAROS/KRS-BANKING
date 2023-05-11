ESX = exports["es_extended"]:getSharedObject()

-- Funzione Ritira
RegisterNetEvent('ritirare', function(importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local sBanca = xPlayer.getAccount("bank").money
    local sContanti = xPlayer.getAccount("money").money
    if sBanca >= importo then
        xPlayer.removeAccountMoney("bank", importo)
        xPlayer.addMoney(importo)
        TriggerClientEvent('esx:showNotification', source, 'Hai ritirato $' .. importo .. ' dalla tua banca.')
    else
        TriggerClientEvent('esx:showNotification', source, 'Non hai abbastanza denaro nella tua banca.')
    end
end)

-- Funzione Deposita
RegisterNetEvent('deposita', function(importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local sBanca = xPlayer.getAccount("bank").money
    local sContanti = xPlayer.getAccount("money").money
    if sContanti >= importo then
        xPlayer.removeAccountMoney("money", importo)
        xPlayer.addAccountMoney('bank', importo)
        TriggerClientEvent('esx:showNotification', source, 'Hai depositato $' .. importo .. ' nella tua banca.')
    else
        TriggerClientEvent('esx:showNotification', source, 'Non hai abbastanza denaro in contanti.')
    end
end)

-- Funzione Deposita
RegisterNetEvent("trasferisci", function(importo, target)
    if source == target then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)

    if not xTarget then return end 

    local sBanca = xPlayer.getAccount("bank").money

    if sBanca >= importo then
        xPlayer.removeAccountMoney("bank", importo)
        xTarget.addAccountMoney('bank', importo)

        xPlayer.showNotification("Hai trasferito $" .. importo .. " a ID " .. target)
        xTarget.showNotification("Hai ricevuto $" .. importo .. " da ID " .. source)
    else
        xPlayer.showNotification("Non hai abbastanza denaro nella tua banca.")
    end
end)

-- Funzione Soldi in Banca
ESX.RegisterServerCallback('soldi:getData', function(source, cb)
    local data = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    data.bank = xPlayer.getAccount("bank").money
    cb(data)
end)


