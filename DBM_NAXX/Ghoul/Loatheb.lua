DBM.AddOns.Loatheb = {
	["Name"] = DBM_LOATHEB_NAME,
	["Abbreviation1"] = "Loa",
	["Abbreviation2"] = "Lolotheb",
	["Version"] = "1.0",
	["Author"] = "Tandanu",
	["Description"] = DBM_LOATHEB_DESCRIPTION,
	["SlashCmdHelpText"] = {
		[1] = "/loatheb setup - shows a dialog to setup the heal rotation",
		[2] = "/loatheb show - shows the heal rotation dialog",
		[3] = "/loatheb hide - hides the heal rotation dialog",
		[4] = "/loatheb broadcast - sends the healer setup to the raid chat (alias: /loatheb bc)",
		[5] = "/loatheb undelete - undeletes deleted healers, set a healer's sort ID to 0 to delete him",
	},
	["Instance"] = DBM_NAXX,
--	["Instance"] = DBM_OTHER, --DEBUG
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 33,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["AnnounceHealRaid"] = true,
		["AnnounceHealRaidWarning"] = false,
		["AnnounceHealWhisper"] = false,
		["ShowHealFrame"] = true,
		["FrameLocked"] = false,
		["PotAnnounce"] = true,
		["PotSpecialWarning"] = true,
		["AnnounceSpores"] = true,
		["AnnounceSporesBackward"] = false,
	},
	["InCombat"] = false,
	["CastingDoom"] = false,
	["DoomCounter"] = 0,
	["CountSpore"] = 0,
	["Healers"] = {
	},
	["DeletedHealers"] = {
	},
	["LongMsg"] = "",
	["HealersSorted"] = false,
	["SpamProt"] = {
	},
	["AutoShown"] = false,
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.AnnounceSpores",
			["text"] = DBM_LOATHEB_ANNOUNCE_SPORES,
			["func"] = function() DBM.AddOns.Loatheb.Options.AnnounceSpores = not DBM.AddOns.Loatheb.Options.AnnounceSpores; end,
		},
		[2] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.AnnounceHealRaid",
			["text"] = DBM_LOATHEB_HEAL_RAID,
			["func"] = function() DBM.AddOns.Loatheb.Options.AnnounceHealRaid = not DBM.AddOns.Loatheb.Options.AnnounceHealRaid; end,
		},
		[3] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.AnnounceHealRaidWarning",
			["text"] = DBM_LOATHEB_HEAL_RAID_WARN,
			["func"] = function() DBM.AddOns.Loatheb.Options.AnnounceHealRaidWarning = not DBM.AddOns.Loatheb.Options.AnnounceHealRaidWarning; end,
		},
		[4] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.AnnounceHealWhisper",
			["text"] = DBM_LOATHEB_HEAL_WHISPER,
			["func"] = function() DBM.AddOns.Loatheb.Options.AnnounceHealWhisper = not DBM.AddOns.Loatheb.Options.AnnounceHealWhisper; end,
		},
		[5] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.PotAnnounce",
			["text"] = DBM_LOATHEB_ANNOUNCE_POT_OPTION,
			["func"] = function() DBM.AddOns.Loatheb.Options.PotAnnounce = not DBM.AddOns.Loatheb.Options.PotAnnounce; end,
		},
		[6] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.PotSpecialWarning",
			["text"] = DBM_LOATHEB_SPECIALWARN_POT_OPTION,
			["func"] = function() DBM.AddOns.Loatheb.Options.PotSpecialWarning = not DBM.AddOns.Loatheb.Options.PotSpecialWarning; end,
		},
		[7] = {
			["variable"] = "DBM.AddOns.Loatheb.Options.ShowHealFrame",
			["text"] = DBM_LOATHEB_HEAL_SHOW_AUTO,
			["func"] = function() DBM.AddOns.Loatheb.Options.ShowHealFrame = not DBM.AddOns.Loatheb.Options.ShowHealFrame; end,
		},
		[8] = {
			["variable"] = "DBMLoathebFrameDrag:IsShown()",
			["text"] = DBM_LOATHEB_HEAL_SHOW_NOW,
			["func"] = function() if DBMLoathebFrameDrag:IsShown() then DBMLoathebFrameDrag:Hide(); else DBMLoathebFrameDrag:Show(); end end,
		},
		[9] = {
			["variable"] = "DBMLoathebFrameDrag.ConfigMode",
			["text"] = DBM_LOATHEB_HEAL_SETUP,
			["func"] = function() DBM.AddOns.Loatheb.OnSlashCommand("setup") end,
		},		
	},
	["Events"] = {
		["SPELL_CAST_SUCCESS"] = true,
		["SPELL_AURA_APPLIED"] = true,
	},
	["OnLoad"] = function()
		if UnitClass("player") == DBM_PRIEST or UnitClass("player") == DBM_DRUID or UnitClass("player") == DBM_PALADIN or UnitClass("player") == DBM_SHAMAN then
			DBM.AddOns.Loatheb.Options.ShowHealFrame = true;
		else
			DBM.AddOns.Loatheb.Options.ShowHealFrame = false;
		end
	end,
	["OnSlashCommand"] = function(msg)
		if string.lower(msg) == "show" then
			DBMLoathebFrameDrag:Show();
			return true;
		elseif string.lower(msg) == "hide" then
			DBMLoathebFrameDrag:Hide();
			return true;
		elseif string.lower(msg) == "setup" or string.lower(msg) == "config" then
				DBMLoathebFrameDrag:Show();
				DBMLoathebFrameDrag.ConfigMode = true;
			if DBM.Rank >= 1 then
				DBMLoathebButton:SetText(DBM_LOATHEB_SET_HEAL_ROTATION);
			else
				DBM.AddMsg(DBM_LOATHEB_NO_BC_INFO);
				DBMLoathebButton:SetText(DBM_LOATHEB_SET_HEAL_ROTATION_NO_BC);
			end
			return true;
		elseif string.lower(msg) == "broadcast" or string.lower(msg) == "bc" then
			local healerSetup = {};
			local i = 1;
			local j = 1;
			while DBM.AddOns.Loatheb.Healers[i] do
				if not healerSetup[j] then
					healerSetup[j] = "";
				end
				if string.len(healerSetup[j]..i..". "..DBM.AddOns.Loatheb.Healers[i].Name.." / ") < 254 then
					healerSetup[j] = healerSetup[j]..i..". "..DBM.AddOns.Loatheb.Healers[i].Name.." / ";
				else
					j = j + 1;
					if not healerSetup[j] then
						healerSetup[j] = "";
					end
					healerSetup[j] = healerSetup[j]..i..". "..DBM.AddOns.Loatheb.Healers[i].Name.." / ";
				end
				i = i + 1;
			end
			for index, value in pairs(healerSetup) do
				healerSetup[index] = string.gsub(healerSetup[index], " / $", "");
				SendChatMessage(healerSetup[index], "RAID");
			end
			DBM.AddOns.Loatheb.OnEvent("SendHealList");
			return true;
		elseif string.lower(msg) == "undelete" then
			DBM.AddOns.Loatheb.DeletedHealers = {};
			DBM.AddOns.Loatheb.OnEvent("RAID_ROSTER_UPDATE");
			return true;
		end
	end,
	["OnCombatStart"] = function(delay)
		DBM.AddOns.Loatheb.InCombat = true;
		DBM.AddOns.Loatheb.DoomCounter = 0;
		DBM.AddOns.Loatheb.CastingDoom = false;
		DBM.Schedule(110 - delay, "DBM.AddOns.Loatheb.OnEvent", "DoomWarning", 10);
		DBM.StartStatusBarTimer(120 - delay, "Inevitable Doom", "Interface\\Icons\\Spell_Shadow_NightOfTheDead");
		if DBM.AddOns.Loatheb.Options.ShowHealFrame and not DBMLoathebFrameDrag:IsShown() then
			DBMLoathebFrameDrag:Show();
			DBM.AddOns.Loatheb.AutoShown = true;
		end
	end,
	["OnEvent"] = function(event, arg1)
		if event == "CHAT_MSG_ADDON" and arg3 == "RAID" then
			if arg1 == "DBMLOATHEB" then
				if arg2 == "REQLIST" then
					if DBM.Rank >= 1 then
						DBM.AddOns.Loatheb.OnEvent("SendHealList");
					end
				end
			elseif arg1 == "DBMLOALISTL" and arg2 then
				local rank;
				for i = 1, GetNumRaidMembers() do
					if UnitName("raid"..i) == arg4 then
						_, _, rank = GetRaidRosterInfo(i);
						break;
					end
				end
				if rank >= 1 then
					DBM.AddOns.Loatheb.LongMsg = DBM.AddOns.Loatheb.LongMsg..arg2;
				end
			elseif arg1 == "DBMLOALISTS" and arg2 then
				local rank;
				for i = 1, GetNumRaidMembers() do
					if UnitName("raid"..i) == arg4 then
						_, _, rank = GetRaidRosterInfo(i);
						break;
					end
				end
				if rank >= 1 then
					arg2 = DBM.AddOns.Loatheb.LongMsg..arg2;
					DBM.AddOns.Loatheb.LongMsg = "";
					DBM.AddOns.Loatheb.DeletedHealers = {};
					DBM.AddOns.Loatheb.OnEvent("RAID_ROSTER_UPDATE");
					for sort, player in string.gmatch(arg2, "(%d+)([^%s]-) ") do
						for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
							if value.Name and value.Name == player and tonumber(sort) then
								DBM.AddOns.Loatheb.Healers[index].Sort = tonumber(sort);
								break;
							end
						end
					end
					DBM.AddOns.Loatheb.DeleteDeletedHealers();
					DBM.AddOns.Loatheb.OnEvent("RAID_ROSTER_UPDATE");
					DBM.AddOns.Loatheb.HealersSorted = true;
					table.sort(DBM.AddOns.Loatheb.Healers, function(v1, v2) return v1.Sort < v2.Sort end);
				end
			elseif arg1 == "DBMLOAHEAL" and arg2 then
				if DBM.AddOns.Loatheb.SpamProt[arg2] then
					return;
				end
				DBM.AddOns.Loatheb.SpamProt[arg2] = 1;
				DBM.AddOns.Loatheb.OnEvent("DetectHeal", arg2);
			end
		elseif event == "PotionWarning" then
			local pot;
			if DBM.AddOns.Loatheb.DoomCounter == 1 then --2:10
				pot = DBM_LOATHEB_SHADOW_PROT_POT;
			elseif DBM.AddOns.Loatheb.DoomCounter == 2 then --2:40
				--shadow protection potion active 
			elseif DBM.AddOns.Loatheb.DoomCounter == 3 then --3:10
				pot = DBM_LOATHEB_BANDAGE
			elseif DBM.AddOns.Loatheb.DoomCounter == 4 then --3:40
				pot = DBM_LOATHEB_HEALTHSTONE
			elseif DBM.AddOns.Loatheb.DoomCounter == 5 then --4:10
				pot = DBM_LOATHEB_SHADOW_PROT_POT.."/"..DBM_LOATHEB_BANDAGE;
			elseif DBM.AddOns.Loatheb.DoomCounter == 6 then --4:40 
				--shadow protection potion active
			elseif DBM.AddOns.Loatheb.DoomCounter == 7 then --5:10
				pot = DBM_LOATHEB_BANDAGE 
			elseif DBM.AddOns.Loatheb.DoomCounter == 8 then --5:25 (enrage --> 15 sec CD)
				--Loatheb should be dead
			elseif DBM.AddOns.Loatheb.DoomCounter == 9 then --5:40
				--okay, wipe :)
			end
			if pot then
				if DBM.AddOns.Loatheb.Options.PotSpecialWarning then
					DBM.AddSpecialWarning(string.format(DBM_LOATHEB_POT_WARNING, pot), true, true);
				end
				if DBM.AddOns.Loatheb.Options.PotAnnounce and DBM.AddOns.Loatheb.Options.Announce and DBM.Rank >= 1 then
					DBM.Announce(string.format(DBM_LOATHEB_POT_ANNOUNCE, pot));
				end
			end
		elseif event == "SPELL_AURA_APPLIED" then
			if arg1.spellId == 29204 and not DBM.AddOns.Loatheb.CastingDoom then
				DBM.AddOns.Loatheb.CastingDoom = true;
				DBM.AddOns.Loatheb.DoomCounter = DBM.AddOns.Loatheb.DoomCounter + 1;
				DBM.Schedule(10, "DBM.AddOns.Loatheb.OnEvent", "PotionWarning");
				if DBM.AddOns.Loatheb.DoomCounter <= 7 then
					DBM.Announce(string.format(DBM_LOATHEB_DOOM_NOW, DBM.AddOns.Loatheb.DoomCounter, 30))
					DBM.Schedule(25, "DBM.AddOns.Loatheb.OnEvent", "DoomWarning", 5);
					DBM.StartStatusBarTimer(30, "Inevitable Doom", "Interface\\Icons\\Spell_Shadow_NightOfTheDead");
				else
					DBM.Announce(string.format(DBM_LOATHEB_DOOM_NOW, DBM.AddOns.Loatheb.DoomCounter, 15))
					DBM.Schedule(10, "DBM.AddOns.Loatheb.OnEvent", "DoomWarning", 5);
					DBM.StartStatusBarTimer(15, "Inevitable Doom", "Interface\\Icons\\Spell_Shadow_NightOfTheDead");
				end
			elseif arg1.spellId == 29199
			or arg1.spellId == 29184
			or arg1.spellId == 29195
			or arg1.spellId == 29197 then
				local sArg1 = tostring(arg1.destName)
				if sArg1 and DBM.AddOns.Loatheb.InCombat then
					for i = 1, GetNumRaidMembers() do
						if UnitName("raid"..i) == sArg1 then
							if UnitClass("raid"..i) == DBM_PRIEST or UnitClass("raid"..i) == DBM_PALADIN or UnitClass("raid"..i) == DBM_DRUID or UnitClass("raid"..i) == DBM_SHAMAN then
								for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
									if value.Name == sArg1 then
										if not value.Cooldown then
											DBM.AddOns.Loatheb.OnEvent("DetectHeal", sArg1);
											if not DBM.AddOns.Loatheb.SpamProt[sArg1] then
												SendAddonMessage("DBMLOAHEAL", sArg1, "RAID");
												DBM.AddOns.Loatheb.SpamProt[sArg1] = 1;
											end											
										end
										break;
									end
								end
							end
							break;
						end
					end
				end
			end
		elseif event == "GetNextHealer" and arg1 then
			if not arg1 then
				return;
			end
			local unitIDs = {};
			local i = arg1 + 1;
			for i = 1, GetNumRaidMembers() do
				if UnitClass("raid"..i) == DBM_PRIEST or UnitClass("raid"..i) == DBM_PALADIN or UnitClass("raid"..i) == DBM_DRUID or UnitClass("raid"..i) == DBM_SHAMAN then
					unitIDs[UnitName("raid"..i)] = "raid"..i;
				end
			end
			while DBM.AddOns.Loatheb.Healers[i] do
				if not UnitIsDeadOrGhost(unitIDs[DBM.AddOns.Loatheb.Healers[i].Name]) and UnitIsConnected(unitIDs[DBM.AddOns.Loatheb.Healers[i].Name]) then
					return i, DBM.AddOns.Loatheb.Healers[i].Name;
				end
				i = i + 1;
			end
			i = 1;
			while DBM.AddOns.Loatheb.Healers[i] and i < arg1 do
				if not UnitIsDeadOrGhost(unitIDs[DBM.AddOns.Loatheb.Healers[i].Name]) and UnitIsConnected(unitIDs[DBM.AddOns.Loatheb.Healers[i].Name]) then
					return i, DBM.AddOns.Loatheb.Healers[i].Name;
				end
				i = i + 1;
			end
		elseif event == "SPELL_CAST_SUCCESS" then
			if arg1.spellId == 30281 then
				DBM.Announce(DBM_LOATHEB_DECURSE_NOW);
			--	DBM.Schedule(25, "DBM.AddOns.Loatheb.OnEvent", "DecurseWarning", 5);
				DBM.StartStatusBarTimer(30, "Decurse", "Interface\\Icons\\Spell_Nature_RemoveCurse");
			elseif arg1.spellId == 29234 then
				if DBM.AddOns.Loatheb.Options.AnnounceSpores then
--[[				-- Grp #1 always the MT Group
					if( DBM.AddOns.Loatheb.Options.AnnounceSporesBackward ) then
						if( DBM.AddOns.Loatheb.CountSpore <= 1 ) then 		DBM.AddOns.Loatheb.CountSpore = 9;
						end
						DBM.AddOns.Loatheb.CountSpore = DBM.AddOns.Loatheb.CountSpore - 1;
					else
						if( DBM.AddOns.Loatheb.CountSpore >= 8 ) then 		DBM.AddOns.Loatheb.CountSpore = 0;
						end
						DBM.AddOns.Loatheb.CountSpore = DBM.AddOns.Loatheb.CountSpore + 1;
					end]]
					DBM.AddOns.Loatheb.CountSpore = DBM.AddOns.Loatheb.CountSpore + 1;
					DBM.Announce(string.format(DBM_LOATHEB_SPORE_SPAWNED, DBM.AddOns.Loatheb.CountSpore));
				end
				DBM.StartStatusBarTimer(12, "Spore", "Interface\\Icons\\Spell_Nature_AbolishMagic");
			end
		elseif event == "DoomWarning" then
			if arg1 and arg1 > 0 then
				DBM.Announce(string.format(DBM_LOATHEB_DOOM_WARNING, (DBM.AddOns.Loatheb.DoomCounter + 1), arg1));
				DBM.AddOns.Loatheb.CastingDoom = false;
			end
		elseif event == "DecurseWarning" then
			if arg1 and arg1 > 0 then
				DBM.Announce(string.format(DBM_LOATHEB_DECURSE_WARNING, arg1));
			end
		elseif event == "PLAYER_LOGIN" then
			DBM.AddOns.Loatheb.OnEvent("RAID_ROSTER_UPDATE");
		elseif event == "RAID_ROSTER_UPDATE" then
			if GetNumRaidMembers() <= 1 then
				DBM.AddOns.Loatheb.Healers = {};
				DBM.AddOns.Loatheb.HealersSorted = false;
			end
			local playersInRaidGrp = {};
			for i = 1, GetNumRaidMembers() do
				if UnitClass("raid"..i) == DBM_PRIEST or UnitClass("raid"..i) == DBM_PALADIN or UnitClass("raid"..i) == DBM_DRUID or UnitClass("raid"..i) == DBM_SHAMAN then
					local exists;
					playersInRaidGrp[UnitName("raid"..i)] = UnitClass("raid"..i);
					for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
						if value.Name and value.Name == UnitName("raid"..i) then
							exists = true;
							break;
						end
					end
					if not exists and not DBM.AddOns.Loatheb.DeletedHealers[UnitName("raid"..i)] then
						table.insert(DBM.AddOns.Loatheb.Healers, {["Name"] = UnitName("raid"..i), ["Class"] = UnitClass("raid"..i), ["Cooldown"] = false, ["Sort"] = 99})
						if not DBM.AddOns.Loatheb.HealersSorted then
							table.sort(DBM.AddOns.Loatheb.Healers, function(v1, v2) return v1.Name < v2.Name end)
						end
					end
				end				
			end
			for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
				if value and value.Name and not playersInRaidGrp[value.Name] then
					table.remove(DBM.AddOns.Loatheb.Healers, index);
				end
			end
			local frameCount = 1;
			while getglobal("DBMLoathebHealerFrame"..frameCount) and getglobal("DBMLoathebHealerFrame"..frameCount):IsShown() do
				frameCount = frameCount + 1;
			end
			frameCount = frameCount - 1;
			for i = (frameCount + 1), table.getn(DBM.AddOns.Loatheb.Healers) do
				if getglobal("DBMLoathebHealerFrame"..i) then
					getglobal("DBMLoathebHealerFrame"..i):Show();					
				else
					local newFrame;
					newFrame = CreateFrame("Frame", "DBMLoathebHealerFrame"..i, DBMLoathebFrameDrag, "DBMLoathebHealerTemplate");
					if i == 1 then
						newFrame:SetPoint("TOP", "DBMLoathebFrameDrag", "BOTTOM", 0, 0);
					else
						newFrame:SetPoint("TOP", "DBMLoathebHealerFrame"..(i - 1), "BOTTOM", 0, 3);
					end
					newFrame:Show();
				end
			end
			for i = frameCount, (table.getn(DBM.AddOns.Loatheb.Healers) + 1), - 1 do
				if i > 0 then
					getglobal("DBMLoathebHealerFrame"..i):Hide();
				end
			end
		elseif event == "SendHealList" then
			local message = "";
			if not DBM.AddOns.Loatheb.HealersSorted then
				return;
			end
			for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
				message = message..value.Sort..value.Name.." ";
			end			
			while string.len(message) > 240 do
				SendAddonMessage("DBMLOALISTL", string.sub(message, 1, 240), "RAID");
				message = string.sub(message, 241);
			end
			SendAddonMessage("DBMLOALISTS", message, "RAID");
		elseif event == "DetectHeal" and arg1 and DBM.AddOns.Loatheb.InCombat then
			for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
				if value.Name == arg1 then
					if not value.Cooldown then
						DBM.AddOns.Loatheb.Healers[index].Cooldown = 60;
						if DBM.AddOns.Loatheb.HealersSorted then
							local nextHealer, nextHealerID, soonHealer, soonHealerID;
							nextHealerID, nextHealer = DBM.AddOns.Loatheb.OnEvent("GetNextHealer", index);
							soonHealerID, soonHealer = DBM.AddOns.Loatheb.OnEvent("GetNextHealer", (DBM.AddOns.Loatheb.OnEvent("GetNextHealer", (DBM.AddOns.Loatheb.OnEvent("GetNextHealer", index)))));
							if nextHealerID and nextHealer then
								if nextHealer == UnitName("player") then
									DBM.AddSpecialWarning(DBM_LOATHEB_YOU_ARE_NEXT, true, true)
								end
								if DBM.AddOns.Loatheb.Options.Announce and DBM.Rank >= 1 then
									if DBM.AddOns.Loatheb.Options.AnnounceHealRaid then
										SendChatMessage(string.format(DBM_LOATHEB_HEAL_WARNING, index, nextHealer), "RAID")
									end
									if DBM.AddOns.Loatheb.Options.AnnounceHealRaidWarning then
										SendChatMessage(string.format(DBM_LOATHEB_HEAL_WARNING, index, nextHealer), "RAID_WARNING")
									end							
									if DBM.AddOns.Loatheb.Options.AnnounceHealWhisper and soonHealer then
										DBM.SendHiddenWhisper(DBM_LOATHEB_YOU_ARE_SOON, soonHealer);
										DBM.SendHiddenWhisper(DBM_LOATHEB_YOU_ARE_NEXT, nextHealer);
									end
								end
								
								if not DBMLoathebArrowRight then
									local arrowRight, arrowRightTexture;
									arrowRight = CreateFrame("Frame", "DBMLoathebArrowRight", DBMLoathebFrameDrag);
									arrowRight:SetWidth(32);
									arrowRight:SetHeight(32);
									arrowRightTexture = arrowRight:CreateTexture("DBMLoathebArrowRightTexture", "BACKGROUND");
									arrowRightTexture:SetTexture("Interface\\AddOns\\DBM_API\\Textures\\Arrow-Right.tga");
									arrowRightTexture:SetBlendMode("ALPHAKEY");
									arrowRightTexture:SetAllPoints(arrowRight);
								elseif not DBMLoathebArrowRight:IsShown() then
									DBMLoathebArrowRight:Show();
								end							
								
								DBMLoathebArrowRight:ClearAllPoints();
								if getglobal("DBMLoathebHealerFrame"..nextHealerID) then
									DBMLoathebArrowRight:SetPoint("RIGHT", "DBMLoathebHealerFrame"..nextHealerID, "LEFT", 0, 0);
									local i = 1;
									while getglobal("DBMLoathebHealerFrame"..i.."BarBorder") do
										getglobal("DBMLoathebHealerFrame"..i.."BarBorder"):SetNormalTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorder");
										i = i + 1;
									end
									getglobal("DBMLoathebHealerFrame"..nextHealerID.."BarBorder"):SetNormalTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorderHighlight");
									DBMLoathebFrameDrag.ArrowPosition = nextHealerID;
									DBM.Schedule(35, "DBM.AddOns.Loatheb.OnEvent", "HideArrow", nextHealerID);
								end
							end
						end
					end
					break;
				end
			end
		elseif event == "HideArrow" and DBMLoathebFrameDrag.ArrowPosition then
			getglobal("DBMLoathebHealerFrame"..arg1.."BarBorder"):SetNormalTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorder");
			if DBMLoathebArrowRight and DBMLoathebFrameDrag.ArrowPosition == arg1 then
				DBMLoathebArrowRight:Hide();
			end
		elseif event == "UpdateHealerFrame" and arg1 then
			for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
				if type(DBM.AddOns.Loatheb.Healers[index].Cooldown) == "number" then
					DBM.AddOns.Loatheb.Healers[index].Cooldown = DBM.AddOns.Loatheb.Healers[index].Cooldown - arg1;
					if DBM.AddOns.Loatheb.Healers[index].Cooldown <= 0 then
						DBM.AddOns.Loatheb.Healers[index].Cooldown = false;
					end
				end
			end
			for index, value in pairs(DBM.AddOns.Loatheb.SpamProt) do
				if type(DBM.AddOns.Loatheb.SpamProt[index]) == "number" then
					DBM.AddOns.Loatheb.SpamProt[index] = DBM.AddOns.Loatheb.SpamProt[index] - arg1;
					if DBM.AddOns.Loatheb.SpamProt[index] <= 0 then
						DBM.AddOns.Loatheb.SpamProt[index] = false;
					end
				end
			end
			if DBMLoathebFrameDrag:IsShown() then
				local unitIDs = {};
				local i = arg1 + 1;
				for i = 1, GetNumRaidMembers() do
					if UnitClass("raid"..i) == DBM_PRIEST or UnitClass("raid"..i) == DBM_PALADIN or UnitClass("raid"..i) == DBM_DRUID or UnitClass("raid"..i) == DBM_SHAMAN then
						unitIDs[UnitName("raid"..i)] = "raid"..i;
					end
				end
				if table.getn(DBM.AddOns.Loatheb.Healers) == 0 then
					DBM.AddOns.Loatheb.OnEvent("RAID_ROSTER_UPDATE");
				end
				local frameID = 0;
				for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
					frameID = frameID + 1;
					local frame = getglobal("DBMLoathebHealerFrame"..frameID);
					local frameName = getglobal("DBMLoathebHealerFrame"..frameID.."BarName");
					local frameCooldown = getglobal("DBMLoathebHealerFrame"..frameID.."BarCooldown");
					local frameSpark = getglobal("DBMLoathebHealerFrame"..frameID.."BarSpark");
					local frameBar = getglobal("DBMLoathebHealerFrame"..frameID.."Bar");					
					if frame then
						frameName:SetText(value.Name.." ("..value.Class..")");
						if value.Name == UnitName("player") then
							frameName:SetTextColor(0, 0.82, 1);
							frameCooldown:SetTextColor(0, 0.82, 1);
						else
							frameName:SetTextColor(1, 0.82, 0);
							frameCooldown:SetTextColor(1, 0.82, 0);
						end
						if UnitIsDeadOrGhost(unitIDs[value.Name]) or not UnitIsConnected(unitIDs[value.Name]) then
							if UnitIsDeadOrGhost(unitIDs[value.Name]) then
								frameCooldown:SetText(DBM_DEAD);
							elseif not UnitIsConnected(unitIDs[value.Name]) then
								frameCooldown:SetText(DBM_OFFLINE);
							end
							frameBar:SetValue(0);
							frameSpark:Hide();							
							frame:SetAlpha(0.5);
						else
							frame:SetAlpha(1);
							if type(value.Cooldown) == "number" and value.Cooldown > 0 then
								frameCooldown:SetText(DBM.SecondsToTime(value.Cooldown));
								frameBar:SetValue(value.Cooldown);						
								frameSpark:ClearAllPoints();
								frameSpark:SetPoint("CENTER", frameBar, "LEFT", ((frameBar:GetValue() / 60) * frameBar:GetWidth()), 0);
								frameSpark:Show();
							else
								frameCooldown:SetText(DBM_LOATHEB_NO_CD);
								frameBar:SetValue(0);
								frameSpark:Hide();
							end
						end
					end
					if DBMLoathebFrameDrag.ConfigMode then
						local editBox;
						if not getglobal("DBMLoathebHealerFrame"..frameID.."EditBox") then
							CreateFrame("Frame", "DBMLoathebHealerFrame"..frameID.."EditBox", DBMLoathebFrameDrag, "DBMLoathebEditBoxTemplate")
						end
						editBox = getglobal("DBMLoathebHealerFrame"..frameID.."EditBox");
						editBox:SetID(frameID);
						editBox:SetPoint("LEFT", "DBMLoathebHealerFrame"..frameID, "RIGHT", -4, 0);
						editBox:Show();
						if not DBMLoathebButton:IsShown() then
							local i = 1;
							while getglobal("DBMLoathebHealerFrame"..i) do
								i = i + 1;
							end
							i = i - 1;
							DBMLoathebButton:ClearAllPoints()
							DBMLoathebButton:SetPoint("TOP", "DBMLoathebHealerFrame"..i, "BOTTOM", 0, 0);
							DBMLoathebButton:Show();
						end
					end
				end
			end
		end
	end,
	["OnCombatEnd"] = function()
		DBM.AddOns.Loatheb.InCombat = false;
		DBM.AddOns.Loatheb.CountSpore = 0;
		DBM.AddOns.Loatheb.DoomCounter = 0;
		DBM.AddOns.Loatheb.CastingDoom = false;				
		if DBM.AddOns.Loatheb.AutoShown then
			DBMLoathebFrameDrag:Hide();
		end
		DBM.AddOns.Loatheb.AutoShown = false;
		for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
			if getglobal("DBMLoathebHealerFrame"..index.."BarBorder") then
				getglobal("DBMLoathebHealerFrame"..index.."BarBorder"):SetNormalTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorder");
			end
		end	
		if DBMLoathebArrowRight then
			DBMLoathebArrowRight:Hide();
		end
	end,
	["InitializeMenu"] = function()
		local info = {};
		info.text = DBM_LOATHEB_LOATHEB;
		info.notClickable = 1;
		info.isTitle = 1;
		info.notCheckable = 1;
		UIDropDownMenu_AddButton(info, 1);
		
		local info = {};
		info.text = DBM_LOATHEB_LOCK;
		info.value = DBM.AddOns.Loatheb.Options.FrameLocked;
		info.func = function() DBM.AddOns.Loatheb.Options.FrameLocked = not DBM.AddOns.Loatheb.Options.FrameLocked; end;
		info.checked = DBM.AddOns.Loatheb.Options.FrameLocked;
		info.keepShownOnClick = 1;
		UIDropDownMenu_AddButton(info, 1);
		local info = {};
		info.text = DBM_CLOSE;
		info.func = function() DBMLoathebFrameDrag.ConfigMode = false; DBMLoathebFrameDrag:Hide() end;
		info.notCheckable = 1;
		UIDropDownMenu_AddButton(info, 1);
	end,
	["DeleteDeletedHealers"] = function() --need recursive function
		for index, value in pairs(DBM.AddOns.Loatheb.Healers) do
			if value and value.Sort == 0 then
				DBM.AddOns.Loatheb.DeletedHealers[value.Name] = true;
				table.remove(DBM.AddOns.Loatheb.Healers, index);
				DBM.AddOns.Loatheb.DeleteDeletedHealers(); --because we can't iterate over a table and delete stuff in it while iterating over it...
				break;
			elseif value and value.Sort ~= 0 and DBM.AddOns.Loatheb.DeletedHealers[value.Name] then
				DBM.AddOns.Loatheb.DeletedHealers[value.Name] = nil;
			end
		end
	end
};
