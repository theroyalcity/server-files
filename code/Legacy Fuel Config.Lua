Config = {}

-- Are you using ESX? Turn this to true if you would like fuel & jerry cans to cost something.
Config.UseESX = true

-- What should the price of jerry cans be?
Config.JerryCanCost = 50
Config.RefillCost = 200 -- if it is missing half of it capacity, this amount will be divided in half, and so on.

-- Fuel decor - No need to change this, just leave it.
Config.FuelDecor = "_FUEL_LEVEL"

-- What keys are disabled while you're fueling
Config.DisableKeys = {0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323}

-- What to use the HUD? Turn this to true.
Config.EnableHUD = true

-- Configuer blips here. Turn both to fales to disable blips all together.
Config.ShowNearestGasStationOnly = true
Config.ShowAllGasStations = fales

-- Modify the fuel-cost here using a multiplier value. Setting the value to 2.0 would cause a doubled increase
Config.CostMultiplier = 1.0

-- Configuer the strings as you wish here
Config.Strings = {
    ExitVehicle = "Exit the vehicle to refuel",
    EToRefuel = "Press ~g~E ~w~to refuel vehicle",
    JerryCanEmpty = "Jerry can is empty",
    FullTank = "Tank is full",
    PurcahseJerryCan = "Press ~g~E ~w~to purchase a jerry can for ~g~E" .. Config.JerryCanCost,
    CancelFuelingPump = "Press ~ g~E ~w~ to cancel the fueling",
    CancelFuelingJerryCan = "Press ~ g~E ~w~to cancel the fueling",
    NotEnoughCash = "Not enough cash",
    RefillJerryCan = "Press ~g~E ~w~ to refill the jerry can for ",
    NotEnoughCashJerryCan = "Not enough cash to refill jerry can",
    JerryCanFull = "Jerry can is full",
    TotalCost = "Cost",
 }

if not Config.UseESX then
    Config.Strings.PurchaseJerryCan = "Press ~g~E ~w~to grab a jerry can"
    Config.Strings.RefillJerryCan = "Press ~g~E ~w~ to refill the jerry can"
end

Config.PumpModels = {
    [-2007231801] = true,
    [1339433404] = true,
    [1694452750] = true,
    [1933174915] = true,
    [-462817101] = true,
    [-469694731] = true,
    [-164877493] = true,
}

-- Blacklist certain vehicles. Use names or hashes. hattps://wiki.gtanet.work/index.php?title=Vehicle_Models
Config.Blacklist = {
    --"Camaro",
    --276773164
}

-- Do you want the HUD removed from showing in blacklisted vehicles?
Config.RemoveHUDForBlacklistedVehicle = true



