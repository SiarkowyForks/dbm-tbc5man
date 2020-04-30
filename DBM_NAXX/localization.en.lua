
--Patchwerk
DBM_PW_NAME			= "Patchwerk";
DBM_PW_DESCRIPTION		= "Provides a timer for Patchwerk's enrage.";
DBM_PW_OPTION1			= "Announce Hateful Strikes";
DBM_PW_OPTION2			= "Show stats";
DBM_PW_OPTION3			= "Show info frame";

DBM_PW_ENRAGE_WARNING		= "*** Enrage in %s %s ***";
DBM_PW_HS_ANNOUNCE		= "Hateful Strike --> >%s< [%s]";

DBM_PW_YELL_1 			= "Patchwerk want to play!";
DBM_PW_YELL_2 			= "Kel'thuzad make Patchwerk his avatar of war!";

DBM_PW_HS_YOU_HIT		= "Patchwerk's Hateful Strike hits you for (%d+).(.*)";
DBM_PW_HS_YOU_MISS		= "Patchwerk's Hateful Strike misses you.";

DBM_PW_HS_YOU_DODGE	= "Patchwerk's Hateful Strike was dodged%.$";
DBM_PW_HS_YOU_PARRY		= "Patchwerk's Hateful Strike was parried%.$";

DBM_PW_HS_PARTY_HIT		= "Patchwerk's Hateful Strike hits ([^%s]+) for (%d+).(.*)";
DBM_PW_HS_PARTY_MISS		= "Patchwerk's Hateful Strike missed ([^%s]+)."; 
DBM_PW_HS_PARTY_DODGE		= "Patchwerk's Hateful Strike was dodged by ([^%s]+).";
DBM_PW_HS_PARTY_PARRY		= "Patchwerk's Hateful Strike was parried by ([^%s]+).";

DBM_PWSTATS_STATS		= "*** Patchwerk Stats ***";
DBM_PWSTATS_STRIKES		= "Hateful Strikes: %s (%.0f%%)";
DBM_PWSTATS_HITS		= "Hits: %s (%.0f%%)";
DBM_PWSTATS_DODGES		= "Dodges: %s (%.0f%%)";
DBM_PWSTATS_PARRIES		= "Parries: %s (%.0f%%)";
DBM_PWSTATS_MISSES		= "Misses: %s (%.0f%%)";
DBM_PWSTATS_AVG_DMG		= "Average damage per hit: %.0f";
DBM_PWSTATS_MAX_HIT		= "Maximum hit: %s on %s";
DBM_PWSTATS_PER_PLAYER		= "%s Hateful Strikes on >%s< (%s hits)";
DBM_PWSTATS_NOT_AVAILABLE	= "Stats not available";


--Grobbulus
DBM_GROBB_NAME				= "Grobbulus";
DBM_GROBB_DESCRIPTION			= "Sets raid target icon (skull) on players that are afflicted by Mutating Injection. Only one player should enable announce and \"Set icon\".";
DBM_GROBB_SEND_WHISPER			= "Send whisper";
DBM_GROBB_SET_ICON			= "Set icon";

DBM_GROBB_YOU_ARE_INJECTED		= "You are injected!";
DBM_GROBB_INJECTED_WARNING		= "*** >%s< is injected ***";
DBM_GROBB_INJECTED			= "Mutating Injection";

DBM_GROBB_INJECTION_REGEXP		= "([^%s]+) (%w+) afflicted by Mutating Injection.";
DBM_GROBB_INJECTION_FADES_REGEXP	= "Mutating Injection fades from ([^%s]+)%.";

DBM_GROBB_CLOUD_POISON			= "Grobbulus casts Poison Cloud.";
	
DBM_GROBB_SBT_INJECTION		= "Injection: ";



--Gluth
DBM_GLUTH_NAME				= "Gluth";
DBM_GLUTH_DESCRIPTION			= "Announces Gluth's Fear, Frenzy and Decimate.";
DBM_GLUTH_ANNOUNCE_FRENZY		= "Announce frenzy";

DBM_GLUTH_DECIMATE_WARN1		= "*** Decimate in 2 min ***";
DBM_GLUTH_DECIMATE_WARN2		= "*** Decimate - next in 2 minutes ***";
DBM_GLUTH_DECIMATE_1MIN_WARNING	= "*** Decimate in 1 minute ***";
DBM_GLUTH_DECIMATE_SOON_WARNING	= "*** Decimate soon ***";
DBM_GLUTH_DECIMATE_WARNING		= "*** Decimate in ~%s sec ***"
DBM_GLUTH_FEAR_WARNING			= "*** Fear - next in 20 sec ***";
DBM_GLUTH_FEAR_5SEC_WARNING		= "*** Fear in 5 sec ***";

DBM_GLUTH_DECIMATE_REGEXP		= "Gluth's Decimate hits ([^%s]+) for (%d+).";
DBM_GLUTH_FEAR_REGEXP			= "(%w+) is afflicted by Terrifying Roar.";
DBM_GLUTH_FRENZY			= "%s goes into a frenzy!"
DBM_GLUTH_FRENZY_ANNOUNCE		= "*** Frenzy ***";
DBM_GLUTH_GLUTH			= "Gluth";
DBM_GLUTH_ENRAGE_ANNOUNCE			= "*** Enrage in %s %s ***";

DBM_SBT["Fear"]			= "Fear";
DBM_SBT["Decimate"]			= "Decimate";


--Razuvious
DBM_IR_NAME				= "Instructor Razuvious";
DBM_IR_DESCRIPTION			= "Provides a timer for Razuvious' Disrupting Shout.";
DBM_IR_SHOW_10SEC_WARNING		= "Show 10 sec warning";

DBM_IR_TIMER_UPDATED			= "Timer updated";
DBM_IR_SHOUT_WARNING			= "*** Disrupting Shout in %s sec ***";

DBM_IR_SPELL_1				= "Disrupting Shout";
--removed in patch 2.0
--DBM_IR_YELL_1				= "The time for practice is over! Show me what you have learned!";
--DBM_IR_YELL_2				= "Sweep the leg... Do you have a problem with that?";
--DBM_IR_YELL_3				= "Do as I taught you!";
--DBM_IR_YELL_4				= "Show them no mercy!";

DBM_SBT["Disruption Shout"]		= "Disrupting Shout";


--Noth the Plaguebringer
DBM_NTP_NAME				= "Noth the Plaguebringer";
DBM_NTP_DESCRIPTION			= "Provides timers for Noth's Teleport and Blink.";
DBM_NTP_OPTION_WARN_SPAWN 		= "Announce adds";
DBM_NTP_OPTION_WARN_CURSE 		= "Announce curse";

DBM_NTP_BACK_WARNING			= "*** Noth is back (for %s sec) ***";
DBM_NTP_TELEPORT_WARNING		= "*** %s sec until teleport ***";
DBM_NTP_NOTH_GAINS_BLINK		= "*** Blink ***";
DBM_NTP_BLINK_5SEC_WARNING		= "*** Blink in ~5 sec ***";
DBM_NTP_BLINK_0SEC_WARNING		= "*** Blink ready - stop ranged dps ***";
DBM_NTP_TELEPORT_10SEC_WARNING		= "*** Teleport in 10 sec ***"
DBM_NTP_BACK_10SEC_WARNING		= "*** 10 sec until he comes back ***";
DBM_NTP_ADD_WARNING			= "*** Adds in 5 seconds ***";
DBM_NTP_CURSE_WARNING			= "*** Curse ***";
DBM_NTP_NEXT_WAVE_SOON			= "*** 10 sec until next wave ***";

DBM_NTP_SPELL_1 			= "Noth the Plaguebringer gains Blink.";
DBM_NTP_CURSE_AFFLICT 			= "Curse of the Plaguebringer"; -- AOE curse
DBM_NTP_ADDS_SPAWN 			= "Rise, my soldiers!"; -- Adds spawn
DBM_NTP_YELL_START1 			= "Die, trespasser!";
DBM_NTP_YELL_START2 			= "Glory to the master!";
DBM_NTP_YELL_START3 			= "Your life is forfeit!";

DBM_SBT["Teleport to Balcony"]		= "Teleport to balcony";
DBM_SBT["Teleport back"]		= "Teleport back";
DBM_SBT["Blink"]			= "Blink";


--Heigan the Unclean
DBM_HTU_NAME			= "Heigan the Unclean";
DBM_HTU_DESCRIPTION		= "Provides a timer for Heigan's Teleport.";

DBM_HTU_TELEPORT_WARNING	= "*** Teleport in %s seconds ***";
DBM_HTU_TELEPORT_BACK_WARNING	= "*** Teleport back in %s seconds ***";

DBM_HTU_YELL_START1 		= "You... are next.";
DBM_HTU_YELL_START2 		= "I see you...";
DBM_HTU_YELL_START3 		= "You are mine now.";

DBM_SBT["Teleport"]		= "Teleport";
DBM_SBT["Teleport Back"]	= "Teleport Back";


--Anub'Rekhan
DBM_AR_NAME			= "Anub'Rekhan";
DBM_AR_DESCRIPTION		= "Provides a timer for Anub'Rekhan's Locust Swarm.";

DBM_AR_LOCUST_WARNING		= "*** Locust Swarm in ~%s sec ***";
DBM_AR_LOCUST_SOON_WARNING	= "*** Locust Swarm soon ***";
DBM_AR_LOCUST_INC_WARNING	= "*** Locust Swarm is casting - 3 sec ***";
DBM_AR_GAIN_LOCUST_WARNING	= "*** Locust Swarm now - 20 sec ***";
DBM_AR_LOCUST_END_WARNING	= "*** Locust Swarm ends in %s sec ***";

DBM_AR_YELL_1 			= "There is no way out.";
DBM_AR_YELL_2 			= "Just a little taste...";	
DBM_AR_YELL_3 			= "Yes, run! It makes the blood pump faster!";
DBM_AR_CAST_LOCUST_SWARM 	= "Anub'Rekhan begins to cast Locust Swarm.";
DBM_AR_GAIN_LOCUST_SWARM 	= "Anub'Rekhan gains Locust Swarm.";

DBM_SBT["Locust Swarm"]	= "Locust Swarm";
DBM_SBT["Locust Swarm Cast"]	= "Locust Swarm Cast";


--Grand Widow Faerlina
DBM_GWF_NAME			= "Grand Widow Faerlina";
DBM_GWF_DESCRIPTION		= "Provides a timer for Grand Widow Faerlina's enrage.";

DBM_GWF_ENRAGE_WARNING1	= "*** Enrage - next in 60 sec ***";
DBM_GWF_ENRAGE_WARNING2	= "*** Enrage in ~%s sec ***";
DBM_GWF_ENRAGE_CD_READY	= "*** Enrage cooldown ready ***";
DBM_GWF_EMBRACE_WARNING	= "*** Widow's Embrace ends in %s sec ***";
DBM_GWF_NEXT_ENRAGE_IN		= "*** Next enrage in %s sec ***";

DBM_GWF_YELL_1			= "You cannot hide from me!";
DBM_GWF_YELL_2			= "Slay them in the master's name!";
DBM_GWF_YELL_3			= "Run while you still can!";
DBM_GWF_YELL_4			= "Kneel before me, worm!";
DBM_GWF_DEBUFF			= "Grand Widow Faerlina is afflicted by Widow's Embrace.";
DBM_GWF_GAIN_ENRAGE		= "Grand Widow Faerlina gains Enrage.";

DBM_SBT["Enrage"]		= "Enrage";
DBM_SBT["Widow's Embrace"]	= "Widow's Embrace";


--Maexxna
DBM_MAEXXNA_NAME			= "Maexxna";
DBM_MAEXXNA_DESCRIPTION		= "Provides timers for Maexxna's Web Spray and spider adds.";
DBM_MAEXXNA_YELL_ON_WRAP		= "Yell when web wrapped";
DBM_MAEXXNA_INFOFRAME			= "Show InfoFrame for Web Wrap targets";
	
DBM_MAEXXNA_INFOFRAME_TITLE	= "Web Wrap targets"

DBM_MAEXXNA_WEB_WRAP_YELL		= "%s is web wrapped. Group %s.";
DBM_MAEXXNA_WRAP_WARNING		= "*** >%s< is wrapped ***";
DBM_MAEXXNA_SPRAY_WARNING		= "*** Web Spray in %s sec ***";
DBM_MAEXXNA_SPIDER_WARNING		= "*** Spiders in %s sec ***";
DBM_MAEXXNA_SPIDERS_SPAWNED		= "*** Spiders spawned ***";

DBM_MAEXXNA_WEB_SPRAY			= "Web Spray";
DBM_MAEXXNA_MAEXXNA			= "Maexxna";
DBM_MAEXXNA_WEB_WRAP_REGEXP		= "([^%s]+) (%w+) afflicted by Web Wrap.";

DBM_SBT["Web Spray"]			= "Web Spray";
DBM_SBT["Spider Spawn"]		= "Spider Spawn";
	

--Gothik the Harvester
DBM_GOTH_NAME				= "Gothik the Harvester";
DBM_GOTH_DESCRIPTION			= "Provides timers for his adds and announces their death.";

DBM_GOTH_PHASE2_WARNING		= "*** Gothik inc ***";
DBM_GOTH_PHASE2_INC_WARNING		= "*** Phase 2 in %s %s ***";
DBM_GOTH_DEAD_WARNING			= "*** %s dead ***";
DBM_GOTH_INC_WARNING			= "*** %s in %s sec ***";
DBM_GOTH_WAVE_INC_WARNING1		= "*** Wave %s/18 in 3 sec - %s %s  ***";
DBM_GOTH_WAVE_INC_WARNING2		= "*** Wave %s/18 in 3 sec - %s %s and %s %s ***";
DBM_GOTH_WAVE_INC_WARNING3		= "*** Wave %s/18 in 3 sec - %s %s, %s %s and %s %s ***";

DBM_GOTH_YELL_START1			= "Foolishly you have sought your own demise."
DBM_GOTH_PHASE2_YELL			= "I have waited long enough. Now you face the harvester of souls.";

DBM_GOTH_RIDER				= "Unrelenting Rider";
DBM_GOTH_RIDER_SHORT			= "Rider";
DBM_GOTH_KNIGHT			= "Unrelenting Deathknight";
DBM_GOTH_KNIGHT_SHORT			= "Deathknight";
DBM_GOTH_KNIGHTS_SHORT			= "Deathknights";
DBM_GOTH_TRAINEE			= "Unrelenting Trainee";
DBM_GOTH_TRAINEE_SHORT			= "Trainees";

-- FourHorsemen
DBM_FOURHORSEMEN_NAME				= "Four Horsemen";
DBM_FOURHORSEMEN_INFO				= "Provides timers for the Four Horsemen fight";
DBM_FOURHORSEMEN_SHOW_5SEC_MARK_WARNING	= "Show 5 sec warning for marks";

DBM_FOURHORSEMEN_THANE				= "Thane Korth'azz";
DBM_FOURHORSEMEN_LADY				= "Lady Blaumeux";
DBM_FOURHORSEMEN_MOGRAINE			= "Highlord Mograine";
DBM_FOURHORSEMEN_ZELIEK			= "Sir Zeliek";

DBM_FOURHORSEMEN_REAL_NAME			= "Four Horsemen";

DBM_FOURHORSEMEN_WHISPER_INFO			= "Whisper players in Void Zones";
DBM_FOURHORSEMEN_SYNC_INFO			= "Sync mark with other clients";
DBM_FOURHORSEMEN_INFOFRAME_INFO		= "Show InfoFrame for boss HP during combat";
DBM_FOURHORSEMEN_SLASH					= "/horsemen hp - shows/hides the InfoFrame";

DBM_FOURHORSEMEN_INFOFRAME_TITLE		= "Four Horsemen";
DBM_FOURHORSEMEN_INFOFRAME_TEXT		= "Shows HP of the Horsemen";

DBM_FOURHORSEMEN_MARK_EXPR			= "afflicted by Mark of"; 
DBM_FOURHORSEMEN_MARK_ANNOUNCE			= "*** Mark #%d ***";
DBM_FOURHORSEMEN_MARK_WARNING			= "*** Mark #%d in 5 sec ***";

DBM_FOURHORSEMEN_METEOR_EXPR			= "Thane Korth'azz's Meteor hits ([^%s]+) for (%d+) Fire damage%.";
DBM_FOURHORSEMEN_METEOR_ANNOUNCE		= "*** Meteor ***";

DBM_FOURHORSEMEN_VOID_EXPR			= "Lady Blaumeux casts Void Zone.";
DBM_FOURHORSEMEN_VOID_ANNOUNCE			= "Void Zone";
DBM_FOURHORSEMEN_VOID_WHISPER			= "Void Zone on you!";
DBM_FOURHORSEMEN_VOID_ALLWAYS_INFO		= "Always use Special Warning on Void Zone";

DBM_FOURHORSEMEN_SHIELDWALL_EXPR		= "(.*) gains Shield Wall.";
DBM_FOURHORSEMEN_SHIELDWALL_ANNOUNCE		= "*** %s: Shield Wall for 20 sec ***";
DBM_FOURHORSEMEN_SHIELDWALL_FADE		= "*** Shield Wall fades from %s ***";

DBM_FOURHORSEMEN_TAUNTRESIST_INFO		= "Inform about taunt resists";
DBM_FOURHORSEMEN_TAUNTRESIST_TAUNT		= "Taunt";
DBM_FOURHORSEMEN_TAUNTRESIST_MOKING		= "Mocking Blow";
DBM_FOURHORSEMEN_TAUNTRESIST_CSHOUT		= "Challenging Shout";
DBM_FOURHORSEMEN_TAUNTRESIST_RESIST		= "resist";
DBM_FOURHORSEMEN_TAUNTRESIST_PARRY		= "parry";
DBM_FOURHORSEMEN_TAUNTRESIST_DODGE		= "dodge";
DBM_FOURHORSEMEN_TAUNTRESIST_MISS		= "miss";
DBM_FOURHORSEMEN_TAUNTRESIST_BLOCK		= "block";
DBM_FOURHORSEMEN_TAUNTRESIST_SELFWARN		= "TAUNT FAILED";
DBM_FOURHORSEMEN_TAUNTRESIST_MESSAGE		= "--> Taunt failed! <--";
	
DBM_FOURHORSEMEN_SBT_MARK				= "Mark";
DBM_FOURHORSEMEN_SBT_SHIELDWALL		= "Shield Wall: ";

--Thaddius
DBM_THADDIUS_NAME				= "Thaddius";
DBM_THADDIUS_DESCRIPTION		= "Provides timers for his Enrage and Polarity Shift.";
DBM_THADDIUS_WARN_NOT_CHANGED	= "Warn when your polarity did not change";
DBM_THADDIUS_ALT_STRATEGY		= "Alternative strategy (show left/right warnings)";
DBM_THADDIUS_WARN_POWERSURGE	= "Warn for Stalagg's Power Surge (200% attack speed)";
DBM_THADDIUS_FIX_LAG           = "Reduce combat log range to prevent lags"
DBM_THADDIUS_ALT_STRAT_STAT1	= "Showing '%s' message when polarity changes";
DBM_THADDIUS_ALT_STRAT_STAT2	= "Showing '%s' message when polarity does not change";
DBM_THADDIUS_INFOFRAME_INFO	= "Show InfoFrame for boss HP in phase 1"

DBM_THADDIUS_ENRAGE_WARNING		= "*** Enrage in %s %s ***";
DBM_THADDIUS_POL_SHIFT				= "*** Polarity Shift ***";
DBM_THADDIUS_SURGE_WARNING			= "*** Power Surge ***";
DBM_THADDIUS_POL_WARNING			= "*** Polarity Shift in %s sec ***";
DBM_THADDIUS_PHASE_2_SOON			= "*** Phase 2 in 4 seconds ***";
DBM_THADDIUS_CHARGE_CHANGED		= "Charge changed to %s!";
DBM_THADDIUS_CHARGE_NOT_CHANGED	= "Charge not changed";
DBM_THADDIUS_RIGHT					= "Right!";
DBM_THADDIUS_LEFT					= "Left!";

DBM_THADDIUS_GAINS_SURGE		= "Stalagg gains Power Surge.";
DBM_THADDIUS_CAST_POL			= "Thaddius begins to cast Polarity Shift.";
DBM_THADDIUS_POL_REGEXP		= "You are afflicted by (%w+) Charge.";
DBM_THADDIUS_YELL_START1		= "Kill...";
DBM_THADDIUS_YELL_START2		= "Eat... your... bones...";
DBM_THADDIUS_YELL_START3		= "Break... you!!";
DBM_THADDIUS_YELL_POL			= "Now you feel pain...";
DBM_THADDIUS_ENRAGE			= "goes into a berserker rage!";
DBM_THADDIUS_TESLA_EMOTE		= "%s overloads!";
DBM_THADDIUS_TESLA_COIL		= "Tesla Coil";
DBM_THADDIUS_THADDIUS			= "Thaddius";
DBM_THADDIUS_POSITIVE			= "Positive";
DBM_THADDIUS_NEGATIVE			= "Negative";

-- Phase1
DBM_THADDIUS_STALAGG 			= "Stalagg";
DBM_THADDIUS_FEUGEN 			= "Feugen";
DBM_THADDIUS_INFOFRAME_TITLE	= "Thaddius";
DBM_THADDIUS_INFOFRAME_TEXT	= "Shows HP of the bosses in phase 1";
DBM_THADDIUS_PHASE1_YELL1 		= "Stalagg crush you!";
DBM_THADDIUS_PHASE1_YELL2 		= "Feed you to master!";
DBM_THADDIUS_PHASE1_ANNOUNCE		= "*** Phase 1 ***";
DBM_THADDIUS_SURGE_EXPR		= "Stalagg gains Power Surge.";
DBM_THADDIUS_SURGE_ANNOUNCE		= "*** Power Surge for 10 sec ***";
DBM_THADDIUS_THROW_ANNOUNCE		= "*** MT thrown ***";
DBM_THADDIUS_THROW_ANNOUNCE_SOON	= "*** MT throw in %s sec ***";
DBM_THADDIUS_PLATFORM_EXPR		= "loses its link!";
DBM_THADDIUS_PLATFORM_ANNOUNCE		= "*** Warning - Add leaves the platform ***";


--Loatheb
DBM_LOATHEB_NAME				= "Loatheb";
DBM_LOATHEB_DESCRIPTION			= "Announces Loatheb's Inevitable Doom and shows heal cooldowns. Use /loatheb setup or /loatheb config to setup your heal rotation, announcing healers does not work if you did not setup a heal rotation. Setting a healer's sort ID to 0 will remove him from the list. To re-add him use /loa undelete.";
DBM_LOATHEB_ANNOUNCE_SPORES			= "Announce spores";
--DBM_LOATHEB_ANNOUNCE_SPORES_BACKWARDS		= "Announce spores to Groups Backwards";
DBM_LOATHEB_HEAL_RAID				= "Announce heals to raid chat";
DBM_LOATHEB_HEAL_RAID_WARN			= "Announce heals to raid warning chat";
DBM_LOATHEB_HEAL_WHISPER			= "Send whisper to next healer";
DBM_LOATHEB_ANNOUNCE_POT_OPTION		= "Announce consumables";
DBM_LOATHEB_SPECIALWARN_POT_OPTION		= "Show special warning when you have to use consumables";
DBM_LOATHEB_HEAL_SHOW_AUTO			= "Show heal info frame when Loatheb is pulled";
DBM_LOATHEB_HEAL_SHOW_NOW			= "Show heal info frame";
DBM_LOATHEB_HEAL_SETUP				= "Setup heal rotation";
DBM_LOATHEB_NO_BC_INFO				= "You are not raid leader or promoted. Your changes will not be broadcasted to the raid and broadcasted settings will overwrite yours.";
DBM_LOATHEB_NO_CD				= "No cooldown";
DBM_LOATHEB_SET_HEAL_ROTATION			= "Save & sync";
DBM_LOATHEB_SET_HEAL_ROTATION_NO_BC		= "Save";
DBM_LOATHEB_SHADOW_PROT_POT			= "Shadow Protection Potion"
DBM_LOATHEB_BANDAGE				= "Bandage";
DBM_LOATHEB_HEALTHSTONE			= "Healthstone";

DBM_LOATHEB_DOOM_WARNING		= "*** Inevitable Doom #%s in %s sec ***";
DBM_LOATHEB_DOOM_NOW			= "*** Inevitable Doom #%s - next in %s sec ***";
DBM_LOATHEB_DECURSE_NOW		= "*** Curses removed - next in 30 sec ***";
DBM_LOATHEB_DECURSE_WARNING		= "*** Remove Curse in %s sec ***";
DBM_LOATHEB_SPORE_SPAWNED		= "*** Spore %d spawned ***";
DBM_LOATHEB_POT_ANNOUNCE		= "*** %s now! ***";
DBM_LOATHEB_POT_WARNING		= "Use %s now!";
DBM_LOATHEB_HEAL_WARNING		= "Heal #%s done - next: >%s<";
DBM_LOATHEB_YOU_ARE_NEXT		= "You are next!";
DBM_LOATHEB_YOU_ARE_SOON		= "Get ready to heal!";

DBM_LOATHEB_DOOM_REGEXP		= "([^%s]+) (%w+) afflicted by Inevitable Doom.";
DBM_LOATHEB_REMOVE_CURSE		= "Loatheb casts Remove Curse on Loatheb.";
DBM_LOATHEB_HEAL_REGEXP		= "([^%s]+) (%w+) afflicted by Corrupted Mind.";
--DBM_LOATHEB_HEAL_REGEXP		= "([^%s]+) (%w+) afflicted by Weakened Soul.";
DBM_LOATHEB_SUMMON_SPORE		= "Loatheb casts Summon Spore.";
DBM_LOATHEB_LOATHEB			= "Loatheb";
DBM_LOATHEB_LOCK				= "Lock window";

DBM_SBT["Inevitable Doom"]		= "Inevitable Doom";


-- Sapphiron
DBM_SAPPHIRON_NAME 			= "Sapphiron";
DBM_SAPPHIRON_INFO			= "Warns for Ice Bomb, Life Drain and Enrage.";

DBM_SAPPHIRON_YELL_INFO		= "Yell when afflicted by Ice Block";
DBM_SAPPHIRON_PING_INFO		= "Show minimap pings";
DBM_SAPPHIRON_SHOW_DISTANCE_FRAME	= "Show distance frame during air phase";
DBM_SAPPHIRON_YELL_ANNOUNCE		= "I'm an Ice Block, stay behind me!";

DBM_SAPPHIRON_LIFEDRAIN_EXPR1		= "afflicted by Life Drain";
DBM_SAPPHIRON_LIFEDRAIN_EXPR2		= "Life Drain was resisted by";
DBM_SAPPHIRON_LIFEDRAIN_ANNOUNCE	= "*** Life Drain - next in ~24 sec ***";
DBM_SAPPHIRON_LIFEDRAIN_WARN		= "*** Life Drain in %d sec ***";

DBM_SAPPHIRON_DEEPBREATH_EXPR		= "takes in a deep breath...";
DBM_SAPPHIRON_DEEPBREATH_ANNOUNCE	= "*** Ice Bomb Incoming ***";

DBM_SAPPHIRON_FROSTBOLT_GAIN_EXPR	= "You are afflicted by Icebolt";
DBM_SAPPHIRON_FROSTBOLT_FADE_EXPR	= "Icebolt fades from you";

DBM_SAPPHIRON_ENRAGE_ANNOUNCE		= "*** Enrage in %d sec ***";


-- Kel'Thuzad
DBM_KELTHUZAD_NAME			= "Kel'Thuzad";
DBM_KELTHUZAD_INFO			= "Announces phases and abilities of the Kel'Thuzad boss fight.";

DBM_KELTHUZAD_RANGECHECK		= "Show distance frame during phase 2 and 3";

DBM_KELTHUZAD_PHASE1_EXPR		= "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!";
DBM_KELTHUZAD_PHASE1_ANNOUNCE		= "*** Phase 1 ***";

DBM_KELTHUZAD_PHASE2_EXPR1		= "Pray for mercy!";
DBM_KELTHUZAD_PHASE2_EXPR2		= "Scream your dying breath!";
DBM_KELTHUZAD_PHASE2_EXPR3		= "The end is upon you!";
DBM_KELTHUZAD_PHASE2_ANNOUNCE		= "*** Phase 2 - Kel'Thuzad engaged ***";

DBM_KELTHUZAD_PHASE3_EXPR		= "Master, I require aid!";
DBM_KELTHUZAD_PHASE3_ANNOUNCE		= "*** Phase 3 - Guardians in ~15 sec ***";

DBM_KELTHUZAD_GUARDIAN_EXPR		= "Very well. Warriors of the frozen wastes, rise up! I command you to fight, kill and die for your master! Let none survive!";
DBM_KELTHUZAD_GUARDIAN_ANNOUNCE	= "*** Guardians in ~10 sec ***";

DBM_KELTHUZAD_MC_EXPR1			= "Your soul is bound to me, now!";
DBM_KELTHUZAD_MC_EXPR2			= "There will be no escape!";
--DBM_KELTHUZAD_MC_EXPR3		= "%s¿ñĞ¦²»Ö¹";			 --laugh emote
DBM_KELTHUZAD_MC_ANNOUNCE		= "*** Mind Control ***";
DBM_KELTHUZAD_MC_CD				= "*** Mind Control cooldown ready ***";
DBM_KELTHUZAD_MC_SOON			= "*** Mind Control Incoming ***";

DBM_KELTHUZAD_FISSURE_EXPR		= "Kel'Thuzad casts Shadow Fissure.";
DBM_KELTHUZAD_FISSURE_ANNOUNCE		= "*** Shadow Fissure ***";

DBM_KELTHUZAD_FROSTBLAST_EXPR		= "^(.+) (.+) afflicted by Frost Blast";
DBM_KELTHUZAD_FROSTBLAST_ANNOUNCE	= "*** Frost Blast ***";
DBM_KELTHUZAD_FROSTBLAST_SOON		= "*** Possible Frost Blast Incoming ***";
DBM_KELTHUZAD_FROSTBLAST_PARTY		= "I'm blasted! HEAL me!";

DBM_KELTHUZAD_DETONATE_EXPR		= "^([^%s]+) ([^%s]+) afflicted by Detonate Mana.";
DBM_KELTHUZAD_DETONATE_ANNOUNCE	= "*** Detonate Mana - >%s< ***";
DBM_KELTHUZAD_DETONATE_SELFWARN	= "You are the Bomb!";
DBM_KELTHUZAD_DETONATE_WHISPER		= "You are the Bomb!";

DBM_SBT["Mindcontrol"]		= "Mind Control";
DBM_SBT["Mindcontrol CD"]	= "Mind Control CD";