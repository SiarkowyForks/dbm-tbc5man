-- v1.4 add enrage warning (Diablohu)

DBM.AddOns.Gluth = {
	["Name"] = DBM_GLUTH_NAME,
	["Abbreviation1"] = "Glu",
	["Version"] = "1.4",
	["Author"] = "Tandanu + Diablohu",
	["Description"] = DBM_GLUTH_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 43,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["Frenzy"] = true,
	},
	["Decimated"] = false,
	["Fearing"] = 0,
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.Gluth.Options.Frenzy",
			["text"] = DBM_GLUTH_ANNOUNCE_FRENZY,
			["func"] = function() DBM.AddOns.Gluth.Options.Frenzy = not DBM.AddOns.Gluth.Options.Frenzy; end,
		},
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_EMOTE"] = true,
		["SPELL_CAST_SUCCESS"] = true,
		["SPELL_AURA_APPLIED"] = true,
	},		
	["OnCombatStart"] = function(delay)
		DBM.AddOns.Gluth.Decimated = false;
		DBM.Announce(DBM_GLUTH_DECIMATE_WARN1);
		DBM.Schedule(50 - delay, "DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 60);
		DBM.Schedule(90 - delay, "DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 20);				
		DBM.Schedule(105 - delay, "DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 5);
		DBM.Schedule(240 - delay, "DBM.AddOns.Gluth.OnEvent", "EnrageWarning", 120);
		DBM.Schedule(300 - delay, "DBM.AddOns.Gluth.OnEvent", "EnrageWarning", 60);
		DBM.Schedule(330 - delay, "DBM.AddOns.Gluth.OnEvent", "EnrageWarning", 30);
		DBM.EndStatusBarTimer("Decimate");
		DBM.StartStatusBarTimer(360 - delay, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");
		DBM.StartStatusBarTimer(110 - delay, "Decimate", "Interface\\Icons\\Spell_Nature_Purge");
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.Gluth.Decimated = false;
	end,
	["OnEvent"] = function(event, arg1)
		if (event == "CHAT_MSG_MONSTER_EMOTE") then
			if (arg2 == DBM_GLUTH_GLUTH) and (arg1 == DBM_GLUTH_FRENZY) then
				DBM.EndStatusBarTimer("Frenzy")
				DBM.StartStatusBarTimer(9, "Frenzy", "Interface\\Icons\\INV_Misc_MonsterClaw_03");
				if (DBM.AddOns.Gluth.Options.Frenzy) then
					DBM.Announce(DBM_GLUTH_FRENZY_ANNOUNCE);
				end
			end		

		elseif event == "SPELL_CAST_SUCCESS" then

			if (not DBM.AddOns.Gluth.Decimated) and (arg1.spellId == 28375 or arg1.spellId == 28374) then
				DBM.AddOns.Gluth.Decimated = true;
				DBM.Announce(DBM_GLUTH_DECIMATE_WARN2);
				DBM.UnSchedule("DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 5)
				DBM.Schedule(10, "DBM.AddOns.Gluth.OnEvent", "ResetDecimate");
				DBM.Schedule(50, "DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 60);
				DBM.Schedule(90, "DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 20);				
				DBM.Schedule(105, "DBM.AddOns.Gluth.OnEvent", "DecimateWarning", 5);
				DBM.EndStatusBarTimer("Decimate");
				DBM.StartStatusBarTimer(110, "Decimate", "Interface\\Icons\\Spell_Nature_Purge");
			end					

		elseif event == "SPELL_AURA_APPLIED" and arg1.spellId == 29685 then

			if (time() - DBM.AddOns.Gluth.Fearing) > 5 then
				DBM.AddOns.Gluth.Fearing = time();
				DBM.Announce(DBM_GLUTH_FEAR_WARNING);
				DBM.Schedule(15, "DBM.AddOns.Gluth.OnEvent", "FearWarning", 5);
				DBM.EndStatusBarTimer("Fear");
				DBM.StartStatusBarTimer(20, "Fear", "Interface\\Icons\\Spell_Shadow_PsychicScream");
			end	

		elseif (event == "DecimateWarning") then
			if arg1 == 60 then		DBM.Announce(DBM_GLUTH_DECIMATE_1MIN_WARNING);
			elseif arg1 == "soon" then	DBM.Announce(DBM_GLUTH_DECIMATE_SOON_WARNING);
			elseif arg1 then		DBM.Announce(string.format(DBM_GLUTH_DECIMATE_WARNING, arg1));
			end

		elseif (event == "ResetDecimate") then
			DBM.AddOns.Gluth.Decimated = false;

		elseif (event == "FearWarning") then
			DBM.Announce(DBM_GLUTH_FEAR_5SEC_WARNING);

		elseif (event == "EnrageWarning") then
			if arg1 == 120 then
				DBM.Announce(string.format(DBM_GLUTH_ENRAGE_ANNOUNCE, 2, DBM_MINUTES));
			elseif arg1 == 60 then
				DBM.Announce(string.format(DBM_GLUTH_ENRAGE_ANNOUNCE, 1, DBM_MINUTE));
			elseif arg1 == 30 then
				DBM.Announce(string.format(DBM_GLUTH_ENRAGE_ANNOUNCE, 30, DBM_SECONDS));
			end
		end
	end,
};
