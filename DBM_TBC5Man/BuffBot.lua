local BuffBot = DBM:NewBossMod("BuffBot", DBM_NAARU_GUARDIAN_NAME, DBM_NAARU_GUARDIAN_DESCRIPTION, DBM_OTHER, "TBC5ManTab", 1)

BuffBot.Version = "1.0"
BuffBot.Author = "Siarkowy"

BuffBot:AddOption("Wild", false, DBM_NAARU_GUARDIAN_OPTION_WILD)
BuffBot:AddBarOption("Buff Bot: (.*)")

BuffBot:RegisterEvents(
	"SPELL_SUMMON"
)

function BuffBot:Test()
	self:SendSync("Pop" .. UnitName("player"))
end

function BuffBot:OnEvent(event, args)
	if event == "SPELL_SUMMON" then
		if args.spellId == 7952 then
			self:SendSync("Pop" .. tostring(args.sourceName))
		end
	end
end

function BuffBot:OnSync(msg)
	if msg:sub(0, 3) == "Pop" then
		msg = msg:sub(4)
		if DBM.Raid[msg] or self.Options.Wild then
			self:StartStatusBarTimer(120, "Buff Bot: " .. msg, [[Interface\Icons\INV_Jewelry_Talisman_01]])
			self:Announce(DBM_NAARU_GUARDIAN_ANNOUNCE:format(msg))
		end
	end
end
