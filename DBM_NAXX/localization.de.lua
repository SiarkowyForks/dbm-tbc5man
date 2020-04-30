if GetLocale() == "deDE" then
	--Patchwerk
	DBM_PW_NAME		= "Flickwerk";
	DBM_PW_DESCRIPTION	= "Stellt einen Timer f\195\188r seinen Enrage zur Verf\195\188gung.";
	DBM_PW_OPTION1		= "Hasserf\195\188llter Sto\195\159 ansagen";
	DBM_PW_OPTION2		= "Stats anzeigen";
	
	DBM_PW_ENRAGE_WARNING	= "*** Enrage in %s %s ***";
	DBM_PW_HS_ANNOUNCE	= "Hasserf\195\188llter Sto\195\159 --> >%s< [%s]";
	--thx 2 leidenschafft
	DBM_PW_YELL_1 		= "Flickwerk spielen m\195\182chte!";
	DBM_PW_YELL_2 		= "Kel'thuzad macht Flickwerk zu seinem Abgesandten von Krieg!";	
  
	DBM_PW_HS_YOU_HIT		= "Flickwerk trifft Euch %(mit Hasserf\195\188llter Sto\195\159%). Schaden: (%d+).(.*)";
	DBM_PW_HS_YOU_MISS		= "Flickwerk greift an %(mit Hasserf\195\188llter Sto\195\159%) und verfehlt Euch.";
	DBM_PW_HS_YOU_DODGE		= "Flickwerks Hasserf\195\188llter Sto\195\159 wurde ausgewichen.";
	DBM_PW_HS_YOU_PARRY		= "Hasserf\195\188llter Sto\195\159 von Flickwerk wurde pariert.";
	DBM_PW_HS_PARTY_HIT		= "Flickwerks Hasserf\195\188llter Sto\195\159 trifft ([^%s]+) f\195\188r (%d+) Schaden.(.*)";
	DBM_PW_HS_PARTY_MISS		= "Hasserf\195\188llter Sto\195\159 von Flickwerk verfehlt ([^%s]+)."; 
	DBM_PW_HS_PARTY_DODGE		= "([^%s]+) ist Hasserf\195\188llter Sto\195\159 von Flickwerk ausgewichen.";
	DBM_PW_HS_PARTY_PARRY		= "Hasserf\195\188llter Sto\195\159 von Flickwerk wurde von ([^%s]+) pariert.";
	
	DBM_PWSTATS_STATS		= "*** Flickwerk Stats ***";
	DBM_PWSTATS_STRIKES		= "Hasserfüllte Stöße: %s (%.0f%%)";
	DBM_PWSTATS_HITS		= "Treffer: %s (%.0f%%)";
	DBM_PWSTATS_DODGES		= "Ausgewichen: %s (%.0f%%)";
	DBM_PWSTATS_PARRIES		= "Parriert: %s (%.0f%%)";
	DBM_PWSTATS_MISSES		= "Verfehlt: %s (%.0f%%)";
	DBM_PWSTATS_AVG_DMG		= "Durchschnittlicher Schaden pro Treffer: %.0f";
	DBM_PWSTATS_MAX_HIT		= "Höchster Treffer: %s auf %s";
	DBM_PWSTATS_PER_PLAYER		= "%s Hasserfüllte Stöße auf >%s< (%s Treffer)";
	DBM_PWSTATS_NOT_AVAILABLE	= "Stats nicht verfügbar";
	
	
	--Grobbulus
	DBM_GROBB_NAME				= "Grobbulus";
	DBM_GROBB_DESCRIPTION			= "Setzt ein Icon (Totenkopf) auf Spieler, die von Mutierende Injektion betroffen sind. Nur ein Spieler sollte ansagen und \"Icon setzen\" aktivieren.";
	DBM_GROBB_SEND_WHISPER			= "Whisper verschicken";
	DBM_GROBB_SET_ICON			= "Icon setzen";
	
	DBM_GROBB_YOU_ARE_INJECTED		= "Du bist von Mutierende Injektion betroffen!";
	DBM_GROBB_INJECTED_WARNING		= "*** >%s< ist von Mutierende Injektion betroffen ***"
	DBM_GROBB_INJECTED			= "Mutierende Injektion";
	
	DBM_GROBB_INJECTION_REGEXP		= "([^%s]+) (%w+) von Mutierende Injektion betroffen.";
	DBM_GROBB_INJECTION_FADES_REGEXP	= "Mutierende Injektion schwindet von ([^%s]+)%.";
	
	
	--Gluth
	DBM_GLUTH_NAME				= "Gluth";
	DBM_GLUTH_DESCRIPTION			= "Sagt Fear, Frenzy und Dezimieren an.";
	DBM_GLUTH_ANNOUNCE_FRENZY		= "Frenzy ansagen";
	
	DBM_GLUTH_DECIMATE_WARN1		= "*** Dezimieren in 2 Minuten ***";
	DBM_GLUTH_DECIMATE_WARN2		= "*** Dezimieren - n\195\164chstes in 2 Minuten ***";
	DBM_GLUTH_DECIMATE_1MIN_WARNING	= "*** Dezimieren in 1 Minute ***";
	DBM_GLUTH_DECIMATE_SOON_WARNING	= "*** Dezimieren bald ***";
	DBM_GLUTH_DECIMATE_WARNING		= "*** Dezimieren in ~%s Sek ***"
	DBM_GLUTH_FEAR_WARNING			= "*** Fear - n\195\164chstes in 20 Sek ***";
	DBM_GLUTH_FEAR_5SEC_WARNING		= "*** Fear in 5 Sekunden ***";
	
	DBM_GLUTH_DECIMATE_REGEXP		= "Gluths Dezimieren trifft ([^%s]+) f\195\188r (%d+) Schaden.";
	DBM_GLUTH_FEAR_REGEXP			= "(%w+) ist von Erschreckendes Gebr\195\188ll betroffen.";
	DBM_GLUTH_FRENZY			= "%s ger\195\164t in Raserei!"
	DBM_GLUTH_GLUTH			= "Gluth";
	
	DBM_SBT["Fear"]			= "Fear";
	DBM_SBT["Decimate"]			= "Dezimieren";
	
	
	--Razuvious
	DBM_IR_NAME			= "Instrukteur Razuvious";
	DBM_IR_DESCRIPTION		= "Stellt einen Timer f\195\188r Disrupting Shout zur Verf\195\188gung.";
	DBM_IR_SHOW_10SEC_WARNING	= "10 Sekunden Warning anzeigen";
	
	DBM_IR_TIMER_UPDATED		= "Timer aktualisiert";
	DBM_IR_SHOUT_WARNING		= "*** Unterbrechungsruf in %s Sek ***"
	
	DBM_IR_SPELL_1			= "Unterbrechungsruf";
	
	DBM_SBT["Disruption Shout"]	= "Unterbrechungsruf";
	
	
	--Noth the Plaguebringer
	DBM_NTP_NAME			= "Noth der Seuchenf\195\188rst";
	DBM_NTP_DESCRIPTION		= "Stellt Timer f\195\188r Blinzeln und Teleport zur Verf\195\188gung.";
	
	DBM_NTP_BACK_WARNING		= "*** Noth ist zur\195\188ck (%s Sek) ***";
	DBM_NTP_TELEPORT_WARNING	= "*** %s Sek bis Teleport ***";
	DBM_NTP_NOTH_GAINS_BLINK	= "*** Blinzeln ***";
	DBM_NTP_BLINK_5SEC_WARNING	= "*** Blinzeln in ~5 Sek ***";
	DBM_NTP_TELEPORT_10SEC_WARNING	= "*** Teleport in 10 Sek ***"
	DBM_NTP_BACK_10SEC_WARNING	= "*** 10 Sek bis er zur\195\188ck kommt ***";
	
	DBM_NTP_SPELL_1 		= "Noth der Seuchenf\195\188rst bekommt 'Blinzeln'.";
	DBM_NTP_YELL_START1 		= "Stirb, Eindringling!";
	DBM_NTP_YELL_START2 		= "Ehre unserem Meister!";
	DBM_NTP_YELL_START3 		= "Euer Leben ist verwirkt!";
	
	DBM_SBT["Teleport to Balcony"]	= "Teleport zum Balkon";
	DBM_SBT["Teleport back"]	= "Teleport zur\195\188ck";
	DBM_SBT["Blink"]		= "Blinzeln";
	
	
	--Heigan the Unclean
	DBM_HTU_NAME			= "Heigan der Unsaubere";
	DBM_HTU_DESCRIPTION		= "Stellt Timer f\195\188r seinen Teleport zur Verf\195\188gung.";
	
	DBM_HTU_TELEPORT_WARNING	= "*** Teleport in %s Sekunden ***";
	DBM_HTU_TELEPORT_BACK_WARNING	= "*** Teleport zur\195\188ck in %s Sekunden ***";
	
	DBM_HTU_YELL_START1 		= "Ihr seid.... als n\195\164chstes dran.";
	DBM_HTU_YELL_START2 		= "Ihr entgeht mir nicht...";
	DBM_HTU_YELL_START3 		= "Ihr geh\195\182rt mir...";
	
	DBM_SBT["Teleport"]		= "Teleport";
	DBM_SBT["Teleport back"]	= "Teleport zur\195\188ck";
	
	
	--Anub'Rekhan
	DBM_AR_NAME			= "Anub'Rekhan";
	DBM_AR_DESCRIPTION		= "Stellt Timer f\195\188r Heuschreckenschwarm zur Verf\195\188gung.";
	
	DBM_AR_LOCUST_WARNING		= "*** Heuschreckenschwarm in ~%s Sek ***";
	DBM_AR_LOCUST_SOON_WARNING	= "*** Heuschreckenschwarm bald ***";
	DBM_AR_LOCUST_INC_WARNING	= "*** Heuschreckenschwarm inc - 3 Sek ***";
	DBM_AR_GAIN_LOCUST_WARNING	= "*** Heuschreckenschwarm jetzt - 20 Sek ***";
	DBM_AR_LOCUST_END_WARNING	= "*** Heuschreckenschwarm endet in %s Sek ***";
	
	DBM_AR_YELL_1 			= "Es gibt kein Entkommen."; 
	DBM_AR_YELL_2 			= "Nur einmal kosten..."; 
	DBM_AR_YELL_3 			= "Rennt! Das bringt das Blut in Wallung!"; 
	DBM_AR_GAIN_LOCUST_SWARM 	= "Anub'Rekhan bekommt 'Heuschreckenschwarm'."; 
	DBM_AR_CAST_LOCUST_SWARM 	= "Anub'Rekhan beginnt Heuschreckenschwarm zu wirken."
	
	DBM_SBT["Locust Swarm"]	= "Heuschreckenschwarm";
	DBM_SBT["Locust Swarm Cast"]	= "Heuschreckenschwarm Cast";
	
	
	--Grand Widow Faerlina
	DBM_GWF_NAME			= "Gro\195\159witwe Faerlina";
	DBM_GWF_DESCRIPTION		= "Stellt Timer f\195\188r ihren Enrage zur Verf\195\188gung.";
	
	DBM_GWF_ENRAGE_WARNING1	= "*** Enrage - n\195\164chster in 60 Sek ***";
	DBM_GWF_ENRAGE_WARNING2	= "*** Enrage in ~%s Sek ***";
	DBM_GWF_ENRAGE_CD_READY	= "*** Enrage Cooldown abgelaufen ***"
	DBM_GWF_EMBRACE_WARNING	= "*** Umarmung der Witwe endet in %s Sek ***"

	DBM_GWF_YELL_1			= "Ihr k\195\182nnt Euch nicht vor mir verstecken!"; 
	DBM_GWF_YELL_2 		= "T\195\182tet sie im Namen des Meisters!"; 
	DBM_GWF_YELL_3 		= "Flieht, solange ihr noch k\195\182nnt." --satzzeichen? ist da wirklich ein punkt? im englischen ausrufezeichen...komisch?
	DBM_GWF_YELL_4 		= "Kniet nieder, Wurm!";
	DBM_GWF_DEBUFF 		= "Gro\195\159witwe Faerlina ist von Umarmung der Witwe betroffen.";
	DBM_GWF_GAIN_ENRAGE		= "Gro\195\159witwe Faerlina bekommt 'Wutanfall'.";

	DBM_SBT["Enrage"]		= "Enrage";
	DBM_SBT["Widow's Embrace"]	= "Umarmung der Witwe";
	
	--Maexxna
	DBM_MAEXXNA_NAME		= "Maexxna";
	DBM_MAEXXNA_DESCRIPTION	= "Stellt Timer f\195\188r ihr Gespinstschauer und die Spinnen Adds zur Verf\195\188gung.";
	DBM_MAEXXNA_YELL_ON_WRAP	= "Schreien, wenn genetzt";
	
	DBM_MAEXXNA_WEB_WRAP_YELL	= "%s ist eingenetzt. Gruppe %s.";
	DBM_MAEXXNA_WRAP_WARNING	= "*** >%s< ist eingenetzt ***";
	DBM_MAEXXNA_SPRAY_WARNING	= "*** Gespinstschauer in %s Sek ***";
	DBM_MAEXXNA_SPIDER_WARNING	= "*** Spinnen in %s Sek ***";
	DBM_MAEXXNA_SPIDERS_SPAWNED	= "*** Spinnen gespawned ***";
	
	DBM_MAEXXNA_WEB_SPRAY		= "Gespinstschauer";
	DBM_MAEXXNA_MAEXXNA		= "Maexxna";
	DBM_MAEXXNA_WEB_WRAP_REGEXP	= "([^%s]+) (%w+) von Fangnetz betroffen.";
	
	DBM_SBT["Web Spray"]		= "Gespinstschauer";
	DBM_SBT["Spider Spawn"]	= "Spinnen";
	
	--Gothik the Harvester
	DBM_GOTH_NAME			= "Gothik der Seelenj\195\164ger";
	DBM_GOTH_DESCRIPTION		= "Stellt Timer f\195\188r seine Adds zur Verf\195\188gung und sagt deren Tod an.";
	
	DBM_GOTH_PHASE2_WARNING	= "*** Gothik inc ***";
	DBM_GOTH_PHASE2_INC_WARNING	= "*** Phase 2 in %s %s ***";
	DBM_GOTH_DEAD_WARNING		= "*** %s tot ***";
	DBM_GOTH_INC_WARNING		= "*** %s in %s Sek ***";
	DBM_GOTH_WAVE_INC_WARNING1	= "*** Welle %s/18 in 3 Sek - %s %s  ***";
	DBM_GOTH_WAVE_INC_WARNING2	= "*** Welle %s/18 in 3 Sek - %s %s und %s %s ***";
	DBM_GOTH_WAVE_INC_WARNING3	= "*** Welle %s/18 in 3 Sek - %s %s, %s %s und %s %s ***";
	
	DBM_GOTH_YELL_START1		= "Ihr Narren habt euren eigenen Untergang heraufbeschworen."
	DBM_GOTH_PHASE2_YELL		= "I have waited long enough. Now you face the harvester of souls.";
	
	DBM_GOTH_RIDER			= "Unerbittlicher Reiter";
	DBM_GOTH_RIDER_SHORT		= "Reiter";
	DBM_GOTH_KNIGHT		= "Unerbittlicher Todesritter";
	DBM_GOTH_KNIGHT_SHORT		= "Todesritter";
	DBM_GOTH_KNIGHTS_SHORT		= "Todesritter";
	DBM_GOTH_TRAINEE		= "Unerbittlicher Lehrling";
	DBM_GOTH_TRAINEE_SHORT		= "Lehrlinge";
	
	DBM_SBT["Phase 2"] 		= "Phase 2";
	DBM_SBT["Trainees"]		= "Lehrlinge";
	DBM_SBT["Deathknight"]		= "Todesritter";
	DBM_SBT["Rider"]		= "Reiter";

	-- Sapphiron
	DBM_SAPPHIRON_NAME 			= "Saphiron";
	DBM_SAPPHIRON_INFO			= "Stellt Timer für den Saphiron Kampf bereit.";

	DBM_SAPPHIRON_YELL_INFO		= "Schreien wenn man zu Eis erstarrt";
	DBM_SAPPHIRON_PING_INFO		= "Minimap Pings anzeigen";
	DBM_SAPPHIRON_YELL_ANNOUNCE		= "Ich bin ein Eisblock, stellt euch hinter mich!";

	DBM_SAPPHIRON_LIFEDRAIN_EXPR1		= "von Lebenssauger betroffen";
	DBM_SAPPHIRON_LIFEDRAIN_EXPR2		= "Lebenssauger wurde von .+ widerstanden";
	DBM_SAPPHIRON_LIFEDRAIN_ANNOUNCE	= "*** Lebenssauger - nächster in ~24 Sek ***";
	DBM_SAPPHIRON_LIFEDRAIN_WARN		= "*** Lebenssauger in %d Sek ***";

	DBM_SAPPHIRON_DEEPBREATH_EXPR		= "atmet tief ein...";
	DBM_SAPPHIRON_DEEPBREATH_ANNOUNCE	= "*** Frostatem ***";

	DBM_SAPPHIRON_FROSTBOLT_GAIN_EXPR	= "Ihr seid von Eisblitz betroffen";
	DBM_SAPPHIRON_FROSTBOLT_FADE_EXPR	= "Eisblitz schwindet von Euch";

	DBM_SAPPHIRON_ENRAGE_ANNOUNCE		= "*** Enrage in %d Sek ***";


	-- Kel'Thuzad
	DBM_KELTHUZAD_NAME			= "Kel'Thuzad";
	DBM_KELTHUZAD_INFO			= "Warnt vor den verschiedenen Kampfphasen und Angriffen von Kel'Thuzad.";

	DBM_KELTHUZAD_PHASE1_EXPR		= "Diener, Jünger, Soldaten der eisigen Finsternis! Folgt dem Ruf von Kel'Thuzad!";
	DBM_KELTHUZAD_PHASE1_ANNOUNCE		= "*** Phase 1 ***";
	
	DBM_KELTHUZAD_PHASE2_EXPR1		= "Fleht um Gnade!";
	DBM_KELTHUZAD_PHASE2_EXPR2		= "Macht Euren letzten Atemzug!";
	DBM_KELTHUZAD_PHASE2_EXPR3		= "Euer Ende ist nah!";
	DBM_KELTHUZAD_PHASE2_ANNOUNCE		= "*** Phase 2 - Kel'Thuzad kommt ***";
	
	DBM_KELTHUZAD_PHASE3_EXPR		= "Meister, helft mir!";
	DBM_KELTHUZAD_PHASE3_ANNOUNCE		= "*** Phase 3 - Wächter in ~15 sec ***";

	DBM_KELTHUZAD_MC_EXPR1			= "Eure Seele gehört jetzt mir!";
	DBM_KELTHUZAD_MC_EXPR2			= "Es gibt kein Entkommen!";
	DBM_KELTHUZAD_MC_ANNOUNCE		= "*** Gedankenkontrolle ***";
	DBM_KELTHUZAD_GUARDIAN_EXPR		= "Also gut. Erhebt euch, Krieger der eisigen Weiten! Ich befehle euch zu kämpfen, zu töten und für euren Meister zu sterben! Lasst keinen am Leben!";
	DBM_KELTHUZAD_GUARDIAN_ANNOUNCE	= "*** Wächter in ~10 sec ***";
	DBM_KELTHUZAD_FISSURE_EXPR		= "Kel'Thuzad wirkt Schattenspalt.";
	DBM_KELTHUZAD_FISSURE_ANNOUNCE		= "*** Schattenspalt ***";
	DBM_KELTHUZAD_FROSTBLAST_EXPR		= "^([^%s]+) ([^%s]+) von Frostschlag betroffen";
	DBM_KELTHUZAD_FROSTBLAST_ANNOUNCE	= "*** Frostschlag ***";
	DBM_KELTHUZAD_DETONATE_EXPR		= "^([^%s]+) ([^%s]+) von Detonierendes Mana betroffen";
	DBM_KELTHUZAD_DETONATE_ANNOUNCE	= "*** Detonierendes Mana - >%s< ***";
	DBM_KELTHUZAD_DETONATE_SELFWARN	= "Du bist die Bombe!";
	DBM_KELTHUZAD_DETONATE_WHISPER		= "Du bist die Bombe!";


	--Thaddius
	DBM_THADDIUS_NAME			= "Thaddius";
	DBM_THADDIUS_DESCRIPTION		= "Stellt Timer für seinen Enrage und \"Polarity Shift\" zur Verfügung.";
	DBM_THADDIUS_WARN_NOT_CHANGED		= "Warnen auch wenn sich die Polarität nicht ändert";
	DBM_THADDIUS_ALT_STRATEGY		= "Alternativ Strategie (zeigt rechts/links Warnungen)";
		
	DBM_THADDIUS_ENRAGE_WARNING		= "*** Enrage in %s %s ***";
	DBM_THADDIUS_POL_SHIFT			= "*** Polaritätsveränderung ***";
	DBM_THADDIUS_SURGE_WARNING		= "*** Power Surge ***";
	DBM_THADDIUS_POL_WARNING		= "*** Polaritätsveränderung in %s Sek ***";
	DBM_THADDIUS_PHASE_2_SOON		= "*** Phase 2 in 4 Sekunden ***";
	DBM_THADDIUS_CHARGE_CHANGED		= "Aufladung geändert zu %s!";
	DBM_THADDIUS_CHARGE_NOT_CHANGED	= "Aufladung nicht geändert";
	DBM_THADDIUS_RIGHT			= "Rechts!";
	DBM_THADDIUS_LEFT			= "Links!";

	DBM_THADDIUS_GAINS_SURGE		= "Stalagg bekommt 'Energieschub'.";
	DBM_THADDIUS_CAST_POL			= "Thaddius beginnt Polarit\195\164tsver\195\164nderung zu wirken.";
	DBM_THADDIUS_POL_REGEXP		= "Ihr seid von ([^%s]+) Ladung betroffen";
	DBM_THADDIUS_YELL_START1		= "Töten...";
	DBM_THADDIUS_YELL_START2		= "Eure... Knochen... zermalmen...";
	DBM_THADDIUS_YELL_START3		= "Euch... zerquetschen!";
	DBM_THADDIUS_YELL_POL			= "Jetzt spürt ihr den Schmerz...";
	DBM_THADDIUS_ENRAGE			= "verfällt in Berserkerwut";
	DBM_THADDIUS_TESLA_EMOTE		= " %s überädt";
	DBM_THADDIUS_TESLA_COIL		= "Teslaspule";
	DBM_THADDIUS_THADDIUS			= "Thaddius";
	DBM_THADDIUS_POSITIVE			= "Positiv";
	DBM_THADDIUS_NEGATIVE			= "Negativ";

	-- Phase1
	DBM_THADDIUS_PHASE1_YELL1 		= "Stalagg zerquetschen!";
	DBM_THADDIUS_PHASE1_YELL2 		= "Verfüttere euch an Meister!";
	DBM_THADDIUS_PHASE1_ANNOUNCE		= "*** Phase 1 ***";
	DBM_THADDIUS_SURGE_EXPR		= "Stalagg bekommt 'Energieschub'.";
	DBM_THADDIUS_SURGE_ANNOUNCE		= "*** Energieschub für 10 Sek ***";
	DBM_THADDIUS_THROW_ANNOUNCE		= "*** MT geworfen ***";
	DBM_THADDIUS_THROW_ANNOUNCE_SOON	= "*** MT wird in %s Sek geworfen ***";
	DBM_THADDIUS_PLATFORM_EXPR		= "verliert die Verbindung!";
	DBM_THADDIUS_PLATFORM_ANNOUNCE		= "*** Warning - Add leaves the platform ***";

	DBM_SBT["Enrage"]			= "Enrage";
	DBM_SBT["Polarity Shift"]		= "Polaritätsveränderung";
	DBM_SBT["Polarity Shift cast"]		= "Polaritätsveränderung Zauber";


	-- FourHorsemen
	DBM_FOURHORSEMEN_NAME				= "Four Horsemen";
	DBM_FOURHORSEMEN_INFO				= "Stellt Timer für den 4H Kampf zur Verfügung.";
	DBM_FOURHORSEMEN_SHOW_5SEC_MARK_WARNING	= "Zeige 5 Sekunden Mark Warnung";

	DBM_FOURHORSEMEN_THANE				= "Thane Korth'azz";
	DBM_FOURHORSEMEN_LADY				= "Lady Blaumeux";
	DBM_FOURHORSEMEN_MOGRAINE			= "Hochlord Mograine";
	DBM_FOURHORSEMEN_ZELIEK			= "Sire Zeliek";

	DBM_FOURHORSEMEN_REAL_NAME			= "Four Horsemen";
	
	DBM_FOURHORSEMEN_WHISPER_INFO			= "Spielern in Void Zonen whispern";
	DBM_FOURHORSEMEN_SYNC_INFO			= "Mark mit anderen Clients synchronisieren";
	DBM_FOURHORSEMEN_INFOFRAME_INFO		= "InfoFrame mit Boss HP während dem Kampf anzeigen";
	
	DBM_FOURHORSEMEN_MARK_EXPR			= "von Mal von (.+) betroffen";
	DBM_FOURHORSEMEN_MARK_ANNOUNCE			= "*** Mark #%d ***";
	DBM_FOURHORSEMEN_MARK_WARNING			= "*** Mark #%d in 5 Sek ***";
	
	DBM_FOURHORSEMEN_METEOR_EXPR			= "Thane Korth'azzs Meteor trifft (.+) für (%d+) Feuerschaden%.";
	DBM_FOURHORSEMEN_METEOR_ANNOUNCE		= "*** Meteor ***";
	
	DBM_FOURHORSEMEN_VOID_EXPR			= "Lady Blaumeux wirkt Zone der Leere.";
	DBM_FOURHORSEMEN_VOID_ANNOUNCE			= "Zone der Leere";
	DBM_FOURHORSEMEN_VOID_WHISPER			= "Du stehst in der 'Zone der Leere'!";
	DBM_FOURHORSEMEN_VOID_ALLWAYS_INFO		= "Zeige immer eine Spezial Warnung bei Void Zonen";
	
	DBM_FOURHORSEMEN_SHIELDWALL_EXPR		= "(.*) bekommt 'Schildwall'.";
	DBM_FOURHORSEMEN_SHIELDWALL_ANNOUNCE		= "*** %s: Schildwall für 20 Sek ***";
	DBM_FOURHORSEMEN_SHIELDWALL_FADE		= "*** Schildwall schwindet von %s ***";	

	DBM_FOURHORSEMEN_TAUNTRESIST_INFO		= "Informiere über Spott Fehlschläge";
	DBM_FOURHORSEMEN_TAUNTRESIST_TAUNT		= "Spott";
	DBM_FOURHORSEMEN_TAUNTRESIST_MOKING		= "Spöttischer Schlag";
	DBM_FOURHORSEMEN_TAUNTRESIST_CSHOUT		= "Herausforderungsruf";
	DBM_FOURHORSEMEN_TAUNTRESIST_RESIST		= "widerstanden";
	DBM_FOURHORSEMEN_TAUNTRESIST_PARRY		= "pariert";
	DBM_FOURHORSEMEN_TAUNTRESIST_DODGE		= "ausgewichen";
	DBM_FOURHORSEMEN_TAUNTRESIST_MISS		= "verfehlt";
	DBM_FOURHORSEMEN_TAUNTRESIST_BLOCK		= "geblockt";
	DBM_FOURHORSEMEN_TAUNTRESIST_SELFWARN		= "SPOTT FEHLGESCHLAGEN";
	DBM_FOURHORSEMEN_TAUNTRESIST_MESSAGE		= "--> Spott fehlgeschlagen! <--";

	--Loatheb
	DBM_LOATHEB_NAME				= "Loatheb";
	DBM_LOATHEB_DESCRIPTION			= "Sagt Loathebs Inevitable Doom and und zeigt Heal Cooldowns. Verwende /loatheb setup oder /loatheb config um die Healer Rotation einzustellen, das Ansagen der Healer funktioniert nicht ohne eine eingestellte Rotation. Wenn du die ID eines Healers auf 0 setzt wird er aus der Liste entfernt. Mit /loa undelete kann man gelöschte Healer wiederherstellen.";
	DBM_LOATHEB_ANNOUNCE_SPORES			= "Sporen ansagen";
	DBM_LOATHEB_HEAL_RAID				= "Heals im Raid Chat ansagen";
	DBM_LOATHEB_HEAL_RAID_WARN			= "Heals im Raid Warnungs Chat ansagen";
	DBM_LOATHEB_HEAL_WHISPER			= "Whisper an den nächsten Healer verschicken";
	DBM_LOATHEB_ANNOUNCE_POT_OPTION		= "Consumables ansagen";
	DBM_LOATHEB_SPECIALWARN_POT_OPTION		= "Special Warning anzeigen, wenn du ein Consumable verwenden musst";
	DBM_LOATHEB_HEAL_SHOW_AUTO			= "Heiler Info Frame nach dem Pull anzeigen";
	DBM_LOATHEB_HEAL_SHOW_NOW			= "Heiler Info Frame anzeigen";
	DBM_LOATHEB_HEAL_SETUP				= "Heiler Rotation einstellen";
	DBM_LOATHEB_NO_BC_INFO				= "Du hast keine Rechte zum Broadcasten deiner Einstellungen. Einstellungen von jemandem mit (A) oder (L) werden deine lokal gesetzte Heiler Rotation überschreiben.";
	DBM_LOATHEB_NO_CD				= "Kein Cooldown";
	DBM_LOATHEB_SET_HEAL_ROTATION			= "Speichern & syncen";
	DBM_LOATHEB_SET_HEAL_ROTATION_NO_BC		= "Speichern";
	DBM_LOATHEB_SHADOW_PROT_POT			= "Schattenschutztrank";
	DBM_LOATHEB_BANDAGE				= "Bandage";
	DBM_LOATHEB_HEALTHSTONE			= "Gesundheitsstein";

	DBM_LOATHEB_DOOM_WARNING		= "*** Inevitable Doom #%s in %s Sek ***";
	DBM_LOATHEB_DOOM_NOW			= "*** Inevitable Doom #%s - nächster in %s Sek ***";
	DBM_LOATHEB_DECURSE_NOW		= "*** Flüche entfernte - nächstes in 30 Sek ***";
	DBM_LOATHEB_DECURSE_WARNING		= "*** Flüche entfernen in %s Sek ***";
	DBM_LOATHEB_SPORE_SPAWNED		= "*** Spore %d ***";
	DBM_LOATHEB_POT_ANNOUNCE		= "*** %s jetzt! ***";
	DBM_LOATHEB_POT_WARNING		= "Jetzt %s verwenden!";
	DBM_LOATHEB_HEAL_WARNING		= "Heilung #%s durch - nächster: >%s<";
	DBM_LOATHEB_YOU_ARE_NEXT		= "Du bist der nächste!";
	DBM_LOATHEB_YOU_ARE_SOON		= "Mach dich bereit zum Heilen!";

	DBM_LOATHEB_DOOM_REGEXP		= "([^%s]+) (%w+) afflicted by Inevitable Doom.";
	DBM_LOATHEB_REMOVE_CURSE		= "Loatheb casts Remove Curse on Loatheb.";
	DBM_LOATHEB_HEAL_REGEXP		= "([^%s]+) (%w+) afflicted by Corrupted Mind.";
	DBM_LOATHEB_SUMMON_SPORE		= "Loatheb casts Summon Spore.";
	DBM_LOATHEB_LOATHEB			= "Loatheb";

	DBM_SBT["Inevitable Doom"]		= "Inevitable Doom";

end
