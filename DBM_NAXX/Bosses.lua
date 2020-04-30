if not DBM.Bosses[DBM_NAXX] then
	DBM.Bosses[DBM_NAXX] = {};
end

DBM.Bosses[DBM_NAXX]["ANUB"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_AR_NAME,
	["startTrigger"] = {
		[DBM_AR_YELL_1] = true,
		[DBM_AR_YELL_2] = true,
		[DBM_AR_YELL_3] = true,
	},
	["BossMods"] = {
		"AnubRekhan",
	},
};
DBM.Bosses[DBM_NAXX]["FAERLINA"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_GWF_NAME,
	["startTrigger"] = {
		[DBM_GWF_YELL_1] = true,
		[DBM_GWF_YELL_2] = true,
		[DBM_GWF_YELL_3] = true,
		[DBM_GWF_YELL_4] = true,
	},
	["BossMods"] = {
		"GrandWidowFaerlina",
	},
};
DBM.Bosses[DBM_NAXX]["MAEXXNA"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_MAEXXNA_NAME,
	["delay"] = 4,
	["BossMods"] = {
		"Maexxna",
	},
};

DBM.Bosses[DBM_NAXX]["RAZUVIOUS"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_IR_NAME,
	["delay"] = 20,
	["BossMods"] = {
		"Razuvious",
	},
};
DBM.Bosses[DBM_NAXX]["GOTHIK"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_GOTH_NAME,
	["startTrigger"] = {
		[DBM_GOTH_YELL_START1] = true,
	},
	["minCombatTime"] = 60,
	["BossMods"] = {
		"Gothik",
	},
};
DBM.Bosses[DBM_NAXX]["HORSEMEN"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_FOURHORSEMEN_THANE,
	["realName"] = DBM_FOURHORSEMEN_REAL_NAME,
	["killName"] = {
		["THANE"] = {
			["notKilled"] = true,
			["name"] = DBM_FOURHORSEMEN_THANE,
		},
		["LADY"] = {
			["notKilled"] = true,
			["name"] = DBM_FOURHORSEMEN_LADY,
		},
		["MOGRAINE"] = {
			["notKilled"] = true,
			["name"] = DBM_FOURHORSEMEN_MOGRAINE,
		},
		["ZELIEK"] = {
			["notKilled"] = true,
			["name"] = DBM_FOURHORSEMEN_ZELIEK,
		},
	},
	["delay"] = 5,
	["BossMods"] = {
		"FourHorsemen",
	},
};


DBM.Bosses[DBM_NAXX]["NOTH"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_NTP_NAME,
	["startTrigger"] = {
		[DBM_NTP_YELL_START1] = true,
		[DBM_NTP_YELL_START2] = true,
		[DBM_NTP_YELL_START3] = true,
	},
	["BossMods"] = {
		"Noth",
	},
};
DBM.Bosses[DBM_NAXX]["HEIGAN"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_HTU_NAME,
	["startTrigger"] = {
		[DBM_HTU_YELL_START1] = true,
		[DBM_HTU_YELL_START2] = true,
		[DBM_HTU_YELL_START3] = true,
	},
	["BossMods"] = {
		"Heigan",
	},
};
DBM.Bosses[DBM_NAXX]["LOATHEB"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_LOATHEB_NAME,
	["delay"] = 5,
	["BossMods"] = {
		"Loatheb",
	},
};

DBM.Bosses[DBM_NAXX]["PATCHWERK"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_PW_NAME,
	["delay"] = 25,
	["BossMods"] = {
		"Patchwerk",
	},
};
DBM.Bosses[DBM_NAXX]["GROBBULUS"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_GROBB_NAME,
	["delay"] = 5,
	["BossMods"] = {
		"Grobbulus",
	},
};
DBM.Bosses[DBM_NAXX]["GLUTH"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_GLUTH_NAME,
	["delay"] = 10,
	["BossMods"] = {
		"Gluth",
	},
};
DBM.Bosses[DBM_NAXX]["THADDIUS"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_THADDIUS_NAME,
	["startTrigger"] = {
		[DBM_THADDIUS_PHASE1_YELL1] = true,
	},
	["BossMods"] = {
		"Thaddius",
	},
};

DBM.Bosses[DBM_NAXX]["SAPPHIRON"] = {
	["startMethod"] = "COMBAT",
	["name"] = DBM_SAPPHIRON_NAME,
	["delay"] = 5,
	["BossMods"] = {
		"Sapphiron",
	},
};
DBM.Bosses[DBM_NAXX]["KELTHUZAD"] = {
	["startMethod"] = "YELL",
	["name"] = DBM_KELTHUZAD_NAME,
	["minCombatTime"] = 75,
	["startTrigger"] = {
		[DBM_KELTHUZAD_PHASE1_EXPR] = true,
	},
	["BossMods"] = {
		"Kelthuzad",
	},
};