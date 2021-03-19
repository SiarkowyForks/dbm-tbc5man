local tbcCthun = DBM:NewBossMod("AQTBC", DBM_CTHUN_T65_NAME, DBM_AQ40_DESCRIPTION, DBM_ZONE_AQ40, "TBC5ManTab", 7)

tbcCthun.Version = "1.0"
tbcCthun.Author = "Jannik"
tbcCthun.MinRevision = 1000

local random = math.random

--------------------------------------------------------------------------------

--TODO - add options
--tbcCthun:AddOption("WarnFankrissBreath", true, DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)


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

--TODO should be set to be based off a yell, if one existed
function tbcCthun:OnCombatStart(delay)
	self.Fankriss = 0
	self.Princess = 0
end

function tbcCthun:OnEvent(event, arg1, arg2, arg3, arg4, arg5)

	if event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 40735 then
			self:SendSync("WarnFankrissBreath")
		elseif arg1.spellId == 28431 then
			self:SendSync("PrincessPoison"..arg1.destName)
		end
	elseif event == "SPELL_CREATE" then
		if arg1.spellId == 25648 then
			player = arg1.sourceName
			self:SendSync("FankrissTrap"..player)
		end
	elseif event == "SPELL_CAST_START" then
		

	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("FankrissDown")
		elseif arg1.destName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("PrincessDown")
		end

	-- detecting miniboss pull, should work off yells instead
	-- detection not working yet, TODO
	elseif event == "SWING_DAMAGE" or event == "SWING_MISSED" then
		if not self.Fankriss and arg1.sourceName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("Fankriss")
		elseif not self.Princess and arg1.sourceName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("Princess")
		end
	end
end

function tbcCthun:OnSync(msg)


	--
	-- Fankriss
	--
	if msg == "Fankriss" then
		--start/stop events on bosses not working yet, TODO
		self.Fankriss = 1
		self:Announce("Fankriss Started")
	elseif msg == "FankrissDown" then
		self.Fankriss = 2
		self:Announce("Fankriss Down")

	elseif msg == "WarnFankrissBreath" then 
		self:Announce(DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)
	elseif msg:sub(1,12) == "FankrissTrap" then
		player = msg:sub(13)
		self:SetIcon(player, 20);
		self:SendHiddenWhisper("Sand Trap on you!", player)

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
		player = msg:sub(15)
		self:SendHiddenWhisper("You are poisoned! Drop the poison somewhere safe", player)
		self:SetIcon(player, 20);
	
	--can be used for test messages
	elseif msg:sub(1,4) == "test" then
		self:Announce(msg)


	end
end
