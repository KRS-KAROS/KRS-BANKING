KRS = {}


KRS.PositionsBank = {

    vector3(150.0761, -1040.1384, 29.3741),
    vector3(314.2038, -278.5833, 54.1708),
    vector3(-1212.8656, -330.4511, 37.7870),
    vector3(242.8678, 223.9182, 106.2868),

}

KRS.PositionsAtm = {

    vector3(147.8769, -1035.2064, 29.3430),
    vector3(146.1002, -1034.6973, 29.3449),
    vector3(33.1368, -1347.7163, 29.4970),
    vector3(110.9836, -775.9797, 31.4382),
    vector3(114.2402, -777.0277, 31.4173),
}

KRS.Icon = {

      ['atm-icon'] = "fa-solid fa-credit-card",
      ['bank-icon'] = "fa-solid fa-bank",
}

-- Label --
KRS.Lang = {

    ["bank"] = "Open bank",
    ["atm"] = "Open atm",

}

KRS.LocationBanksBlip = {
    {
        position = vector3(150.0761, -1040.1384, 29.3741),
        blip = {
            active = true,
            sprite = 207,
            color = 43,
            size = 0.7,
            name = "Fleeca Bank"
        }
    },
    {
        position = vector3(314.2038, -278.5833, 54.1708),
        blip = {
            active = true,
            sprite = 207,
            color = 43,
            size = 0.7,
            name = "Fleeca Bank"
        }
    },
    {
        position = vector3(-1212.8656, -330.4511, 37.7870),
        blip = {
            active = true,
            sprite = 207,
            color = 43,
            size = 0.7,
            name = "Fleeca Bank"
        }
    },
    {
        position = vector3(242.8678, 223.9182, 106.2868),
        blip = {
            active = true,
            sprite = 207,
            color = 15,
            size = 0.7,
            name = "Pacific Bank"
        }
    },
}