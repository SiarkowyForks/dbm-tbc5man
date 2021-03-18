local tbcCthun = DBM:NewBossMod("AQTBC", DBM_CTHUN_T65_NAME, DBM_AQ40_DESCRIPTION, DBM_ZONE_AQ40, "TBC5ManTab", 7)

tbcCthun.Version = "1.0"
tbcCthun.Author = "Jannik"
tbcCthun.MinRevision = 1000

local random = math.random

--------------------------------------------------------------------------------

tbcCthun:AddOption("WarnFankrissBreath", true, DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)


--------------------------------------------------------------------------------

--tbcCthun:AddBarOption("Fankriss Breath")

--------------------------------------------------------------------------------

tbcCthun:RegisterEvents(
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_DAMAGE",
	"SPELL_SUMMON",
	"SWING_DAMAGE",
	"SWING_MISSED",
	"UNIT_DIED"
)

tbcCthun:RegisterCombat("COMBAT");

--------------------------------------------------------------------------------

function tbcCthun:OnCombatStart(delay)
	--self:Announce("Cthun fight started, glhf")
	self.Fankriss = 0
	self.Princess = 0
end

function tbcCthun:OnEvent(event, arg1)

	if event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 40735 then
			self:SendSync("FankrissBreath")
		end

	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("FankrissDown")
		elseif arg1.destName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("PrincessDown")
		end
	end
end

function tbcCthun:OnSync(msg)

	-- Fankriss
	if msg == "Fankriss" then
		self.Fankriss = 1
		
	elseif msg == "FankrissDown" then
		self.Fankriss = 2

	elseif msg == "WarnFankrissBreath" then 
		if self.Options.WarnFankrissBreath then
			self:Announce(DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)
		end

	-- Princess
	elseif msg == "Broodlord" then
		self.Princess = 1
	elseif msg == "PrincessDown" then
		self.Princess = 2
	end

end
