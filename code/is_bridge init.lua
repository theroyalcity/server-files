bridge = {}

Lib = exports["is_lib"]:GetLibObject()

local modules = {
    {
        module = "framework",
        resources = {
            client = {
                ["qb-core"] = "qb-core.lua",
                ["qbx_core"] = "qbx_core.lua",
                ["es_extended"] = "es_extended.lua",
            },
            server = {
                ["qb-core"] = "qb-core.lua",
                ["qbx_core"] = "qbx_core.lua",
                ["es_extended"] = "es_extended.lua",
            },
        },
    },
    {
        module = "inventory",
        resources = {
            server = {
                ["core_inventory"] = "core_inventory.lua",
                ["codem-inventory"] = "codem-inventory.lua",
                ["origen_inventory"] = "mixed.lua",
                ["lj-inventory"] = "mixed.lua",
                ["ps-inventory"] = "mixed.lua",
                ["qs-inventory"] = "qs-inventory.lua",
                ["qb-inventory"] = "mixed.lua",
                ["ox_inventory"] = "ox_inventory.lua",
            },
        },
    },
    {
        module = "fuel",
        resources = {
            client = {
                ["LegacyFuel"] = "mixed.lua",
                ["cdn-fuel"] = "mixed.lua",
                ["ps-fuel"] = "mixed.lua",
                ["okokGasStation"] = "mixed.lua",
                ["ox_fuel"] = "ox_fuel.lua",
                ["lj-fuel"] = "mixed.lua",
                ["hyon_gas_station"] = "mixed.lua",
                ["ND_Fuel"] = "mixed.lua",
                ["myFuel"] = "mixed.lua",
            },
        },
    },
    {
        module = "keys",
        resources = {
            client = {
                ["is_carlock"] = "is_carlock.lua",
                ["qb-vehiclekeys"] = "qb-vehiclekeys.lua",
                ["qs-vehiclekeys"] = "qs-vehiclekeys.lua",
                ["vehicles_keys"] = "vehicles_keys.lua",
                ["wasabi_carlock"] = "wasabi_carlock.lua",
                ["cd_garage"] = "cd_garage.lua",
                ["okokGarage"] = "okokGarage.lua",
            },
            server = {
                ["is_carlock"] = "is_carlock.lua",
                ["qb-vehiclekeys"] = "qb-vehiclekeys.lua",
                ["qs-vehiclekeys"] = "qs-vehiclekeys.lua",
                ["vehicles_keys"] = "vehicles_keys.lua",
                ["wasabi_carlock"] = "wasabi_carlock.lua",
                ["cd_garage"] = "cd_garage.lua",
                ["okokGarage"] = "okokGarage.lua",
            },
        },
    },
    {
        module = "notification",
        resources = {
            client = {
                ["is_ui"] = "is_ui.lua",
                ["ox_lib"] = "ox_lib.lua",
                ["qb-core"] = "qb-core.lua",
                ["esx_notify"] = "esx_notify.lua",
                ["codem-notification"] = "codem-notification.lua",
            },
            server = {
                ["is_ui"] = "is_ui.lua",
                ["ox_lib"] = "ox_lib.lua",
                ["qb-core"] = "qb-core.lua",
                ["esx_notify"] = "esx_notify.lua",
                ["codem-notification"] = "codem-notification.lua",
            },
        },
    },
    {
        module = "progressbar",
        resources = {
            client = {
                ["is_ui"] = "is_ui.lua",
                ["ox_lib"] = "ox_lib.lua",
                ["progressbar"] = "qb-core.lua",
            },
        },
    },
    {
        module = "target",
        resources = {
            client = {
                ["is_interaction"] = "is_interaction.lua",
                ["qb-target"] = "qb-target.lua",
                ["ox_target"] = "ox_target.lua",
            },
        },
    },
}

local resourceName = GetCurrentResourceName()
local isBridge = GetResourceMetadata(resourceName, "name") == "is_bridge"
local version = GetResourceMetadata("is_bridge", "version")
local isServer = IsDuplicityVersion()

local function loadModules(path)
    local file = LoadResourceFile("is_bridge", path)

    if not file then
        Lib.print(("Failed to load file: ^1%s^0"):format(path), "error")
        return nil
    end
    
    local func, err = load(file, path)

    if not func then
        Lib.print(("An error occurred while loading the file: ^1%s^0"):format(path), "error")
        return nil
    end

    local status, result = pcall(func)

    if not status then
        Lib.print(("An error occurred in module ^1%s^0: ^1%s^0"):format(path, result), "error")
        return nil
    end

    return result
end

local function isResourceStarted(res)
    local state = GetResourceState(res)
    local t = 0.0

    while state == "starting" and t < 0.5 do
        state = GetResourceState(res)
        Wait(10)
        t = t + 0.01
    end

    return state == "started"
end

local function getResource(mod, side, res)
    local resType = type(res)

    if resType == "string" then
        local isLoaded = isResourceStarted(res)

        if isLoaded then return res, modules[mod].resources[side][res] end
    elseif resType == "table" then
        for checkRes, file in pairs(res) do
            local isLoaded = isResourceStarted(checkRes)

            if isLoaded then return checkRes, file end
        end
    end

    return nil, nil
end

local function injectModule(mod, side, res, file)
    local result = loadModules(mod .. "/" .. side .. "/" .. file)

    if result then
        bridge[mod] = result
        bridge[mod].name = res

        if mod == "target" then
            bridge[mod].cache = {}
        end
        
        return true
    end

    return false
end

local function getModules()
    bridge.language = GetConvar("is_bridge:language", "en")

    for modId, tbl in ipairs(modules) do
        local moduleType = tbl.module
        local convar = GetConvar("is_bridge:" .. moduleType, "none")
        local convarRes = convar ~= "none" and convar or nil

        for side, v in pairs(tbl.resources) do
            if side == "server" and not isServer or side == "client" and isServer then goto skip end

            local resource, file

            if convarRes and modules[modId].resources[side][convarRes] then
                resource, file = getResource(modId, side, convarRes)

                if resource and file and injectModule(moduleType, side, convarRes, file) then break else convarRes = nil end
            end

            resource, file = getResource(modId, side, v)
            if resource and file and injectModule(moduleType, side, resource, file) then break else
                injectModule(moduleType, side, "none", "none.lua")
            end

            ::skip::
        end
    end
end

getModules()

if isBridge then
    Lib.print(("is_bridge (^5%s^0) started"):format(version), "success")

    for _, tbl in ipairs(modules) do
        local moduleType = tbl.module

        if bridge[moduleType] and bridge[moduleType].name ~= "none" then
            Lib.print(("Module ^3%s^0: ^2%s^0"):format(moduleType, bridge[moduleType].name), "success")
        elseif bridge[moduleType] and bridge[moduleType].name == "none" then
            Lib.print(("Module ^3%s^0: ^1%s^0"):format(moduleType, bridge[moduleType].name), "error")
        end
    end

    if resourceName ~= "is_bridge" then
        CreateThread(function()
            while true do
                Lib.print(("Use the resource name ^2is_bridge^0 instead of ^1%s^0."):format(resourceName), "error")
                Wait(2000)
            end
        end)
    end

    if isServer then
        local repository = GetResourceMetadata(resourceName, "repository")

        PerformHttpRequest("https://api.github.com/repos/inside-scripts/is_bridge/releases/latest", function(status, response)
            if status ~= 200 then return end
    
            local response = json.decode(response)
    
            if response.tag_name == nil then return end
    
            if version ~= response.tag_name then
                local latestTag = repository.."/releases/tag/"..response.tag_name
    
                Lib.print(("An update for ^2is_bridge^0 is available. Download the Latest Version from ^3GitHub^0: ^5%s^0"):format(latestTag), "info")
            end
        end, 'GET')
    end
end

if not isServer then
    AddEventHandler("onResourceStop", function(stoppedRes)
        if not stoppedRes or type(stoppedRes) ~= "string" then return end

        for entity, tbl in pairs(bridge.target.cache) do

            for i, v in ipairs(tbl.options) do
                if v.invoker == stoppedRes then
                    bridge.target.removeEntity(entity, v.name, v.invoker)
                    Lib.print(("Removing Option ^3%s^0 from Target ^3%s^0 from resource ^5[%s]^0"):format(v.name, tostring(entity), v.invoker), "info")
                end
            end
        end
    end)
end
