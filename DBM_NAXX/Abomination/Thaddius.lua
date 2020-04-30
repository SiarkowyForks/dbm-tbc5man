--
-- Thaddius v1.0 by Tandanu
-- v1.1 modded by Nitram with:  'Phase 1' Start Detection
-- 				'Power Surge' Warning for Stalagg
-- 				'MT Throw' Warning
--
-- v1.2 by Diablohu: new infoframe for HP of bosses in phase 1

DBM.AddOns.Thaddius = {
	["Name"] = DBM_THADDIUS_NAME,
	["Abbreviation1"] = "thad",
	["Abbreviation2"] = "thadd",
	["Version"] = "1.2",
	["Author"] = "Tandanu + Diablohu",
	["Description"] = DBM_THADDIUS_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 44,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["PowerSurge"] = true,
		["WarnWhenNotChanged"] = false,
		["AltStrat"] = false,
		["ReduceLogRange"] = false,
		["AltStratInverted"] = false,
		["InfoFrame"] = true,
	},
	["oldCharge"] = "",
	["InCombat"] = false,
	["Phase"] = 0,
	["LastPol"] = 0,
	["TeslaCoil"] = false,
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.Thaddius.Options.PowerSurge",
			["text"] = DBM_THADDIUS_WARN_POWERSURGE,
			["func"] = function() DBM.AddOns.Thaddius.Options.PowerSurge = not DBM.AddOns.Thaddius.Options.PowerSurge; end,
		},
		[2] = {
			["variable"] = "DBM.AddOns.Thaddius.Options.WarnWhenNotChanged",
			["text"] = DBM_THADDIUS_WARN_NOT_CHANGED,
			["func"] = function() DBM.AddOns.Thaddius.Options.WarnWhenNotChanged = not DBM.AddOns.Thaddius.Options.WarnWhenNotChanged; end,
		},
		[3] = {
			["variable"] = "DBM.AddOns.Thaddius.Options.AltStrat",
			["text"] = DBM_THADDIUS_ALT_STRATEGY,
			["func"] = function() DBM.AddOns.Thaddius.Options.AltStrat = not DBM.AddOns.Thaddius.Options.AltStrat; end,
		},
		[4] = {
			["variable"] = "DBM.AddOns.Thaddius.Options.ReduceLogRange",
			["text"] = DBM_THADDIUS_FIX_LAG,
			["func"] = function() DBM.AddOns.Thaddius.Options.ReduceLogRange = not DBM.AddOns.Thaddius.Options.ReduceLogRange; end,
		},
		[5] = {
			["variable"] = "DBM.AddOns.Thaddius.Options.InfoFrame",
			["text"] = DBM_THADDIUS_INFOFRAME_INFO,
			["func"] = function() DBM.AddOns.Thaddius.Options.InfoFrame = not DBM.AddOns.Thaddius.Options.InfoFrame; end,
		},	
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_YELL"] = true,
		["CHAT_MSG_MONSTER_EMOTE"] = true,
		["SPELL_CAST_START"] = true,
		["PLAYER_AURAS_CHANGED"] = true,
		["SPELL_AURA_APPLIED"] = true,		-- Power Surge
	},
	["SlashCmdHelpText"] = {
		[1] = "/Thaddius invert - inverts the left/right messages when using the alternative strategy",
	},
	["OnSlashCommand"] = function(msg)
		if string.lower(msg) == "invert" then
			DBM.AddOns.Thaddius.Options.AltStratInverted = not DBM.AddOns.Thaddius.Options.AltStratInverted;
			if DBM.AddOns.Thaddius.Options.AltStratInverted then
				DBM.AddMsg(string.format(DBM_THADDIUS_ALT_STRAT_STAT1, DBM_LEFT));
				DBM.AddMsg(string.format(DBM_THADDIUS_ALT_STRAT_STAT2, DBM_RIGHT));
			else
				DBM.AddMsg(string.format(DBM_THADDIUS_ALT_STRAT_STAT1, DBM_RIGHT));
				DBM.AddMsg(string.format(DBM_THADDIUS_ALT_STRAT_STAT2, DBM_LEFT));
			end
			return true;
		end		
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.Thaddius.Phase = 0;
		DBM.AddOns.Thaddius.oldCharge = "";
		DBM.EndRepeatingStatusBarTimer("MT throw");

		if DBM.AddOns.Thaddius.Options.ReduceLogRange and DBM.SetCombatLogDistance then
			DBM.SetCombatLogDistance( DBM.Options.Gui.CombatLogValue );
		end

		DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG]	= 100;
		DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN]	= 100;

		if DBM.AddOns.Thaddius.Options.InfoFrame then
			DBM.AddOns.Thaddius.CreateInfoFrame(false);
		end
	end,
	["OnCombatStart"] = function(delay)
		DBM.Announce(DBM_THADDIUS_PHASE1_ANNOUNCE);
		DBM.AddOns.Thaddius.Phase = 1;
		DBM.StartStatusBarTimer(21.5, "MT throw", "Interface\\Icons\\Spell_Magic_FeatherFall");
		DBM.Schedule(21.5 - 5 - delay, "DBM.AddOns.Thaddius.OnEvent", "NextThrow", 5);
		DBM.Schedule(21.5 - delay, "DBM.AddOns.Thaddius.OnEvent", "NextThrow", 0);
		DBM.Schedule(21.5 - delay, "DBM.AddOns.Thaddius.OnEvent", "StartThrowLoop");
		if DBM.AddOns.Thaddius.Options.InfoFrame then
			DBM.AddOns.Thaddius.CreateInfoFrame(true);
		end
	end,
	[DBM_THADDIUS_STALAGG] = 100,
	[DBM_THADDIUS_FEUGEN] = 100,
	["OnEvent"] = function(event, arg1)		
		if (event == "NextThrow") then
			if DBM.AddOns.Thaddius.Phase == 1 then
				if arg1 and arg1 ~= 0 then
					DBM.Announce(string.format(DBM_THADDIUS_THROW_ANNOUNCE_SOON, arg1));
				else
					DBM.Announce(DBM_THADDIUS_THROW_ANNOUNCE);				
					DBM.Schedule(20.6 - 5, "DBM.AddOns.Thaddius.OnEvent", "NextThrow", 5);
					DBM.Schedule(20.6, "DBM.AddOns.Thaddius.OnEvent", "NextThrow", 0);
				end
			else
				DBM.EndRepeatingStatusBarTimer("MT throw");
			end
		elseif (event == "StartThrowLoop") then
			DBM.StartRepeatingStatusBarTimer(20.6, "MT throw");
		elseif (event == "CHAT_MSG_MONSTER_EMOTE" and string.find(arg1, DBM_THADDIUS_PLATFORM_EXPR) ) then
			DBM.Announce(DBM_THADDIUS_PLATFORM_ANNOUNCE);

		elseif (event == "SPELL_AURA_APPLIED" 
		     and arg1.spellId == 28134
		     and DBM.AddOns.Thaddius.Options.PowerSurge ) then
			DBM.Announce(DBM_THADDIUS_SURGE_ANNOUNCE);
			DBM.StartStatusBarTimer(10, "Power Surge", "Interface\\Icons\\Spell_Shadow_SpectralSight");

		elseif (event == "CHAT_MSG_MONSTER_YELL") then
			if (arg1 == DBM_THADDIUS_YELL_START1) or (arg1 == DBM_THADDIUS_YELL_START2) or (arg1 == DBM_THADDIUS_YELL_START3) then
				DBM.AddOns.Thaddius.TeslaCoil = false;
				DBM.AddOns.Thaddius.Phase = 2;
				
				if DBM.AddOns.Thaddius.Options.ReduceLogRange and DBM.SetCombatLogDistance then
					DBM.SetCombatLogDistance(4);
				end

				DBM.EndRepeatingStatusBarTimer("MT throw");
				DBM.Announce(string.format(DBM_THADDIUS_ENRAGE_WARNING, 5, DBM_MINUTES));
				DBM.Schedule(120, "DBM.AddOns.Thaddius.OnEvent", "EnrageWarning", 180);
				DBM.Schedule(180, "DBM.AddOns.Thaddius.OnEvent", "EnrageWarning", 120);
				DBM.Schedule(240, "DBM.AddOns.Thaddius.OnEvent", "EnrageWarning", 60);
				DBM.Schedule(270, "DBM.AddOns.Thaddius.OnEvent", "EnrageWarning", 30);
				DBM.Schedule(290, "DBM.AddOns.Thaddius.OnEvent", "EnrageWarning", 10);
				DBM.StartStatusBarTimer(300, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");

			elseif (arg1 == DBM_THADDIUS_YELL_POL) then
				
				DBM.AddOns.Thaddius.Phase = 2;
				DBM.EndRepeatingStatusBarTimer("MT throw");
				
				DBM.Announce(DBM_THADDIUS_POL_SHIFT);
				DBM.EndStatusBarTimer("Polarity Shift");
				DBM.StartStatusBarTimer(30, "Polarity Shift", "Interface\\Icons\\Spell_Nature_Lightning");
			end
		elseif (event == "CHAT_MSG_MONSTER_EMOTE") then
			if arg1 == DBM_THADDIUS_TESLA_EMOTE and not DBM.AddOns.Thaddius.TeslaCoil then --and arg2 == DBM_THADDIUS_TESLA_COIL then
				DBM.AddOns.Thaddius.Phase = 2;
				DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG]	= 100;
				DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN]	= 100;
				if DBM.AddOns.Thaddius.Options.InfoFrame then
					DBM.AddOns.Thaddius.CreateInfoFrame(false);
				end
				DBM.EndRepeatingStatusBarTimer("MT throw");
				DBM.AddOns.Thaddius.TeslaCoil = true;
				DBM.Announce(DBM_THADDIUS_PHASE_2_SOON);
				DBM.StartStatusBarTimer(4.3, "Phase 2");
			end
		elseif (event == "SPELL_CAST_START") then
			if arg1.spellId == 28089 then
				DBM.AddOns.Thaddius.Phase = 2;
				DBM.EndRepeatingStatusBarTimer("MT throw");
				
				DBM.Announce(string.format(DBM_THADDIUS_POL_WARNING, 3));
				DBM.EndStatusBarTimer("Polarity Shift");
				DBM.StartStatusBarTimer(3, "Polarity Shift cast", "Interface\\Icons\\Spell_Nature_Lightning");
			end                                             
		elseif (event == "PLAYER_AURAS_CHANGED") and GetTime() > (DBM.AddOns.Thaddius.LastPol + 26) then
			local charge, i;
			charge = "";
			i = 1;
			while UnitDebuff("player", i) do
				local texture, stacks;
				texture, stacks = UnitDebuff("player", i)
				if texture == "Interface\\Icons\\Spell_ChargeNegative" then
					if stacks > 1 then
						return; 
					end					
					charge = DBM_THADDIUS_NEGATIVE;
				elseif texture == "Interface\\Icons\\Spell_ChargePositive" then
					if stacks > 1 then
						return; 
					end					
					charge = DBM_THADDIUS_POSITIVE;
				end
				i = i + 1;
			end
			if charge == "" then
				return;
			end
			
			DBM.AddOns.Thaddius.Phase = 2;
			DBM.EndRepeatingStatusBarTimer("MT throw");
			
			DBM.AddOns.Thaddius.LastPol = GetTime();
			if DBM.AddOns.Thaddius.Options.AltStrat then
				if charge ~= DBM.AddOns.Thaddius.oldCharge then
					if DBM.AddOns.Thaddius.Options.AltStratInverted then
						DBM.AddSpecialWarning(DBM_THADDIUS_LEFT, true, true);
					else
						DBM.AddSpecialWarning(DBM_THADDIUS_RIGHT, true, true);
					end
				else
					if DBM.AddOns.Thaddius.Options.AltStratInverted then
						DBM.AddSpecialWarning(DBM_THADDIUS_RIGHT, true, true);
					else
						DBM.AddSpecialWarning(DBM_THADDIUS_LEFT, true, true);
					end
				end
				DBM.AddOns.Thaddius.oldCharge = charge;
			else
				if charge ~= DBM.AddOns.Thaddius.oldCharge then
					DBM.AddSpecialWarning(string.format(DBM_THADDIUS_CHARGE_CHANGED, charge), true, true);
				elseif DBM.AddOns.Thaddius.Options.WarnWhenNotChanged then
					DBM.AddSpecialWarning(DBM_THADDIUS_CHARGE_NOT_CHANGED, true, true);
				end
				DBM.AddOns.Thaddius.oldCharge = charge;				
			end
		elseif (event == "EnrageWarning") then
			if arg1 == 180 then
				DBM.Announce(string.format(DBM_THADDIUS_ENRAGE_WARNING, 3, DBM_MINUTES));
			elseif arg1 == 120 then
				DBM.Announce(string.format(DBM_THADDIUS_ENRAGE_WARNING, 2, DBM_MINUTES));
			elseif arg1 == 60 then
				DBM.Announce(string.format(DBM_THADDIUS_ENRAGE_WARNING, 1, DBM_MINUTE));
			elseif arg1 == 30 then
				DBM.Announce(string.format(DBM_THADDIUS_ENRAGE_WARNING, 30, DBM_SECONDS));
			elseif arg1 == 10 then
				DBM.Announce(string.format(DBM_THADDIUS_ENRAGE_WARNING, 10, DBM_SECONDS));
			end
		end
	end,
	["OnUpdate"] = function(elapsed)
		for i = 1, GetNumRaidMembers() do
			if UnitName("raid"..i.."target") == DBM_THADDIUS_STALAGG then
				DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG] = UnitHealth("raid"..i.."target");

			elseif UnitName("raid"..i.."target") == DBM_THADDIUS_FEUGEN then
				DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN] = UnitHealth("raid"..i.."target");
			end
		end
	end,
	["CreateInfoFrame"] = function(xshow)
		if not DBMGui then return; end

		if DBMThaddiusFrame then		-- no need to create a new Frame
			if (xshow == false) then -- or (DBMThaddiusFrame:GetObject():IsShown() and not xshow)) then
				DBMThaddiusFrame:Hide();
			elseif (xshow == true) then -- or (DBMThaddiusFrame:GetObject():IsShown() and xshow)) then
				DBMThaddiusFrame:Show();
			end
			return;
		elseif xshow == false then --we don't want to create a frame if we call this function to hide a info frame that does not exist
			return;
		end
		
		DBMThaddiusFrame = DBMGui:CreateInfoFrame(DBM_THADDIUS_INFOFRAME_TITLE, DBM_THADDIUS_INFOFRAME_TEXT);
		if( not DBMThaddiusFrame ) then 
			DBM.AddMsg("Can't get frame from CreateInfoFrame()");
			return false; 
		end
		DBMThaddiusFrame:GetObject():SetScript("OnUpdate", function() 
						DBM_InfoFrameTemplate_OnUpdate(this, arg1); 
						DBM.AddOns.Thaddius.FrameUpdate(); 
					end);
	
		DBMThaddiusFrameR1 = DBMThaddiusFrame:CreateStatusBar(0, 100, 100, nil, DBM_THADDIUS_STALAGG, 100);
		DBMThaddiusFrameR1:GetObject():SetStatusBarTexture("Interface\\AddOns\\DBM_API\\Textures\\glaze");
		
		DBMThaddiusFrameR2 = DBMThaddiusFrame:CreateStatusBar(0, 100, 100, nil, DBM_THADDIUS_FEUGEN, 100);
		DBMThaddiusFrameR2:GetObject():SetStatusBarTexture("Interface\\AddOns\\DBM_API\\Textures\\glaze");
	end,
	["FrameUpdate"] = function()
		DBMThaddiusFrameR1:SetValue( DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG] );
		getglobal(DBMThaddiusFrameR1:GetObject():GetName().."RightText"):SetText(DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG]);

		DBMThaddiusFrameR2:SetValue( DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN] );
		getglobal(DBMThaddiusFrameR2:GetObject():GetName().."RightText"):SetText(DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN]);

		-- Make the bars look better :)
		if DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG] > 50 then	DBMThaddiusFrameR1:GetObject():SetStatusBarColor(0, 1, 0);
		elseif DBM.AddOns.Thaddius[DBM_THADDIUS_STALAGG] > 20 then	DBMThaddiusFrameR1:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									DBMThaddiusFrameR1:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN] > 50 then		DBMThaddiusFrameR2:GetObject():SetStatusBarColor(0, 1, 0);
		elseif DBM.AddOns.Thaddius[DBM_THADDIUS_FEUGEN] > 20 then	DBMThaddiusFrameR2:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									DBMThaddiusFrameR2:GetObject():SetStatusBarColor(1, 0, 0);
		end
		-- End Bar Colors
	end,
};

