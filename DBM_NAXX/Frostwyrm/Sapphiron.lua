--
--  Sapphiron - v1.0 by Nitram
--

DBM.AddOns.Sapphiron = {
	["Name"] = DBM_SAPPHIRON_NAME,
	["Abbreviation1"] = "sapphiron",
	["Version"] = "1.0",
	["Author"] = "Nitram",
	["Description"] = DBM_SAPPHIRON_INFO,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 51,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["Yell"] = true,
		["ShowPings"] = true,
		["ShowDistanceFrame"] = true,
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.Sapphiron.Options.Yell",
			["text"] = DBM_SAPPHIRON_YELL_INFO,
			["func"] = function() DBM.AddOns.Sapphiron.Options.Yell = not DBM.AddOns.Sapphiron.Options.Yell; end,
		},
		[2] = {
			["variable"] = "DBM.AddOns.Sapphiron.Options.ShowPing",
			["text"] = DBM_SAPPHIRON_PING_INFO,
			["func"] = function()
				DBM.AddOns.Sapphiron.Options.ShowPing = not DBM.AddOns.Sapphiron.Options.ShowPing;
				if DBM.AddOns.Sapphiron.InCombat then
					DBM.AddOns.Sapphiron.HidePings((not DBM.AddOns.Sapphiron.Options.ShowPing));
				end
			end,
		},
		[3] = {
			["variable"] = "DBM.AddOns.Sapphiron.Options.ShowDistanceFrame",
			["text"] = DBM_SAPPHIRON_SHOW_DISTANCE_FRAME,
			["func"] = function() DBM.AddOns.Sapphiron.Options.ShowDistanceFrame = not DBM.AddOns.Sapphiron.Options.ShowDistanceFrame	end,
		},
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_EMOTE"] = true,				-- IceBomb
		["SPELL_AURA_APPLIED"] = true,			-- LifeDrain // Icebolt
		["SPELL_AURA_REMOVED"] = true,			-- Icebolt
	},
	["LastDrain"] = 0,
	["LastDeepBreath"] = 0,
	["InCombat"] = false, 
	["OnCombatStart"] = function(delay)
		DBM.Schedule(810 - delay, "DBM.AddOns.Sapphiron.OnEvent", "EnrageWarning", 90);
		DBM.Schedule(870 - delay, "DBM.AddOns.Sapphiron.OnEvent", "EnrageWarning", 30);
		DBM.StartStatusBarTimer(900 - delay, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");
		DBM.StartStatusBarTimer(10 - delay, "Life Drain", "Interface\\Icons\\Spell_Shadow_LifeDrain02");
		DBM.AddOns.Sapphiron.HidePings((not DBM.AddOns.Sapphiron.Options.ShowPing));
		DBM.AddOns.Sapphiron.InCombat = true;
		
		
		DBM.StartStatusBarTimer(44 - delay, "Air Phase", "Interface\\AddOns\\DBM_API\\Textures\\CryptFiendUnBurrow");
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.Sapphiron.InCombat = false;
		DBM.AddOns.Sapphiron.PingStartedTime = 0;
		DBM.UnSchedule("DBM.AddOns.Sapphiron.OnEvent", "EnrageWarning");
		DBM.UnSchedule("DBM.AddOns.Sapphiron.PingMiniMap");
		DBM.AddOns.Sapphiron.HidePings(false);
	end,
	["TargetTime"] = 0,
	["LastTarget"] = "",
	["OnUpdate"] = function(elapsed)
		if (not DBM.AddOns.Sapphiron.InCombat) then  return; end

		local FoundSapphiron = false;
		local newTarget;
			
		if (UnitName("target") == DBM_SAPPHIRON_NAME) and UnitAffectingCombat("target") then
			newTarget = UnitName("targettarget")
			FoundSapphiron = true;
		else
			for i = 1, GetNumRaidMembers() do
				if (UnitName("raid"..i.."target") == DBM_SAPPHIRON_NAME) and UnitAffectingCombat("raid"..i.."target") then
					newTarget = UnitName("Raid"..i.."targettarget")
					FoundSapphiron = true;
					break;
				end
			end
		end
		if (FoundSapphiron) then
			if (newTarget == DBM.AddOns.Sapphiron.LastTarget) then
				DBM.AddOns.Sapphiron.TargetTime = DBM.AddOns.Sapphiron.TargetTime + elapsed;
			else
				DBM.AddOns.Sapphiron.LastTarget = newTarget;
				DBM.AddOns.Sapphiron.TargetTime = 0;
			end

			if (not newTarget and DBM.AddOns.Sapphiron.TargetTime > 2 and (GetTime() - DBM.AddOns.Sapphiron.LastDeepBreath) > 37) then
				DBM.StartStatusBarTimer(29.25, "Deep Breath", "Interface\\Icons\\Spell_Frost_FrostNova");
				DBM.EndStatusBarTimer("Life Drain");
				DBM.EndStatusBarTimer("Air Phase");
				
				DBM.AddOns.Sapphiron.LastDeepBreath = GetTime();
				
				if DBM.AddOns.Sapphiron.Options.ShowDistanceFrame then
					DBM_Gui_DistanceFrame_Show();
				end
			end
		end
	end,
	["UpdateInterval"] = 0.2,
	["PingStartedTime"] = 0,
	["PingMiniMap"] = function()
		if( (time() - DBM.AddOns.Sapphiron.PingStartedTime) < 30 ) then	-- Protect Ping Spam !! :)
			Minimap:PingLocation(CURSOR_OFFSET_X, CURSOR_OFFSET_Y);
			DBM.Schedule(2, "DBM.AddOns.Sapphiron.PingMiniMap");		-- Ping all 2 sec
		else
			DBM.AddOns.Sapphiron.PingStartedTime = 0;
		end
	end,
	["HidePings"] = function(value)
		if value then
			Minimap_SetPing = function() end;
		else
			Minimap_SetPing = DBM.Hooks.oldMinimap_SetPing;
		end
	end,
	["OnEvent"] = function(event, arg1)
		-------------------------
		-- Icebolt PingMinimap --
		-------------------------
	
		
		if (event == "SPELL_AURA_APPLIED" and arg1.spellId == 28522 and bit.band(arg1.destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0 and arg1.destName == UnitName("player")) then
			DBM.AddOns.Sapphiron.PingStartedTime = time();
			DBM.AddOns.Sapphiron.PingMiniMap();

			if( DBM.AddOns.Sapphiron.Options.Yell ) then
				SendChatMessage( DBM_SAPPHIRON_YELL_ANNOUNCE, "YELL");
			end

		elseif (event == "SPELL_AURA_REMOVED" and arg1.spellId == 28522) then
			DBM.UnSchedule("DBM.AddOns.Sapphiron.PingMiniMap");
		end
		
		---------------------
		-- Enrage Warnings --
		---------------------
		if (event == "EnrageWarning") then
			DBM.Announce(string.format(DBM_SAPPHIRON_ENRAGE_ANNOUNCE, arg1));
		end

		------------------------
		-- Life Drain Warning --
		------------------------
		if ((event == "SPELL_AURA_APPLIED")
		 and (time() - DBM.AddOns.Sapphiron.LastDrain) > 5 
		 and arg1.spellId == 28542) then
			DBM.AddOns.Sapphiron.LastDrain = time();
			DBM.Announce(DBM_SAPPHIRON_LIFEDRAIN_ANNOUNCE);
			DBM.Schedule(19, "DBM.AddOns.Sapphiron.OnEvent", "LifeDrainWarn", 5);
			DBM.StartStatusBarTimer(24, "Life Drain", "Interface\\Icons\\Spell_Shadow_LifeDrain02");
			
		elseif (event == "LifeDrainWarn") then
			DBM.Announce(string.format(DBM_SAPPHIRON_LIFEDRAIN_WARN, arg1));
		end

		-----------------
		-- Deep Breath --
		-----------------
		if (event == "CHAT_MSG_MONSTER_EMOTE" and string.find(arg1, DBM_SAPPHIRON_DEEPBREATH_EXPR)) then
			DBM.Announce(DBM_SAPPHIRON_DEEPBREATH_ANNOUNCE);
			
			
			DBM.Schedule(7, "DBM.AddOns.Sapphiron.DeepBreath");

			
			
			if not DBM.GetStatusBarTimerTimeLeft("Deep Breath") then
				DBM.StartStatusBarTimer(29.25, "Deep Breath", "Interface\\Icons\\Spell_Frost_FrostNova");
			end			
			
			DBM.UpdateStatusBarTimer("Deep Breath", 22.25, 29.25);	
		end
	end,
	["DeepBreath"] = function()
		if DBM.AddOns.Sapphiron.Options.ShowDistanceFrame then
			DBM_Gui_DistanceFrame_Hide();
		end
		
		DBM.StartStatusBarTimer(66, "Air Phase", "Interface\\AddOns\\DBM_API\\Textures\\CryptFiendUnBurrow");
	end
};


DBM.Hooks.oldMinimap_SetPing = Minimap_SetPing;
