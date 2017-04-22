
local InterruptSay = CreateFrame("Frame")
local function OnEvent(self, event, ...)
	local dispatch = self[event]

	if dispatch then
		dispatch(self, ...)
	end
end
InterruptSay:SetScript("OnEvent", OnEvent)
InterruptSay:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
function InterruptSay:COMBAT_LOG_EVENT_UNFILTERED(...)
	local inRaid=GetNumRaidMembers()>0 
	local inParty=GetNumPartyMembers()>0
	local aEvent = select(2, ...)
	local aUser = select(4, ...)
	local c= select(10, ...)
	local interruptid= select(9, ...)
	local aTarget = select(7, ...)
	
	local a = select(13, ...)
	local spellid = select(12, ...)
	
	if aUser==UnitName("player") or aUser==UnitName("pet") or aTarget==UnitName("player") then
		if aEvent== 'SPELL_INTERRUPT' then
			if inRaid then SendChatMessage(aTarget.."'s "..GetSpellLink(spellid).." was interrupted by "..aUser.."'s "..GetSpellLink(interruptid)..".","raid") end
			if inParty and not inRaid then SendChatMessage(aTarget.."'s "..GetSpellLink(spellid).." was interrupted by "..aUser.."'s "..GetSpellLink(interruptid)..".","party") end
			if not inParty and not inRaid then SendChatMessage(aTarget.."'s "..GetSpellLink(spellid).." was interrupted by "..aUser.."'s "..GetSpellLink(interruptid)..".","say") end
		end
		
		if aEvent== 'SPELL_CAST_SUCCESS' then
			if (c=="Counterspell" or c=="Viper Sting" or c=="Silence" or c=="Blind" or c=="Cyclone" or c=="Retaliation" or c=="Grounding Totem") then
				if inRaid then SendChatMessage(aUser.." used "..GetSpellLink(interruptid).." on ["..aTarget.."].","raid") end
				if inParty and not inRaid then SendChatMessage(aUser.." used "..GetSpellLink(interruptid).." on ["..aTarget.."].","party") end
			end
		end
		if aEvent== 'SPELL_MISSED' and (c=="Mocking Blow" or c=="Taunt" or c=="Challenging Shout") then
			if inRaid then SendChatMessage(GetSpellLink(interruptid).." was resisted by "..aTarget..".","raid") end
			if inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." was resisted by "..aTarget..".","party") end
			if not inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." was resisted by "..aTarget..".","say") end
		end
	end	
end

