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
	-- TODO let dark glare go for X seconds, then repeat new timers

	

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
	self:EndStatusBarTimer("Tentacles")
	self:EndStatusBarTimer("Dark Glare")
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
		elseif arg1.spellId == 27564 then
			self:SendSync("PrincessReflectionStart")
		elseif arg1.spellId == 25161 then
			self:SendSync("WindWarning")
		end
	elseif event == "SPELL_AURA_REFRESH" then
		if arg1.spellId == 28431 then
			--drop a poison and reapply  warning
			self:SendSync("PrincessPoisonDrop"..arg1.destName)
			self:SendSync("PrincessPoison"..arg1.destName)
		end
	elseif event == "SPELL_AURA_REMOVED" then
		if arg1.spellId == 40735 then
			self:SendSync("WarnFankrissBreathEnd")
		elseif arg1.spellId == 28431 then
			self:SendSync("PrincessPoisonDrop"..arg1.destName)
		elseif arg1.spellId == 27564 then
			self:SendSync("PrincessReflectionEnd")
		end
	elseif event == "SPELL_CREATE" then
		if arg1.spellId == 25648 then
			player = arg1.sourceName
			self:SendSync("FankrissTrap"..player)
		end
	elseif event == "SPELL_CAST_START" then
		
	elseif event == "SPELL_DAMAGE" then
		if arg1.spellId == 26102 then
			player = arg1.destName
			self:SendSync("WarnFankrissBreathHit"..player)
		elseif arg1.spellId == 25656 then
			player = arg1.destName
			self:SendSync("WarnFankrissTrapHit"..player)
		end
	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_CTHUN_T65_FANKRISS_NAME then
			self:SendSync("FankrissDown")
		elseif arg1.destName == DBM_CTHUN_T65_PRINCESS_NAME then
			self:SendSync("PrincessDown")
		elseif arg1.destName == DBM_CTHUN_T65_STOMACH_NAME then
			self:SendSync("StomachDown")
		end

		--deleteme, testing only
		--SendChatMessage(arg1.destName.." Down")

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
		--self:StartStatusBarTimer(20, "Breath", "Interface\\Icons\\spell_nature_lightning")
		--self:StartStatusBarTimer(10, "Sand Trap", "Interface\\Icons\\spell_nature_earthshock")

		--deleteme, testing only
		--self:Announce("Fankriss Started")
	elseif msg == "FankrissDown" then
		--set fankriss to dead, activate cthun phase 2
		self.Fankriss = 2
		self.CThunPhase = 2
		self.CThunActive = 1
		cThunPhaseStart(self)

		self:EndStatusBarTimer("Breath")
		self:EndStatusBarTimer("Sand Trap")

		--deleteme, testing only
		--self:Announce("Fankriss Down")


	elseif msg == "WarnFankrissBreath" then 
		self:Announce(DBM_CTHUN_OPTION_WARN_FANKRISS_BREATH)

		self:EndStatusBarTimer("Next Breath")
		self:StartStatusBarTimer(3, "Incoming Breath", "Interface\\Icons\\spell_nature_lightning")
		
	elseif msg == "WarnFankrissBreathEnd" then 

		self:EndStatusBarTimer("Incoming Breath")
		--self:StartStatusBarTimer(25, "Next Breath cooldown", "Interface\\Icons\\spell_nature_lightning")

	elseif msg:sub(1,21) == "WarnFankrissBreathHit" then 
		--TODO, /rw that player got hit
		player = msg:sub(22)
		self:Announce(player.." was hit by sand blast!")
	elseif msg:sub(1,19) == "WarnFankrissTrapHit" then 
		--TODO /rw that player got it 25656
		player = msg:sub(20)
		--TODO make this not a rw, maybe raid only
		self:Announce(player.." was hit by sand trap!")
	elseif msg:sub(1,12) == "FankrissTrap" then
		player = msg:sub(13)

		--TODO delete icon set once more people have mod
		self:SetIcon(player, 20);
		
		--self:StartStatusBarTimer(25, "Sand Trap", "Interface\\Icons\\spell_nature_earthshock")
		self:SendHiddenWhisper("Sand Trap on you!", player)
		self:StartStatusBarTimer(10, "Sand Trap on "..player, "Interface\\Icons\\spell_nature_nullifydisease")
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
		--self:Announce("Princess Started")
		cThunPhaseEnd(self)

		self:StartStatusBarTimer(60, "Next Poison Barrage", "Interface\\Icons\\spell_shadow_teleport")
		self:StartStatusBarTimer(7, "Shield Bugs Spawning", "Interface\\Icons\\inv_shield_05")

	elseif msg == "PrincessDown" then
		-- princess killed, start cthun
		self.Princess = 2
		self.CThunPhase = 3
		self.CThunActive = 1
		cThunPhaseStart(self)

		self:EndStatusBarTimer("Poison Rain")
		self:EndStatusBarTimer("Summon Guards")
		self:EndStatusBarTimer("Spawn Shield Bugs")


		--deleteme, testing only
		--self:Announce("Princess Down")

	elseif msg:sub(1,14) == "PrincessPoison" then
		player = msg:sub(15)
		self:SendHiddenWhisper("You are poisoned! Drop the poison somewhere safe", player)

		
		self:StartStatusBarTimer(9, "Poisoned: "..player, "Interface\\Icons\\spell_nature_corrosivebreath")

		if UnitName("player") == player then
			self:AddSpecialWarning("Poisoned!")
		end

	elseif msg:sub(1,18) == "PrincessPoisonDrop" then
		player = msg:sub(19)
		-- clear timer from existing
		self:EndStatusBarTimer("Poisoned: "..player)
		if UnitName("player") == player then
			SendChatMessage("Dropped poison", "SAY")
		end		
		
	elseif msg == "PrincessReflectionStart" then
		--start timer for 10 seconds of poison barrage and announce
		self:EndStatusBarTimer("Next Poison Barrage")
		self:StartStatusBarTimer(10, "Poison Barrage", "Interface\\Icons\\spell_nature_nullifydisease")
		self:Announce("Poison Barrage!")
	elseif msg == "PrincessReflectionEnd" then
		--clear timers from poison, set timer for next reflection and shield bugs
		self:EndStatusBarTimer("Poison Barrage")
		self:StartStatusBarTimer(60, "Next Poison Barrage", "Interface\\Icons\\spell_shadow_teleport")
		self:StartStatusBarTimer(7, "Shield Bugs Spawning", "Interface\\Icons\\inv_shield_05")

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
	elseif msg == "WindWarning" then
		self:AddSpecialWarning("In Tornado")

	end
end

