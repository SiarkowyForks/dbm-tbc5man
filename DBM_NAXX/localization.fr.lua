--## Vendetta boss mod naxxramas ##
  -- ## Traduction fr by Elfik Medivh-eu  ##

if ( GetLocale() == "frFR" ) then
--Patchwerk
DBM_PW_NAME			= "Le Recousu";
DBM_PW_DESCRIPTION		= "Pr\195\169viens quand Le Recousu devient enrag\195\169.";
DBM_PW_OPTION1			= "Annoncer les Frappe haineuse";
DBM_PW_OPTION2			= "Voir les stats";
DBM_PW_OPTION3			= "Voir info frame";

DBM_PW_ENRAGE_WARNING		= "*** Enrager dans %s %s ***";
DBM_PW_HS_ANNOUNCE		= "Frappe haineuse --> %s [%s]";

DBM_PW_YELL_1 			= "R'cousu veut jouer !";
DBM_PW_YELL_2 			= "R'cousu avatar de guerre pour Kel'Thuzad !";

DBM_PW_HS_YOU_HIT		= "Frappe haineuse de Le Recousu vous inflige (%d+).(.*)";
DBM_PW_HS_YOU_MISS		= "Frappe haineuse de Le Recousu vous rate.";
DBM_PW_HS_YOU_DODGE		= "Vous esquivez Frappe haineuse de Le Recousu.";
DBM_PW_HS_YOU_PARRY		= "Frappe haineuse de Le Recousu : Par\195\169.";
DBM_PW_HS_PARTY_HIT		= "Frappe haineuse de Le Recousu touche ([^%s]+) pour (%d+).(.*)";
DBM_PW_HS_PARTY_MISS		= "Le Recousu voit son Frappe haineuse manquer ([^%s]+)."; 
DBM_PW_HS_PARTY_DODGE		= "([^%s]+) esquive Frappe haineuse de Le Recousu.";
DBM_PW_HS_PARTY_PARRY		= "Le Recousu attaque et ([^%s]+) pare son attaque.";

DBM_PWSTATS_STATS		= "*** Le Recousu Stats ***";
DBM_PWSTATS_STRIKES		= "Frappe haineuse: %s (%.0f%%)";
DBM_PWSTATS_HITS		      = "Touch\195\169: %s (%.0f%%)";
DBM_PWSTATS_DODGES		= "Esquiv\195\169: %s (%.0f%%)";
DBM_PWSTATS_PARRIES		= "Par\195\169: %s (%.0f%%)";
DBM_PWSTATS_MISSES		= "Rat\195\169: %s (%.0f%%)";
DBM_PWSTATS_AVG_DMG		= "D\195\169gats moyen par coup: %.0f";
DBM_PWSTATS_MAX_HIT		= "Coup Maximum: %s sur %s";
DBM_PWSTATS_PER_PLAYER		= "%s Frappe haineuse sur %s (%s hits)";
DBM_PWSTATS_NOT_AVAILABLE	= "Stats non disponible";


--Grobbulus
DBM_GROBB_NAME				= "Grobbulus";
DBM_GROBB_DESCRIPTION			= "Mettre une icone sur la personne subissant Injection mutante.";
DBM_GROBB_SEND_WHISPER			= "whisper";
DBM_GROBB_SET_ICON			= "Mettre icone";

DBM_GROBB_YOU_ARE_INJECTED		= "Tu es inject\195\169 !";
DBM_GROBB_INJECTED_WARNING		= "*** %s est inject\195\169 ***";
DBM_GROBB_INJECTED			= "Injection mutante";

DBM_GROBB_INJECTION_REGEXP		= "([^%s]+) (%w+) les effets de Injection mutante.";
DBM_GROBB_INJECTION_FADES_REGEXP	= "Injection mutante disparait de ([^%s]+)%.";

DBM_GROBB_CLOUD_POISON			= "Grobbulus lance Nuage de poison.";



--Gluth
DBM_GLUTH_NAME				= "Gluth";
DBM_GLUTH_DESCRIPTION			= "Annonce le fear, la fr\195\169n\195\169sie et le d\195\169cimer de gluth .";
DBM_GLUTH_ANNOUNCE_FRENZY		= "Annoncer fr\195\169n\195\169sie";

DBM_GLUTH_DECIMATE_WARN1		= "*** D\195\169cimer dans 2 min ***";
DBM_GLUTH_DECIMATE_WARN2		= "*** D\195\169cimer - prochain dans 2 minutes ***";
DBM_GLUTH_DECIMATE_1MIN_WARNING	= "*** D\195\169cimer dans 1 minute ***";
DBM_GLUTH_DECIMATE_SOON_WARNING	= "*** D\195\169cimer imminent ***";
DBM_GLUTH_DECIMATE_WARNING		= "*** D\195\169cimer dans ~%s sec ***"
DBM_GLUTH_FEAR_WARNING			= "*** Fear - prochain dans 20 sec ***";
DBM_GLUTH_FEAR_5SEC_WARNING		= "*** Fear dans 5 sec ***";

DBM_GLUTH_DECIMATE_REGEXP		= "D\195\169cimer de gluth touche ([^%s]+) pour (%d+).";
DBM_GLUTH_FEAR_REGEXP			= "(%w+) subit les effets de Rugissement terrifiant.";
DBM_GLUTH_FRENZY			      = "%s est pris de fr\195\169n\195\169sie !"
DBM_GLUTH_FRENZY_ANNOUNCE		= "*** fr\195\169n\195\169sie ***";
DBM_GLUTH_GLUTH			      = "Gluth";
DBM_GLUTH_ENRAGE_ANNOUNCE		= "*** Enrager dans %s%s ***";

DBM_SBT["Fear"]			      = "Rugissement terrifiant";
DBM_SBT["Decimate"]			= "D\195\169cimer";


--Razuvious
DBM_IR_NAME				= "Instructeur Razuvious";
DBM_IR_DESCRIPTION			= "Affiche des alertes lorsque l'Instructeur Razuvious utilise son Cri perturbant";
DBM_IR_SHOW_10SEC_WARNING		= "Show 10 sec warning";

DBM_IR_TIMER_UPDATED			= "Timer updated";
DBM_IR_SHOUT_WARNING			= "*** CRI PERTURBANT DANS %s SEC ***";

DBM_IR_SPELL_1				= "Cri perturbant";
--removed in patch 2.0
DBM_IR_YELL_1				= "Les cours sont termin\195\169s ! Montrez%-moi ce que vous avez appris !";
DBM_IR_YELL_2				= "Frappe%-le \195\160 la jambe";
DBM_IR_YELL_3				= "Faites ce que vous ai appris !";
DBM_IR_YELL_4				= "Pas de quartier !";

DBM_SBT["Disruption Shout"]		= "Cri perturbant";


--Noth the Plaguebringer
DBM_NTP_NAME				= "Noth le Porte-peste";
DBM_NTP_DESCRIPTION			= "Affiche des alertes pour la Mal\195\169diction, le Transfert et la T\195\169l\195\169portation de Noth.";
DBM_NTP_OPTION_WARN_SPAWN 		= "Annonce des adds";
DBM_NTP_OPTION_WARN_CURSE 		= "Annonce du curse";

DBM_NTP_BACK_WARNING			= "*** Noth est de retour (%s sec) - Frappez le ***";
DBM_NTP_TELEPORT_WARNING		= "*** %s sec avant teleportation ***";
DBM_NTP_NOTH_GAINS_BLINK		= "*** Transfert ***";
DBM_NTP_BLINK_5SEC_WARNING		= "*** Transfert dans ~5 sec ***";
DBM_NTP_BLINK_0SEC_WARNING		= "*** NOTH GAGNE TRANSFERT - STOP DPS ***";
DBM_NTP_TELEPORT_10SEC_WARNING	= "*** Teleportation dans 10 sec ***"
DBM_NTP_BACK_10SEC_WARNING		= "*** 10 sec avant Retour de Noth ***";
DBM_NTP_ADD_WARNING			= "*** Adds dans 5 secondes ***";
DBM_NTP_CURSE_WARNING			= "*** Curse ***";
DBM_NTP_NEXT_WAVE_SOON			= "*** 10 sec avant prochaine vague ***";

DBM_NTP_SPELL_1 			      = "Noth le Porte-peste gagne Transfert";
DBM_NTP_CURSE_AFFLICT 			= "Noth le Porte-peste gagne Transfert"; -- AOE curse
DBM_NTP_ADDS_SPAWN 			= "Je servirai le ma\195\174tre... dans la mort !"; -- Adds spawn
DBM_NTP_YELL_START1 			= "Mourez, intrus !";
DBM_NTP_YELL_START2 			= "Gloire au ma\195\174tre !";
DBM_NTP_YELL_START3 			= "Vos vies ne valent plus rien !";

DBM_SBT["Teleport to Balcony"]	= "T\195\169l\195\169portation sur le balcon";
DBM_SBT["Teleport back"]		= "Teleport back";
DBM_SBT["Blink"]			      = "Transfert";

--Heigan the Unclean
DBM_HTU_NAME			= "Heigan l'Impur";
DBM_HTU_DESCRIPTION		= "Affiche des alertes pour la T\195\169l\195\169portation de Heigan.";

DBM_HTU_TELEPORT_WARNING	= "*** T\195\169l\195\169portation dans %s sec ***";
DBM_HTU_TELEPORT_BACK_WARNING	= "*** Retour de Heigan dans %s sec ***";

DBM_HTU_YELL_START1 		= "Tu es... le suivant.";
DBM_HTU_YELL_START2 		= "Je vous vois...";
DBM_HTU_YELL_START3 		= "Vous \195\170tes \195\160 moi, maintenant.";

DBM_SBT["Teleport"]		= "T\195\169l\195\169portation";
DBM_SBT["Teleport Back"]	= "Teleport Back";


--Anub'Rekhan
DBM_AR_NAME			= "Anub'Rekhan";
DBM_AR_DESCRIPTION		= "Affiches des alertes pour pr\195\169venir de la Nu\195\169e de sauterelles d'Anub'Rekhan";

DBM_AR_LOCUST_WARNING		= "*** Nu\195\169e de sauterelles dans ~%s sec ***";
DBM_AR_LOCUST_SOON_WARNING	= "*** NUEE DE SAUTERELLES IMMINENTE ***";
DBM_AR_LOCUST_INC_WARNING	= "*** Nu\195\169e de sauterelles est lancé - 3 sec ***";
DBM_AR_GAIN_LOCUST_WARNING	= "*** Nu\195\169e de sauterelles pendant 20 sec ***";
DBM_AR_LOCUST_END_WARNING	= "*** Fin de la Nu\195\169e de sauterelles dans %s sec ***";

DBM_AR_YELL_1 			= "Nulle part pour s'enfuir.";
DBM_AR_YELL_2 			= "Rien qu'une petite bouch\195\169e";	
DBM_AR_YELL_3 			= "Oui, courez ! Faites circulez le sang !";
DBM_AR_CAST_LOCUST_SWARM 	= "Anub'Rekhan commence \195\160 lancer Nu\195\169e de sauterelles.";
DBM_AR_GAIN_LOCUST_SWARM 	= "Anub'Rekhan gagne Nu\195\169e de sauterelles.";

DBM_SBT["Locust Swarm"]	= "Nu\195\169e de sauterelles";
DBM_SBT["Locust Swarm Cast"]	= "lancer Nu\195\169e de sauterelles";


--Grand Widow Faerlina
DBM_GWF_NAME			= "Grande veuve Faerlina";
DBM_GWF_DESCRIPTION		= "Affiche des alertes pour l'Enrager de Faerlina.";

DBM_GWF_ENRAGE_WARNING1	= "*** Enrager - prochain dans 60 sec ***";
DBM_GWF_ENRAGE_WARNING2	= "*** Enrager dans ~%s sec ***";
DBM_GWF_ENRAGE_CD_READY	= "*** Enrager cooldown pret ***";
DBM_GWF_EMBRACE_WARNING	= "*** Etreinte de la veuve fini dans %s sec ***";
DBM_GWF_NEXT_ENRAGE_IN		= "*** Prochain enrager dans %s sec ***";

DBM_GWF_YELL_1			= "Vous ne pouvez pas m'\195\169chapper !";
DBM_GWF_YELL_2			= "Tuez-les au nom du ma\195\174tre !";
DBM_GWF_YELL_3			= "Fuyez tant que vous le pouvez !";
DBM_GWF_YELL_4			= " genoux, vermisseau !";
DBM_GWF_DEBUFF			= "Grande veuve Faerlina subit les effets de Etreinte de la veuve.";
DBM_GWF_GAIN_ENRAGE		= "Grande veuve Faerlina gagne Enrager.";

DBM_SBT["Enrage"]		= "Enrager";
DBM_SBT["Widow's Embrace"]	= "Etreinte de la veuve";

--Maexxna
DBM_MAEXXNA_NAME			= "Maexxna";
DBM_MAEXXNA_DESCRIPTION		= "Affiche des alertes pour le Jet de rets et l'Entoilage de Maexxna.";
DBM_MAEXXNA_YELL_ON_WRAP		= "Annoncer quand quelqu'un est entoil\195\137";

DBM_MAEXXNA_WEB_WRAP_YELL		= "%s est Entoil\195\137 . Groupe %s.";
DBM_MAEXXNA_WRAP_WARNING		= "*** %s est Entoil\195\169 ***";
DBM_MAEXXNA_SPRAY_WARNING		= "*** Entoilage dans %s sec ***";
DBM_MAEXXNA_SPIDER_WARNING		= "*** Pop des araign\195\137es dans %s sec ***";
DBM_MAEXXNA_SPIDERS_SPAWNED		= "*** POP DES ARAIGN\195\137ES ***";

DBM_MAEXXNA_WEB_SPRAY			= "Jet de rets";
DBM_MAEXXNA_MAEXXNA			= "Maexxna";
DBM_MAEXXNA_WEB_WRAP_REGEXP		= "([^%s]+) (%w+) les effets de Entoilage.";

DBM_SBT["Web Spray"]			= "Jet de rets";
DBM_SBT["Spider Spawn"]		= "Pop des araign\195\137es";
	

--Gothik the Harvester
DBM_GOTH_NAME				= "Gothik le moissonneur";
DBM_GOTH_DESCRIPTION			= "Affiche un timer pour le pop des add et annonce leur mort.";

DBM_GOTH_PHASE2_WARNING		= "*** Gothik arrive ***";
DBM_GOTH_PHASE2_INC_WARNING		= "*** Phase 2 dans %s %s ***";
DBM_GOTH_DEAD_WARNING			= "*** %s mort ***";
DBM_GOTH_INC_WARNING			= "*** %s dans %s sec ***";
DBM_GOTH_WAVE_INC_WARNING1		= "*** Vague %s/18 dans 3 sec - %s %s  ***";
DBM_GOTH_WAVE_INC_WARNING2		= "*** Vague %s/18 dans 3 sec - %s %s et %s %s ***";
DBM_GOTH_WAVE_INC_WARNING3		= "*** Vague %s/18 dans 3 sec - %s %s, %s %s et %s %s ***";

DBM_GOTH_YELL_START1			= "Dans votre folie, vous avez provoqu\195\169 votre propre mort.";
DBM_GOTH_PHASE2_YELL			= "J'ai attendu assez longtemps. Maintenant, vous affrontez le moissonneur d'\195\162mes.";

DBM_GOTH_RIDER				= "Cavalier tenace";
DBM_GOTH_RIDER_SHORT			= "Cavalier";
DBM_GOTH_KNIGHT			      = "Chevalier de la mort tenace";
DBM_GOTH_KNIGHT_SHORT			= "Chevalier";
DBM_GOTH_KNIGHTS_SHORT			= "Chevaliers";
DBM_GOTH_TRAINEE			      = "Jeune recrue tenace";
DBM_GOTH_TRAINEE_SHORT			= "Jeune recrue";

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

DBM_FOURHORSEMEN_INFOFRAME_TITLE		= "Four Horsemen";
DBM_FOURHORSEMEN_INFOFRAME_TEXT		= "Shows HP of the Horsemen";

DBM_FOURHORSEMEN_MARK_EXPR			= "afflicted by Mark of"; 	-- Is afflicted .. hmm You are affl...
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

--Thaddius
DBM_THADDIUS_NAME		      = "Thaddius";
DBM_THADDIUS_DESCRIPTION		= "Afficher un timer pour son enrage et son changement de polarit\195\169";
DBM_THADDIUS_WARN_NOT_CHANGED	= "Indiquer quand la polarit\195\169 na pas chang\195\169";
DBM_THADDIUS_ALT_STRATEGY		= "Strat\195\169gie alternative (Voir messages droite/gauche)";
DBM_THADDIUS_WARN_POWERSURGE	      = "Pr\195\169venir pour Vague de Puissance sur Stalagg (+ 200% vitesse d'attaque)";
DBM_THADDIUS_FIX_LAG               = "R\195\169duire la port\195\169e du combat log pour \195\169\viter le lag";
DBM_THADDIUS_ALT_STRAT_STAT1	      = "Voir message '%s' quand la polarit\195\169 change";
DBM_THADDIUS_ALT_STRAT_STAT2	      = "Voir message '%s' quand la polarit\195\169 ne change pas";
DBM_THADDIUS_INFOFRAME_INFO	      = "Voir infoframe des point de vie des boss en phase 1"

DBM_THADDIUS_ENRAGE_WARNING		= "*** Enrager dans %s %s ***";
DBM_THADDIUS_POL_SHIFT			= "*** Changement de polarit\195\169 ***";
DBM_THADDIUS_SURGE_WARNING		= "*** Vague de Puissance ***";
DBM_THADDIUS_POL_WARNING		= "*** Changement de polarit\195\169 dans %s sec ***";
DBM_THADDIUS_PHASE_2_SOON		= "*** Phase 2 dans 4 secondes ***";
DBM_THADDIUS_CHARGE_CHANGED		= "Charge chang\195\169 pour %s!";
DBM_THADDIUS_CHARGE_NOT_CHANGED	= "Charge non chang\195\169e";
DBM_THADDIUS_RIGHT			= "Droite!";
DBM_THADDIUS_LEFT			= "Gauche!";

DBM_THADDIUS_GAINS_SURGE		= "Vague de Puissance sur Stalagg";
DBM_THADDIUS_CAST_POL			= "Thaddius commence \195\160 lancer Changement de polarit\195\169.";
DBM_THADDIUS_POL_REGEXP		= "Vous subissez les effets de Charge (%w+).";
DBM_THADDIUS_YELL_START1		= "Tuer...";
DBM_THADDIUS_YELL_START2		= "Manger... tes... os..."; 
DBM_THADDIUS_YELL_START3		= "Casser... toi !";
DBM_THADDIUS_YELL_POL			= "Maintenant toi sentir douleur...";
DBM_THADDIUS_ENRAGE			= "%s entre dans une rage d\195\169mente !";
DBM_THADDIUS_TESLA_EMOTE		= "%s entre en surcharge !";
DBM_THADDIUS_TESLA_COIL		= "Bobine de tesla";
DBM_THADDIUS_THADDIUS			= "Thaddius";
DBM_THADDIUS_POSITIVE			= "Positif";
DBM_THADDIUS_NEGATIVE			= "Negatif";

-- Phase1
DBM_THADDIUS_STALAGG 			= "Stalagg";
DBM_THADDIUS_FEUGEN 			= "Feugen";
DBM_THADDIUS_INFOFRAME_TITLE	= "Thaddius";
DBM_THADDIUS_INFOFRAME_TEXT	= "Voir les points de vie des boss pendant la phase 1";
DBM_THADDIUS_PHASE1_YELL1 		= "Stalagg \195\169craser toi !";
DBM_THADDIUS_PHASE1_YELL2 		= "A manger pour maitre !";
DBM_THADDIUS_PHASE1_ANNOUNCE		= "*** Phase 1 ***";
DBM_THADDIUS_SURGE_EXPR		= "Stalagg gagne Vague de puissance.";
DBM_THADDIUS_SURGE_ANNOUNCE		= "*** Vague de Puissance pour 10 sec ***";
DBM_THADDIUS_THROW_ANNOUNCE		= "*** T\195\169l\195\169portation MT ***";
DBM_THADDIUS_THROW_ANNOUNCE_SOON	= "*** T\195\169l\195\169portation MT dans %s sec ***";
DBM_THADDIUS_PLATFORM_EXPR		= "perd son lien !";
DBM_THADDIUS_PLATFORM_ANNOUNCE	= "*** Attention - Les add partent de la plateforme ***";


--Loatheb
DBM_LOATHEB_NAME				      = "Horreb";
DBM_LOATHEB_DESCRIPTION			= "Annoncer les Mal\195\169diction in\195\169vitable et voir les cooldown des heal. Utiliser /loatheb setup ou /loatheb config pour configurer votre rotation de heal, l'annonce des healer ne fonctionne pas si vous n'avez pas configur\195\196 votre rotation de heal. Mettre l'ID 0 \195\160 un healer pour le retirer de la liste. Pour le rajouter de nouveau tapez /loa undelete.";
DBM_LOATHEB_ANNOUNCE_SPORES			= "Annoncer les spores";
--DBM_LOATHEB_ANNOUNCE_SPORES_BACKWARDS	= "Annoncer les spores aux groupes de derri\195\168re";
DBM_LOATHEB_HEAL_RAID				= "Annoncer les heals sur le cannal raid";
DBM_LOATHEB_HEAL_RAID_WARN			= "Annoncer les heals sur les annonces raid";
DBM_LOATHEB_HEAL_WHISPER			= "Envoyer un message au prochain healeur";
DBM_LOATHEB_ANNOUNCE_POT_OPTION		= "Annoncer consomables";
DBM_LOATHEB_SPECIALWARN_POT_OPTION		= "Voir message sp\195\169cial quand vous devez utiliser des consomables";
DBM_LOATHEB_HEAL_SHOW_AUTO			= "Voir heal info frame quand horreb est pull";
DBM_LOATHEB_HEAL_SHOW_NOW			= "Voir heal info frame";
DBM_LOATHEB_HEAL_SETUP				= "Installer la rotation de heal";
DBM_LOATHEB_NO_BC_INFO				= "Vous n'\195\170tes pas raid leader ou vous n'avez pas de promotion. Vos changements ne seront pas broadcast\195\69 au raid et les changements effectu\195\169 effaceront les v\195\180tres.";
DBM_LOATHEB_NO_CD				= "Pas de cooldown";
DBM_LOATHEB_SET_HEAL_ROTATION		= "Enregistrer & synchroniser";
DBM_LOATHEB_SET_HEAL_ROTATION_NO_BC	= "Enregistrer";
DBM_LOATHEB_SHADOW_PROT_POT			= "Potion de protection com l'ombre"
DBM_LOATHEB_BANDAGE				= "Bandage";
DBM_LOATHEB_HEALTHSTONE			= "Healthstone";

DBM_LOATHEB_DOOM_WARNING		= "*** Mal\195\169diction in\195\169vitable #%s dans %s sec ***";
DBM_LOATHEB_DOOM_NOW			= "*** Mal\195\169diction in\195\169vitable #%s - prochain dans %s sec ***";
DBM_LOATHEB_DECURSE_NOW		= "*** Decurse \195\169ffectu\195\169 - prochain dans 30 sec ***";
DBM_LOATHEB_DECURSE_WARNING		= "*** Decurse dans %s sec ***";
DBM_LOATHEB_SPORE_SPAWNED		= "*** Spore %d apparues ***";
DBM_LOATHEB_POT_ANNOUNCE		= "*** %s maintenant! ***";
DBM_LOATHEB_POT_WARNING		= "Utiliser %s maintenant!";
DBM_LOATHEB_HEAL_WARNING		= "Heal #%s fin - prochain: %s";
DBM_LOATHEB_YOU_ARE_NEXT		= "Tu es le suivant!";
DBM_LOATHEB_YOU_ARE_SOON		= "Pr\195\169pare toi \195\160 heal!";

DBM_LOATHEB_DOOM_REGEXP		= "([^%s]+) (%w+) subbit les effets de Mal\195\169diction in\195\169vitable.";
DBM_LOATHEB_REMOVE_CURSE		= "Horreb lance D\195\169livrance de la mal\195\169diction sur Horreb.";
DBM_LOATHEB_HEAL_REGEXP		= "([^%s]+) (%w+) subbit les effets de esprit corrompu.";
--DBM_LOATHEB_HEAL_REGEXP		= "([^%s]+) (%w+) subbit les effets de \195\162me affaiblie.";
DBM_LOATHEB_SUMMON_SPORE		= "Horreb lance Invocation de spore.";
DBM_LOATHEB_LOATHEB			= "Horreb";
DBM_LOATHEB_LOCK				= "Bloquer la fenêtre";

DBM_SBT["Inevitable Doom"]		= "Mal\195\169diction in\195\169vitable";


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
DBM_KELTHUZAD_MC_CD				= "*** Mind Control Cool Down ***";
DBM_KELTHUZAD_MC_SOON			= "*** Mind Control Incoming ***";

DBM_KELTHUZAD_FISSURE_EXPR		= "Kel'Thuzad casts Shadow Fissure.";
DBM_KELTHUZAD_FISSURE_ANNOUNCE		= "*** Shadow Fissure ***";

DBM_KELTHUZAD_FROSTBLAST_EXPR		= "^(.+) (.+) afflicted by Frost Blast";
DBM_KELTHUZAD_FROSTBLAST_ANNOUNCE	= "*** Frost Blast ***";
DBM_KELTHUZAD_FROSTBLAST_SOON		= "*** Possible Frost Blast Incoming ***";
DBM_KELTHUZAD_FROSTBLAST_PARTY		= "I'm blasted! HEAL me!";

DBM_KELTHUZAD_DETONATE_EXPR		= "^([^%s]+) ([^%s]+) afflicted by Detonate Mana.";
DBM_KELTHUZAD_DETONATE_ANNOUNCE	= "*** Detonate Mana - %s ***";
DBM_KELTHUZAD_DETONATE_SELFWARN	= "You are the Bomb!";
DBM_KELTHUZAD_DETONATE_WHISPER		= "You are the Bomb!";

DBM_SBT["Mindcontrol"]		= "Mind Control";
DBM_SBT["Mindcontrol CD"]	= "Mind Control CD";

end
