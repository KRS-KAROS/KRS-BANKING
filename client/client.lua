ESX = exports["es_extended"]:getSharedObject()


-- Funzione Chiudi Banca
RegisterNUICallback('chiudi', function(data, cb)
   SetNuiFocus(false,false)
    cb('ok')
end)

-- Funzione Apri Banca
function ApriBanca()
    ESX.TriggerServerCallback('soldi:getData', function(data)
    SendNUIMessage({
      type = "apriBanca",
      soldi = data.bank
    })
    SetNuiFocus(true, true)
  end)
end

function ApriAtm()
    ESX.TriggerServerCallback('soldi:getData', function(data)
    SendNUIMessage({
      type = "apriAtm",
      soldi = data.Atm
    })
    SetNuiFocus(true, true)
  end)
end

-- Funzione ritira soldi 
RegisterNUICallback('ritira', function(data, cb)
    print(json.encode(data))
   TriggerServerEvent('ritirare', tonumber(data.importo))
 
     cb('ok')
 end)
  
-- Funzione Deposita soldi
RegisterNUICallback('deposita', function(data, cb)
    print(json.encode(data))
   TriggerServerEvent('deposita', tonumber(data.importo))
  
     cb('ok')
 end)
-- Funzione Deposita soldi
RegisterNUICallback('trasferire', function(data, cb)
    print(tonumber(data.importo), tonumber(data.id))
    TriggerServerEvent('trasferisci', tonumber(data.importo), tonumber(data.id))
    cb('ok')
end)

-- Bank --
CreateThread(function()
    for i = 1, #KRS.PositionsBank,1 do 
    exports.ox_target:addBoxZone({
        coords = KRS.PositionsBank[i],
        size = vec3(2, 2, 2),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'bank',
                icon = KRS.Icon['bank-icon'],
                label = KRS.Lang["bank"],
               onSelect = function(data)
                        ApriBanca()
                        	
                    end,
                    }
                }
            })
       end
end)


CreateThread(function()
    for i = 1, #KRS.PositionsAtm,1 do 
    exports.ox_target:addBoxZone({
        coords = KRS.PositionsAtm[i],
        size = vec3(2, 2, 2),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'bank',
                icon = KRS.Icon['atm-icon'],
                label = KRS.Lang["atm"],
               onSelect = function(data)
                        ApriBanca()
                        	
                    end,
                    }
                }
            })
       end
end)

CreateThread(function()
    for i = 1, #KRS.LocationBanksBlip, 1 do
        local KRS = KRS.LocationBanksBlip[i]

        if KRS.blip.active then 
			local blip = AddBlipForCoord(KRS.position.x, KRS.position.y, KRS.position.z)
			SetBlipSprite (blip, KRS.blip.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, KRS.blip.size)
			SetBlipColour (blip, KRS.blip.color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(KRS.blip.name)
			EndTextCommandSetBlipName(blip)
        end
    end
end)