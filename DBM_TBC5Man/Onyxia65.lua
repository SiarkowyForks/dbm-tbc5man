local Onyxia = DBM:NewBossMod("Onyxia65", DBM_ONYXIA_T65_NAME, DBM_ONYXIA_DESCRIPTION, DBM_ZONE_ONYXIAS_LAIR, "TBC5ManTab", 7)

Onyxia.Version = "1.0"
Onyxia.Author = "Siarkowy"
Onyxia.MinRevision = 1099

local random = math.random

--------------------------------------------------------------------------------

Onyxia:AddOption("WarnHatch", true, DBM_ONYXIA_OPTION_WARN_WHELP_HATCHED)
Onyxia:AddOption("WarnWall", true, DBM_ONYXIA_OPTION_WARN_FLAME_WAVE)
Onyxia:AddOption("WarnWhelp", true, DBM_ONYXIA_OPTION_WARN_WHELP_ENGAGED)

Onyxia:AddOption("WarnNova", true, DBM_ONYXIA_OPTION_WARN_NOVA_SOON)
Onyxia:AddOption("WarnConflag", true, DBM_ONYXIA_OPTION_WARN_CONFLAG)

Onyxia:AddOption("WarnRof", true, DBM_ONYXIA_OPTION_WARN_ROF)
Onyxia:AddOption("WhisperRof", true, DBM_ONYXIA_OPTION_WHISPER_ROF)
Onyxia:AddOption("SpecWarnRof", true, DBM_ONYXIA_OPTION_SPECWARN_ROF)

Onyxia:AddOption("WarnEggs", true, DBM_ONYXIA_OPTION_WARN_EGGS)
Onyxia:AddOption("WarnFear", false, DBM_ONYXIA_OPTION_WARN_FEAR)

--------------------------------------------------------------------------------

Onyxia:AddBarOption("Fire Nova")
Onyxia:AddBarOption("Next Fire Nova")

Onyxia:AddBarOption("Next Blast Wave")
Onyxia:AddBarOption("Next Rain of Fire")

Onyxia:AddBarOption("Next Eggs")
Onyxia:AddBarOption("Bellowing Roar CD")

--------------------------------------------------------------------------------

Onyxia:RegisterEvents(
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

Onyxia:RegisterCombat("YELL", DBM_ONYXIA_YELL_PULL, DBM_ONYXIA_NAME, DBM_ONYXIA_T65_NAME, DBM_ONYXIA_NAME)

--------------------------------------------------------------------------------

function Onyxia:OnCombatStart(delay)
	self.rofs = self.rofs or {}
	for k, _ in pairs(self.rofs) do
		self.rofs[k] = nil
	end

	self.LastWhelps = 0
	self.LastRof = 0
	self.Razorgore = false
	self.Broodlord = false
end

function Onyxia:OnEvent(event, arg1)
	if event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		if arg1 == DBM_RAZORGORE_EMOTE_NOVA then
			self:SendSync("Nova")
		elseif arg1 == DBM_ONYXIA_EMOTE_EGGS then
			self:SendSync("Eggs")
		end

	elseif event == "CHAT_MSG_MONSTER_YELL" then
		if arg1 == DBM_ONYXIA_YELL_TAKEOFF then
			self:SendSync("TakeOff")
		elseif arg1 == DBM_BROODLORD_PULL then
			if not self.Broodlord then
				self:SendSync("Broodlord")
			end
		elseif arg1 == DBM_ONYXIA_YELL_LESSON then
			if self.Broodlord then
				self:SendSync("Finale")
			end
		end

	elseif event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 23023 then
			self:SendSync("Conflag"..arg1.destName)
		elseif arg1.spellId == 19717 then
			self:SendSync("RofOn"..arg1.destName)
		end

	elseif event == "SPELL_AURA_REMOVED" then
		if arg1.spellId == 19717 then
			self:SendSync("RofOff"..arg1.destName)
		end

	elseif event == "SPELL_CAST_START" then
		if arg1.spellId == 18431 then
			self:SendSync("Fear")
		end

	elseif event == "SPELL_CAST_SUCCESS" then
		if arg1.spellId == 23331 then
			self:SendSync("Blast")
		end

	elseif event == "SPELL_DAMAGE" then
		if arg1.spellId == 29644 then
			self:SendSync("Wall"..arg1.destName)
		end

	elseif event == "SPELL_SUMMON" then
		if arg1.spellId == 17646 then
			self:SendSync("Hatch"..arg1.sourceName)
		end

	elseif event == "SWING_DAMAGE" or event == "SWING_MISSED" then -- only possiblity to detect Razorgore pull
		if not self.Razorgore and arg1.sourceName == DBM_RAZORGORE_NAME then
			self:SendSync("Razor")
		elseif self.Razorgore and arg1.sourceName == DBM_ONYXIA_WHELP_NAME then
			local now = GetTime()
			if now - self.LastWhelps > 15 then -- prevent spam
				-- self.LastWhelps = now
				self:SendSync("Whelps")
			end
		end

	elseif event == "UNIT_DIED" then
		if arg1.destName == DBM_RAZORGORE_NAME then
			self:SendSync("RazorDown")
		end

	elseif event == "WarnNova" then
		if self.Options.WarnNova then
			self:Announce(DBM_RAZORGORE_WARN_NOVA_SOON, 2)
		end
	end
end

function Onyxia:OnSync(msg)
	-- Tunnel

	if msg == "TakeOff" then
		self:ScheduleAnnounce(5, DBM_ONYXIA_WARN_TELEPORT_SOON)

	elseif msg:sub(1,5) == "Hatch" then
		msg = msg:sub(6)
		if self.Options.WarnHatch then
			local F = random(50) >= 50
			self:Announce((F and DBM_ONYXIA_WARN_MINUS or DBM_ONYXIA_WARN_WHELP_HATCHED):format(msg), 3)
		end

	elseif msg:sub(1,4) == "Wall" then
		msg = msg:sub(5)
		if self.Options.WarnWall then
			self:Announce(DBM_ONYXIA_WARN_FLAME_WAVE:format(msg), 4)
		end

	elseif msg == "Whelps" then
		local now = GetTime()
		if now - self.LastWhelps > 15 then
			self.LastWhelps = now
			if self.Options.WarnWhelp then
				self:Announce(DBM_ONYXIA_WARN_WHELPS)
			end
		end

	-- Razorgore the Untamed

	elseif msg == "Razor" then
		self.Razorgore = 1
		-- adjust for pull reported a bit late; boss needs to hit the tank first
		self:StartStatusBarTimer(30 - 3, "Next Fire Nova", [[Interface\Icons\Spell_Fire_SoulBurn]])
		self:ScheduleEvent(25 - 3, "WarnNova")

	elseif msg == "RazorDown" then
		self.Razorgore = 2
		self:EndStatusBarTimer("Next Fire Nova")
		self:EndStatusBarTimer("Fire Nova")
		self:UnScheduleEvent("WarnNova")

	elseif msg == "Nova" then
		self:StartStatusBarTimer(5, "Fire Nova", [[Interface\Icons\Spell_Shadow_Cripple]])
		self:StartStatusBarTimer(30, "Next Fire Nova", [[Interface\Icons\Spell_Fire_SoulBurn]])
		self:ScheduleEvent(25, "WarnNova")

	elseif msg:sub(1,7) == "Conflag" then
		msg = msg:sub(8)
		if self.Options.WarnConflag then
			self:Announce(DBM_RAZORGORE_WARN_CONFLAG:format(msg), 3)
		end

	-- Broodlord Lashlayer

	elseif msg == "Broodlord" then
		self.Broodlord = 1
		self:StartStatusBarTimer(12, "Next Blast Wave", [[Interface\Icons\Spell_Holy_Excorcism_02]])
		self:StartStatusBarTimer(16, "Next Rain of Fire", [[Interface\Icons\Spell_Shadow_RainOfFire]])

	elseif msg:sub(1,5) == "RofOn" then
		msg = msg:sub(6)
		local now = GetTime()
		if now - self.LastRof > 16 then
			self.LastRof = now
			self:StartStatusBarTimer(16, "Next Rain of Fire", [[Interface\Icons\Spell_Shadow_RainOfFire]])
			if self.Options.WarnRof then
				self:Announce(DBM_ONYXIA_WARN_ROF:format(msg), 4)
			end
		end
		if msg == UnitName("player") then
			if self.Options.SpecWarnRof then
				self:AddSpecialWarning(DBM_ONYXIA_SPECIAL_ROF)
			end
		elseif not self.rofs[msg] then
			self.rofs[msg] = true
			if self.Options.WhisperRof then
				self:SendHiddenWhisper(DBM_ONYXIA_SPECIAL_ROF, msg)
			end
		end

	elseif msg:sub(1,6) == "RofOff" then
		msg = msg:sub(7)
		self.rofs[msg] = nil

	elseif msg == "Blast" then
		self:StartStatusBarTimer(14, "Next Blast Wave", [[Interface\Icons\Spell_Holy_Excorcism_02]])

	-- Onyxia Final Phase

	elseif msg == "Finale" then
		self:EndStatusBarTimer("Next Rain of Fire")
		self:EndStatusBarTimer("Next Blast Wave")
		self:StartStatusBarTimer(25, "Next Eggs", [[Interface\Icons\INV_Egg_01]])
		if self.Options.WarnEggs then
			self:ScheduleAnnounce(22, DBM_ONYXIA_WARN_EGGS_SOON, 2)
		end
		self:StartStatusBarTimer(17, "Bellowing Roar CD", [[Interface\Icons\Spell_Shadow_DeathScream]])
		if self.Options.WarnFear then
			self:ScheduleAnnounce(12, DBM_ONYXIA_WARN_FEAR_SOON)
		end

	elseif msg == "Eggs" then
		self:StartStatusBarTimer(30, "Next Eggs", [[Interface\Icons\INV_Egg_01]])
		if self.Options.WarnEggs then
			self:ScheduleAnnounce(28, DBM_ONYXIA_WARN_EGGS_SOON, 2)
		end

	elseif msg == "Fear" then
		self:UnScheduleAnnounce(18, DBM_ONYXIA_WARN_FEAR_SOON)
		self:StartStatusBarTimer(18, "Bellowing Roar CD", [[Interface\Icons\Spell_Shadow_DeathScream]])
		if self.Options.WarnFear then
			self:ScheduleAnnounce(18, DBM_ONYXIA_WARN_FEAR_SOON)
		end
	end
end
