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
    RefillJerryCan = "Press

