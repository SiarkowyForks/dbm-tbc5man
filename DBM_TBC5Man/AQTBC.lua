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
	"SPELL_CREATE",
	"SWING_DAMAGE",
	"SWING_MISSED",
	"UNIT_DIED",
	"UNIT_SPELLCAST_SENT"
)

tbcCthun:RegisterCombat("COMBAT");

--------------------------------------------------------------------------------

function tbcCthun:OnCombatStart(delay)
	--self:Announce("C'Thun fight started, glhf testing")
	self.Fankriss = 0
	self.Princess = 0
end

function tbcCthun:OnEvent(event, arg1, arg2, arg3, arg4, arg5)

	if event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 40735 then
			self:SendSync("FankrissBreath")
		elseif arg1.spellId == 28431 then
			self:SendSync("PrincessPoison"..arg1.destName)
		end
	elseif event == "SPELL_CREATE" then
		if arg1.spellId == 25648 then
			player = 'unknown'
			self:SendSync("FankrissTrap"..player)
		end
	elseif event == "SPELL_CAST_START" then
		

	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("FankrissDown")
		elseif arg1.destName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("PrincessDown")
		end

	elseif event == "UNIT_SPELLCAST_SENT" then
		--arg1 == caster, 2 == spellname, 3== rank, 4 == target


	-- detecting miniboss pull, should work off yells instead
	elseif event == "SWING_DAMAGE" or event == "SWING_MISSED" then
		if not self.Fankriss and arg1.sourceName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("Fankriss")
		elseif not self.Princess and arg1.sourceName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("Princess")
		end
	end
end

function tbcCthun:OnSync(msg)

	if msg:sub(1,12) == "CthunEyeBeam" then
		msg = msg:sub(13)
		self:Announce("Cthun Eye Beam on "..msg)

	elseif msg:sub(1,16) == "TentacleMindFlay" then
		msg = msg:sub(17)
		self:Announce("Tentacle Mind Flay on "..msg)

	--
	-- Fankriss
	--
	elseif msg == "Fankriss" then
		self.Fankriss = 1
		self:Announce("Fankriss Started")
	elseif msg == "FankrissDown" then
		self.Fankriss = 2
		self:Announce("Fankriss Down")

	elseif msg == "WarnFankrissBreath" then 
		if self.Options.WarnFankrissBreath then
			self:Announce(DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)
		end
	elseif msg:sub(1,12) == "FankrissTrap" then
		msg = msg:sub(13)
		self:Announce("Sand Trap on "..msg)

	--
	-- Princess
	--
	elseif msg == "Princess" then
		self.Princess = 1
		self:Announce("Princess Started")
	elseif msg == "PrincessDown" then
		self.Princess = 2
		self:Announce("Princess Down")
	elseif msg:sub(1,14) == "PrincessPoison" then
		target = msg:sub(15)
		self:Announce("Poison Charge on "..target)
		self:SetIcon(target, 20);
	
	--can be used for test messages
	elseif msg:sub(1,4) == "test" then
		self:Announce(msg)


	end
end
