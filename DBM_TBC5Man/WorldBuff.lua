local WorldBuff = DBM:NewBossMod("WorldBuff", DBM_WBUFF_NAME, DBM_WBUFF_DESCRIPTION, DBM_OTHER, "TBC5ManTab", 1)

WorldBuff.Version = "1.0"
WorldBuff.Author = "Siarkowy"

WorldBuff:RegisterEvents(
	"CHAT_MSG_SYSTEM"
)

WorldBuff:AddOption("WorldBuffAnn300", false, DBM_WBUFF_OPTION_ANN300)
WorldBuff:AddOption("WorldBuffAnn150", true, DBM_WBUFF_OPTION_ANN150)
WorldBuff:AddOption("WorldBuffAnnOOC", true, DBM_WBUFF_OPTION_ANNOOC)

WorldBuff:AddBarOption("World Buff")


function WorldBuff:Test()
	self:OnEvent("CHAT_MSG_SYSTEM", "World buffs set to trigger in the next 2.5 min")
end

function WorldBuff:OnEvent(event, arg1)
	if event == "CHAT_MSG_SYSTEM" then
		-- 23:37:10 1:"CHAT_MSG_SYSTEM", 2:"|cffff6060[Event Message]: |cff00C78CWorld buffs set to trigger in the next 2.5 minutes from the middle of Shattrath.|r", 3:"", 4:"", 5:"", 6:"", 7:"", 8:0, 9:0, 10:"", 11:0, 12:2883
		local _, _, mins = string.find(arg1, "World buffs set to trigger in the next ([%d%.]+) min")
		if mins then
			self:SendSync(("WorldBuff%d"):format(tonumber(mins) * 60))
		end
	end
end

function WorldBuff:OnSync(msg)
	if msg:sub(1, 9) ~= "WorldBuff" then return end

	local left = tonumber(msg:sub(10))
	if not left then return end

	if not self:GetStatusBarTimerTimeLeft("World Buff") then
		self:StartStatusBarTimer(300, "World Buff", 24425)
	end
	self:UpdateStatusBarTimer("World Buff", 300 - left, 300)

	if self.Options.WorldBuffAnnOOC and DBM.InCombat then
		return
	end

	if left == 300 and self.Options.WorldBuffAnn300 then
		self:Announce(DBM_WBUFF_ANN_MINS:format(left / 60), 2)
	elseif left == 150 and self.Options.WorldBuffAnn150 then
		self:Announce(DBM_WBUFF_ANN_MINS:format(left / 60), 3)
	end
end
