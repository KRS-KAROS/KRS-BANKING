ESX = exports["es_extended"]:getSharedObject()

-- Funzione Ritira
RegisterNetEvent('ritirare', function(importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    print('money')
    local sBanca = xPlayer.getAccount("bank").money
    local sContanti = xPlayer.getAccount("money").money
    if sBanca >= importo then
        print('money')
        xPlayer.removeAccountMoney("bank", importo)
        xPlayer.addMoney(importo)
    end
end)

-- Funzione Deposita 
RegisterNetEvent('deposita', function(importo)
    local xPlayer = ESX.GetPlayerFromId(source)
    print('money')
    local sBanca = xPlayer.getAccount("bank").money
    local sContanti = xPlayer.getAccount("money").money
    if sContanti >= importo then
          
        xPlayer.removeAccountMoney("money", importo)
        xPlayer.addAccountMoney('bank', importo)
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

        xPlayer.showNotification("Hai trasferito $"..importo.." a Id"..xTarget.source)
        xPlayer.showNotification("Hai Ricevuto $"..importo.." da Id"..xPlayer.source)
    end

end)


-- Funzione Soldi in Banca
ESX.RegisterServerCallback('soldi:getData', function(source, cb)
    local data = {}
    local xPlayer = ESX.GetPlayerFromId(source)

    data.bank = xPlayer.getAccount("bank").money

    cb(data)
end)


