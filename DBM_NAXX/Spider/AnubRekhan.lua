--La Vendetta Anub'Rekhan Raid Warning AddOn

DBM.AddOns.AnubRekhan = {
	["Name"] = DBM_AR_NAME,
	["Abbreviation1"] = "Anub",
	["Abbreviation2"] = "ar",
	["Abbreviation3"] = "AnubRekhan",
	["Version"] = "1.8",
	["Author"] = "Tandanu",
	["Description"] = DBM_AR_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 11,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_YELL"] = true,
		["SPELL_AURA_APPLIED"] = true,
		["SPELL_CAST_START"] = true,
	},	
	["OnEvent"] = function(event, arg1)
		if (event == "CHAT_MSG_MONSTER_YELL") then
			if (arg1 == DBM_AR_YELL_1) or (arg1 == DBM_AR_YELL_2) or (arg1 == DBM_AR_YELL_3) then
				DBM.Announce(string.format(DBM_AR_LOCUST_WARNING, 90));
				DBM.StartStatusBarTimer(90, "Locust Swarm", "Interface\\Icons\\Spell_Nature_InsectSwarm");
				DBM.Schedule(30, "DBM.AddOns.AnubRekhan.OnEvent", "LocustWarning", 60);
				DBM.Schedule(60, "DBM.AddOns.AnubRekhan.OnEvent", "LocustWarning", 30);
				DBM.Schedule(80, "DBM.AddOns.AnubRekhan.OnEvent", "LocustWarning", 10);
			end
		elseif (event == "SPELL_CAST_START") then
			if (arg1.spellId == 28785) then
				DBM.Announce(DBM_AR_LOCUST_INC_WARNING);
				DBM.EndStatusBarTimer("Locust Swarm");
				DBM.StartStatusBarTimer(3, "Locust Swarm Cast", "Interface\\Icons\\Spell_Nature_InsectSwarm");
				DBM.Schedule(23, "DBM.AddOns.AnubRekhan.OnEvent", "StartNewLocustTimer");
				DBM.Schedule(3, "DBM.AddOns.AnubRekhan.OnEvent", "SPELL_AURA_APPLIED", {spellId = 28785});
			end
		elseif (event == "SPELL_AURA_APPLIED") then
			if (arg1.spellId == 28785) and not DBM.GetScheduleTimeLeft("DBM.AddOns.AnubRekhan.OnEvent", "LocustEndWarning", 3) then
				DBM.Schedule(10, "DBM.AddOns.AnubRekhan.OnEvent", "LocustEndWarning", 10);
				DBM.Schedule(17, "DBM.AddOns.AnubRekhan.OnEvent", "LocustEndWarning", 3);
				DBM.Announce(DBM_AR_GAIN_LOCUST_WARNING);
				DBM.EndStatusBarTimer("Locust Swarm Cast", true);
				DBM.StartStatusBarTimer(20, "Locust Swarm", "Interface\\Icons\\Spell_Nature_InsectSwarm");
			end
		elseif (event == "LocustWarning") then
			if arg1 and arg1 ~= 10 then
				DBM.Announce(string.format(DBM_AR_LOCUST_WARNING, arg1));
			else
				DBM.Announce(DBM_AR_LOCUST_SOON_WARNING);
			end
		elseif (event == "LocustEndWarning") then
			if arg1 then
				DBM.Announce(string.format(DBM_AR_LOCUST_END_WARNING, arg1));		
			end
		elseif (event == "StartNewLocustTimer") then
			DBM.Announce(string.format(DBM_AR_LOCUST_WARNING, 60));
			DBM.EndStatusBarTimer("Locust Swarm");
			DBM.StartStatusBarTimer(62, "Locust Swarm", "Interface\\Icons\\Spell_Nature_InsectSwarm");
			DBM.Schedule(32, "DBM.AddOns.AnubRekhan.OnEvent", "LocustWarning", 30);
			DBM.Schedule(52, "DBM.AddOns.AnubRekhan.OnEvent", "LocustWarning", 10);
		end	
	end,
};
