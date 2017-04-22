
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
				
			if aEvent== 'SPELL_AURA_REMOVED' then
				--ChatFrame1:AddMessage(GetSpellLink(interruptid).." fades from "..aTarget..".")
				if (c=="Soulstone Resurrection") then
					if inRaid then SendChatMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".","raid") end
					if inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".","party") end
					if not inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." has faded from "..aTarget..".","say") end
				end
			end

			if aEvent== 'SPELL_MISSED' and (c=="Mocking Blow" or c=="Taunt" or c=="Challenging Shout") then
					if inRaid then SendChatMessage(GetSpellLink(interruptid).." was resisted by "..aTarget..".","raid") end
					if inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." was resisted by "..aTarget..".","party") end
					if not inParty and not inRaid then SendChatMessage(GetSpellLink(interruptid).." was resisted by "..aTarget..".","say") end
					end
			end	
end




SLASH_KICKFILTER1 = "/kickfiltered"
function SlashCmdList.KICKFILTER()
if UnitClass('player')=="Rogue" then
	if (FilterSpell()==true) then CastSpellByName('Kick') end
end
if UnitClass('player')=="Warlock" and (FilterSpell()==true) then
local  _,petcd = GetPetActionCooldown(5)
local spell=UnitCastingInfo('player')
	if (GetUnitName('pet')=="Droodhun" and petcd==0) then CastSpellByName('Spell Lock') end

	if (GetUnitName('pet')=="Droodhun" and petcd~=0) then
		if spell and not spell=="Fear" then SpellStopCasting() end
		CastSpellByName('Fear') end
	if not GetUnitName('pet')=="Droodhun" then		
		if spell and not spell=="Fear" then SpellStopCasting() end
		CastSpellByName('Fear') end
end
end

SLASH_KICKALL1 = "/kickall"
function SlashCmdList.KICKALL()
local name = UnitCastingInfo("target") or UnitChannelInfo("target") or UnitCastingInfo("mouseover") or UnitChannelInfo("mouseover")
	if name then CastSpellByName('Kick') end
end

function FilterSpell(sayNothing)
	local name = UnitCastingInfo("target") or UnitChannelInfo("target") or UnitCastingInfo("focus") or UnitChannelInfo("mouseover")	
	local casting = false
	if name then
		if name=="Slowing Poison" 		then casting=true end
		if name=="Healing Wave" 		then casting=true end
		if name=="Lesser Healing Wave" 	then casting=true end
		if name=="Chain Heal" 			then casting=true end
		if name=="Ancestral Spirit" 	then casting=true end
		if name=="Healing Touch" 		then casting=true end
		if name=="Regrowth" 			then casting=true end
		if name=="Tranquility" 			then casting=true end
		if name=="Rebirth" 				then casting=true end
		if name=="Mend Pet" 			then casting=true end
		if name=="Revive Pet" 			then casting=true end
		if name=="Scare Beast" 			then casting=true end
		if name=="Wyvern Sting" 		then casting=true end
		if name=="Holy Light" 			then casting=true end
		if name=="Flash of Light" 		then casting=true end
		if name=="Redemption" 			then casting=true end
		if name=="Hammer of Wrath" 		then casting=true end
		if name=="Avenger's Shield" 	then casting=true end
		if name=="Lesser Heal" 			then casting=true end
		if name=="Heal" 				then casting=true end
		if name=="Smite" 				then casting=true end
		if name=="Prayer of Healing" 	then casting=true end
		if name=="Resurrection" 		then casting=true end
		if name=="Arcane Flurry" 		then casting=true end
		if name=="Cyclone" 			then casting=true end
		if name=="Mind Control" 		then casting=true end
		if name=="Greater Heal" 		then casting=true end
		if name=="Flash Heal" 			then casting=true end
		if name=="Mana Burn" 			then casting=true end
		if name=="Holy Fire" 			then casting=true end
		if name=="Lightwell" 			then casting=true end
		if name=="Binding Heal" 		then casting=true end
		if name=="Circle of Healing" 	then casting=true end
		if name=="Fear" 				then casting=true end
		if name=="Howl of Terror" 		then casting=true end
		if name=="Drain Life" 			then casting=true end
		if name=="Drain Mana" 			then casting=true end
		if name=="Summon Imp" 			then casting=true end
		if name=="Summon Voidwalker" 	then casting=true end
		if name=="Summon Succubus" 		then casting=true end
		if name=="Summon Felhunter" 	then casting=true end
		if name=="Unstable Affliction" 	then casting=true end
		if name=="Shadowfury" 			then casting=true end
		if name=="Polymorph" 			then casting=true end
		if name=="Spirit Shock"			then casting=true end
		
	end
	
	return casting
end