Config = Config or {}

-- Start Message:
Config.CStartMSGT = true -- Toggles the client console message.
Config.SStartMSGT = true -- Toggles the server console message.
Config.StartMSG = "SG-Tyres:ON" -- A console message when the script starts.

-- Server Console Logging: (format: 'licence | just used: command/message')
Config.FixtyreConsoleLog = true -- if true a message will be sent in the server console when someone uses the fixtyre command.
Config.ABPtyreConsoleLog = true -- if true a message will be sent in the server console when someone uses the add bulletproof tyres command.
Config.RBPtyreConsoleLog = true -- if true a message will be sent in the server console when someone uses the remove bulletproof tyres command.
Config.NormaltyreSwapConsoleLog = true -- if true a message will be sent in the server console when someone uses the normal tyre swap item.
Config.BulletprooftyreSwapConsoleLog = true -- if true a message will be sent in the server console when someone uses the bulletproof tyre swap item.
Config.BPTyreSwapConsoleMSG = "BulletProof Tyre Swap" -- the message that will apear in the server console when using bulletproof tyre swap item.
Config.NormalTyreSwapConsoleMSG = "Normal Tyre Swap" -- the message that will apear in the server console when using normal tyre swap item.

-- Command Toggles (true/false):
Config.TFtoggle = true -- Toggle the fix wheels command.
Config.ABPtoggle = true -- Toggle the add bulletproof tyres command.
Config.RBPtoggle = true -- Toggle the remove bulletproof tyres command.

-- Commands ("Command"):
Config.Tyrefixcommand = "fixwheels" -- Fixes the tyres of the car you are in.
Config.ABPtyrescommand = "addbulletprooftyres" -- Fixes and adds Bulletproofing to the Tyres of the car you are in.
Config.RBPtyrescommand = "removebulletprooftyres" -- Removes the bulletproofing from Tyres of the car you are in.

-- Bulletproof Commands (true/false):
Config.ABPFW = false -- If add bulletproof tyres command will also fix the tyres.
Config.RBPFW = false -- If remove bulletproof tyres command will also fix the tyres.

-- Command Settings:
Config.FixTyreCommandDescription = "Fixes Your Car's Tires (Admin only)" -- The command description for the fixwheel command.
Config.AddBulletproofTyresCommandDescription = "Adds Bulletproofing To Your Car's Tires (Admin only)" -- The command description for the addbulletprooftyres command
Config.RemoveBulletproofTyresCommandDescription = "Removes Bulletproofing From Your Car's Tires (Admin only)" -- The command description for the removebulletprooftyres command
Config.FixTyreCommandRequirement = "admin" -- What permission level is needed to use the Fixwheels command (admin/god) (default = "admin")
Config.AddBulletproofTyreCommandRequirement = "admin" -- What permission level is needed to use the addbulletprooftyres command (admin/god) (default = "admin")
Config.RemoveBulletproofTyreCommandRequirement = "admin" -- What permission level is needed to use the removebulletprooftyres command (admin/god) (default = "admin")

-- Item Toggles (true/false):
Config.TStoggle = true -- Toggle the tyre swap with item.
Config.BPStoggle = true -- Toggle the bulletproof tyre swap with item.

-- Items ("Item"):
Config.TyreSwap = "ntyre" -- Item for normal tyre swap.
Config.BpTyreSwap = "bptyre" -- Item for bulletproof tyre swap.

-- Use Duration Toggle (true/false) false = instant use:
Config.TSUDT = true -- Toggle the progressbar for tyre swap.
Config.BPTSUDT = true -- Toggle the progressbar for bulletproof tyre swap.

--Use Duration (INT) (1000 = 1 second):
Config.TSUD = 10000 -- How much time in miliseconds will it take to replace the tyres with normal tyres.
Config.BPTSUD = 12500 -- How much time in miliseconds will it take to replace the tyres with bulletproofs tyres.

-- Command Notifications Toggle (true/false):
Config.FWCTT = true -- Toggles the fix tyres command notification.
Config.ABPTCT = true -- Toggles the add bulletproof tyres command notification.
Config.RBPTCT = true -- Toggles the remove bulletproof tyres command notification.
Config.NRTIUST = true -- Toggles the normal replace tyres item use Start notification.
Config.NRTIUDT = true -- Toggles the normal replace tyres item use Done notification.
Config.BPRTIUST = true -- Toggles the bulletproof replace tyres item use Start notification.
Config.BPRTIUDT = true -- Toggles the bulletproof replace tyres item use Done notification.

-- Command Notifications ("Text"):
Config.FWCT = "Tyres Fixed!" -- Fix tyres command notification text.
Config.ABPTC = "Added Bulletproof Tyres!" -- Add bulletproof tyres command notification.
Config.RBPTC = "Removed Bulletproof Tyres!" -- Remove bulletproof tyres command notification
Config.NRTIUS = "Replacing Tyres!" -- Normal replace tyres item use Start notification
Config.NRTIUD = "Tyres Have Been Replaced!" -- Normal replace tyres item use Done notification.
Config.BPRTIUS = "Replacing Tyres!" -- Bulletproof replace tyres item use Start notification.
Config.BPRTIUD = "Tyres Have Been Replaced!" -- Bulletproof replace tyres item use Done notification.

-- Bulletproof Toggles:
Config.NRTIBP = true -- If the standard tyre swap will REMOVE bulletproofing (true = remove bulletproof)
Config.BPRTIBP = true -- If the bulletproof tyre swap will ADD bulletproofing (true = add bulletproof)

-- Vehicle must be stopped toggles:
Config.Nfixtyremustbestopped = true -- if using the normal tyres swap item will require the car to be stopped.
Config.BPfixtyremustbestopped = true -- if using the bulletproof tyres swap item will require the car to be stopped.

-- Cant swap unless a tyre is burst or swap bp status:
Config.NSwapOnlyWhenNeeded = true -- when true you can only swap tyres with the normal tyre swap when the tyres are burst or are bulletproof. when false you can use it allways
Config.BPSwapOnlyWhenNeeded = true -- when true you can only swap tyres with the bulletproof tyre swap when the tyres are burst or are not bulletproof. when false you can use it allways



-- SG-tyres Version 1.2.2
-- Made by Shamgamer & BR2BOY