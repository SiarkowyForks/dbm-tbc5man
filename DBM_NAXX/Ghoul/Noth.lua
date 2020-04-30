--
-- La Vendetta Noth the Plaguebringer Raid Warning AddOn
-- (c) by Nitram from La Vendetta on DE-Azshara
--
-- Edited Hye/Ajaaja of Kilrogg (first blink timer and spawn warning during balcony phase) - thank you!

local BossMod = DBM:NewBossMod("Noth", DBM_NTP_NAME, DBM_NTP_DESCRIPTION, DBM_NAXX, DBMGUI_TAB_NAXX, 31);

BossMod.Author 				= "Nitram";
BossMod.Version				= "1.7";
BossMod.MinVersionToSync	= 2.20;
BossMod.Phase				= 1;
BossMod.LastCurse			= 0;
BossMod.TimeOnBalcony		= 70;
BossMod.TimeInRoom			= 90;
BossMod.OnBalcony			= false;


BossMod:AddOption("AnnounceSpawn", false, DBM_NTP_OPTION_WARN_SPAWN)
BossMod:AddOption("AnnounceCurse", true, DBM_NTP_OPTION_WARN_CURSE)

BossMod:RegisterEvents(
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_APPLIED"
)

function BossMod:OnEvent(event, arg1)
	if (event == "CHAT_MSG_MONSTER_YELL" and ((arg1 == DBM_NTP_YELL_START1) 
										or (arg1 == DBM_NTP_YELL_START2) 
										or (arg1 == DBM_NTP_YELL_START3))) 
	  or (event == "BACKINROOM") then

		self.InCombat = true;
		self.OnBalcony = false;					
		if (event == "BACKINROOM") then
			DBM.Announce(string.format(DBM_NTP_BACK_WARNING, self.TimeInRoom));
		else
			self.TimeOnBalcony = 70;
			self.TimeInRoom = 90;
			DBM.Announce(string.format(DBM_NTP_TELEPORT_WARNING, self.TimeInRoom));
			DBM.Schedule(25, "DBM.AddOns.Noth:OnEvent", "NTP5SecWarningBlink");
			DBM.Schedule(30, "DBM.AddOns.Noth:OnEvent", "NTP0SecWarningBlink");
			DBM.StartStatusBarTimer(30, "Blink Cooldown", "Interface\\Icons\\Spell_Arcane_Blink");
		end
		DBM.Schedule((self.TimeInRoom-10), "DBM.AddOns.Noth:OnEvent", "NTP10SecWarningTeleport");
		DBM.Schedule(self.TimeInRoom, "DBM.AddOns.Noth:OnEvent", "NTPGoToBalcony");
		DBM.StartStatusBarTimer(self.TimeInRoom, "Teleport to Balcony", "Interface\\Icons\\Spell_Arcane_Blink");
	end


	if( event == "SPELL_AURA_APPLIED" ) then

		if (self.Options.AnnounceCurse 
		and (time() > (self.LastCurse+10) )
		and arg1.spellId == 29213) then

			self.LastCurse = time();
			DBM.Announce(DBM_NTP_CURSE_WARNING);
			
			DBM.StartStatusBarTimer(9, "Curse Timeout", "Interface\\Icons\\Spell_Shadow_AnimateDead");
		end
	end
	
	if( event == "CHAT_MSG_MONSTER_YELL" and (string.find(arg1, DBM_NTP_ADDS_SPAWN))) and self.Options.AnnounceSpawn then
		DBM.Announce(DBM_NTP_ADD_WARNING);
	end
		
	if (event == "NTP5SecWarningBlink") then							-- Blink System
		DBM.Announce(DBM_NTP_BLINK_5SEC_WARNING);
	elseif (event == "NTP0SecWarningBlink") then
		DBM.Announce(DBM_NTP_BLINK_0SEC_WARNING);	
	elseif (event == "NTP10SecWarningTeleport") then
		DBM.Announce(DBM_NTP_TELEPORT_10SEC_WARNING);				
	elseif (event == "NTP10SECUNTILBACK" ) then
		DBM.Announce(DBM_NTP_BACK_10SEC_WARNING);
	elseif (event == "NTP10SecWarningWave2") then
		DBM.Announce(DBM_NTP_NEXT_WAVE_SOON);
		
	elseif (event == "NTPGoToBalcony" ) then
		self.OnBalcony = true;
		DBM.Schedule((self.TimeOnBalcony-10), "DBM.AddOns.Noth:OnEvent", "NTP10SECUNTILBACK");
		DBM.Schedule(self.TimeOnBalcony, "DBM.AddOns.Noth:OnEvent", "BACKINROOM");
		DBM.StartStatusBarTimer(self.TimeOnBalcony, "Teleport back", "Interface\\Icons\\Spell_Arcane_Blink");
		if (self.TimeOnBalcony == 70 ) then
			self.Phase = 1;
			self.TimeOnBalcony = 95;
			self.TimeInRoom = 110;
			-- Wave1/Wave2 Announce/Scheduling
			DBM.Schedule(30, "DBM.AddOns.Noth:OnEvent", "NTP10SecWarningWave2");
			DBM.StartStatusBarTimer(10, "Wave 1", "Interface\\Icons\\Spell_Shadow_RaiseDead");
			DBM.StartStatusBarTimer(40, "Wave 2", "Interface\\Icons\\Spell_Shadow_RaiseDead");
		elseif (self.TimeOnBalcony == 95) then
			self.Phase = 2;
			self.TimeOnBalcony = 120;
			self.TimeInRoom = 180;
			-- Wave1/Wave2 Announce/Scheduling
			DBM.Schedule(45, "DBM.AddOns.Noth:OnEvent", "NTP10SecWarningWave2");
			DBM.StartStatusBarTimer(10, "Wave 1", "Interface\\Icons\\Spell_Shadow_RaiseDead");
			DBM.StartStatusBarTimer(55, "Wave 2", "Interface\\Icons\\Spell_Shadow_RaiseDead");
		end

		DBM.EndStatusBarTimer("Blink");
		DBM.UnSchedule("DBM.AddOns.Noth:OnEvent", "NTP5SecWarningBlink");
	end
end
