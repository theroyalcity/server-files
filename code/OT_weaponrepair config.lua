Config = {}

Config.useOTSkills = false -- requires our skills system, you can find here
Config.xpreward = 5

Config.requireditem = 'money'
Config.requireditemamount = 1000
Config.repairtime = 5000
Config.repairItem = 'weaponrepairkit'

Config.require = {
    ['WEAPON COMBATPDW'] = {
        requireditem = 'money',
        requirediteamamount = 2000,
        repairtime = 10000
   },
}

Config.locations = {
    {
       coords = vector3(-567.8292, -1696.3129, 19.0366),
       heading = 210.3678,
       spawnprop = true, -- spwans the workbench at the location
       free = false -- allows weapons to be repaired for free at the location
  }
}
