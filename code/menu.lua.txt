--<-.(`-')               _                         <-. (`-')_  (`-')  _                          (`-')              _           (`-') (`-')  _ _(`-')    (`-')  _      (`-')
-- __( OO)      .->     (_)        .->                \( OO) ) ( OO).-/    <-.          .->   <-.(OO )     <-.     (_)         _(OO ) ( OO).-/( (OO ).-> ( OO).-/     _(OO )
--'-'---.\  ,--.'  ,-.  ,-(`-') ,---(`-')  .----.  ,--./ ,--/ (,------. (`-')-----.(`-')----. ,------,) (`-')-----.,-(`-'),--.(_/,-.\(,------. \    .'_ (,------.,--.(_/,-.\
--| .-. (/ (`-')'.'  /  | ( OO)'  .-(OO ) /  ..  \ |   \ |  |  |  .---' (OO|(_\---'( OO).-.  '|   /`. ' (OO|(_\---'| ( OO)\   \ / (_/ |  .---' '`'-..__) |  .---'\   \ / (_/
--| '-' `.)(OO \    /   |  |  )|  | .-, \|  /  \  .|  . '|  |)(|  '--.   / |  '--. ( _) | |  ||  |_.' |  / |  '--. |  |  ) \   /   / (|  '--.  |  |  ' |(|  '--.  \   /   / 
--| /`'.  | |  /   /)  (|  |_/ |  | '.(_/'  \  /  '|  |\    |  |  .--'   \_)  .--'  \|  |)|  ||  .   .'  \_)  .--'(|  |_/ _ \     /_) |  .--'  |  |  / : |  .--' _ \     /_)
--| '--'  / `-/   /`    |  |'->|  '-'  |  \  `'  / |  | \   |  |  `---.   `|  |_)    '  '-'  '|  |\  \    `|  |_)  |  |'->\-'\   /    |  `---. |  '-'  / |  `---.\-'\   /   
--`------'    `--'      `--'    `-----'    `---''  `--'  `--'  `------'    `--'       `-----' `--' '--'    `--'    `--'       `-'     `------' `------'  `------'    `-'    

Menu = {}
Menu.item = {
    ['Title'] = 'Emotes',
    ['Items'] = {
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU INTERACTIONS -----------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		{['Title'] = 'Interactions', ['SubMenu'] = {
				['Title'] = 'Sport',
					['Items'] = {
									{ ['Title'] = "Serrer la main", 	Function = playAmination ,  dictionaries = "mp_common", clip = 'givetake1_a'},
									{ ['Title'] = "Dire bonjour",   	Function = playAmination ,  dictionaries = "gestures@m@standing@casual", clip = "gesture_hello" },
									{ ['Title'] = "Tappes moi en 5", 	Function = playAmination ,  dictionaries = "mp_ped_interaction", clip = "highfive_guy_a" },
									{ ['Title'] = 'Signe de la main', ['Function'] = playAmination, ['dictionaries'] = "friends@frj@ig_1", ['clip'] = 'wave_e' },
									{ ['Title'] = "Salut militaire", 	Function = playAmination ,  dictionaries = "mp_player_int_uppersalute", clip = "mp_player_int_salute" },
									{ ['Title'] = "Branleur", Function = playAmination ,  dictionaries = "mp_player_int_upperwank", clip = "mp_player_int_wank_01" },
									{ ['Title'] = "Dammed ", Function = playAmination ,  dictionaries = "gestures@m@standing@casual", clip = "gesture_damn" },
									{ ['Title'] = "Calme toi ", Function = playAmination ,  dictionaries = "gestures@m@standing@casual", clip = "gesture_easy_now" },
									{ ['Title'] = "No way", Function = playAmination ,  dictionaries = "gestures@m@standing@casual", clip = "gesture_no_way" },
									{ ['Title'] = "Doigt d'honneur", Function = playAmination ,  dictionaries = "mp_player_int_upperfinger", clip = "mp_player_int_finger_01_enter" },
									{ ['Title'] = "Balle dans la tête", Function = playAmination ,  dictionaries = "mp_suicide", clip = "pistol" },
									{ ['Title'] = "Super", Function = playAmination ,  dictionaries = "mp_action", clip = "thanks_male_06" },
									{ ['Title'] = "Enlacer", Function = playAmination ,  dictionaries = "mp_ped_interaction", clip = "kisses_guy_a" },
									{ ['Title'] = "Se gratter les couilles", Function = playAmination , dictionaries = "mp_player_int_uppergrab_crotch", clip = "mp_player_int_grab_crotch" },
										}
									}
								},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU SPORT ------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        {['Title'] = 'Sport', ['SubMenu'] = {
				['Title'] = 'Sport',
					['Items'] = {
									{ ['Title'] = "Yoga", 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_YOGA"},
									{ ['Title'] = 'Pompes', 		Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_PUSH_UPS"},
									{ ['Title'] = 'Jogging', 		Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_JOG_STANDING"},
									{ ['Title'] = 'Bodybuilder', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_MUSCLE_FLEX"},
									{ ['Title'] = 'Soulever poids', Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS"},
										}
									}
								},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU FESTIF -----------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------								
		{['Title'] = 'Festif', ['SubMenu'] = {
				['Title'] = 'Festif',
							['Items'] = {
									{ ['Title'] = 'Musique', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_MUSICIAN"},
									{ ['Title'] = 'Fumer', 				Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_SMOKING"},
									{ ['Title'] = 'Fumer joint', 		Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_SMOKING_POT"},
									{ ['Title'] = 'Boire bouteille', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_DRINKING"},
									{ ['Title'] = 'Boire bière', 		Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_PARTYING"},
									{ ['Title'] = 'Applaudir', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_CHEERING"},
									{ ['Title'] = "Danser", 			Function = playAmination , dictionaries = "amb@world_human_partying@female@partying_beer@base", clip = "base" },
										}
									}
								},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU METIER -----------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------								
		{['Title'] = 'Métiers', ['SubMenu'] = {
				['Title'] = 'Métiers',
							['Items'] = {
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU POLICE -----------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------							
									{['Title'] = 'Police', ['SubMenu'] = {
											['Title'] = 'Police',
														['Items'] = {					
																{ ['Title'] = 'Examiner', 	Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_KNEEL"},
																{ ['Title'] = 'Calepin', 	Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"},
																{ ['Title'] = 'Clipboard', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_CLIPBOARD"},
																{ ['Title'] = 'Jumelles', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_BINOCULARS"},
																{ ['Title'] = 'Police', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_COP_IDLES"},
																{ ['Title'] = 'Trafique', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_CAR_PARK_ATTENDANT"},
																	}
																}
															},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU MEDECIN ----------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------														
									{['Title'] = 'Medecin', ['SubMenu'] = {
											['Title'] = 'Medecin',
														['Items'] = {					
																{ ['Title'] = 'Examiner', 			Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_KNEEL"},
																{ ['Title'] = 'Calepin', 			Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"},
																{ ['Title'] = 'Clipboard', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_CLIPBOARD"},
																{ ['Title'] = 'Prendre le pouls', 	Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"},
																	}
																}
															},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU DEPANNEUR --------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
									{['Title'] = 'Medecin', ['SubMenu'] = {
											['Title'] = 'Medecin',
														['Items'] = {					
																{ ['Title'] = 'Examiner', 			Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_KNEEL"},
																{ ['Title'] = 'Calepin', 			Function = playEmote, ['EmoteName'] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"},
																{ ['Title'] = 'Clipboard', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_CLIPBOARD"},
																{ ['Title'] = 'Marteau', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_HAMMERING"},
																{ ['Title'] = 'Mécanicien', 		Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_VEHICLE_MECHANIC"},
																{ ['Title'] = 'Soudure', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_WELDING"},
																{ ['Title'] = 'Réparer moteur', 	Function = playEmote, ['EmoteName'] = "PROP_HUMAN_BUM_BIN"},
																	}
																}
															},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU AUTRES -----------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------															
									{['Title'] = 'Autres', ['SubMenu'] = {
											['Title'] = 'Autres',
														['Items'] = {
																{ ['Title'] = 'Marteau', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_HAMMERING"},
																{ ['Title'] = 'Pêcher', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_STAND_FISHING"},
																{ ['Title'] = 'Jardiner', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_GARDENER_PLANT"},
																{ ['Title'] = 'Mécanicien', 		Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_VEHICLE_MECHANIC"},
																{ ['Title'] = 'Soudure', 			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_WELDING"},
																{ ['Title'] = 'Réparer moteur', 	Function = playEmote, ['EmoteName'] = "PROP_HUMAN_BUM_BIN"},
																{ ['Title'] = 'Marteau piqueur', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_CONST_DRILL"},
																	}
																}
															},
														}
													}
												},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU ATTITUDES --------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------												
		{['Title'] = 'Attitudes', ['SubMenu'] = {
				['Title'] = 'Attitudes',
							['Items'] = {
									{ ['Title'] = 'S\'impatienter', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_STAND_IMPATIENT"},
									{ ['Title'] = 'Regarder carte', 	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_TOURIST_MAP"},
									{ ['Title'] = 'Regarder téléphone', Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_STAND_MOBILE"},
										}
									}
								},
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- MENU AUTRES -----------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------								
		{['Title'] = 'Autres', ['SubMenu'] = {
				['Title'] = 'Autres',
							['Items'] = {	
									{ ['Title'] = 'Assis',				Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_PICNIC"},
									{ ['Title'] = 'Sur le ventre', 		Function = playEmote, ['EmoteName'] = 'WORLD_HUMAN_SUNBATHE' },
									{ ['Title'] = 'Sur le dos', 		Function = playEmote, ['EmoteName'] = 'WORLD_HUMAN_SUNBATHE_BACK' },
									{ ['Title'] = 'Paparazzi',			Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_PAPARAZZI"},
									{ ['Title'] = 'Filmer téléphone',	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
									{ ['Title'] = 'Faire un selfie',	Function = playEmote, ['EmoteName'] = "WORLD_HUMAN_TOURIST_MOBILE"},
										}
									}
								}
							}
						}

	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- Création du menu ------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Menu.backgroundColor = { 241, 241, 241, 255 }
Menu.backgroundColorActive = { 208, 208, 208, 255 }
Menu.tileTextColor = { 241, 241, 241, 255 }
Menu.tileBackgroundColor = { 80,107,230, 255 }
Menu.textColor = { 58,58,58,255 }
Menu.textColorActive = { 58,58,58, 255 }

Menu.keyOpenMenu = 170 -- F3    
Menu.keyUp = 172 -- PhoneUp
Menu.keyDown = 173 -- PhoneDown
Menu.keyLeft = 174 -- PhoneLeft || Not use next release Maybe 
Menu.keyRight =	175 -- PhoneRigth || Not use next release Maybe 
Menu.keySelect = 176 -- PhoneSelect
Menu.KeyCancel = 177 -- PhoneCancel

Menu.posX = 0.05
Menu.posY = 0.05

Menu.ItemWidth = 0.20
Menu.ItemHeight = 0.03

Menu.isOpen = false   -- /!\ Ne pas toucher
Menu.currentPos = {1} -- /!\ Ne pas toucher

	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------- Menu System ------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Menu.drawRect(posX, posY, width, heigh, color)
    DrawRect(posX + width / 2, posY + heigh / 2, width, heigh, color[1], color[2], color[3], color[4])
end

function Menu.initText(textColor, font, scale)
    font = font or 0
    scale = scale or 0.35
    SetTextFont(font)
    SetTextScale(0.0,scale)
    SetTextCentre(true)
    SetTextDropShadow(0, 0, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 0)
    SetTextColour(textColor[1], textColor[2], textColor[3], textColor[4])
    SetTextEntry("STRING")
end

function Menu.draw() 
    -- Draw Rect
    local pos = 0
    local menu = Menu.getCurrentMenu()
    local selectValue = Menu.currentPos[#Menu.currentPos]
    local nbItem = #menu.Items
    -- draw background title & title
    Menu.drawRect(Menu.posX, Menu.posY , Menu.ItemWidth, Menu.ItemHeight * 2, Menu.tileBackgroundColor)    
    Menu.initText(Menu.tileTextColor, 4, 0.7)
    AddTextComponentString(menu.Title)
    DrawText(Menu.posX + Menu.ItemWidth/2, Menu.posY)

    -- draw bakcground items
    Menu.drawRect(Menu.posX, Menu.posY + Menu.ItemHeight * 2, Menu.ItemWidth, Menu.ItemHeight + (nbItem-1)*Menu.ItemHeight, Menu.backgroundColor)
    -- draw all items
    for pos, value in pairs(menu.Items) do
        if pos == selectValue then
            Menu.drawRect(Menu.posX, Menu.posY + Menu.ItemHeight * (1+pos), Menu.ItemWidth, Menu.ItemHeight, Menu.backgroundColorActive)
            Menu.initText(Menu.textColorActive)
        else
            Menu.initText(Menu.textColor)
        end
        AddTextComponentString(value.Title)
        DrawText(Menu.posX + Menu.ItemWidth/2, Menu.posY + Menu.ItemHeight * (pos+1))
    end
    
end

function Menu.getCurrentMenu()
    local currentMenu = Menu.item
    for i=1, #Menu.currentPos - 1 do
        local val = Menu.currentPos[i]
        currentMenu = currentMenu.Items[val].SubMenu
    end
    return currentMenu
end

function Menu.initMenu()
    Menu.currentPos = {1}
end

function Menu.keyControl()
    if IsControlJustPressed(1, Menu.keyDown) then 
        local cMenu = Menu.getCurrentMenu()
        local size = #cMenu.Items
        local slcp = #Menu.currentPos
        Menu.currentPos[slcp] = (Menu.currentPos[slcp] % size) + 1

    elseif IsControlJustPressed(1, Menu.keyUp) then 
        local cMenu = Menu.getCurrentMenu()
        local size = #cMenu.Items
        local slcp = #Menu.currentPos
        Menu.currentPos[slcp] = ((Menu.currentPos[slcp] - 2 + size) % size) + 1

    elseif IsControlJustPressed(1, Menu.KeyCancel) then 
        table.remove(Menu.currentPos)
        if #Menu.currentPos == 0 then
            Menu.isOpen = false 
        end

    elseif IsControlJustPressed(1, Menu.keySelect)  then
        local cSelect = Menu.currentPos[#Menu.currentPos]
        local cMenu = Menu.getCurrentMenu()
        if cMenu.Items[cSelect].SubMenu ~= nil then
            Menu.currentPos[#Menu.currentPos + 1] = 1
        else
            if cMenu.Items[cSelect].Function ~= nil then
                cMenu.Items[cSelect].Function(cMenu.Items[cSelect])
            end
            if cMenu.Items[cSelect].Event ~= nil then
                TriggerEvent(cMenu.Items[cSelect].Event, cMenu.Items[cSelect])
            end
        end
    end

end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        if IsControlJustPressed(1, Menu.keyOpenMenu) then
            Menu.initMenu()
            Menu.isOpen = not Menu.isOpen
        end
        if Menu.isOpen then
            Menu.draw()
            Menu.keyControl()
        end
	end
end)
