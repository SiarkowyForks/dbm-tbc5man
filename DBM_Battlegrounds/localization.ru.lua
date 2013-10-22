if (GetLocale()=="ruRU") then

DBM_BGMOD_LANG = {}
DBM_BGMOD_LANG["NAME"] 		= "Battlegrounds";
DBM_BGMOD_LANG["INFO"] 		= "Shows timers for Alterac Valley and Arathi Basin. "
					.."It also shows the Warsong flag carrier and allows auto turn-in of Alterac Valley quest items.";

DBM_BGMOD_LANG["THANKS"] 		= "Thanks for using La Vendetta Boss Mods! :)";
DBM_BGMOD_LANG["WINS"]			= "The (%w+) wins";
DBM_BGMOD_LANG["BEGINS"]		= "Game starts in";	-- BAR
DBM_BGMOD_LANG["ALLIANCE"]		= "Альянс";
DBM_BGMOD_LANG["HORDE"]		= "Орда";
DBM_BGMOD_LANG["ALLI_TAKE_ANNOUNCE"] 	= "*** Альянсом захвачен(о) %s ***";
DBM_BGMOD_LANG["HORDE_TAKE_ANNOUNCE"]	= "*** Ордой захвачен(о) %s ***";

		-- AV
DBM_BGMOD_LANG["AV_ZONE"] 		= "Альтеракская долина";
DBM_BGMOD_LANG["AV_START60SEC"]	= "1 минута до начала битвы за Альтераксую Долину.";
DBM_BGMOD_LANG["AV_START30SEC"]	= "30 секунд до начала битвы за Альтераксую Долину.";
DBM_BGMOD_LANG["AV_TURNININFO"] 	= "Авто-сдача предметов для репутации";
DBM_BGMOD_LANG["AV_NPC"] = {}
DBM_BGMOD_LANG["AV_NPC"]["SMITHREGZAR"] 			= "Smith Regzar";			-- armor
DBM_BGMOD_LANG["AV_NPC"]["PRIMALISTTHURLOGA"] 			= "Primalist Thurloga";			-- icelord
DBM_BGMOD_LANG["AV_NPC"]["WINGCOMMANDERJEZTOR"] 		= "Wing Commander Jeztor";		
DBM_BGMOD_LANG["AV_NPC"]["WINGCOMMANDERGUSE"] 			= "Wing Commander Guse";
DBM_BGMOD_LANG["AV_NPC"]["WINGCOMMANDERMULVERICK"]	 	= "Wing Commander Mulverick";
DBM_BGMOD_LANG["AV_NPC"]["MURGOTDEEPFORGE"] 			= "Murgot Deepforge";			-- armor
DBM_BGMOD_LANG["AV_NPC"]["ARCHDRUIDRENFERAL"] 			= "Arch Druid Renferal";		-- forestlord
DBM_BGMOD_LANG["AV_NPC"]["WINGCOMMANDERVIPORE"] 		= "Wing Commander Vipore";
DBM_BGMOD_LANG["AV_NPC"]["WINDCOMMANDERSLIDORE"]	 	= "Wing Commander Slidore";
DBM_BGMOD_LANG["AV_NPC"]["WINGCOMMANDERICHMAN"] 		= "Wing Commander Ichman";
DBM_BGMOD_LANG["AV_NPC"]["STORMPIKERAMRIDERCOMMANDER"]		= "Stormpike Ram Rider Commander";
DBM_BGMOD_LANG["AV_NPC"]["FROSTWOLFWOLFRIDERCOMMANDER"]	= "Frostwolf Wolf Rider Commander";
DBM_BGMOD_LANG["AV_ITEM"] = {}
DBM_BGMOD_LANG["AV_ITEM"]["ARMORSCRAPS"] 	= "Armor Scraps";
DBM_BGMOD_LANG["AV_ITEM"]["SOLDIERSBLOOD"] 	= "Stormpike Soldier's Blood";
DBM_BGMOD_LANG["AV_ITEM"]["LIEUTENANTSFLESH"] 	= "Stormpike Lieutenant's Flesh";
DBM_BGMOD_LANG["AV_ITEM"]["SOLDIERSFLESH"] 	= "Stormpike Soldier's Flesh";
DBM_BGMOD_LANG["AV_ITEM"]["COMMANDERSFLESH"] 	= "Stormpike Commander's Flesh";
DBM_BGMOD_LANG["AV_ITEM"]["STORMCRYSTAL"] 	= "Storm Crystal";
DBM_BGMOD_LANG["AV_ITEM"]["LIEUTENANTSMEDAL"] 	= "Frostwolf Lieutenant's Medal";
DBM_BGMOD_LANG["AV_ITEM"]["SOLDIERSMEDAL"] 	= "Frostwolf Soldier's Medal";
DBM_BGMOD_LANG["AV_ITEM"]["COMMANDERSMEDAL"] 	= "Frostwolf Commander's Medal";
DBM_BGMOD_LANG["AV_ITEM"]["FROSTWOLFHIDE"] 	= "Frostwolf Hide";
DBM_BGMOD_LANG["AV_ITEM"]["ALTERACRAMHIDE"] 	= "Alterac Ram Hide";
DBM_BGMOD_LANG["AV_TARGETS"] = {
		"Stormpike Aid Station",
		"Dun Baldar North Bunker",
		"Dun Baldar South Bunker",
		"Stormpike Graveyard",
		"Icewing Bunker",
		"Stonehearth Graveyard",
		"Stonehearth Bunker",
		"Snowfall Graveyard",
		"Iceblood Tower",
		"Iceblood Graveyard",
		"Tower Point",
		"Frostwolf Graveyard",
		"West Frostwolf Tower",
		"East Frostwolf Tower",
		"Frostwolf Relief Hut"
};

DBM_BGMOD_LANG["AV_TARGET_TYPE"] = { --not really a localization table... -> DO NOT TRANSLATE!
	"graveyard",
	"tower",
	"tower",
	"graveyard",
	"tower",
	"graveyard",
	"tower",
	"graveyard",
	"tower",
	"graveyard",
	"tower",
	"graveyard",
	"tower",
	"tower",
	"graveyard",
};

DBM_BGMOD_LANG["AV_UNDERATTACK"]	= "(.+) is under attack!  If left unchecked, the (%w+) will (%w+) it.";	-- Graveyard // Tower
DBM_BGMOD_LANG["AV_WASTAKENBY"]	= "(.+) was taken by the (%w+)!";
DBM_BGMOD_LANG["AV_WASDESTROYED"]	= "(.+) was destroyed by the (%w+)!";
DBM_BGMOD_LANG["AV_IVUS"]		= "Wicked, Wicked, Mortals! The forest weeps";
DBM_BGMOD_LANG["AV_ICEY"]		= "It is done! The Ice Lord has arrived! Bow to the might of the Horde, fools!";

		-- AB
DBM_BGMOD_LANG["AB_ZONE"] 		= "Низина Арати";
DBM_BGMOD_LANG["AB_INFOFRAME_INFO"]	= "Показывать предположительный счет в финале";
DBM_BGMOD_LANG["AB_START60SEC"]	= "Битва за Низину Арати начнется через минуту.";
DBM_BGMOD_LANG["AB_START30SEC"]	= "Битва за Низину Арати начнется через 30 секунд.";
DBM_BGMOD_LANG["AB_CLAIMSTHE"]	= "(.+) захватил(.+)! Если (.+) минуту!";
DBM_BGMOD_LANG["AB_HASTAKENTHE"]	= "(%w+) захватил (.+)!";
DBM_BGMOD_LANG["AB_HASDEFENDEDTHE"]	= "(.+) отразил(.+) нападение на (.+)!";
DBM_BGMOD_LANG["AB_HASASSAULTED"]	= "штурмует";
DBM_BGMOD_LANG["AB_SCOREEXP"] 		= "Базы: (%d+) Ресурсы: (%d+)/2000";
DBM_BGMOD_LANG["AB_WINALLY"] 		= "Альянс победит через:";
DBM_BGMOD_LANG["AB_WINHORDE"] 		= "Орда победит через:";
DBM_BGMOD_LANG["AB_TARGETS"] 		= {
		"ферму",
		"лесопилку",
		"кузницу",
		"рудник",
		"стойла"
	};

		-- WSG
DBM_BGMOD_LANG["WSG_ZONE"] 		= "Ущелье Песни Войны";
DBM_BGMOD_LANG["WSG_START60SEC"]	= "Битва за Ущелье Песни Войны начнется через 1 минуту.";
DBM_BGMOD_LANG["WSG_START30SEC"]	= "Битва за Ущелье Песни Войны начнется через 30 секунд. Готовьтесь!";
DBM_BGMOD_LANG["WSG_INFOFRAME_INFO"]	= "Показывать флагоносца";
DBM_BGMOD_LANG["WSG_FLAG_PICKUP"] 	= "Флаг (%w+) у (.+)!";			-- . because the F is not allways large char 
DBM_BGMOD_LANG["WSG_FLAG_RETURN"]	= "(%w+) вернул на базу флаг (.+)!";
DBM_BGMOD_LANG["WSG_ALLYFLAG"]		= "флаг Альянса: ";
DBM_BGMOD_LANG["WSG_HORDEFLAG"]	= "флаг Орды: ";
DBM_BGMOD_LANG["WSG_FLAG_BASE"]	= "Base";  				-- not found in Warsong.lua
DBM_BGMOD_LANG["WSG_HASCAPTURED"]	= "(.+) захватил флаг (%w+)!";

		-- NEW Added 08.11.06
DBM_BGMOD_LANG["WSG_INFOFRAME_TITLE"]	= "Захват флага на УПВ";
DBM_BGMOD_LANG["WSG_INFOFRAME_TEXT"]	= "Показывать флагоносца";
DBM_BGMOD_LANG["AB_STRINGALLIANCE"]	= "Альянс:";
DBM_BGMOD_LANG["AB_STRINGHORDE"]	= "Орда:";
DBM_BGMOD_LANG["WSG_BOOTS_EXPR"]	= "afflicted by Speed";

-- ADDED 9.12.06
DBM_BGMOD_LANG["ARENA_BEGIN"]		= "One minute until the Arena battle begins!";
DBM_BGMOD_LANG["ARENA_BEGIN30"]	= "Thirty seconds until the Arena battle begins!";
DBM_BGMOD_LANG["ARENA_BEGIN15"]	= "Fifteen seconds until the Arena battle begins!";

DBM_BGMOD_EN_TARGET_AV = DBM_BGMOD_LANG.AV_TARGETS;
DBM_BGMOD_EN_TARGET_AB = DBM_BGMOD_LANG.AB_TARGETS;

DBM_SBT["Begins"] = DBM_BGMOD_LANG["BEGINS"];
DBM_SBT["AB_WINHORDE"] = DBM_BGMOD_LANG.AB_WINHORDE;
DBM_SBT["AB_WINALLY"] = DBM_BGMOD_LANG.AB_WINALLY;

-- 17.12.06
DBM_BGMOD_LANG["COLOR_BY_CLASS"] = "Показывать класс цветом в таблице очков";
DBM_BGMOD_LANG["SHOW_INV_TIMER"] = "Показывать таймер на вход на БГ"


--added 2.1.07

DBM_BGMOD_LANG["AB_DESCRIPTION"]	= "Показывает время до захвата и вычисляет время до конца битвы.";
DBM_BGMOD_LANG["AV_DESCRIPTION"]	= "Показывать таймеры для башен и кладбонов.";
DBM_BGMOD_LANG["WS_DESCRIPTION"]	= "Показывать флагоносца";

--added 7.1.07
DBM_BGMOD_LANG["UPGRADETROOPS"]		= "upgrade to";


DBM_ARENAS				= "Arenas";
DBM_ARENAS_DESCRIPTION	= "Shows timers for arenas.";



-- eye of the storm

DBM_EOTS_NAME			= "Око Бури";
DBM_EOTS_DESCRIPTION	= "Показывать время до победы и флагоносца.";

DBM_EOTS_BEGINS_60		= "Битва начнется через минуту!";
DBM_EOTS_BEGINS_30		= "Битва начнется через 30 секунд!";

DBM_EOTS_FLAG_TAKEN		= "(.+) захватывает флаг!";
DBM_EOTS_FLAG_RESET		= "Флаг вернули на место.";
DBM_EOTS_FLAG_CAPTURED	= "(%w) захватил знамя!";
DBM_EOTS_FLAG_DROPPED	= "Флаг был уронен!";

DBM_EOTS_POINTS			= "Базы: (%d+)  Очки победы: (%d+)/2000";

DBM_EOTS_FLAG			= "Флаг";

--added 27.7.07
DBM_BGMOD_LANG["WSG_INFOFRAME_ERRORINFO"] = "Показывать ошибки про флагоносца в бою."
DBM_BGMOD_LANG["WSG_INFOFRAME_ERRORTEXT"] = "Взять в цель флагоносца будет восстановлена при выходе из бояt."

--added 1.8.07
DBM_BGMOD_LANG["AB_BASESTOWIN_INFO"] = "Показывать кол-во необходимых для победы баз"
DBM_BGMOD_LANG["AB_BASESTOWIN_TEXT"] = "Баз для победы: "


DBM_BGMOD_OPTION_AUTOSPIRIT			= "Auto-release spirit"

DBM_BGMOD_AV_BARS = {}

DBM_BGMOD_LANG.AV_OPTION_FLASH		= "Enable flash effects"

end