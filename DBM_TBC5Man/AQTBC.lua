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
	"SPELL_AURA_REFRESH",
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

tbcCthun:RegisterCombat("COMBAT", 5, DBM_CTHUN_T65_NAME);

--------------------------------------------------------------------------------

--
-- C'Thun
--
local function cThunPhaseStart(self)
	self:Announce("C'Thun phase "..self.CThunPhase.." started")
	--TODO remove this when combat start is figured out with a yell
	delay = 0
	if  self.CThunPhase == 1 then
		delay = 5
	end

	-- show distance
	DBM_Gui_DistanceFrame_Show()
	DBM_Gui_DistanceFrame_SetDistance(10);

	-- start tentacle & dark glare timer
	self:StartStatusBarTimer((16 - delay), "Tentacles", "Interface\\Icons\\spell_shadow_siphonmana");
	self:StartStatusBarTimer((25 - delay), "Dark Glare", "Interface\\Icons\\spell_shadow_unholyfrenzy");
	if self.CThunPhase >= 2 then
		-- fankriss killed
		-- add small bug timer
	end
	if self.CThunPhase >= 3 then
		-- princess killed
		-- add large bug timer
	end
	if self.CThunPhase >= 4 then
		-- stomach killed
		-- unknown
	end
end

local function cThunPhaseEnd(self)
	-- clear all cthun timers
	DBM_Gui_DistanceFrame_Hide();
	-- self:EndStatusBarTimer("Next Fire Nova")
	-- self:UnScheduleEvent("WarnNova")
	--reset distance frame to default of 10, copied from gruuls.lua
	DBM_Gui_DistanceFrame_SetDistance(10);
end

--TODO should be set to be based off a yell, if one existed
function tbcCthun:OnCombatStart(delay)
	-- 0 if miniboss hasnt been encountered, 1 if active, 2 if dead
	self.Fankriss = 0
	self.Princess = 0
	self.Stomach = 0
	-- tracks phase 1-4 of cthun
	self.CThunPhase = 1
	-- 1 if cthun is active, else 0
	self.CThunActive = 1

	cThunPhaseStart(self)
end
function tbcCthun:OnCombatEnd()
	-- clean up, set all variables to default
	self.Fankriss = 0
	self.Princess = 0
	self.Stomach = 0
	self.CThunPhase = 1
	self.CThunActive = 1
	DBM_Gui_DistanceFrame_Hide();
	DBM_Gui_DistanceFrame_SetDistance(10);
end

function tbcCthun:OnEvent(event, arg1, arg2, arg3, arg4, arg5)
	if event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 40735 then
			self:SendSync("WarnFankrissBreath")
		elseif arg1.spellId == 28431 then
			self:SendSync("PrincessPoison"..arg1.destName)
		end
	elseif event == "SPELL_AURA_REFRESH" then
		if arg1.spellId == 28431 then
			--drop a poison and reapply  warning
			self:SendSync("PrincessPoisonDrop"..arg1.destName)
			self:SendSync("PrincessPoison"..arg1.destName)
		end
	elseif event == "SPELL_AURA_REMOVED" then
		if arg1.spellId == 28431 then
			self:SendSync("PrincessPoisonDrop"..arg1.destName)
		end
	elseif event == "SPELL_CREATE" then
		if arg1.spellId == 25648 then
			player = arg1.sourceName
			self:SendSync("FankrissTrap"..player)
		end
	elseif event == "SPELL_CAST_START" then
		-- currently starts next poison rain timer from shield bug cast
		if arg1.spellId == 44475 then
			self.SendSync("PrincessPoisonRain")

	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("FankrissDown")
		elseif arg1.destName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("PrincessDown")
		elseif arg1.destName == DBM_CTHUN_T65_STOMACH_NAME then
			self:SendSync("StomachDown")
		end

	-- detecting miniboss pull, should work off yells instead
	-- detection not working yet, TODO
	elseif event == "SWING_DAMAGE" or event == "SWING_MISSED" then
		if self.Fankriss == 0 and arg1.sourceName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("Fankriss")
		elseif self.Princess == 0 and arg1.sourceName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("Princess")
		elseif self.Stomach == 0 and arg1.sourceName == DBM_CTHUN_T65_STOMACH_NAME then
			self:SendSync("Stomach")
		end
	end

end

function tbcCthun:OnSync(msg)

	--
	-- Fankriss
	--
	if msg == "Fankriss" then
		--set  fankriss to active, deactive cthun
		self.Fankriss = 1
		self.CThunActive = 0
		cThunPhaseEnd(self)

		--start initial  timers
		self:StartStatusBarTimer(20, "Breath", "Interface\\Icons\\spell_nature_lightning");
		self:StartStatusBarTimer(10, "Sand Trap", "Interface\\Icons\\spell_nature_earthshock");

		--deleteme, testing only
		self:Announce("Fankriss Started")
	elseif msg == "FankrissDown" then
		--set fankriss to dead, activate cthun phase 2
		self.Fankriss = 2
		self.CThunPhase = 2
		self.CThunActive = 1
		cThunPhaseStart(self)

		--deleteme, testing only
		self:Announce("Fankriss Down")

	elseif msg == "WarnFankrissBreath" then 
		self:Announce(DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)
		self:StartStatusBarTimer(25, "Breath", "Interface\\Icons\\spell_nature_lightning");
	elseif msg:sub(1,12) == "FankrissTrap" then
		player = msg:sub(13)
		
		self:StartStatusBarTimer(25, "Sand Trap", "Interface\\Icons\\spell_nature_earthshock");
		self:SendHiddenWhisper("Sand Trap on you!", player)
		if UnitName("player") == player then
			PlaySoundFile("Sound\\Spells\\PVPFlagTaken.wav"); 
			SendChatMessage("Sand Trap on me!", "SAY")
			self:AddSpecialWarning("Sand Trap!")
		end

	--
	-- Princess
	--
	elseif msg == "Princess" then
		-- princess started, clear cthun
		self.Princess = 1
		self.CThunActive = 0
		self:Announce("Princess Started")
		cThunPhaseEnd(self)

		self:StartStatusBarTimer(30, "Poison Rain", "Interface\\Icons\\spell_nature_nullifydisease");

	elseif msg == "PrincessDown" then
		-- princess killed, start cthun
		self.Princess = 2
		self.CThunPhase = 3
		self.CThunActive = 1
		cThunPhaseStart(self)

		--deleteme, testing only
		self:Announce("Princess Down")

	elseif msg:sub(1,14) == "PrincessPoison" then
		player = msg:sub(15)
		self:SendHiddenWhisper("You are poisoned! Drop the poison somewhere safe", player)
		if UnitName("player") == player then
			self:AddSpecialWarning("Poisoned!")
		end

	elseif msg:sub(1,18) == "PrincessPoisonDrop" then
		player = msg:sub(19)
		if UnitName("player") == player then
			SendChatMessage("Dropped poison", "SAY")
		end		
	elseif msg == "PrincessPoisonRain" then
		self:StartStatusBarTimer(30, "Poison Rain", "Interface\\Icons\\spell_nature_nullifydisease");

	--
	-- TODO Stomach
	--
	elseif msg == "Stomach" then
		self.Stomach = 1
		self.CThunActive = 0
		self:Announce("Stomach Started")
	elseif msg == "StomachDown" then
		self.Stomach = 2
		self.CThunPhase = 4
		self.CThunActive = 1

		--deleteme, testing only
		self:Announce("Stomach Down")

	--
	-- TODO C'Thun
	--

	end
end

