local Ysondre = DBM:NewBossMod("Ysondre", DBM_YSONDRE_NAME, DBM_YSONDRE_DESCRIPTION, DBM_ZONE_VERDANT_FIELDS, "TBC5ManTab", 3)

Ysondre.Version = "1.0"
Ysondre.Author = "Siarkowy"
Ysondre.MinRevision = 1097

Ysondre:AddOption("WarnMushroom", true, DBM_YSONDRE_OPTION_MUSHROOM_SOON)
Ysondre:AddOption("WarnElks", true, DBM_YSONDRE_OPTION_ELKS_SOON)

Ysondre:AddBarOption("Towering Mushroom")
Ysondre:AddBarOption("Weakened Elks")
Ysondre:AddBarOption("Elk Enrage")

Ysondre:RegisterEvents(
	"CHAT_MSG_RAID_BOSS_EMOTE"
)

Ysondre:RegisterCombat("YELL", DBM_YSONDRE_YELL_PULL)

function Ysondre:Test()
	self:OnCombatStart(0)

	self:ScheduleMethod(40, "SendSync", "Mushroom")
	self:ScheduleMethod(60, "SendSync", "Elks")
end

function Ysondre:OnCombatStart(delay)
	self:StartStatusBarTimer(40 - delay, "Towering Mushroom", [[Interface\Icons\Spell_Nature_NatureGuardian]])
	self:StartStatusBarTimer(60 - delay, "Weakened Elks", [[Interface\Icons\Spell_Holy_Renew]])

	self:ScheduleEvent(35 - delay, "WarnMushroom")
	self:ScheduleEvent(55 - delay, "WarnElks")
end

function Ysondre:OnEvent(event, arg1)
	if event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		if arg1 == DBM_YSONDRE_EMOTE_MUSHROOM then
			self:SendSync("Mushroom")
		elseif arg1 == DBM_YSONDRE_EMOTE_ELKS then
			self:SendSync("Elks")
		end

	elseif event == "WarnMushroom" then
		if self.Options.WarnMushroom then
			self:Announce(DBM_YSONDRE_WARN_MUSHROOM_SOON)
		end

	elseif event == "WarnElks" then
		if self.Options.WarnElks then
			self:Announce(DBM_YSONDRE_WARN_ELKS_SOON)
		end
	end
end

function Ysondre:OnSync(msg)
	if msg == "Mushroom" then
		self:StartStatusBarTimer(40, "Towering Mushroom", [[Interface\Icons\Spell_Nature_NatureGuardian]])
		self:ScheduleEvent(35, "WarnMushroom")
		-- no announce

	elseif msg == "Elks" then
		self:StartStatusBarTimer(15, "Elk Enrage", [[Interface\Icons\Spell_Shadow_UnholyFrenzy]])
		self:StartStatusBarTimer(60, "Weakened Elks", [[Interface\Icons\Spell_Holy_Renew]])
		self:ScheduleEvent(55, "WarnElks")
		-- no announce
	end
end
