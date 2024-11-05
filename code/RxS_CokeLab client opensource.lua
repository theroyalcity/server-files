--[[
BY RX Scripts © rxscripts.xyz
--]]

---@return boolean | nil
function RaidMinigame(hasSecurity)
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)
    local result
    
    -- You can use hasSecurity to check if the lab has security, to make the raid harder
    if hasSecurity then
        result = lib.skillCheck({'medium', 'medium', 'hard'}, {'w', 'a', 's', 'd'})
    else
        result = lib.skillCheck({'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
    end

    ClearPedTasks(playerPed)
    
    -- Must return: true, false or nil
    return result
end

function ShowMarker(type, coords)
    if type == 'laptop' or type == 'door' or type == 'stash' or type == 'action' then
        DrawMarker(2, coords, 0, 0, 0, 0, 180.0, 0, 0.3, 0.3, 0.3, 204, 0, 102, 100, false, false, 2, true, false, false, false)
    end
end

-- Only works with qb-target or ox_target started
function InitEntranceTarget(labId)
    local lab = Labs[labId]
    if not lab then return end

    if OXTarget then
        OXTarget:addLocalEntity(lab.ped, {
            {
                name = 'enter'..labId,
                label = 'Enter '..lab.name,
                icon = 'fas fa-sign-in-alt',
                distance = 2.5,
                canInteract = function()
                    return lab.owner and (lab.code or lab.lastraid)
                end,
                onSelect = function()
                    EnterLab(labId)
                end
            },
            {
                name = 'changecode'..labId,
                label = 'Set Code',
                icon = 'fas fa-key',
                distance = 2.5,
                canInteract = function()
                    return lab.owner and lab.owner == FM.player.getIdentifier()
                end,
                onSelect = function()
                    ChangeCode(labId)
                end
            },
            {
                name = 'buy'..labId,
                label = 'Buy '..lab.name..' ($'..lab.price..')',
                icon = 'fas fa-dollar-sign',
                distance = 2.5,
                canInteract = function()
                    return not lab.owner
                end,
                onSelect = function()
                    OpenBuyLabDialog(labId)
                end
            },
            {
                name = 'raid'..labId,
                label = 'Raid '..lab.name,
                icon = 'fas fa-handcuffs',
                distance = 2.5,
                canInteract = function()
                    return Config.CopsRaid.enabled and CurrentJob and CurrentJob.name == Config.CopsRaid.allowedJob.name and CurrentJob.grade >= Config.CopsRaid.allowedJob.minGrade and lab.owner
                end,
                onSelect = function()
                    RaidLab(labId)
                end
            }
        })
    elseif QBTarget then
        QBTarget:AddTargetEntity(lab.ped, {
            options = {
                {
                    label = 'Enter '..lab.name,
                    icon = 'fas fa-sign-in-alt',
                    targeticon = 'fas fa-sign-in-alt',
                    action = function()
                        EnterLab(labId)
                    end,
                    canInteract = function()
                        return lab.owner and (lab.code or lab.lastraid)
                    end,
                },
                {
                    label = 'Set Code',
                    icon = 'fas fa-key',
                    targeticon = 'fas fa-key',
                    action = function()
                        ChangeCode(labId)
                    end,
                    canInteract = function()
                        return lab.owner and lab.owner == FM.player.getIdentifier()
                    end,
                },
                {
                    label = 'Buy '..lab.name..' ($'..lab.price..')',
                    icon = 'fas fa-dollar-sign',
                    targeticon = 'fas fa-dollar-sign',
                    action = function()
                        OpenBuyLabDialog(labId)
                    end,
                    canInteract = function()
                        return not lab.owner
                    end,
                },
                {
                    label = 'Raid '..lab.name,
                    icon = 'fas fa-handcuffs',
                    targeticon = 'fas fa-handcuffs',
                    action = function()
                        RaidLab(labId)
                    end,
                    canInteract = function()
                        return Config.CopsRaid.enabled and CurrentJob and CurrentJob.name == Config.CopsRaid.allowedJob.name and CurrentJob.grade >= Config.CopsRaid.allowedJob.minGrade and lab.owner
                    end,
                }
            },
            distance = 2.5,
        })
    end
end

-- Gets used when ox_target and qb-target are not started
function OpenLabMenu(labId)
    local lab = Labs[labId]
    if not lab then return end

    local opts = {}
    
    if lab.owner and (lab.code or lab.lastraid) then
        opts[#opts+1] = {
            title = 'Enter '..lab.name,
            icon = 'fas fa-sign-in-alt',
            arrow = true,
            onSelect = function()
                EnterLab(labId)
            end,
        }
    end

    if lab.owner and lab.owner == FM.player.getIdentifier() then
        opts[#opts+1] = {
            title = 'Set Code',
            icon = 'fas fa-key',
            arrow = true,
            onSelect = function()
                ChangeCode(labId)
            end,
        }
    end

    if not lab.owner then
        opts[#opts+1] = {
            title = 'Buy '..lab.name..' ($'..lab.price..')',
            icon = 'fas fa-dollar-sign',
            arrow = true,
            onSelect = function()
                OpenBuyLabDialog(labId)
            end,
        }
    end

    if Config.CopsRaid.enabled and CurrentJob and CurrentJob.name == Config.CopsRaid.allowedJob.name and CurrentJob.grade >= Config.CopsRaid.allowedJob.minGrade and lab.owner then
        opts[#opts+1] = {
            title = 'Raid '..lab.name,
            icon = 'fas fa-handcuffs',
            arrow = true,
            onSelect = function()
                RaidLab(labId)
            end,
        }
    end

    lib.registerContext({
        id = 'labmenu'..tostring(labId),
        title = lab.name,
        options = opts,
    })

    lib.showContext('labmenu'..tostring(labId))
end
