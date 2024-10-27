local printStyles = {
    ["error"] = "^1[ERROR] ^0",
    ["success"] = "^2[SUCCESS] ^0",
    ["info"] = "^3[INFORMATION] ^0",
}

Lib.print = function(txt, printType)
    print((printStyles[printType] or printStyles["info"])..txt)
end

Lib.debug = function(tbl, indent)
    local indent = indent or 0
    local prefix = "^6[DEBUG]^0 "
    local tbltype = type(tbl)

    if tbltype ~= "table" then
        print(prefix .. (tbl or tbltype))
        return
    end

    for key, value in pairs(tbl) do
        local formatting = string.rep("  ", indent) .. "^0" .. tostring(key) .. "^0" .. ": "

        if type(value) == "table" then
            print(prefix .. formatting)
            Lib.debug(value, indent + 1)
        elseif type(value) == "string" then
            print(prefix .. formatting .. "^5'" .. tostring(value) .. "'^0")
        else
            print(prefix .. formatting .. "^2" .. tostring(value) .. "^0")
        end
    end
end

Lib.refInt = function(int)
	return tostring(int):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

Lib.missingValue = function(num1, num2)
	return math.floor(num1 - num2)
end

Lib.roundTo = function(int, round)
	return tonumber(string.format("%." .. round .. "f", int))
end

Lib.checkSuccess = function(chance)
    return (math.random() * 100) <= chance
end

local numbers = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
local letters = {}
local small_letters = {}

for i = 65, 90 do
    table.insert(letters, string.char(i))
end

for i = 97, 122 do
    table.insert(small_letters, string.char(i))
end

Lib.randomString = function(length, pattern)
    local charset = {}

    if pattern == "A" then
        charset = letters
    elseif pattern == "a" then
        charset = small_letters
    elseif pattern == 0 then
        charset = numbers
    else
        for _, v in ipairs(letters) do
            table.insert(charset, v)
        end

        for _, v in ipairs(small_letters) do
            table.insert(charset, v)
        end

        for _, v in ipairs(numbers) do
            table.insert(charset, tostring(v))
        end
    end

    local randomStr = ""
    for i = 1, length do
        local randIndex = math.random(1, #charset)
        randomStr = randomStr .. charset[randIndex]
    end

    return randomStr
end

Lib.isExportAvailable = function(resource, export)
	if GetResourceState(resource) ~= "started" then return false end

    local success, result = pcall(function()
        return exports[resource][export]
    end)

    return success and result ~= nil
end

Lib.capitalizeFirstLetter = function(string)
	return string:sub(1, 1):upper() .. string:sub(2):lower()
end

Lib.copyTable = function(table)
    local newTable = {}

    for i, v in pairs(table) do
        newTable[i] = v
    end

    return newTable
end

modules.functions = true

local resourceName = GetCurrentResourceName()
local version = GetResourceMetadata("is_lib", "version")

local function libStarted(isServer)
    Lib.print(("is_lib (^5%s^0) started"):format(version), "success")

    if resourceName ~= "is_lib" then
        CreateThread(function()
            while true do
                Lib.print(("Use the resource name ^2is_lib^0 instead of ^1%s^0."):format(resourceName), "error")
                Wait(2000)
            end
        end)
    end

    if isServer then
        local repository = GetResourceMetadata(resourceName, "repository")

        PerformHttpRequest("https://api.github.com/repos/inside-scripts/is_lib/releases/latest", function(status, response)
            if status ~= 200 then return end
    
            local response = json.decode(response)
    
            if response.tag_name == nil then return end
    
            if version ~= response.tag_name then
                local latestTag = repository.."/releases/tag/"..response.tag_name
    
                Lib.print(("An update for ^2is_lib^0 is available. Download the Latest Version from ^3GitHub^0: ^5%s^0"):format(latestTag), "info")
            end
        end, 'GET')
    end
end

libStarted(IsDuplicityVersion())
