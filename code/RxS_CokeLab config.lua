--[[
BY RX Scripts © rxscripts.xyz
--]]

Config = {}

--[[ 
    YOU CAN CREATE THE DRUGLABS IN config/labs/**.lua FILES
--]]
Config.DrugLabs = {}

Config.SaveInterval = 10 -- saves data every x minutes
Config.Locale = 'en'
Config.DefaultRoutingBucket = 0 -- default routing bucket for players

Config.MaxLabsOwned = 1 -- how many labs can a player own
Config.SellPercentage = 0.75 -- percentage of the lab price to return to the player when selling
Config.UseMoney = 'black_money' -- money type to purchase lab

Config.CopsRaid = { -- raid settings for the cops, minigame/progress duration etc can be changed in client/opensource.lua)
    enabled = true,
    openDoorDuration = 3, -- in minutes (how long will the door be open for everyone, after this the lab will be disabled for the cooldown below)
    labDisabledCooldown = 60 * 24, -- in minutes (how long will the lab be disabled to use after a raid)
    copsRequired = 1, -- how many cops are required to be online to raid a lab, takes job from Config.CopsRaid.allowedJob
    allowedJob = { name = 'police', minGrade = 1 }, -- job and min grade required to start a raid
    requiredItems = { -- items required to raid
        { item = 'phone', amount = 1, remove = true }
    },
}

Config.Security = {
    price = 50000,
    protectWorkers = true, -- if true, workers will not 'arrested' by the cops and hide until lab is back running again
    protectWorkersInventory = true, -- if true, workers inventory will not be able to be taken by cops during a raid
}

Config.StashGrades = {
    { -- DEFAULT GRADE
        price = 0,
        weight = 10000,
        slots = 10,
    },
    {
        price = 25000,
        weight = 25000,
        slots = 20,
    },
    {
        price = 50000,
        weight = 50000,
        slots = 30,
    }
}

Config.Blips = {
    ownedLab = { -- blip seen by the owner of the lab
        enabled = true,
        sprite = 473,
        color = 3,
        scale = 0.8,
        display = 4,
        shortrange = true,
        label = '%s', -- %s will be replaced with the lab name
    },
    unownedLab = { -- blip seen by everyone if the lab has no owner
        enabled = true,
        sprite = 473,
        color = 0,
        scale = 0.8,
        display = 4,
        shortrange = true,
        label = '%s ($%s)', -- 1st %s will be replaced with the lab name, 2nd %s will be replaced with the lab price
    },
}

Config.EntranceNPC = {
    model = "s_m_m_highsec_01",
    anims = {
        failPurchase = {
            dict = "misscommon@response",
            anim = "screw_you"
        },
        successPurchase = {
            dict = "mp_ped_interaction",
            anim = "handshake_guy_a",
        },
    },
    scenarios = {
        forSaleStanding = "WORLD_HUMAN_CLIPBOARD",
        ownedStanding = "WORLD_HUMAN_GUARD_STAND",
    }
}

--[[
    INITIALIZATION SECTION

    ONLY UNCOMMENT/CHANGE THIS IF YOU HAVE RENAMED SCRIPTS SUCH AS FRAMEWORK, TARGET, INVENTORY ETC
    RENAME THE SCRIPT NAME TO THE NEW NAME

    IF IT CANT FIND A TARGET IT WILL WORK WITH 3D TEXT + OX_LIB CONTEXT MENU
--]]

-- FM = 'fmLib'
-- OXTarget = 'ox_target'
-- QBTarget = 'qb-target'
IgnoreResourceNotFoundErrors = false
IgnoreResourceInitializedLogs = false
