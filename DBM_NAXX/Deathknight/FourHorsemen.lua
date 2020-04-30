--
-- Four Horsemen Raidwarning AddOn
--


DBM.AddOns.FourHorsemen = {
	["Name"] = DBM_FOURHORSEMEN_NAME,
	["Abbreviation1"] = "horsemen",
	["Version"] = "1.4",
	["Author"] = "Nitram",
	["MinVersionToSync"] = 2.00,
	["Description"] = DBM_FOURHORSEMEN_INFO,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 23,
	["lastTarget"] = "",
	["lastVoid"] = GetTime(),
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["ShowMarkPreWarning"] = true,
		["SyncMark"] = true,
		["WhisperVoid"] = false,
		["FlashVoidAlways"] = true,
		["TauntResist"] = true,
		["InfoFrame"] = true,
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning",
			["text"] = DBM_FOURHORSEMEN_SHOW_5SEC_MARK_WARNING,
			["func"] = function() DBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning = not DBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning; end,
		},	
		[2] = {
			["variable"] = "DBM.AddOns.FourHorsemen.Options.SyncMark",
			["text"] = DBM_FOURHORSEMEN_SYNC_INFO,
			["func"] = function() DBM.AddOns.FourHorsemen.Options.SyncMark = not DBM.AddOns.FourHorsemen.Options.SyncMark; end,
		},	
		[3] = {
			["variable"] = "DBM.AddOns.FourHorsemen.Options.WhisperVoid",
			["text"] = DBM_FOURHORSEMEN_WHISPER_INFO,
			["func"] = function() DBM.AddOns.FourHorsemen.Options.WhisperVoid = not DBM.AddOns.FourHorsemen.Options.WhisperVoid; end,
		},	
		[4] = {
			["variable"] = "DBM.AddOns.FourHorsemen.Options.FlashVoidAlways",
			["text"] = DBM_FOURHORSEMEN_VOID_ALLWAYS_INFO,
			["func"] = function() DBM.AddOns.FourHorsemen.Options.FlashVoidAlways = not DBM.AddOns.FourHorsemen.Options.FlashVoidAlways; end,
		},	
		[5] = {
			["variable"] = "DBM.AddOns.FourHorsemen.Options.TauntResist",
			["text"] = DBM_FOURHORSEMEN_TAUNTRESIST_INFO,
			["func"] = function() DBM.AddOns.FourHorsemen.Options.TauntResist = not DBM.AddOns.FourHorsemen.Options.TauntResist; end,
		},	
		[6] = {
			["variable"] = "DBM.AddOns.FourHorsemen.Options.InfoFrame",
			["text"] = DBM_FOURHORSEMEN_INFOFRAME_INFO,
			["func"] = function() DBM.AddOns.FourHorsemen.Options.InfoFrame = not DBM.AddOns.FourHorsemen.Options.InfoFrame; end,
		},	
	},
	["SlashCmdHelpText"] = {
		[1] = DBM_FOURHORSEMEN_SLASH,
	},
	["OnSlashCommand"] = function(msg)
		if string.lower(msg) == "hp" then
			if DBMFourHorsemenFrame then		-- no need to create a new Frame
				if DBMFourHorsemenFrame:GetObject():IsShown() then
					DBMFourHorsemenFrame:Hide();
				else
					DBMFourHorsemenFrame:Show();
				end
			else
				DBM.AddOns.FourHorsemen.CreateInfoFrame();
			end
			return true;
		end
	end,
	["Events"] = {
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = true,		-- ShieldWall
		["SPELL_CAST_SUCCESS"] = true,		-- Meteor // Wrath // Void
		["CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE"] = true,		-- Meteor
		["SPELL_AURA_APPLIED"] = true,		-- Mark
		["CHAT_MSG_SPELL_SELF_DAMAGE"] = true,				-- Taunt Resist
		["CHAT_MSG_ADDON"] = true, 					-- Void Zone // Mark sync
	},
	["LastMark"] = 0,
	["CountMark"] = 0,
	["OnCombatStart"] = function(delay)
		DBM.AddOns.FourHorsemen.InCombat = true;
		DBM.AddOns.FourHorsemen.LastMark = 0;
		DBM.AddOns.FourHorsemen.CountMark = 0;
		DBM.Schedule(20 - 5 - delay, "DBM.AddOns.FourHorsemen.OnEvent", "MarkWarn5");
		DBM.StartStatusBarTimer(1200 - delay, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");	-- Not sure, but seems to be correct ( = ~100 marks)
		DBM.StartStatusBarTimer(20 - delay, "Mark #1", "Interface\\Icons\\Ability_Creature_Cursed_02");

		if DBM.AddOns.FourHorsemen.Options.InfoFrame then
			DBM.AddOns.FourHorsemen.CreateInfoFrame(true);
		end
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.FourHorsemen.InCombat = false;
		DBM.AddOns.FourHorsemen.LastMark = 0;
		DBM.AddOns.FourHorsemen.CountMark = 0;
		DBM.AddOns.FourHorsemen.HighSyncMark = 0;

		DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_THANE]	= 100;
		DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_LADY]	= 100;
		DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_MOGRAINE]	= 100;
		DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_ZELIEK]	= 100;

		if DBM.AddOns.FourHorsemen.Options.InfoFrame then
			DBM.AddOns.FourHorsemen.CreateInfoFrame(false);
		end
	end,
	["HighSyncMark"] = 0,
	["OnEvent"] = function(event, arg1)

		------------------
		-- Taunt Resist --
		------------------
		if (event == "SPELL_MISSED"
		    and DBM.AddOns.FourHorsemen.InCombat
		    and DBM.AddOns.FourHorsemen.Options.TauntResist
		    and select(2, UnitClass("player")) == "WARRIOR") then

			if (arg1.spellId == 355 or arg1.spellId == 25266 or arg1.spellId == 1161) and bit.band(arg1.sourceFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0 and arg1.sourceName == UnitName("player") then
				DBM.AddSpecialWarning(DBM_FOURHORSEMEN_TAUNTRESIST_SELFWARN);
				SendChatMessage(DBM_FOURHORSEMEN_TAUNTRESIST_MESSAGE, "SAY");
			end
		end

		-----------------
		-- Mark Debuff --
		-----------------
		if (event == "SPELL_AURA_APPLIED") then
			if arg1.spellId == 28832 or arg1.spellId == 28833 or arg1.spellId == 28834 or arg1.spellId == 28835 then
				if( time() - DBM.AddOns.FourHorsemen.LastMark > 11.5 )then
					DBM.AddOns.FourHorsemen.LastMark = time();
					DBM.AddOns.FourHorsemen.CountMark = DBM.AddOns.FourHorsemen.CountMark + 1;

					if( DBM.AddOns.FourHorsemen.Options.SyncMark ) then
						SendAddonMessage("LVFH MARK", DBM.AddOns.FourHorsemen.CountMark, "RAID");
					end

					DBM.Announce( string.format(DBM_FOURHORSEMEN_MARK_ANNOUNCE, DBM.AddOns.FourHorsemen.CountMark) );
					DBM.Schedule(7, "DBM.AddOns.FourHorsemen.OnEvent", "MarkWarn5");
					DBM.StartStatusBarTimer(12, "Mark #"..DBM.AddOns.FourHorsemen.CountMark+1, "Interface\\Icons\\Ability_Creature_Cursed_02");
				end
			end

		elseif (event == "CHAT_MSG_ADDON" and DBM.AddOns.FourHorsemen.InCombat and DBM.AddOns.FourHorsemen.Options.SyncMark
		   and arg1 == "LVFH MARK" and arg2 and arg3 == "RAID") then
			arg2 = tonumber(arg2) or 0;
			if( time() - DBM.AddOns.FourHorsemen.LastMark > 11.5 )then
				DBM.AddOns.FourHorsemen.LastMark = time();
				DBM.AddOns.FourHorsemen.CountMark = DBM.AddOns.FourHorsemen.CountMark + 1;

				DBM.Announce( string.format(DBM_FOURHORSEMEN_MARK_ANNOUNCE, DBM.AddOns.FourHorsemen.CountMark) );
				DBM.Schedule(7, "DBM.AddOns.FourHorsemen.OnEvent", "MarkWarn5");
				DBM.EndStatusBarTimer("Mark #"..DBM.AddOns.FourHorsemen.CountMark, true);
				DBM.StartStatusBarTimer(12, "Mark #"..DBM.AddOns.FourHorsemen.CountMark+1, "Interface\\Icons\\Ability_Creature_Cursed_02");
			end

		elseif (event == "MarkWarn5") and DBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning then
			DBM.Announce(string.format(DBM_FOURHORSEMEN_MARK_WARNING, (DBM.AddOns.FourHorsemen.CountMark+1)));
		end

		
		---------------
		-- Void Zone --
		---------------
		if (event == "SPELL_CAST_SUCCESS") then
			if arg1.spellId == 28863 then		-- Void
				DBM.StartStatusBarTimer(12, "Void Zone", "Interface\\Icons\\Spell_Shadow_GatherShadows");
				if( DBM.AddOns.FourHorsemen.Options.FlashVoidAlways ) then
					DBM.AddSpecialWarning(DBM_FOURHORSEMEN_VOID_ANNOUNCE);
				end
			end

		elseif (event == "CHAT_MSG_ADDON") then
			if DBM.AddOns.FourHorsemen.InCombat and arg1 == "LVFH VOID" and arg2 and arg3 == "RAID" then
				if DBM.Raid[arg2] and arg2 ~= DBM.AddOns.FourHorsemen.lastTarget then
					DBM.AddOns.FourHorsemen.lastTarget = arg2;
					DBM.AddOns.FourHorsemen.OnEvent("DetectVoidZone", arg2);
				end
			end

		elseif (event == "DetectVoidZone") and arg1 then
			if (GetTime() - DBM.AddOns.FourHorsemen.lastVoid) > 9 then
				DBM.AddOns.FourHorsemen.lastVoid = GetTime();
				if arg1 == UnitName("player") and not DBM.AddOns.FourHorsemen.Options.FlashVoidAlways then
					DBM.AddSpecialWarning(DBM_FOURHORSEMEN_VOID_ANNOUNCE);
				end
				if DBM.AddOns.FourHorsemen.Options.WhisperVoid and DBM.Rank >= 1 then
					DBM.SendHiddenWhisper(DBM_FOURHORSEMEN_VOID_WHISPER, arg1);
				end
			end
		end
		
		------------
		-- Meteor --
		------------
		if (event == "SPELL_CAST_SUCCESS") then
			if arg1.spellId == 28884 then
				DBM.EndStatusBarTimer("Meteor");
				DBM.StartStatusBarTimer(12, "Meteor", "Interface\\Icons\\Spell_Fire_MeteorStorm");
			end
		end

		----------------
		-- ShieldWall --
		----------------
		if (event == "SPELL_AURA_APPLIED") then
			if arg1.spellId == 29061 then
				DBM.Announce(string.format(DBM_FOURHORSEMEN_SHIELDWALL_ANNOUNCE, arg1.destName));
				DBM.Schedule(20, "DBM.AddOns.FourHorsemen.OnEvent", "ShieldWallWarn5", arg1.destName);

				
				DBM.StartStatusBarTimer(20, "Shield Wall: "..arg1.destName, "Interface\\Icons\\Ability_Warrior_ShieldWall", true);
			end

		elseif (event == "ShieldWallWarn5") then
			DBM.Announce(string.format(DBM_FOURHORSEMEN_SHIELDWALL_FADE, arg1));

		end

	end,
	["OnUpdate"] = function(elapsed)
		if not DBM.AddOns.FourHorsemen.InCombat then
			return;
		end
		local ladyUnitID;
		if UnitName("target") == DBM_FOURHORSEMEN_LADY then
			ladyUnitID = "target";
		end
		if not ladyUnitID then
			for i = 1, GetNumRaidMembers() do
				if UnitName("raid"..i.."target") == DBM_FOURHORSEMEN_LADY then
					ladyUnitID = "raid"..i.."target";
					DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_LADY] = UnitHealth("raid"..i.."target");

				elseif UnitName("raid"..i.."target") == DBM_FOURHORSEMEN_THANE then
					DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_THANE] = UnitHealth("raid"..i.."target");

				elseif UnitName("raid"..i.."target") == DBM_FOURHORSEMEN_MOGRAINE then
					DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_MOGRAINE] = UnitHealth("raid"..i.."target");

				elseif UnitName("raid"..i.."target") == DBM_FOURHORSEMEN_ZELIEK then
					DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_ZELIEK] = UnitHealth("raid"..i.."target");
				end
			end
		end

		if ladyUnitID and UnitExists(ladyUnitID.."target") and UnitClass(ladyUnitID.."target") ~= DBM_WARRIOR then
			local newTarget = UnitName(ladyUnitID.."target");
			if newTarget ~= DBM.AddOns.FourHorsemen.lastTarget and DBM.Raid[newTarget] then
				DBM.AddOns.FourHorsemen.lastTarget = newTarget;
				DBM.AddOns.FourHorsemen.OnEvent("DetectVoidZone", newTarget);
				SendAddonMessage("LVFH VOID", newTarget, "RAID");
			end
		end
	end,
	[DBM_FOURHORSEMEN_THANE] = 100,
	[DBM_FOURHORSEMEN_LADY] = 100,
	[DBM_FOURHORSEMEN_MOGRAINE] = 100,
	[DBM_FOURHORSEMEN_ZELIEK] = 100,
	["CreateInfoFrame"] = function(xshow)		-- DBM.AddOns.FourHorsemen.CreateInfoFrame();
		if not DBMGui then return; end

		if DBMFourHorsemenFrame then		-- no need to create a new Frame
			if (xshow == false) then -- or (DBMFourHorsemenFrame:GetObject():IsShown() and not xshow)) then
				DBMFourHorsemenFrame:Hide();
			elseif (xshow == true) then -- or (DBMFourHorsemenFrame:GetObject():IsShown() and xshow)) then
				DBMFourHorsemenFrame:Show();
			end
			return;
		elseif xshow == false then --we don't want to create a frame if we call this function to hide a info frame that does not exist
			return;
		end
		
		DBMFourHorsemenFrame = DBMGui:CreateInfoFrame(DBM_FOURHORSEMEN_INFOFRAME_TITLE, DBM_FOURHORSEMEN_INFOFRAME_TEXT);
		if( not DBMFourHorsemenFrame ) then 
			DBM.AddMsg("Can't get frame from CreateInfoFrame()");
			return false; 
		end
		DBMFourHorsemenFrame:GetObject():SetScript("OnUpdate", function() 
						DBM_InfoFrameTemplate_OnUpdate(this, arg1); 
						DBM.AddOns.FourHorsemen.FrameUpdate(); 
					end);
	
		DBMFourHorsemenFrameR1 = DBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, DBM_FOURHORSEMEN_MOGRAINE, 100);
		DBMFourHorsemenFrameR2 = DBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, DBM_FOURHORSEMEN_THANE, 100);
		DBMFourHorsemenFrameR3 = DBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, DBM_FOURHORSEMEN_LADY, 100);
		DBMFourHorsemenFrameR4 = DBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, DBM_FOURHORSEMEN_ZELIEK, 100);
	end,
	["FrameUpdate"] = function()
		DBMFourHorsemenFrameR1:SetValue( DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_MOGRAINE] );
		getglobal(DBMFourHorsemenFrameR1:GetObject():GetName().."RightText"):SetText(DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_MOGRAINE]);

		DBMFourHorsemenFrameR2:SetValue( DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_THANE] );
		getglobal(DBMFourHorsemenFrameR2:GetObject():GetName().."RightText"):SetText(DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_THANE]);

		DBMFourHorsemenFrameR3:SetValue( DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_LADY] );
		getglobal(DBMFourHorsemenFrameR3:GetObject():GetName().."RightText"):SetText(DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_LADY]);

		DBMFourHorsemenFrameR4:SetValue( DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_ZELIEK] );
		getglobal(DBMFourHorsemenFrameR4:GetObject():GetName().."RightText"):SetText(DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_ZELIEK]);

		-- Make the bars look better :)
		if DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_MOGRAINE] > 50 then	DBMFourHorsemenFrameR1:GetObject():SetStatusBarColor(0, 1, 0);
		elseif DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_MOGRAINE] > 20 then	DBMFourHorsemenFrameR1:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									DBMFourHorsemenFrameR1:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_THANE] > 50 then		DBMFourHorsemenFrameR2:GetObject():SetStatusBarColor(0, 1, 0);
		elseif DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_THANE] > 20 then	DBMFourHorsemenFrameR2:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									DBMFourHorsemenFrameR2:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_LADY] > 50 then		DBMFourHorsemenFrameR3:GetObject():SetStatusBarColor(0, 1, 0);
		elseif DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_LADY] > 20 then	DBMFourHorsemenFrameR3:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									DBMFourHorsemenFrameR3:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_ZELIEK] > 50 then		DBMFourHorsemenFrameR4:GetObject():SetStatusBarColor(0, 1, 0);
		elseif DBM.AddOns.FourHorsemen[DBM_FOURHORSEMEN_ZELIEK] > 20 then	DBMFourHorsemenFrameR4:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									DBMFourHorsemenFrameR4:GetObject():SetStatusBarColor(1, 0, 0);
		end
		-- End Bar Colors
	end,
};



