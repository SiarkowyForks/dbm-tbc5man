--
-- La Vendetta Instructor Razuvious Raid Warning AddOn
-- (c) by Nitram from La Vendetta on DE-Azshara
--
local BossMod = DBM:NewBossMod("Razuvious", DBM_IR_NAME, DBM_IR_DESCRIPTION, DBM_NAXX, DBMGUI_TAB_NAXX, 21);

BossMod.Author 			= "Nitram";
BossMod.Version			= "1.7";
BossMod.Lastshout		= 0;
BossMod.LastAnnounce	= 0;

BossMod:AddOption("10SecWarning", false, DBM_IR_SHOW_10SEC_WARNING)

BossMod:RegisterEvents("SPELL_CAST_SUCCESS");

function BossMod:OnCombatStart(delay)
	self:Announce(string.format(DBM_IR_SHOUT_WARNING, 5));	
	self:StartStatusBarTimer(5, "Disrupting Shout", "Interface\\Icons\\Ability_Warrior_RallyingCry");
	self:Schedule(5, function() 
		DBM.AddOns.Razuvious:OnEvent("StartNewDShoutTimer");
		DBM.StartRepeatingStatusBarTimer(25, "Disrupting Shout", "Interface\\Icons\\Ability_Warrior_RallyingCry", nil, nil, nil, "Razuvious");
	end);
end

function BossMod:OnEvent(event, args)
		if ( event == "SPELL_CAST_SUCCESS" ) then
			
			if args.spellId == 29107 then
				if( self.Lastshout > 0 and math.floor(GetTime() - self.Lastshout) > 0 ) then
					self.InCombat = true;
					self:AddMsg(DBM_IR_TIMER_UPDATED);
					
					self:OnEvent("StartNewDShoutTimer");
					self.Lastshout = GetTime();
					self:EndStatusBarTimer("Disrupting Shout");
					self:StartStatusBarTimer(25, "Disrupting Shout", "Interface\\Icons\\Ability_Warrior_RallyingCry", nil, 333);
				else
					self:OnEvent("StartNewDShoutTimer");
					self.Lastshout = GetTime();
				end
			end
		end
			
		if (event == "StartNewDShoutTimer") then
			if (GetTime() - self.Lastshout) < 2  then return true; end	-- Don't need Spam
				
			self:UnScheduleSelf();			-- Don't need the Loop & Warnings
				
			if (GetTime() - self.LastAnnounce) > 4 then
				self:Announce(string.format(DBM_IR_SHOUT_WARNING, 25));		-- Callout Warning
				self.LastAnnounce = GetTime();
			end
			self:ScheduleSelf(15, "DShout10SecWarning");			-- Schedule Warnings
			self:ScheduleSelf(20, "DShout5SecWarning");
			self:ScheduleSelf(22, "DShout3SecWarning");
				
		elseif (event == "DShout10SecWarning") and self.Options["10SecWarning"] then
			self:Announce(string.format(DBM_IR_SHOUT_WARNING, 10));
			
		elseif (event == "DShout5SecWarning") then
			self:Announce(string.format(DBM_IR_SHOUT_WARNING, 5));
			
		elseif (event == "DShout3SecWarning") then

			self:ScheduleSelf(3, "StartNewDShoutTimer");			-- Schedule Loop
		end
end
