--
--  La Vendetta BossMod for Patchwerk v1.2
--
--  v1.0 Based on Tandanus Enrage Timer
--  v1.1 Modified version with HFS Announce
--  v1.2 Modified version by Nitram 
--  v1.3 Modified version by Nitram - bugfix Druid HFS

DBM.AddOns.Patchwerk = {
	["Name"] = DBM_PW_NAME,
	["Abbreviation1"] = "pw",
	["Version"] = "1.2",
	["Author"] = "La Vendetta|Nitram",
	["Description"] = DBM_PW_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 41,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["HatefulStrike"] = true,
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "DBM.AddOns.Patchwerk.Options.HatefulStrike",
			["text"] = DBM_PW_OPTION1,
			["func"] = function() DBM.AddOns.Patchwerk.Options.HatefulStrike = not DBM.AddOns.Patchwerk.Options.HatefulStrike; end,
		},
		[2] = {
			["variable"] = "false",
			["notCheckable"] = 1,
			["text"] = DBM_PW_OPTION2,
			["func"] = function() DBM.AddOns.Patchwerk.OnSlashCommand("stats"); end,
		},
	},
	["SlashCmdHelpText"] = {
		[1] = "/patchwerk stats - shows statistics for the last fight",
	},
	["Stats"] = {
		["damage"] = 0,
		["max"] = {
			["damage"] = 0,
			["target"] = "",
		},
		["hitsPerPlayer"] = {
		},
		["strikes"] = 0,
		["hits"] = 0,
		["misses"] = 0,
		["parries"] = 0,
		["dodges"] = 0,
	},
	["Events"] = {
		["CHAT_MSG_MONSTER_YELL"] = true,
		["SPELL_DAMAGE"] = true,
		["SPELL_MISSED"] = true,
	},
	["OnSlashCommand"] = function(msg)
		if string.lower(msg) == "stats" then
			if DBM.AddOns.Patchwerk.Stats.strikes > 0 then
				SendChatMessage(DBM_PWSTATS_STATS , "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_STRIKES, DBM.AddOns.Patchwerk.Stats.strikes, (DBM.AddOns.Patchwerk.Stats.strikes/DBM.AddOns.Patchwerk.Stats.strikes)*100), "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_HITS, DBM.AddOns.Patchwerk.Stats.hits, (DBM.AddOns.Patchwerk.Stats.hits/DBM.AddOns.Patchwerk.Stats.strikes)*100), "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_DODGES, DBM.AddOns.Patchwerk.Stats.dodges, (DBM.AddOns.Patchwerk.Stats.dodges/DBM.AddOns.Patchwerk.Stats.strikes)*100), "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_PARRIES, DBM.AddOns.Patchwerk.Stats.parries, (DBM.AddOns.Patchwerk.Stats.parries/DBM.AddOns.Patchwerk.Stats.strikes)*100), "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_MISSES, DBM.AddOns.Patchwerk.Stats.misses, (DBM.AddOns.Patchwerk.Stats.misses/DBM.AddOns.Patchwerk.Stats.strikes)*100), "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_AVG_DMG, DBM.AddOns.Patchwerk.Stats.damage/DBM.AddOns.Patchwerk.Stats.hits), "RAID");
				SendChatMessage(string.format(DBM_PWSTATS_MAX_HIT, DBM.AddOns.Patchwerk.Stats.max.damage, DBM.AddOns.Patchwerk.Stats.max.target), "RAID");
				local hitsPerPlayer = {};
				for index, value in pairs(DBM.AddOns.Patchwerk.Stats.hitsPerPlayer) do
					if type(value) == "table" then
						table.insert(hitsPerPlayer, {["hits"] = value.hits, ["strikes"] = value.strikes, ["name"] = index});
					end
				end				
				table.sort(hitsPerPlayer, function(v1, v2) return v1.strikes > v2.strikes end);
				
				for index, value in pairs(hitsPerPlayer) do
					if value.hits > 2 then
						SendChatMessage(string.format(DBM_PWSTATS_PER_PLAYER, value.strikes, value.name, value.hits), "RAID");
					end
				end
			else
				DBM.AddMsg(DBM_PWSTATS_NOT_AVAILABLE);
			end
			return true;
		end
	end,
	["OnEvent"] = function(event, arg1)
		if (event == "CHAT_MSG_MONSTER_YELL") then
			if (arg1 == DBM_PW_YELL_1) or (arg1 == DBM_PW_YELL_2) then
				DBM.Announce(string.format(DBM_PW_ENRAGE_WARNING, 7, DBM_MINUTES));
				DBM.Schedule(120, "DBM.AddOns.Patchwerk.OnEvent", "EnrageWarning", 300);
				DBM.Schedule(240, "DBM.AddOns.Patchwerk.OnEvent", "EnrageWarning", 180);
				DBM.Schedule(360, "DBM.AddOns.Patchwerk.OnEvent", "EnrageWarning", 60);
				DBM.Schedule(390, "DBM.AddOns.Patchwerk.OnEvent", "EnrageWarning", 30);
				DBM.Schedule(405, "DBM.AddOns.Patchwerk.OnEvent", "EnrageWarning", 15);
				DBM.Schedule(420, "DBM.AddOns.Patchwerk.OnEvent", "EnrageWarning", 0);				
				DBM.StartStatusBarTimer(420, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");
				DBM.AddOns.Patchwerk.InCombat = true;
				DBM.AddOns.Patchwerk.Stats = {
					["damage"] = 0,
					["max"] = {
						["damage"] = 0,
						["target"] = "",
					},
					["hitsPerPlayer"] = {
					},
					["strikes"] = 0,
					["hits"] = 0,
					["misses"] = 0,
					["parries"] = 0,
					["dodges"] = 0,
				};
			end

		elseif (event == "EnrageWarning") then
			if arg1 == 300 then
				DBM.Announce(string.format(DBM_PW_ENRAGE_WARNING, 5, DBM_MINUTES));
			elseif arg1 == 180 then
				DBM.Announce(string.format(DBM_PW_ENRAGE_WARNING, 3, DBM_MINUTES));
			elseif arg1 == 60 then
				DBM.Announce(string.format(DBM_PW_ENRAGE_WARNING, 1, DBM_MINUTE));
			elseif arg1 == 30 then
				DBM.Announce(string.format(DBM_PW_ENRAGE_WARNING, 30, DBM_SECONDS));
			elseif arg1 == 15 then
				DBM.Announce(string.format(DBM_PW_ENRAGE_WARNING, 15, DBM_SECONDS));
			end
		elseif event == "SPELL_DAMAGE" and arg1.spellId == 28308 then
			local announceHS = false;
			if DBM.AddOns.Patchwerk.Options.HatefulStrike and DBM.AddOns.Patchwerk.Options.Announce and DBM.Rank >= 1 then
				announceHS = true;
			end
			local _, _, target, damage;
			target = tostring(arg1.destName)
			damage = tonumber(arg1.amount or 0) or 0

			DBM.AddOns.Patchwerk.Stats.strikes = DBM.AddOns.Patchwerk.Stats.strikes + 1;
			DBM.AddOns.Patchwerk.Stats.hits = DBM.AddOns.Patchwerk.Stats.hits + 1;
			DBM.AddOns.Patchwerk.Stats.damage = DBM.AddOns.Patchwerk.Stats.damage + (tonumber(damage) or 0);
			if not DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] then
				DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] = {};
				DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = 0;
				DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].hits = 0;
			end
			DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes + 1;
			DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].hits = DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].hits + 1;
			
			if (tonumber(damage) or 0) > DBM.AddOns.Patchwerk.Stats.max.damage then
				DBM.AddOns.Patchwerk.Stats.max.damage = (tonumber(damage) or 0);
				DBM.AddOns.Patchwerk.Stats.max.target = target;
			end
			if announceHS then
				SendChatMessage(string.format(DBM_PW_HS_ANNOUNCE, target, damage), "RAID");
			end
		elseif event == "SPELL_MISSED" and arg1.spellId == 28308 then
			target = tostring(arg1.destName)
			if arg1.missType == "MISS" then
				DBM.AddOns.Patchwerk.Stats.strikes = DBM.AddOns.Patchwerk.Stats.strikes + 1;
				DBM.AddOns.Patchwerk.Stats.misses = DBM.AddOns.Patchwerk.Stats.misses + 1;
				if not DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] then
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] = {};
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = 0;
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].hits = 0;
				end
				DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes + 1;
				if announceHS then
					SendChatMessage(string.format(DBM_PW_HS_ANNOUNCE, UnitName("player"), DBM_MISS), "RAID");
				end

			elseif arg1.missType == "DODGE" then
				DBM.AddOns.Patchwerk.Stats.strikes = DBM.AddOns.Patchwerk.Stats.strikes + 1;
				DBM.AddOns.Patchwerk.Stats.dodges = DBM.AddOns.Patchwerk.Stats.dodges + 1;
				if not DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] then
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] = {};
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = 0;
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].hits = 0;
				end
				DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes + 1;
				if announceHS then
					SendChatMessage(string.format(DBM_PW_HS_ANNOUNCE, UnitName("player"), DBM_DODGE), "RAID");
				end

			elseif arg1.missType == "PARRY" then
				DBM.AddOns.Patchwerk.Stats.strikes = DBM.AddOns.Patchwerk.Stats.strikes + 1;
				DBM.AddOns.Patchwerk.Stats.parries = DBM.AddOns.Patchwerk.Stats.parries + 1;
				if not DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] then
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target] = {};
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = 0;
					DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].hits = 0;
				end
				DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes = DBM.AddOns.Patchwerk.Stats.hitsPerPlayer[target].strikes + 1;
				if announceHS then
					SendChatMessage(string.format(DBM_PW_HS_ANNOUNCE, UnitName("player"), DBM_PARRY), "RAID");
				end
			end
		end
	end,
};
