--
--  Kel'Thuzad - v1.0 by Nitram
-- v1.1 add cooldown timers for some abilities (Diablohu)
-- v2.0 by Siarkowy
--

local Kelt = DBM:NewBossMod("Kelt", DBM_KELTHUZAD_NAME, DBM_KELTHUZAD_INFO, DBM_NAXX, DBMGUI_TAB_NAXX, 52);
Kelt.Author = "Nitram, Diablohu, Siarkowy";
Kelt.Version = "2.0";
Kelt.MinRevision = 1092;

Kelt:AddOption("AnnFrostBlast", true, DBM_KELTHUZAD_OPTION_ANN_FROSTBLAST);
Kelt:AddOption("AnnReflection", true, DBM_KELTHUZAD_OPTION_ANN_REFLECTION);
Kelt:AddOption("AnnFissure", true, DBM_KELTHUZAD_OPTION_ANN_FISSURE);
Kelt:AddOption("AnnDetonate", false, DBM_KELTHUZAD_OPTION_ANN_DETONATE);
Kelt:AddOption("AnnGhoulSoon", true, DBM_KELTHUZAD_OPTION_ANN_GHOUL_SOON);
Kelt:AddOption("WhisperFissure", true, DBM_KELTHUZAD_OPTION_WHISP_FISSURE);
Kelt:AddOption("WhisperDetonate", true, DBM_KELTHUZAD_OPTION_WHISP_DETONATE);
Kelt:AddOption("WarnFissure", true, DBM_KELTHUZAD_OPTION_FISSURE);
Kelt:AddOption("WarnDetonate", false, DBM_KELTHUZAD_OPTION_DETONATE);
Kelt:AddOption("RangeCheck", true, DBM_KELTHUZAD_RANGECHECK);

Kelt:AddBarOption("Enrage");
Kelt:AddBarOption("Phase 2");
Kelt:AddBarOption("Frost Blast CD");
Kelt:AddBarOption("Sinister Reflection");
Kelt:AddBarOption("Exploding Shadow CD");
Kelt:AddBarOption("Shadow Fissure", false);
Kelt:AddBarOption("Void Blast");
Kelt:AddBarOption("Detonate Mana");

Kelt:RegisterCombat("YELL", DBM_KELTHUZAD_PHASE1_EXPR);

Kelt:RegisterEvents(
	"CHAT_MSG_MONSTER_EMOTE",
	"CHAT_MSG_MONSTER_YELL",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED"
);

local LastFrostBlast = 0;

function Kelt:OnCombatStart(delay)
	LastFrostBlast = 0;

	self:StartStatusBarTimer(722 - delay, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");
	self:ScheduleAnnounce(722 - 180 - delay, DBM_GENERIC_ENRAGE_WARN:format(3, DBM_MIN), 1);
	self:ScheduleAnnounce(722 -  60 - delay, DBM_GENERIC_ENRAGE_WARN:format(1, DBM_MIN), 3);
	self:ScheduleAnnounce(722 -  30 - delay, DBM_GENERIC_ENRAGE_WARN:format(30, DBM_SEC), 4);
end

function Kelt:OnCombatEnd()
	DBM_Gui_DistanceFrame_Hide();
end

function Kelt:OnSync(msg)
	if msg == "Phase1" then
		self:Announce(DBM_KELTHUZAD_PHASE1_ANNOUNCE, 2);
		self:ScheduleAnnounce(152, DBM_KELTHUZAD_PHASE2_SOON_ANNOUNCE, 1);
		self:StartStatusBarTimer(162, "Phase 2", "Interface\\Icons\\Spell_Ice_Lament"); -- 160

	elseif msg == "Phase2" then
		self:Announce(DBM_KELTHUZAD_PHASE2_ANNOUNCE, 2);
		self:EndStatusBarTimer("Phase 2");
		self:StartStatusBarTimer(30, "Frost Blast CD", "Interface\\Icons\\Spell_Frost_FreezingBreath");
		if self.Options.AnnFrostBlast then
			self:ScheduleAnnounce(25, DBM_KELTHUZAD_FROSTBLAST_SOON, 1);
		end
		self:StartStatusBarTimer(60, "Sinister Reflection", "Interface\\Icons\\Spell_Nature_Invisibilty");
		if self.Options.AnnReflection then
			self:ScheduleAnnounce(55, DBM_KELTHUZAD_REFLECTION_SOON, 1);
		end
		self:StartStatusBarTimer(25, "Exploding Shadow CD", "Interface\\Icons\\Ability_Creature_Cursed_02");
		if self.Options.AnnGhoulSoon then
			self:ScheduleAnnounce(25, DBM_KELTHUZAD_GHOUL_SOON, 1);
		end
		if self.Options.RangeCheck then
			DBM_Gui_DistanceFrame_Show();
		end
		
	elseif msg == "Phase3" then
		self:Announce(DBM_KELTHUZAD_PHASE3_ANNOUNCE, 2);
		
	elseif msg == "Reflection" then
		self:StartStatusBarTimer(60, "Sinister Reflection", "Interface\\Icons\\Spell_Nature_Invisibilty");
		if self.Options.AnnReflection then
			self:Announce(DBM_KELTHUZAD_REFLECTION_ANNOUNCE, 3);
			self:ScheduleAnnounce(55, DBM_KELTHUZAD_REFLECTION_SOON, 1);
		end
		
	elseif msg == "Ghoul" then
		self:StartStatusBarTimer(25, "Exploding Shadow CD", "Interface\\Icons\\Ability_Creature_Cursed_02");
		if self.Options.AnnGhoulSoon then
			self:ScheduleAnnounce(25, DBM_KELTHUZAD_GHOUL_SOON, 1);
		end

	elseif msg:sub(0,7) == "Fissure" then
		msg = msg:sub(8);
		self:StartStatusBarTimer(10, "Shadow Fissure", 27810);
		if self.Options.AnnFissure then
			self:Announce(DBM_KELTHUZAD_FISSURE_ANNOUNCE:format(msg), 3);
		end
		if msg == UnitName("player") then
			if self.Options.WarnFissure then
				self:AddSpecialWarning(DBM_KELTHUZAD_FISSURE_WARN);
			end
			self:StartStatusBarTimer(4, "Void Blast", 27812, true);
		elseif self.Options.WhisperFissure and self.Options.Announce and DBM.Rank >= 1 then
			self:SendHiddenWhisper(DBM_KELTHUZAD_FISSURE_WARN, msg);
		end
		
	elseif msg:sub(0,5) == "Blast" then
		msg = msg:sub(6);
		LastFrostBlast = time();
		if self.Options.AnnFrostBlast then
			self:Announce(DBM_KELTHUZAD_FROSTBLAST_ANNOUNCE:format(msg), 4);
			self:ScheduleAnnounce(35, DBM_KELTHUZAD_FROSTBLAST_SOON, 1);
		end
		self:StartStatusBarTimer(40, "Frost Blast CD", "Interface\\Icons\\Spell_Frost_FreezingBreath");
		
	elseif msg:sub(0,8) == "Detonate" then
		msg = msg:sub(9);
		if self.Options.AnnDetonate then
			self:Announce(DBM_KELTHUZAD_DETONATE_ANNOUNCE:format(msg), 1);
		end
		if msg == UnitName("player") then
			if self.Options.WarnDetonate then
				self:AddSpecialWarning(DBM_KELTHUZAD_DETONATE_SELFWARN);
			end
			self:StartStatusBarTimer(5, "Detonate Mana", "Interface\\Icons\\Spell_Nature_WispSplode", true);
		elseif self.Options.WhisperDetonate and self.Options.Announce and DBM.Rank >= 1 then
			self:SendHiddenWhisper(DBM_KELTHUZAD_DETONATE_WHISPER, msg);
		end
	end
end

function Kelt:OnEvent(event, arg1)
	if event == "CHAT_MSG_MONSTER_YELL" or event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		if arg1 == DBM_KELTHUZAD_PHASE1_EXPR then
			self:SendSync("Phase1");
		elseif arg1 == DBM_KELTHUZAD_PHASE2_EXPR1 or arg1 == DBM_KELTHUZAD_PHASE2_EXPR2 or arg1 == DBM_KELTHUZAD_PHASE2_EXPR3 then
			self:SendSync("Phase2");
		elseif arg1 == DBM_KELTHUZAD_GHOUL_EXPR then
			self:SendSync("Ghoul");
		elseif arg1 == DBM_KELTHUZAD_PHASE3_EMOTE then
			self:SendSync("Phase3");
		end
	elseif event == "SPELL_CAST_SUCCESS" then
		if arg1.spellId == 45892 then
			self:SendSync("Reflection");
		elseif arg1.spellId == 27810 then
			self:SendSync("Fissure"..tostring(arg1.destName));
		elseif arg1.spellId == 27808 and (time() - LastFrostBlast > 2) then
			self:SendSync("Blast"..tostring(arg1.destName));
		elseif arg1.spellId == 27819 then
			self:SendSync("Detonate"..tostring(arg1.destName));
		end
	end
end

function Kelt:Test()
	self:OnCombatStart(0);
	self:OnSync("Phase1");
	self:Schedule(2, function()
		self:OnSync("Phase2");
	end)
	self:Schedule(4, function()
		self:OnSync("Reflection");
		self:OnSync("Ghoul");
		self:OnSync("Fissure"..UnitName("player"));
		self:OnSync("Blast"..UnitName("player"));
		self:OnSync("Detonate"..UnitName("player"));
	end)
	self:Schedule(6, function()
		self:OnSync("Phase3");
	end)
	self:Schedule(8, function()
		self:OnCombatEnd();
	end)
end
