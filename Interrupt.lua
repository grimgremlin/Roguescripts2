
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
	
	if aUser==UnitName("player") or aUser==UnitName("pet") or aUser=="Trickynick" or aTarget==UnitName("player") or aTarget=="Trickynick" then
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
				
			if aEvent== 'SPELL_AURA_REMOVED' then
				--ChatFrame1:AddMessage(GetSpellLink(interruptid).." fades from "..aTarget..".")
				if (c=="Soulstone Resurrection") then
					if inRaid then SendChatMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".","raid") end
					if inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".","party") end
					if not inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".","say") end
				end
				if (c=="Fel Armor") then ChatFrame1:AddMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".") end
				if (c=="Unending Breath") then ChatFrame1:AddMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".") end
				if (c=="Detect Invisibility") then ChatFrame1:AddMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".") end
				if (c=="Battle Shout") and aTarget=="Defensive" then ChatFrame1:AddMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".") end
			end
			if aEvent== "SPELL_HEAL" then
				if c=="Master Healthstone" then
					if aTarget=="Trickynick" then 
					if inRaid then SendChatMessage(aTarget.." has used a tasty "..GetSpellLink(interruptid)..".","raid") end
					if inParty and not inRaid then SendChatMessage(aTarget.." has used a tasty "..GetSpellLink(interruptid)..".","party") end
					if not inParty and not inRaid then SendChatMessage(aTarget.." has used a tasty "..GetSpellLink(interruptid)..".","say") end				
				end
			end
			end
	end		
end

