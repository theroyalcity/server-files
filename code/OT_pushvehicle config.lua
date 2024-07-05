Config = {}

Config.target = true -- Use target system for vehicle push (disables TextUI)
Config.targetSystem = 'ox_target' -- Target System to use. ox_target, qtarget, qb-target
Config.Usebones = true -- Use bones for vehicle push
Config.PushKey = 'W'-- Key to push vehicle
Config.TurnRightKey = 'D' -- Keys to turn the vehicle while pushing it.
Config.TurnLeftKey = 'A' -- Keys to turn the vehicle while pushing it.
Config.TextUI = true -- Use Text UI for vehicle push
Config.useOTSkills = false -- Use OT Skills for XP gain from pushing vehicle.
Config.maxReward = false -- Max amount of xp that can't be gained from pushing vehicle
Config.healthMin = 2000.0 -- Minimum health of vehicle to be able to push it.

Config.blacklist = { -- blacklist vehicle models from begin pushed.
    ['phantom'] = true
}
