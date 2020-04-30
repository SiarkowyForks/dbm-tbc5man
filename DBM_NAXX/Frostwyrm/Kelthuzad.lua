--
--  Kel'Thuzad - v1.0 by Nitram
-- v1.1 add cooldown timers for some abilities (Diablohu)
--

DBM.AddOns.Kelthuzad = {
	["Name"] = DBM_KELTHUZAD_NAME,
	["Abbreviation1"] = "kel",
	["Version"] = "1.1",
	["Author"] = "Nitram + Diablohu",
	["Description"] = DBM_KELTHUZAD_INFO,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 52,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["Whisper"] = false,
		["SetIcon"] = true,
		["RangeCheck"] = true,
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_EMOTE"] = true,				-- MindControlSoon (Laugh)
		["CHAT_MSG_MONSTER_YELL"] = true,				-- Many
		["SPELL_CAST_SUCCESS"] = true,			-- Fissure
		["SPELL_AURA_APPLIED"] = true,			-- Frostblast / Detonate
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.Kelthuzad.Options.Whisper",
			["text"] = DBM_SEND_WHISPER,
			["func"] = function() DBM.AddOns.Kelthuzad.Options.Whisper = not DBM.AddOns.Kelthuzad.Options.Whisper; end,
		},
		[2] = {
			["variable"] = "DBM.AddOns.Kelthuzad.Options.SetIcon",
			["text"] = DBM_SET_ICON,
			["func"] = function() DBM.AddOns.Kelthuzad.Options.SetIcon = not DBM.AddOns.Kelthuzad.Options.SetIcon; end,
		},
		[3] = {
			["variable"] = "DBM.AddOns.Kelthuzad.Options.RangeCheck",
			["text"] = DBM_KELTHUZAD_RANGECHECK,
			["func"] = function() DBM.AddOns.Kelthuzad.Options.RangeCheck = not DBM.AddOns.Kelthuzad.Options.RangeCheck; end,
		},
	},
	["InCombat"] = false,
	["IsRangeShown"] = false,
	["InMindControl"] = false,
	["LastMindControl"] = 0,
	["LastFrostBlast"] = 0,
	["OnCombatStart"] = function()
		if (DBM.AddOns.Kelthuzad.Options.RangeCheck and DBMDistanceFrame and DBMDistanceFrame:GetObject():IsShown()) then
			DBM.AddOns.Kelthuzad.Options.IsRangeShown = true;
		else
			DBM.AddOns.Kelthuzad.Options.IsRangeShown = false;
		end
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.Kelthuzad.InCombat = false;
		if (DBM.AddOns.Kelthuzad.Options.RangeCheck and not DBM.AddOns.Kelthuzad.Options.IsRangeShown) then
			DBM_Gui_DistanceFrame_Hide();
		end
	end,
	["OnEvent"] = function(event, arg1)
		if (event == "CHAT_MSG_MONSTER_YELL" and arg1 == DBM_KELTHUZAD_PHASE1_EXPR) then		-- Phase 1 Start
			DBM.AddOns.Kelthuzad.InCombat = true;
			DBM.Announce( DBM_KELTHUZAD_PHASE1_ANNOUNCE );
			DBM.StartStatusBarTimer(320, "Phase 2");

		elseif (event == "CHAT_MSG_MONSTER_YELL" and (arg1 == DBM_KELTHUZAD_PHASE2_EXPR1 or arg1 == DBM_KELTHUZAD_PHASE2_EXPR2 or arg1 == DBM_KELTHUZAD_PHASE2_EXPR3)) then		-- Phase 2 Start
			if (DBM.AddOns.Kelthuzad.Options.RangeCheck) then
				DBM_Gui_DistanceFrame_Show();
			end
			DBM.Announce( DBM_KELTHUZAD_PHASE2_ANNOUNCE );
			DBM.EndStatusBarTimer("Phase 2");
			DBM.StartStatusBarTimer(20, "Kel'Thuzad incoming");

		elseif (event == "CHAT_MSG_MONSTER_YELL" and arg1 == DBM_KELTHUZAD_PHASE3_EXPR) then		-- Phase 3 Start
			DBM.Announce( DBM_KELTHUZAD_PHASE3_ANNOUNCE );
			DBM.StartStatusBarTimer(15, "Guardians incoming");

		elseif (event == "CHAT_MSG_MONSTER_YELL" 
		   and (arg1 == DBM_KELTHUZAD_MC_EXPR1 or arg1 == DBM_KELTHUZAD_MC_EXPR2)
		   and (time() - DBM.AddOns.Kelthuzad.LastMindControl) > 2 ) then				-- Mind Control
			DBM.AddOns.Kelthuzad.InMindControl = true;
		   	DBM.AddOns.Kelthuzad.LastMindControl = time();
			DBM.Announce( DBM_KELTHUZAD_MC_ANNOUNCE );
			DBM.Schedule(68, "DBM.AddOns.Kelthuzad.OnEvent", "MindControlCD");
			DBM.StartStatusBarTimer(21, "Mindcontrol", "Interface\\Icons\\Spell_Shadow_ShadowWordDominate");
			DBM.StartStatusBarTimer(68, "Mindcontrol CD", "Interface\\Icons\\Spell_Shadow_ShadowWordDominate");

		elseif (event == "CHAT_MSG_MONSTER_EMOTE"
		   and arg1 == DBM_KELTHUZAD_MC_EXPR3
		   and not DBM.AddOns.Kelthuzad.InMindControl) then	-- Mind Control
			DBM.Announce( DBM_KELTHUZAD_MC_SOON );
			
		elseif (event == "SPELL_CAST_SUCCESS" 
		    and arg1.spellId == 27810 ) then						-- Fissure Warning
		    DBM.Announce( DBM_KELTHUZAD_FISSURE_ANNOUNCE );
			
		elseif (event == "SPELL_AURA_APPLIED") then					-- Frostblast // Detonate
				
			if ((time() - DBM.AddOns.Kelthuzad.LastFrostBlast > 2) 
			 and arg1.spellId == 27808) then
			   	DBM.AddOns.Kelthuzad.LastFrostBlast = time();
				DBM.Announce( DBM_KELTHUZAD_FROSTBLAST_ANNOUNCE );
				DBM.Schedule(30, "DBM.AddOns.Kelthuzad.OnEvent", "FrostBlastSoon");
				DBM.StartStatusBarTimer(30, "Frost Blast CD", "Interface\\Icons\\Spell_Frost_FreezingBreath");
			end
				
			if arg1.spellId == 27819 then
				local sArg1 = tostring(arg1.destName)
					if sArg1 == UnitName("player") then
						DBM.AddSpecialWarning(DBM_KELTHUZAD_DETONATE_SELFWARN);
						DBM.StartStatusBarTimer(5, "Detonate Mana", "Interface\\Icons\\Spell_Nature_WispSplode", true);
						
					elseif( DBM.AddOns.Kelthuzad.Options.Whisper ) then
						DBM.SendHiddenWhisper(DBM_KELTHUZAD_DETONATE_WHISPER, sArg1);
					end
						
					if( DBM.AddOns.Kelthuzad.Options.SetIcon ) then
						DBM.SetIconByName(sArg1, 8);
						DBM.Schedule(5, "DBM.AddOns.Kelthuzad.OnEvent", "cleanicon", sArg1)
					end
				DBM.Announce( string.format(DBM_KELTHUZAD_DETONATE_ANNOUNCE, sArg1) );
			end
			
		elseif (event == "FrostBlastSoon") then
			DBM.Announce( DBM_KELTHUZAD_FROSTBLAST_SOON );
			
		elseif (event == "MindControlCD") then
			DBM.Announce( DBM_KELTHUZAD_MC_CD );
			DBM.AddOns.Kelthuzad.InMindControl = false;
			
		elseif (event == "cleanicon" and arg1) then
			DBM.ClearIconByName(arg1);
		end
	end,
}


