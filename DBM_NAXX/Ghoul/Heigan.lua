DBM.AddOns.Heigan = {
	["Name"] = DBM_HTU_NAME,
	["Abbreviation1"] = "Heigan",
	["Abbreviation2"] = "htu",
	["Version"] = "1.1",
	["Author"] = "Tandanu",
	["Description"] = DBM_HTU_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["MinVersionToSync"] = 2.2, --this version does not sync anything, but we don't want to sync timers, because we already sync the combat start
	["Sort"] = 32,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
	},
	["InCombat"] = false,
	["Events"] = {
	},
	["OnCombatStart"] = function(delay)
		DBM.AddOns.Heigan.OnEvent("TeleportBackWarning", 0);
		DBM.AddOns.Heigan.InCombat = true;
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.Heigan.InCombat = false;
	end,
	["OnEvent"] = function(event, arg1)
		if event == "TeleportWarning" then
			if arg1 and arg1 > 0 then
				DBM.Announce(string.format(DBM_HTU_TELEPORT_WARNING, arg1));
			elseif arg1 == 0 then
				DBM.Announce(string.format(DBM_HTU_TELEPORT_BACK_WARNING, 45));
				DBM.Schedule(20, "DBM.AddOns.Heigan.OnEvent", "TeleportBackWarning", 25);
				DBM.Schedule(35, "DBM.AddOns.Heigan.OnEvent", "TeleportBackWarning", 10);
				DBM.Schedule(45, "DBM.AddOns.Heigan.OnEvent", "TeleportBackWarning", 0);
				DBM.EndStatusBarTimer("Teleport Back", true);
				DBM.StartStatusBarTimer(45, "Teleport Back", "Interface\\Icons\\Spell_Arcane_Blink", true);
			end
		elseif event == "TeleportBackWarning" then
			if arg1 and arg1 > 0 then
				DBM.Announce(string.format(DBM_HTU_TELEPORT_BACK_WARNING, arg1));
			elseif arg1 == 0 then
				DBM.Announce(string.format(DBM_HTU_TELEPORT_WARNING, 90));
				DBM.Schedule(30, "DBM.AddOns.Heigan.OnEvent", "TeleportWarning", 60);
				DBM.Schedule(60, "DBM.AddOns.Heigan.OnEvent", "TeleportWarning", 30);
				DBM.Schedule(80, "DBM.AddOns.Heigan.OnEvent", "TeleportWarning", 10);
				DBM.Schedule(90, "DBM.AddOns.Heigan.OnEvent", "TeleportWarning", 0);
				DBM.EndStatusBarTimer("Teleport", true);
				DBM.StartStatusBarTimer(90, "Teleport", "Interface\\Icons\\Spell_Arcane_Blink", true);
			end
		end
	end,
};
