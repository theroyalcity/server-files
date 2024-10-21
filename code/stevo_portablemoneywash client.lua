if not lib.checkDependency('stevo_lib', '1.7.0') then error('stevo_lib 1.7.0 required for stevo_portablemoneywash') end
lib.locale()
local config = require('config')
local stevo_lib = exports['stevo_lib']:import()
local CurrentlyPlacingTable = false
local progress = config.progressCircle and lib.progressCircle or lib.progressBar


local function formatTime(msec) -- courtesy of ChatGPT (Could not be bothered)
    local seconds = math.floor(msec / 1000)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    
    seconds = seconds % 60
    minutes = minutes % 60

    local timeString = ""

    if hours > 0 then
        timeString = timeString .. hours .. " hour" .. (hours > 1 and "s" or "")
    end

    if minutes > 0 then
        if timeString ~= "" then
            timeString = timeString .. ", "
        end
        timeString = timeString .. minutes .. " minute" .. (minutes > 1 and "s" or "")
    end

    if seconds > 0 or timeString == "" then
        if timeString ~= "" then
            timeString = timeString .. ", "
        end
        timeString = timeString .. seconds .. " second" .. (seconds > 1 and "s" or "")
    end

    return timeString
end

local function startWash(id)
    local balance, type = lib.callback.await('stevo_portablemoneywash:getMoneyBalance', false, id)

    if not balance then   
        stevo_lib.Notify(locale('notify.nodirtymoney'), 'error', 3000)
        return lib.showContext('stevo_portablemoneywash_wash_'..id)
    end

    local input

    if config.useSlider then 
        input = lib.inputDialog(locale("input.washamount"), {
            {type = 'slider', label = locale("input.washamountinfo", balance), required = true, min = 1, max = balance, step = config.sliderStep}
        })
    else 
        input = lib.inputDialog(locale("input.washamount"), {
            {type = 'number', label = locale("input.washamountinfo", balance), required = true, min = 1, max = balance},
        })
    end

    if not input then 
        return lib.showContext('stevo_portablemoneywash_wash_'..id)
    end

    if input[1] > balance then 
        input[1] = balance 
    end

    local washAmount = input[1]
    local washTax = math.floor(washAmount * config.washingMachines[type].washTax)
    local washReturn = washAmount - washTax
    local washTime = config.washingMachines[type].msecPer * washAmount

    lib.registerContext({
        id = 'stevo_portablemoneywash_startwash_'..id,
        title = locale('menu.startwash'),
        menu = 'stevo_portablemoneywash_wash_'..id,
        options = {
          {
            title = locale("menu.amounttowash", washAmount),
            icon = 'sack-dollar'
          },
          {
            title = locale("menu.washreturn", washReturn),
            icon = 'money-bill'
          },
          {
            title = locale("menu.timetocomplete", formatTime(washTime)),
            icon = 'stopwatch'
          },
          {
            title = locale("menu.startwash", formatTime(washTime)),
            icon = 'play',
            onSelect = function()
                if progress({
                    duration = config.loadTime * 1000,
                    position = 'bottom',
                    label = locale('progress.loadingWasher'),
                    useWhileDead = false,
                    canCancel = false,
                    anim = {
                        dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        clip = "machinic_loop_mechandplayer"
                    },
                    disable = { move = true, car = true, mouse = false, combat = true, },
                }) then    
                    local updatedWasher, time = lib.callback.await('stevo_portablemoneywash:startedWash', false, id, washAmount)

                    if updatedWasher then 
                        stevo_lib.Notify(locale('notify.washstarted', formatTime(washTime)), 'success', 5000)
                        manageWasher(id, updatedWasher, time)
                    end
                end
            end
          }
        }
      })
     
    lib.showContext('stevo_portablemoneywash_startwash_'..id)
end

local function placeWasher(model)

    if CurrentlyPlacingTable then return stevo_lib.Notify(locale('notify.alreadyplacing'), 'error', 5000) end

    lib.requestModel(model)
      
    local _, _, endCoords, _ = lib.raycast.cam()
    local object = CreateObject(model, endCoords.x, endCoords.y, endCoords.z+1, false, false, false)

    CurrentlyPlacingTable = true

    SetEntityAlpha(object, 200, false)
    DisableCamCollisionForEntity(object)
    SetEntityCollision(object, false, false)
    SetEntityDrawOutlineColor(10, 170, 210, 200)
    SetEntityDrawOutlineShader(0)
    SetEntityDrawOutline(object, true)

    lib.showTextUI(locale('placeInstructions'))

    while true do
        _, _, endCoords, _ = lib.raycast.cam()
        SetEntityCoords(object, endCoords.x, endCoords.y, endCoords.z+1)

        if IsControlJustReleased(0, 241) and not IsControlPressed(0, 21) then
            local objHeading = GetEntityHeading(object)
            SetEntityRotation(object, 0.0, 0.0, objHeading + 10, false, false)
        end

        if IsControlJustReleased(0, 242) and not IsControlPressed(0, 21) then
            local objHeading = GetEntityHeading(object)
            SetEntityRotation(object, 0.0, 0.0, objHeading - 10, false, false)
        end
  
        if IsControlJustPressed(0, 38) then
           break
        end
    end

    Wait(100)
    local washerCoords = GetEntityCoords(object)
    local washerHeading = GetEntityHeading(object)

    lib.hideTextUI()
    DeleteObject(object)

    CurrentlyPlacingTable = false

    return washerCoords, washerHeading
end

local function manageWasherAction(data)
    local updatedWasher, updatedTime = lib.callback.await('stevo_portablemoneywash:washerActionModified', false, data.action, data.actiondata, data.id)

    manageWasher(data.id, updatedWasher, updatedTime)
end

local function manageWasherKeys(data)
    local coords = GetEntityCoords(cache.ped)
    local players = lib.getNearbyPlayers(coords, 5.0, false)
    local closestPlayers = {}

    for i, player in pairs(players) do 
        local dist = #(player.coords - coords)
        local newnumber = string.sub(tostring(dist), 1,4)
        local label = ("%sm away"):format(newnumber)
        local newPlayer = {label = label, value = GetPlayerServerId(player.id)}
        
        table.insert(closestPlayers, newPlayer)
    end

    if #closestPlayers < 1 then 
        stevo_lib.Notify(locale("notify.noplayersnearby"), 'error', 3000)
        return lib.showContext('stevo_portablemoneywash_keys_'..data.id)
    end


    local closestPlayers = lib.callback.await('stevo_portablemoneywash:formatClosestPlayers', false, closestPlayers)

    local input = lib.inputDialog(locale("input.addkey"), {
        { type = 'select', options = closestPlayers, label = locale("input.addkeyselect"), required = true },
    })

    if input then 
        manageWasherAction({action = 'addkey', actiondata = input[1], id = data.id})
    else 
        return lib.showContext('stevo_portablemoneywash_keys_'..data.id)
    end
end

function manageWasher(id)
    local washer, isOwner, hasKey, time = lib.callback.await('stevo_portablemoneywash:getWasherData', false, id) 
    

    if washer.data.locked and not isOwner and not hasKey then 
        return stevo_lib.Notify(locale("notify.locked", locale("menu.title", washer.name, config.washingMachines[washer.type].label)), 'error', 3000)
    end

    local keys = {
        {
            title = locale("menu.addkeys"),
            icon = 'plus',
            arrow = true,
            onSelect = manageWasherKeys,
            args = {id = id}
        }
    }

    if #washer.data.keys < 1 then       
        local option = {
            title = locale("menu.nokeys"),
            disabled = true,
            icon = 'x'
        }
        table.insert(keys, option)
    else 
        for identifier, key in pairs(washer.data.keys) do 
            local option = {
                title = key.name,
                icon = 'key',
                onSelect = function()
                    lib.showContext('stevo_portablemoneywash_key_'..identifier)
                end
            }
            table.insert(keys, option)

            lib.registerContext({
                id = 'stevo_portablemoneywash_key_'..identifier,
                title = key.name,
                menu = 'stevo_portablemoneywash_keys_'..id,
                options = {
                  {
                    title = locale("menu.removekey"),
                    icon = 'x', 
                    arrow = true,
                    onSelect = manageWasherAction,
                    args = {action = 'removekey', actiondata = key.identifier, id = id}
                  }
                }
              })
        end
    end

    if washer.data.currentWash.active then
        if washer.data.currentWash.finish < time then 
            lib.registerContext({
                id = 'stevo_portablemoneywash_wash_'..id,
                title = locale("menu.currentWash"),
                menu = 'stevo_portablemoneywash_'..id,
                options = {
                  {
                    title = locale("menu.washcomplete", washer.data.currentWash.washReturn),
                    icon = 'circle-check'
                  },
                  {
                    title = locale("menu.unloadmoney"),
                    arrow = true,
                    icon = 'money-bill',
                    onSelect = function()
                        if progress({
                            duration = config.loadTime * 1000,
                            position = 'bottom',
                            label = locale('progress.unloadingWasher'),
                            useWhileDead = false,
                            canCancel = false,
                            anim = {
                                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                                clip = "machinic_loop_mechandplayer"
                            },
                            disable = { move = true, car = true, mouse = false, combat = true, },
                        }) then    
                            local updatedWasher, updatedTime = lib.callback.await('stevo_portablemoneywash:moneyUnloaded', false, id)

                            if updatedWasher then 
                                stevo_lib.Notify(locale('notify.moneycollected', washer.data.currentWash.washReturn), 'success', 5000)
                                manageWasher(id)
                            end
                        end
                    end
                  }
                }
            })
        else 
            lib.registerContext({
                id = 'stevo_portablemoneywash_wash_'..id,
                title = locale("menu.currentWash"),
                menu = 'stevo_portablemoneywash_'..id,
                options = {
                {
                    title = locale("menu.washamount"),
                    description = '$'..washer.data.currentWash.amount,
                    icon = 'sack-dollar'
                },
                {
                    title = locale("menu.washstart"),
                    description  =  washer.data.currentWash.startFormatted,
                    icon = 'clock'
                },
                {
                    title = locale("menu.washend"),
                    description = washer.data.currentWash.finishFormatted,
                    icon = 'stopwatch'
                },
                {
                    title = locale("menu.washStartedBy"),
                    description = washer.data.currentWash.startedBy,
                    icon = 'user'
                },
                {
                    title = locale("menu.cancelwash"),
                    arrow = true,
                    icon = 'x',
                    onSelect = function()
                        if progress({
                            duration = config.loadTime * 1000,
                            position = 'bottom',
                            label = locale('progress.unloadingWasher'),
                            useWhileDead = false,
                            canCancel = false,
                            anim = {
                                dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                                clip = "machinic_loop_mechandplayer"
                            },
                            disable = { move = true, car = true, mouse = false, combat = true, },
                        }) then    
                            local updatedWasher, updatedTime = lib.callback.await('stevo_portablemoneywash:washCancelled', false, id)

                            if updatedWasher then 
                                stevo_lib.Notify(locale('notify.washCancelled'), 'error', 5000)
                                manageWasher(id)
                            end
                        end
                    end
                }
                }
            })
        end
    else
        lib.registerContext({
            id = 'stevo_portablemoneywash_wash_'..id,
            title = locale("menu.currentWash"),
            menu = 'stevo_portablemoneywash_'..id,
            options = {
              {
                title = locale("menu.startwash"),
                arrow = true,
                icon = 'play',
                onSelect = function()
                    startWash(id)
                end
              }
            }
        })
    end

    lib.registerContext({
        id = 'stevo_portablemoneywash_keys_'..id,
        title = locale("menu.keys"),
        menu = 'stevo_portablemoneywash_'..id,
        options = keys
    })


    lib.registerContext({
        id = 'stevo_portablemoneywash_'..id,
        title = locale("menu.title", washer.name, config.washingMachines[washer.type].label),
        options = {
            {
                title = locale("menu.locked"),
                description = washer.data.locked and locale("locked") or locale("unlocked"),
                icon = washer.data.locked and 'lock' or 'lock-open',
                iconColor = washer.data.locked and '#ab1d1d' or '#69ab1d',
                arrow = hasKey,
                disabled =not hasKey,
                onSelect = manageWasherAction,
                args = {action = 'lockstatus', actiondata = false, id = id}
            },
            {
                title = locale("menu.wash"),
                description = washer.data.currentWash.active and locale("menu.washactive") or locale("menu.washinactive"),
                icon = 'spinner',
                iconColor = washer.data.currentWash.active and '#69ab1d' or '#ab1d1d',
                arrow = true,
                onSelect = function()
                    lib.showContext('stevo_portablemoneywash_wash_'..id)
                end,
                args = {washer = washer}
            },
            {
                title = locale("menu.managekeys"),
                icon = 'key',
                arrow = isOwner,
                disabled = not isOwner,
                onSelect = function()
                    lib.showContext('stevo_portablemoneywash_keys_'..id)
                end,
                args = {washer = washer}
            },
            {
                title = locale("menu.pickupWasher"),
                icon = 'arrow-up-from-bracket',
                arrow = isOwner and true or false,
                disabled = not isOwner,
                onSelect = function()
                    if progress({
                        duration = config.loadTime * 1000,
                        position = 'bottom',
                        label = locale('progress.pickupWasher'),
                        useWhileDead = false,
                        canCancel = false,
                        anim = {
                            dict = "pickup_object",
                            clip = "pickup_low"
                        },
                        disable = { move = true, car = true, mouse = false, combat = true, },
                    }) then    
                        local pickedupWasher = lib.callback.await('stevo_portablemoneywash:pickedupWasher', false, id)

                        if pickedupWasher then 
                            stevo_lib.Notify(locale('notify.pickedupWasher'), 'success', 5000)

                        end
                    end
                end,
            }
        }
    })
     
    lib.showContext('stevo_portablemoneywash_'..id)
end

local function initWashers()
    local washers = lib.callback.await('stevo_portablemoneywash:getWashers', false)

    for id, washer in pairs(washers) do 
        local options = {
            options = {
                {
                    name = id,
                    type = "client",
                    action = function()
                        manageWasher(id)
                    end,
                    icon =  config.target.icon,
                    label = locale("target.open", config.washingMachines[washer.type].label),
                }
            },
            distance = config.target.distance,
            rotation = 45
        }
        
        stevo_lib.target.AddBoxZone('stevo_portablemoneywash:'..id, vec3(washer.coords.x, washer.coords.y, washer.coords.z)+vec3(0.0, 0.0, 0.5), config.target.radius, options)
    end
end

RegisterNetEvent('stevo_portablemoneywash:useItem', function(type)
    local washerConfig = config.washingMachines[type]
    local washerCoords, washerHeading = placeWasher(washerConfig.model)

    local washerPlaced = lib.callback.await('stevo_portablemoneywash:placed', false, type, washerCoords, washerHeading)

    if not washerPlaced then return stevo_lib.Notify(locale('notify.unabletoplace', 'error', 3000)) end

    stevo_lib.Notify(locale('notify.washerplaced', 'success', 5000))
end)

RegisterNetEvent('stevo_portablemoneywash:addTarget', function(washer)

    local options = {
        options = {
            {
                name = washer.id,
                type = "client",
                action = function()
                    manageWasher(washer.id)
                end,
                icon =  config.target.icon,
                label = locale("target.open", config.washingMachines[washer.type].label),
            }
        },
        distance = config.target.distance,
        rotation = 45
    }
    
    stevo_lib.target.AddBoxZone('stevo_portablemoneywash:'..washer.id, vec3(washer.coords.x, washer.coords.y, washer.coords.z)+vec3(0.0, 0.0, 0.5), config.target.radius, options)
end)

RegisterNetEvent('stevo_portablemoneywash:deleteWasher', function(id)
    stevo_lib.target.RemoveZone('stevo_portablemoneywash:'..id)
end)

RegisterNetEvent('stevo_portablemoneywash:notify', function(message, type, duration)
    stevo_lib.Notify(message, type, duration)
end)

RegisterNetEvent('stevo_lib:playerLoaded', function()
    initWashers()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= cache.resource then return end

    initWashers()
end)
