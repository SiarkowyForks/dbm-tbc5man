--La Vendetta Grand Widow Faerlina Raid Warning AddOn
-- Edited by Hye of Kilrogg
-- Changes:
--  Removed using Yells to determine enrage, they're used only to determine start of combat
--  Enrage determined from CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
--  Made Enrage timer smart (doesn't get out of sync when embraced before she enrages)

DBM.AddOns.GrandWidowFaerlina = {
	["Name"] = DBM_GWF_NAME,
	["Abbreviation1"] = "Faerlina",
	["Abbreviation2"] = "Widow",
	["Abbreviation3"] = "GWF",
	["Version"] = "1.7",
	["Author"] = "Tandanu",
	["Description"] = DBM_GWF_DESCRIPTION,
	["Instance"] = DBM_NAXX,
	["GUITab"] = DBMGUI_TAB_NAXX,
	["Sort"] = 12,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
	},
	["Enraged"] = false,
	["Events"] = {
		["SPELL_AURA_APPLIED"] = true,
		["CHAT_MSG_ADDON"] = true, 					-- Enrage Sync
	},
	["OnCombatStart"] = function(delay)
		DBM.Announce(string.format(DBM_GWF_ENRAGE_WARNING2, 60));
		DBM.StartStatusBarTimer(54, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");
		DBM.Schedule(39, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 15);
		DBM.Schedule(44, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 10);
		DBM.Schedule(49, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 5);
		DBM.Schedule(54, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 0);
		DBM.AddOns.GrandWidowFaerlina.Enraged = false;
	end,
	["OnEvent"] = function(event, arg1)
		if (event == "CHAT_MSG_ADDON" and arg1 == "LVGWF ENRAGE" and arg2 == "enrage" and arg3 == "RAID") then
			if (not DBM.AddOns.GrandWidowFaerlina.Enraged) then
				DBM.AddOns.GrandWidowFaerlina.Enraged = true;
				DBM.Announce(DBM_GWF_ENRAGE_WARNING1);
				if UnitClass("player") == DBM_PRIEST and DBM.GetBuff("player", DBM_MINDCONTROL) then
					DBM.AddSpecialWarning("Enrage", true, true)
				end
				DBM.EndStatusBarTimer("Enrage");
				DBM.UnSchedule("DBM.AddOns.GrandWidowFaerlina.OnEvent");
			end

		elseif (event == "SPELL_AURA_APPLIED") then
			if arg1.spellId == 28747 then
				DBM.AddOns.GrandWidowFaerlina.Enraged = true;

				SendAddonMessage("LVGWF ENRAGE", "enrage", "RAID");

				DBM.Announce(DBM_GWF_ENRAGE_WARNING1);
				if UnitClass("player") == DBM_PRIEST and DBM.GetBuff("player", DBM_MINDCONTROL) then
					DBM.AddSpecialWarning("Enrage", true, true)
				end
				DBM.EndStatusBarTimer("Enrage");
				DBM.UnSchedule("DBM.AddOns.GrandWidowFaerlina.OnEvent");
			elseif arg1.spellId == 28732 then				
				local tmpEnrageTime
				local timeLeft, timeElapsed = DBM.GetStatusBarTimerTimeLeft("Enrage");
				if not timeLeft then
					timeLeft = 0;
				end
				if DBM.AddOns.GrandWidowFaerlina.Enraged then
					tmpEnrageTime = 54;
				else
					tmpEnrageTime = 30;
				end

				if (timeLeft < tmpEnrageTime) then
					DBM.UnSchedule("DBM.AddOns.GrandWidowFaerlina.OnEvent");
					DBM.EndStatusBarTimer("Enrage");
					DBM.StartStatusBarTimer(tmpEnrageTime, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");

					DBM.Announce(string.format(DBM_GWF_NEXT_ENRAGE_IN, tmpEnrageTime));
					DBM.Schedule(tmpEnrageTime-15, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 15);
					DBM.Schedule(tmpEnrageTime-10, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 10);
					DBM.Schedule(tmpEnrageTime-5, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 5);
					DBM.Schedule(tmpEnrageTime, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EnrageWarning", 0);
				else
					-- Enrage not prevention not prolonged by *this* embrace, so...
					  -- Use enrage timer that is currently going
					  -- Use Scheduled Timers that are currently in place
				end

				DBM.EndStatusBarTimer("Widow's Embrace");
				DBM.StartStatusBarTimer(30, "Widow's Embrace", "Interface\\Icons\\Spell_Arcane_Blink");
				DBM.Schedule(20, "DBM.AddOns.GrandWidowFaerlina.OnEvent", "EmbraceWarning", 10);
				DBM.Announce(string.format(DBM_GWF_EMBRACE_WARNING, 30));
				
				DBM.AddOns.GrandWidowFaerlina.Enraged = false;
			end
		elseif (event == "EmbraceWarning") then
			if arg1 then
				DBM.Announce(string.format(DBM_GWF_EMBRACE_WARNING, arg1));
			end
		elseif (event == "EnrageWarning") then
			if arg1 and arg1 > 0 then
				DBM.Announce(string.format(DBM_GWF_ENRAGE_WARNING2, arg1));
			elseif arg1 == 0 then
				DBM.Announce(DBM_GWF_ENRAGE_CD_READY);
			end
		end
	end,
};
