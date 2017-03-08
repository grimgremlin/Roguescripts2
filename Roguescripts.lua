SLASH_FRAMENAME1 = "/framename"
function SlashCmdList.FRAMENAME()
	DEFAULT_CHAT_FRAME:AddMessage(GetMouseFocus():GetName())
end
SLASH_ACCEPT1 = "/acceptquest"
function SlashCmdList.ACCEPT()
	if not (GetTrackingTexture()=="Interface\\Icons\\Spell_Nature_Earthquake") then CastSpellByName("Find Minerals")end		
				AcceptQuest() 
				SelectGossipAvailableQuest(1) 
				CompleteQuest() 
				if GossipTitleButton1:IsVisible() then GossipTitleButton1:Click() end
				if QuestTitleButton2:IsVisible() then QuestTitleButton2:Click() end
				if QuestFrameCompleteQuestButton:IsVisible() then QuestFrameCompleteQuestButton:Click() end
		AcceptResurrect()
		if StaticPopup1:IsVisible() then StaticPopup1Button1:Click()
		end
		end	
SLASH_COMPLETE1 = "/completequest"
function SlashCmdList.COMPLETE()	
		QuestFrameCompleteQuestButton:Click()
		CompleteQuest()
		SelectGossipActiveQuest(1);
		SelectActiveQuest(1);
		local i=GetNumQuestChoices() if i<2 then GetQuestReward(1) end
	end
SLASH_UTILITY1 = "/utilityclick"
function SlashCmdList.UTILITY()	
			if AtlasLootDefaultFrame:IsVisible()==1 then AtlasLootDefaultFrame_CloseButton:Click() end
			if AtlasFrame:IsVisible()==1 then AtlasFrameCloseButton:Click() end
			if MailFrame:IsVisible()==1 then MailItem1Button:Click() end
			if OpenMailFrame:IsVisible()==1 then OpenMailMoneyButton:Click() OpenMailPackageButton:Click() OpenMailCloseButton:Click() end
end 	
SLASH_SKULL1 = "/skull"
function SlashCmdList.SKULL()
	if GetRaidTargetIndex("target")~=8 then SetRaidTarget("target",8)end
end
SLASH_X1 = "/x"
function SlashCmdList.X()
	if GetRaidTargetIndex("target")~=7 then SetRaidTarget("target",7)end
end
SLASH_LUNA1 = "/luna"
function SlashCmdList.LUNA()
	if GetRaidTargetIndex("target")~=5 then SetRaidTarget("target",5)end
end
SLASH_SQUARE1 = "/square"
function SlashCmdList.SQUARE()
	if GetRaidTargetIndex("target")~=6 then SetRaidTarget("target",6)end
end
SLASH_GREED1 = "/greed"
function SlashCmdList.GREED()
if GroupLootFrame1GreedButton:IsVisible() then GroupLootFrame1GreedButton:Click() end
if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end
if GroupLootFrame2GreedButton:IsVisible() then GroupLootFrame2GreedButton:Click() end
if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end
if GroupLootFrame3GreedButton:IsVisible() then GroupLootFrame3GreedButton:Click() end
if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end
if GroupLootFrame4GreedButton:IsVisible() then GroupLootFrame4GreedButton:Click() end
if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end
end
SLASH_SS1 = "/ss"
function SlashCmdList.SS()
		local c=CastSpellByName if GetComboPoints("target")==5 then c("Eviscerate") else c("Sinister Strike") end
end
function GetKickSlot(sayNothing)
   local texture = "Interface\\Icons\\Ability_Kick"
   if texture then

      if kickSlot then
         return kickSlot
      end

      for i = 1, 120 do
         if (not GetActionText(i)) then -- ignore any Player macros :-)
            if (not IsEquippedAction(i)) then -- ignore any equip macros :-)
               if (GetActionTexture(i) == texture) then
                  kickSlot = i
                  break
               end
            end
         end
      end

      if (not kickSlot) then
         if (not sayNothing) then
            DEFAULT_CHAT_FRAME:AddMessage("Couldn't find Kick action on your action bar, PLEASE ADD IT.")
         end
      end
   else
      kickSlot = nil
   end
   return kickSlot
end

function isKickOffCD(sayNothing)
	if GetKickSlot(sayNothing) and UnitExists("target") and GetActionCooldown(kickSlot)==0 and UnitMana('player')>=25 and IsActionInRange(kickSlot)==1 and not UnitIsFriend("player","target") then
		return true
	end
	return false
end

function FilterSpell(sayNothing)
	local name = UnitCastingInfo("target") or UnitChannelInfo("target") or UnitCastingInfo("mouseover") or UnitChannelInfo("mouseover")	
	local casting = false
	if name then
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
		if name=="Shadowbolt" 			then casting=true end
		if name=="Corruption" 			then casting=true end
		if name=="Drain Soul" 			then casting=true end
		if name=="Seed of Corruption" 	then casting=true end
		if name=="Unstable Affliction" 	then casting=true end
		if name=="Shadowfury" 			then casting=true end
		if name=="Polymorph" 			then casting=true end
		if name=="Spirit Shock"			then casting=true end
		if name=="Frostbolt"			then casting=true end
	end
	
	return casting
end

function RaidMarker(sayNothing)
marker=""
if GetRaidTargetIndex("target")==1 then marker="{star}" end
if GetRaidTargetIndex("target")==2 then marker="{circle}" end
if GetRaidTargetIndex("target")==3 then marker="{diamond}" end
if GetRaidTargetIndex("target")==4 then marker="{triangle}" end
if GetRaidTargetIndex("target")==5 then marker="{moon}" end
if GetRaidTargetIndex("target")==6 then marker="{square}" end
if GetRaidTargetIndex("target")==7 then marker="{cross}" end
if GetRaidTargetIndex("target")==8 then marker="{skull}" end
end
	
SLASH_KICKFILTER1 = "/kickfiltered"
function SlashCmdList.KICKFILTER()
	if (FilterSpell()==true) then CastSpellByName('Kick') end
end

SLASH_KICKALL1 = "/kickall"
function SlashCmdList.KICKALL()
local name = UnitCastingInfo("target") or UnitChannelInfo("target") or UnitCastingInfo("mouseover") or UnitChannelInfo("mouseover")
	if name then CastSpellByName('Kick') end
end

function SnD()
	local SND=0
	local Cast=CastSpellByName
	local CP=GetComboPoints("target")
	for i=0,31 do 
		if (GetPlayerBuffTexture(i)=="Interface\\Icons\\Ability_Rogue_SliceDice") then 
		SND=GetPlayerBuffTimeLeft(i)
		end
	end

	if CP==0 then Cast("Sinister Strike") end														--Sinister Strike if 0 CP
	if SND==0 and CP>=1 then Cast("Slice and Dice()") end  											--Cast SND if you have CPs and not Buffed.
	if SND~=0 and SND<=0.3 and GetComboPoints("target")>=1 then Cast("Slice and Dice()") end		--Cast SND if you have CPs and 0.5secs or less on Buff
	if SND>=4 and CP==5 then Cast("Eviscerate") end  												--Cast Evis if you have 3sec+ SND and 5 CP
			if ( UnitClassification("target") == "trivial" ) or
			( UnitClassification("target") == "normal" ) then
			if UnitHealth("target")<=10 and CP>=3 and SND<=6.5 then Cast("Slice and Dice") end end
	if SND<=4 and UnitMana("player")>=60 and CP~=5 then Cast("Sinister Strike") end					--Pool Energy if SND is running out, else cast SS
	if SND<=4 and UnitMana("player")>=60 and CP==5 then Cast("Eviscerate") end	
	if SND>=4 and UnitMana("player")>=40 then Cast("Sinister Strike") end
		
	
	
end		
	SLASH_RESET1 = "/reset"
function SlashCmdList.RESET()
	ResetInstances()
end
SLASH_DDPOISON1, SLASH_DDPOISON2 = "/dpspoison", "/dp"
function SlashCmdList.DDPOISON()
if not (UnitCastingInfo('player')) or (UnitChannelInfo('player')) then
	if not IsControlKeyDown() and not IsAltKeyDown() then
		local instant=0
		for  x=0,4,1 do 
			for  y=1,GetContainerNumSlots(x),1 do z= GetContainerItemLink(x,y)
				if z and string.find(z,"Instant Poison") then
					local _, itemCount = GetContainerItemInfo(x,y);
					instant= instant + itemCount;
					UseContainerItem(x,y)
						if instant==0 then DEFAULT_CHAT_FRAME:AddMessage("You have no Instant Poison. Purchase more!")
						else instant= instant - 1
						DEFAULT_CHAT_FRAME:AddMessage("Using Instant Poison. "..instant.." remaining.")
						end
				
				end
			end
		end
	end
	if IsAltKeyDown() then
		local deadly=0
		for  x=0,4,1 do 
			for y=1,16,1 do z= GetContainerItemLink(x,y)
				if z and string.find(z,"Deadly Poison") then
					local _, itemCount = GetContainerItemInfo(x,y);
					deadly = deadly + itemCount
					UseContainerItem(x,y)
						if deadly==0 then DEFAULT_CHAT_FRAME:AddMessage("You have no Deadly Poison. Purchase more!")
						else deadly= deadly - 1
						DEFAULT_CHAT_FRAME:AddMessage("Using Deadly Poison on Off-hand. "..deadly.." remaining.")
						end
				end
			end
		end
	end	
	if IsControlKeyDown() then
		local wound=0
		for  x=0,4,1 do 
			for y=1,16,1 do z= GetContainerItemLink(x,y)
				if z and string.find(z,"Wound Poison") then
					local _, itemCount = GetContainerItemInfo(x,y);
					wound = wound + itemCount
					UseContainerItem(x,y)
						if wound==0 then DEFAULT_CHAT_FRAME:AddMessage("You have no Wound Poison. Purchase more!")
						else wound = wound - 1
						DEFAULT_CHAT_FRAME:AddMessage("Using Wound Poison on Off-hand. "..wound.." remaining.")
						end
				end
			end
		end
	end
end		
end

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
	local aEvent = select(2, ...)
	local aUser = select(4, ...)
	local aTarget = select(7, ...)
	local destName = select(7, ...)


	if aUser == UnitName("player") then
		if aEvent== 'SPELL_INTERRUPT' then		
			AnnounceKick()
		end
	end
end

function AnnounceKick(sayNothing)
	local marker=""
	if GetRaidTargetIndex("target")==1 then marker="{star}" end
	if GetRaidTargetIndex("target")==2 then marker="{circle}" end
	if GetRaidTargetIndex("target")==3 then marker="{diamond}" end
	if GetRaidTargetIndex("target")==4 then marker="{triangle}" end
	if GetRaidTargetIndex("target")==5 then marker="{moon}" end
	if GetRaidTargetIndex("target")==6 then marker="{square}" end
	if GetRaidTargetIndex("target")==7 then marker="{cross}" end
	if GetRaidTargetIndex("target")==8 then marker="{skull}" end
	local inRaid=GetNumRaidMembers()>0 
	local inParty=GetNumPartyMembers()>0

	if inRaid then SendChatMessage("Kicked ["..UnitCastingInfo('target').."].  "..marker.."%t"..marker,"raid","Common", "7") end
	if inParty and not inRaid then SendChatMessage("Kicked ["..UnitCastingInfo('target').."].  "..marker.."%t"..marker,"party","Common", "7") end
	if not inParty and not inRaid then SendChatMessage("Kicked ["..UnitCastingInfo('target').."].  "..marker.."%t"..marker	,"say","Common", "7") end	
end
