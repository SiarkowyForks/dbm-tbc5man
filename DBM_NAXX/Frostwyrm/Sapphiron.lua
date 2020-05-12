--
--  Sapphiron - v1.0 by Nitram
--  v2.0 by Siarkowy
--

local Sapph = DBM:NewBossMod("Sapph", DBM_SAPPHIRON_NAME, DBM_SAPPHIRON_INFO, DBM_NAXX, DBMGUI_TAB_NAXX, 51);
Sapph.Author	= "Nitram, Siarkowy";
Sapph.Version	= "2.0";
Sapph.MinRevision = 1090;

Sapph:AddOption("AnnLifeDrain", true, DBM_SAPPHIRON_OPTION_ANN_LIFEDRAIN);
Sapph:AddOption("AnnIcebolt", true, DBM_SAPPHIRON_OPTION_ANN_ICEBOLT);
Sapph:AddOption("AnnWontFly", true, DBM_SAPPHIRON_OPTION_ANN_WONTFLY);
Sapph:AddOption("Yell", true, DBM_SAPPHIRON_YELL_INFO);
Sapph:AddOption("ShowPing", false, DBM_SAPPHIRON_PING_INFO, function()
	Sapph.Options.ShowPing = not Sapph.Options.ShowPing;
	if Sapph.InCombat then
		Sapph:HidePings(not Sapph.Options.ShowPing);
	end
end);

Sapph:AddOption("SpecWarnChill", true, DBM_SAPPHIRON_OPTION_CHILL);
Sapph:AddOption("ShowDistanceFrame", true, DBM_SAPPHIRON_SHOW_DISTANCE_FRAME);

Sapph:AddBarOption("Enrage");
Sapph:AddBarOption("Next Life Drain");
Sapph:AddBarOption("Air Phase");
Sapph:AddBarOption("Stay Behind: (.*)");
Sapph:AddBarOption("Ground Phase");

Sapph:RegisterCombat("COMBAT");
Sapph:RegisterEvents(
	"UNIT_HEALTH",
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_SUCCESS"
);

local PingStartedTime;
local IceboltTarget = DBM_UNKNOWN;
local AirPhase = false;
local CanFly = true;

function Sapph:OnCombatStart(delay)
	PingStartedTime = 0;
	IceboltTarget = DBM_UNKNOWN;
	AirPhase = false;
	CanFly = true;
	self:HidePings(not self.Options.ShowPing);

	self:StartStatusBarTimer(540 - delay, "Enrage", "Interface\\Icons\\Spell_Shadow_UnholyFrenzy");
	self:ScheduleAnnounce(540 - 180 - delay, DBM_GENERIC_ENRAGE_WARN:format(3, DBM_MIN), 1);
	self:ScheduleAnnounce(540 -  60 - delay, DBM_GENERIC_ENRAGE_WARN:format(1, DBM_MIN), 3);
	self:ScheduleAnnounce(540 -  30 - delay, DBM_GENERIC_ENRAGE_WARN:format(30, DBM_SEC), 4);
	self:StartStatusBarTimer(45 - delay, "Air Phase", "Interface\\AddOns\\DBM_API\\Textures\\CryptFiendUnBurrow");

	if self.Options.ShowDistanceFrame then
		DBM_Gui_DistanceFrame_Show();
	end
end

function Sapph:OnCombatEnd()
	self:HidePings(false);

	if self.Options.ShowDistanceFrame then
		DBM_Gui_DistanceFrame_Hide();
	end
end

function Sapph:OnSync(msg)
	if msg:sub(0,5) == "Blast" then
		msg = msg:sub(6);
		IceboltTarget = msg;
		if self.Options.AnnIcebolt then
			self:Announce(DBM_SAPPHIRON_ICEBOLT_ANNOUNCE:format(msg), 4);
		end

		local secsToGroundPhase = (AirPhase or GetTime()) - GetTime() + 20;
		self:StartStatusBarTimer(secsToGroundPhase - 3, "Stay Behind: " .. IceboltTarget, 29318);

		if msg == UnitName("player") then
			if self.Options.ShowPing then
				PingStartedTime = GetTime();
				self:PingMiniMap();
			end

			if self.Options.Yell then
				SendChatMessage(DBM_SAPPHIRON_YELL_ANNOUNCE, "YELL");
			end
		end
	elseif msg:sub(0,5) == "Drain" then
		msg = msg:sub(6);
		if self.Options.AnnLifeDrain then
			self:Announce(DBM_SAPPHIRON_LIFEDRAIN_ANNOUNCE:format(msg), 3);
			self:ScheduleAnnounce(18, DBM_SAPPHIRON_LIFEDRAIN_WARN, 1);
		end
		self:StartStatusBarTimer(23, "Next Life Drain", "Interface\\Icons\\Spell_Shadow_LifeDrain02");
	elseif msg == "Air" then
		AirPhase = GetTime();
		self:Announce(DBM_SAPPHIRON_PHASE_AIR, 2);
		self:StartStatusBarTimer(20, "Ground Phase", "Interface\\AddOns\\DBM_API\\Textures\\CryptFiendBurrow");
	elseif msg == "Ground" then
		AirPhase = false;
		self:Announce(DBM_SAPPHIRON_PHASE_GROUND, 2);
		self:StartStatusBarTimer(70, "Air Phase", "Interface\\AddOns\\DBM_API\\Textures\\CryptFiendUnBurrow");
	elseif msg:sub(0,5) == "Chill" then
		msg = msg:sub(6);
		if msg == UnitName("player") and self.Options.SpecWarnChill then
			self:AddSpecialWarning(DBM_SAPPHIRON_CHILL_SELFWARN);
		end
	elseif msg == "WontFly" and CanFly then
		CanFly = false;
		if self.Options.AnnWontFly then
			self:Announce(DBM_SAPPHIRON_WONTFLY_ANNOUNCE, 1);
		end
		self:EndStatusBarTimer("Air Phase");
	end
end

function Sapph:OnEvent(event, arg1)
	if event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		if arg1 == DBM_SAPPHIRON_EMOTE_AIR then
			self:SendSync("Air");
		elseif arg1 == DBM_SAPPHIRON_EMOTE_BREATH then
			self:SendSync("Breath");
		elseif arg1 == DBM_SAPPHIRON_EMOTE_GROUND then
			self:SendSync("Ground");
		end
	elseif event == "SPELL_CAST_SUCCESS" then
		if arg1.spellId == 28522 then
			self:SendSync("Blast"..tostring(arg1.destName));
		elseif arg1.spellId == 28542 then
			self:SendSync("Drain"..tostring(arg1.destName));
		end
	elseif event == "SPELL_AURA_APPLIED" then
		if arg1.spellId == 28547 then
			self:SendSync("Chill"..tostring(arg1.destName));
		end
	elseif CanFly and event == "UNIT_HEALTH" and UnitIsEnemy(arg1, "player") then
		if UnitName(arg1) == DBM_SAPPHIRON_NAME then
			local percHp = UnitHealth(arg1) / UnitHealthMax(arg1) * 100;
			if percHp < 10 then
				self:SendSync("WontFly");
			end
		end
	end
end

function Sapph:PingMiniMap()
	if (GetTime() - PingStartedTime) < 10 then	-- Protect Ping Spam !! :)
		Minimap:PingLocation(CURSOR_OFFSET_X, CURSOR_OFFSET_Y);
		self:ScheduleMethod(2, "PingMiniMap");		-- Ping all 2 sec
	else
		PingStartedTime = 0;
	end
end

function Sapph:HidePings(value)
	if value then
		Minimap_SetPing = function() end;
	else
		Minimap_SetPing = DBM.Hooks.oldMinimap_SetPing;
	end
end

DBM.Hooks.oldMinimap_SetPing = Minimap_SetPing;

function Sapph:Test()
	self:OnCombatStart(0);
	self:Schedule(2, function()
		self:OnSync("Drain"..UnitName("player"));
		self:OnSync("Chill"..UnitName("player"));
	end)
	self:Schedule(5, function()
		self:OnSync("Air");
	end)
	self:Schedule(9 + random() * 3, function()
		self:OnSync("Blast"..UnitName("player"));
	end)
	self:Schedule(15, function()
		self:OnSync("Breath");
	end)
	self:Schedule(25, function()
		self:OnSync("Ground");
	end)

	self:Schedule(30, function()
		self:OnSync("WontFly");
		self:ScheduleMethod(1, "OnSync", "WontFly");
		self:ScheduleMethod(2, "OnSync", "WontFly");
	end)
	self:Schedule(35, function()
		self:OnCombatEnd();
	end)
end
