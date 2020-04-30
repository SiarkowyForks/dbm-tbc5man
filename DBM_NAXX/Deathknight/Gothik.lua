DBM.AddOns.Gothik = {
	["Name"] = DBM_GOTH_NAME,
	["Abbreviation1"] = "Gothik",
	["Abbreviation2"] = "gth",	
	["Version"] = "1.0",
	["Author"] = "Tandanu",
	["Description"] = DBM_GOTH_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 22,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
	},
	["InCombat"] = false,
	["Wave"] = 0,
	["Events"] = {
		["CHAT_MSG_MONSTER_YELL"] = true,
		["UNIT_DIED"] = true,
	},
	["TellMages"] = function()	-- DBM.AddOns.Gothik.TellMages
		for i=1, GetNumRaidMembers(), 1 do
			if( UnitClass("raid"..i) == DBM_MAGE ) then
				DBM.SendHiddenWhisper("Sheep Wave", UnitName("raid"..i));
			end
		end
	end,
	["OnEvent"] = function(event, arg1)
		if event == "CHAT_MSG_MONSTER_YELL" then
			if arg1 == DBM_GOTH_YELL_START1 then
				DBM.AddOns.Gothik.InCombat = true;
				DBM.StartStatusBarTimer(270, "Phase 2");
				DBM.Schedule(90, "DBM.AddOns.Gothik.OnEvent", "GothikIncWarning", 180);
				DBM.Schedule(150, "DBM.AddOns.Gothik.OnEvent", "GothikIncWarning", 120);
				DBM.Schedule(210, "DBM.AddOns.Gothik.OnEvent", "GothikIncWarning", 60);
				DBM.Schedule(240, "DBM.AddOns.Gothik.OnEvent", "GothikIncWarning", 30);
				DBM.Schedule(260, "DBM.AddOns.Gothik.OnEvent", "GothikIncWarning", 10);
				DBM.Schedule(270, "DBM.AddOns.Gothik.OnEvent", "GothikIncWarning", 0);
				DBM.Schedule(27, "DBM.AddOns.Gothik.OnEvent", "TraineeWarning", 0);
				DBM.Schedule(77, "DBM.AddOns.Gothik.OnEvent", "KnightWarning", 0);
				DBM.Schedule(137, "DBM.AddOns.Gothik.OnEvent", "RiderWarning", 0);
				
				DBM.Schedule(27 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 1);
				DBM.Schedule(47 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 2);
				DBM.Schedule(67 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 3);
				DBM.Schedule(77 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 4);
				DBM.Schedule(87 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 5);
				DBM.Schedule(102 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 6);
				DBM.Schedule(107 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 7);
				DBM.Schedule(127 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 8);
				DBM.Schedule(137 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 9);
				DBM.Schedule(147 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 10);
				DBM.Schedule(152 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 11);
				DBM.Schedule(167 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 12);
				DBM.Schedule(177 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 13);
				DBM.Schedule(187 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 14);
				DBM.Schedule(197 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 15);
				DBM.Schedule(202 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 16);
				DBM.Schedule(207 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 17);
				DBM.Schedule(227 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 18);
--				DBM.Schedule(247 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 19);
--				DBM.Schedule(252 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 20);
--				DBM.Schedule(257 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 21);
--				DBM.Schedule(267 - 3, "DBM.AddOns.Gothik.OnEvent", "WaveIncWarning", 22);
				
				DBM.StartStatusBarTimer(137, "Rider", "Interface\\Icons\\Ability_Mount_Undeadhorse");
				DBM.StartStatusBarTimer(77, "Deathknight", "Interface\\Icons\\Spell_Shadow_RaiseDead");
				DBM.StartStatusBarTimer(27, "Trainees", "Interface\\Icons\\INV_Misc_Bell_01");
			elseif arg1 == DBM_GOTH_PHASE2_YELL then
				DBM.Announce(DBM_GOTH_PHASE2_WARNING);
			end
		elseif event == "UNIT_DIED" then
			if arg1.destName == DBM_GOTH_RIDER then
				DBM.AddOns.Gothik.InCombat = true;
				DBM.Announce(string.format(DBM_GOTH_DEAD_WARNING, DBM_GOTH_RIDER_SHORT));
			elseif arg1.destName == DBM_GOTH_KNIGHT then
				DBM.AddOns.Gothik.InCombat = true;
				DBM.Announce(string.format(DBM_GOTH_DEAD_WARNING, DBM_GOTH_KNIGHT_SHORT));
			end
		elseif event == "GothikIncWarning" then
			DBM.AddOns.Gothik.InCombat = true;
			if arg1 and arg1 >= 60 then
				DBM.Announce(string.format(DBM_GOTH_PHASE2_INC_WARNING, arg1/60, DBM_MIN));
			elseif arg1 and arg1 > 0 then
				DBM.Announce(string.format(DBM_GOTH_PHASE2_INC_WARNING, arg1, DBM_SEC));
			elseif arg1 == 0 then
				DBM.AddOns.Gothik.InCombat = false;
				DBM.UnSchedule("DBM.AddOns.Gothik.OnEvent");
				DBM.EndStatusBarTimer("Phase 2");
				DBM.EndRepeatingStatusBarTimer("Rider");
				DBM.EndRepeatingStatusBarTimer("Deathknight");
				DBM.EndRepeatingStatusBarTimer("Trainees");
			end
		elseif event == "TraineeWarning" then
			DBM.AddOns.Gothik.InCombat = true;
			if arg1 == 3 then
--				DBM.Announce(string.format(DBM_GOTH_INC_WARNING, DBM_GOTH_TRAINEE_SHORT, arg1));
--				DBM.Schedule(3, "DBM.AddOns.Gothik.OnEvent", "TraineeWarning", 0);
			elseif arg1 == 0 then
				DBM.StartRepeatingStatusBarTimer(20, "Trainees", "Interface\\Icons\\INV_Misc_Bell_01", 10, nil, nil, "Gothik");
			end
		elseif event == "KnightWarning" then
			DBM.AddOns.Gothik.InCombat = true;
			if arg1 == 3 then
--				DBM.Announce(string.format(DBM_GOTH_INC_WARNING, DBM_GOTH_KNIGHT_SHORT, arg1));
--				DBM.Schedule(3, "DBM.AddOns.Gothik.OnEvent", "KnightWarning", 0);
			elseif arg1 == 0 then
				DBM.StartRepeatingStatusBarTimer(25, "Deathknight", "Interface\\Icons\\Spell_Shadow_RaiseDead", 6, nil, nil, "Gothik");
			end
		elseif event == "RiderWarning" then
			DBM.AddOns.Gothik.InCombat = true;
			if arg1 == 3 then
--				DBM.Announce(string.format(DBM_GOTH_INC_WARNING, DBM_GOTH_RIDER_SHORT, arg1));
--				DBM.Schedule(3, "DBM.AddOns.Gothik.OnEvent", "RiderWarning", 0);
			elseif arg1 == 0 then
				DBM.StartRepeatingStatusBarTimer(30, "Rider", "Interface\\Icons\\Ability_Mount_Undeadhorse", 3, nil, nil, "Gothik");
			end
		elseif event == "WaveIncWarning" then
			DBM.AddOns.Gothik.Wave = arg1;
			if arg1 == 1 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 2 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 3 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 4 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 2, DBM_GOTH_KNIGHTS_SHORT));
			elseif arg1 == 5 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 6 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 2, DBM_GOTH_KNIGHTS_SHORT));
			elseif arg1 == 7 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 8 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING2, arg1, 2, DBM_GOTH_KNIGHTS_SHORT, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 9 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 1, DBM_GOTH_RIDER_SHORT));
				-- DBM.AddOns.Gothik.TellMages();
			elseif arg1 == 10 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 11 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 2, DBM_GOTH_KNIGHTS_SHORT));
			elseif arg1 == 12 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING2, arg1, 1, DBM_GOTH_RIDER_SHORT, 3, DBM_GOTH_TRAINEE_SHORT))
				-- DBM.AddOns.Gothik.TellMages();
			elseif arg1 == 13 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 2, DBM_GOTH_KNIGHTS_SHORT));
			elseif arg1 == 14 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 15 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 1, DBM_GOTH_RIDER_SHORT));
			elseif arg1 == 16 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 2, DBM_GOTH_KNIGHTS_SHORT));
			elseif arg1 == 17 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 18 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING3, arg1, 1, DBM_GOTH_RIDER_SHORT, 2, DBM_GOTH_KNIGHTS_SHORT, 3, DBM_GOTH_TRAINEE_SHORT));
--[[		elseif arg1 == 19 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT));
			elseif arg1 == 20 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 2, DBM_GOTH_KNIGHTS_SHORT));
			elseif arg1 == 21 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 1, DBM_GOTH_RIDER_SHORT));
			elseif arg1 == 22 then
				DBM.Announce(string.format(DBM_GOTH_WAVE_INC_WARNING1, arg1, 3, DBM_GOTH_TRAINEE_SHORT)); ]]
			end
		end
	end,
};
