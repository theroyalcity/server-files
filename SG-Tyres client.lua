local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    if Config.CStartMSGT then
        print(Config.StartMSG)
    end
end)

-- Commands:

RegisterNetEvent( Config.Tyrefixcommand, function()
    if Config.TFtoggle then
        local plyPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        TriggerEvent("fixwheelsevent", vehicle)
        if Config.FWCTT then
            QBCore.Functions.Notify(Config.FWCT)
        end
        if Config.FixtyreConsoleLog then
            TriggerServerEvent("sg-tyres:s:PrintToConsole", "/"..Config.Tyrefixcommand)
        end
    end
end)

RegisterNetEvent(Config.ABPtyrescommand, function()
    if Config.ABPtoggle then
        local plyPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        if Config.ABPFW then
            TriggerEvent("fixwheelsevent", vehicle)
        end
        SetVehicleTyresCanBurst(vehicle, false)
        if Config.ABPTCT then
            QBCore.Functions.Notify(Config.ABPTC)
        end
        if Config.ABPtyreConsoleLog then
            TriggerServerEvent("sg-tyres:s:PrintToConsole", "/"..Config.ABPtyrescommand)
        end
    end
end)

RegisterNetEvent(Config.RBPtyrescommand, function()
    if Config.RBPtoggle then
            local plyPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(plyPed, false)
        if Config.RBPFW then
            TriggerEvent("fixwheelsevent", vehicle)
        end
        SetVehicleTyresCanBurst(vehicle, true)
        if Config.RBPTCT then
            QBCore.Functions.Notify(Config.RBPTC)
        end
        if Config.RBPtyreConsoleLog then
            TriggerServerEvent("sg-tyres:s:PrintToConsole", "/"..Config.RBPtyrescommand)
        end
    end
end)

-- Item Uses:

RegisterNetEvent("bptyre", function()
    if IsPedSittingInAnyVehicle(PlayerPedId()) then
        local plyPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        local BPcheck = GetVehicleTyresCanBurst(vehicle)
        if IsVehicleStopped(vehicle) or Config.BPfixtyremustbestopped == false then
            if BPcheck == 1 or checktyres(vehicle) or Config.BPSwapOnlyWhenNeeded == false then
                if Config.BPRTIUST then
                    QBCore.Functions.Notify(Config.BPRTIUS)
                end
                if Config.BPTSUDT then
                    exports['progressbar']:Progress({
                        name = 'BPTyreswap',
                        duration = Config.BPTSUD,
                        label = "Swapping Tyres",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation ={},
                        prop = {},
                        propTwo = {},
                    })
                    Wait(Config.BPTSUD-1)
                end
                TriggerEvent("fixwheelsevent", vehicle)
                if Config.BPRTIBP then
                    SetVehicleTyresCanBurst(vehicle, false)
                end
                TriggerServerEvent("sg-tyres:s:removeitem", Config.BpTyreSwap, 1)
                if Config.BPRTIUDT then
                    QBCore.Functions.Notify(Config.BPRTIUD)
                end
            end
            if Config.BulletprooftyreSwapConsoleLog then
                TriggerServerEvent("sg-tyres:s:PrintToConsole", Config.BPTyreSwapConsoleMSG)
            end
        end
    end
end)

RegisterNetEvent("fixtyre", function()
    if IsPedSittingInAnyVehicle(PlayerPedId()) then
        local plyPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        local BPcheck = GetVehicleTyresCanBurst(vehicle)
        if IsVehicleStopped(vehicle) or Config.Nfixtyremustbestopped == false then
            if BPcheck == false or checktyres(vehicle) or Config.NSwapOnlyWhenNeeded == false then
                if Config.NRTIUST then
                    QBCore.Functions.Notify(Config.NRTIUS)
                end
                if Config.TSUDT then
                exports['progressbar']:Progress({
                    name = 'Tyreswap',
                    duration = Config.TSUD,
                    label = "Swapping Tyres",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation ={},
                    prop = {},
                    propTwo = {},
                })
                Wait(Config.TSUD-1)
                end
                TriggerEvent("fixwheelsevent", vehicle)
                if Config.NRTIBP then
                    SetVehicleTyresCanBurst(vehicle, true)
                end
                TriggerServerEvent("sg-tyres:s:removeitem", Config.TyreSwap, 1)
                if Config.NRTIUDT then
                    QBCore.Functions.Notify(Config.NRTIUD)
                end
            end
            if Config.NormaltyreSwapConsoleLog then
                TriggerServerEvent("sg-tyres:s:PrintToConsole", Config.NormalTyreSwapConsoleMSG)
            end
        end
    end
end)

-- wheelfix event:

RegisterNetEvent("fixwheelsevent", function(vehicle)
    SetVehicleTyreFixed(vehicle, 0)
    SetVehicleTyreFixed(vehicle, 1)
    SetVehicleTyreFixed(vehicle, 2)
    SetVehicleTyreFixed(vehicle, 3)
    SetVehicleTyreFixed(vehicle, 4)
    SetVehicleTyreFixed(vehicle, 5)
    SetVehicleTyreFixed(vehicle, 6)
end)


function checktyres(vehicle)
    local checkburst1 = IsVehicleTyreBurst(vehicle, 0, false)
    local checkburst2 = IsVehicleTyreBurst(vehicle, 1, false)
    local checkburst3 = IsVehicleTyreBurst(vehicle, 2, false)
    local checkburst4 = IsVehicleTyreBurst(vehicle, 3, false)
    local checkburst5 = IsVehicleTyreBurst(vehicle, 4, false)
    local checkburst6 = IsVehicleTyreBurst(vehicle, 5, false)
    local checkburst7 = IsVehicleTyreBurst(vehicle, 6, false)
    local istyreburst = false

    if checkburst1 == 1 or checkburst2 == 1 or checkburst3 == 1 or checkburst4 == 1 or checkburst5 == 1 or checkburst6 == 1 or checkburst7 == 1 then
        istyreburst = true
    else
        istyreburst = false
    end
    return istyreburst
end