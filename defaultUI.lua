

-- Improved UI with default theming


-- Make the buttons bigger
-- Hide old background and create new background (using blizzards art files) that doesnt have page up and down garbage
-- Hide xp/honor/artifact bar and sexy black bar in place 
function updateNewActionBar() 
	function replaceActionBar()
		MainMenuBarArtFrame:SetScale(1.3)
		MainMenuBarArtFrameBackground:SetAlpha(0)
		MainMenuBarArtFrame.RightEndCap:SetAlpha(0)
		MainMenuBarArtFrame.LeftEndCap:SetAlpha(0)
		MainMenuBarArtFrame.PageNumber:SetAlpha(0)
		ActionBarUpButton:Hide()
		ActionBarDownButton:Hide()
		local Frame = CreateFrame("Frame")
		local f = CreateFrame("Frame",nil)
		f:SetFrameStrata("BACKGROUND")
		f:SetSize(472, 44)
		local t = f:CreateTexture(nil,"BACKGROUND")
		t:SetTexture("Interface\\MainMenuBar\\MainMenuBar")
		t:SetTexCoord(0.114, .61, .255, .45)	
		t:SetAllPoints(f)
		f.texture = t
		f:SetPoint("BOTTOM",0,10)
		f:SetFrameStrata('LOW')
		f:Show() 
		ActionButton1:ClearAllPoints()
		ActionButton1:SetPoint("BOTTOM", UIParent, "BOTTOM", -231, 14)
	end
	function replaceXPbarWithBlack()
		StatusTrackingBarManager:SetAlpha(0)
		StatusTrackingBarManager:UnregisterAllEvents()
		local f = CreateFrame("Frame",nil,UIParent)
		f:SetFrameStrata("BACKGROUND")
		f:SetWidth(668)
		f:SetHeight(70)
		local t = f:CreateTexture(nil,"BACKGROUND")
		t:SetAllPoints(f)
		t:SetColorTexture(0,0,0,1)
		f.texture = t
		f:SetPoint("BOTTOM",0,0)
		f:Show()
	end
	function addLeftGriffon() 
		local f = CreateFrame("Frame",nil,UIParent)
		f:SetFrameStrata("LOW")
		f:SetSize(152, 152)
		local t = f:CreateTexture(nil,"BACKGROUND")
		t:SetTexture("Interface\\MainMenuBar\\UI-MainMenuBar-EndCap-Dwarf")
		t:SetTexCoord(0,1,0,1)	
		t:SetAllPoints(f)
		f.texture = t
		f:SetPoint("BOTTOM",-371,0)
		f:Show()
	end 
	function addRightGriffon() 
		local f = CreateFrame("Frame",nil,UIParent)
		f:SetFrameStrata("LOW")
		f:SetSize(152, 152)
		local t = f:CreateTexture(nil,"BACKGROUND")
		t:SetTexture("Interface\\MainMenuBar\\UI-MainMenuBar-EndCap-Dwarf")
		t:SetTexCoord(1,0,0,1)	
		t:SetAllPoints(f)
		f.texture = t
		f:SetPoint("BOTTOM",371,0)
		f:Show()
	end
	replaceActionBar()
	replaceXPbarWithBlack()
	addLeftGriffon()
	addRightGriffon()
end


function hideBagMenuBar()
	-- Hide bag and micro icons
	MicroButtonAndBagsBar:Hide()
	CharacterMicroButton:SetScript("OnShow",CharacterMicroButton.Hide)
	CharacterMicroButton.Show = function() end
	CharacterMicroButton:Hide()
	SpellbookMicroButton:Hide()
	TalentMicroButton:SetScript("OnShow",TalentMicroButton.Hide)
	TalentMicroButton.Show = function() end
	TalentMicroButton:Hide()
	AchievementMicroButton:Hide()
	QuestLogMicroButton:Hide()
	GuildMicroButton:Hide()
	LFDMicroButton:Hide()
	CollectionsMicroButton:Hide()
	EJMicroButton:Hide()
	StoreMicroButton:SetScript("OnShow",StoreMicroButton.Hide)
	StoreMicroButton.Show = function() end
	StoreMicroButton:Hide()
	EJMicroButton:Hide()
	MainMenuMicroButton:Hide()
end


function updatePlayerBuffs()
	debuffDirectionY = "up"
	debuffPerRow = 10
	debuffScale = .9
	ypos = -405
	BuffDirectionX = "left"
	Buffxpos = -28
	local f = CreateFrame("Frame")
	local function BuffsUpdate(self)
	db = "BuffButton"
	dpr = debuffPerRow
	dbs = debuffScale
	if (BuffDirectionX=="right") then ddx = 35 elseif (BuffDirectionX=="left") then ddx = -35 end
	if (debuffDirectionY=="down") then ddy = -45 elseif (debuffDirectionY=="up") then ddy = 45 end
	if debuffPerRow < 3 then debuffPerRow = 3 end
	if _G[db..1] then _G[db..1]:ClearAllPoints() _G[db..1]:SetPoint("CENTER","UIParent",Buffxpos,ypos) end
	for i = 2, dpr do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr+1] then _G[db..dpr+1]:ClearAllPoints() _G[db..dpr+1]:SetPoint("CENTER",db..1,0,ddy) end
	for i = dpr+2, dpr*2 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr*2+1] then _G[db..dpr*2+1]:ClearAllPoints() _G[db..dpr*2+1]:SetPoint("CENTER",db..dpr+1,0,ddy) end
	for i = dpr*2+2, dpr*3 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr*3+1] then _G[db..dpr*3+1]:ClearAllPoints() _G[db..dpr*3+1]:SetPoint("CENTER",db..dpr*2+1,0,ddy) end
	for i = dpr*3+2, dpr*4 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr*4+1] then _G[db..dpr*4+1]:ClearAllPoints() _G[db..dpr*4+1]:SetPoint("CENTER",db..dpr*3+1,0,ddy) end
	for i = dpr*4+2, dpr*5 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	for i = 1, 25 do if _G[db..i] then _G[db..i]:SetScale(dbs) end end
	end
	f:SetScript("OnUpdate", BuffsUpdate)
	debuffDirectionX = "right"
	xpos = 28
	hooksecurefunc("DebuffButton_UpdateAnchors", function()
	db = "DebuffButton"
	dpr = debuffPerRow
	dbs = debuffScale
	if (debuffDirectionX=="right") then ddx = 35 elseif (debuffDirectionX=="left") then ddx = -35 end
	if (debuffDirectionY=="down") then ddy = -45 elseif (debuffDirectionY=="up") then ddy = 45 end
	if debuffPerRow < 3 then debuffPerRow = 3 end
	if _G[db..1] then _G[db..1]:ClearAllPoints() _G[db..1]:SetPoint("CENTER","UIParent",xpos,ypos) end
	for i = 2, dpr do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr+1] then _G[db..dpr+1]:ClearAllPoints() _G[db..dpr+1]:SetPoint("CENTER",db..1,0,ddy) end
	for i = dpr+2, dpr*2 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr*2+1] then _G[db..dpr*2+1]:ClearAllPoints() _G[db..dpr*2+1]:SetPoint("CENTER",db..dpr+1,0,ddy) end
	for i = dpr*2+2, dpr*3 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr*3+1] then _G[db..dpr*3+1]:ClearAllPoints() _G[db..dpr*3+1]:SetPoint("CENTER",db..dpr*2+1,0,ddy) end
	for i = dpr*3+2, dpr*4 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	if _G[db..dpr*4+1] then _G[db..dpr*4+1]:ClearAllPoints() _G[db..dpr*4+1]:SetPoint("CENTER",db..dpr*3+1,0,ddy) end
	for i = dpr*4+2, dpr*5 do if _G[db..i] then _G[db..i]:ClearAllPoints() _G[db..i]:SetPoint("CENTER",db..i - 1 ,ddx,0) end end
	for i = 1, 25 do if _G[db..i] then _G[db..i]:SetScale(dbs) end end
	end)
end


function updateCastBar()
	CastingBarFrame:SetScale(1.3)
	CastingBarFrame:HookScript("OnShow", function(self)
		self:ClearAllPoints()
		self:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
	end)
end


function updateInterface()
	PlayerFrame:Hide()  
end


function updateTargetFrame()
	local Frame = CreateFrame("Frame")
	Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	Frame:SetScript("OnEvent", function(...)
		TargetFrameTextureFrameRaidTargetIcon:SetAlpha(0)
		-- TargetFrameTextureFrameLevelText:SetAlpha(0) 
		TargetFrameTextureFramePVPIcon:SetAlpha(0)   
		TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
		TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
		TargetFrameTextureFrameLeaderIcon:SetAlpha(0)
		TargetFrameToTTextureFrameName:SetAlpha(0)
	end)
	TargetFrameToT:ClearAllPoints() 
	TargetFrameToT:SetPoint("CENTER", 90,-24)
	TargetFrameNameBackground:ClearAllPoints()
	TargetFrameNameBackground:SetPoint("CENTER", UIParent, "CENTER", -5000, 0)
	TargetFrameNameBackground.SetPoint = function() end
	local f = CreateFrame("Frame",nil,TargetFrame)
	f:SetFrameStrata("BACKGROUND")
	f:SetWidth(120)
	f:SetHeight(18)
	local t = f:CreateTexture(nil,"BACKGROUND")
	t:SetColorTexture(0,0,0,.8)
	t:SetAllPoints(f)
	f.texture = t
	f:SetPoint("CENTER",-50,18)
	f:Show()    
	hooksecurefunc("UnitFramePortrait_Update",function(self)
	if self.portrait then
	if UnitIsPlayer(self.unit) then                
	local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
	if t then
	self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
	self.portrait:SetTexCoord(unpack(t))
	end
	else
	self.portrait:SetTexCoord(0,1,0,1)
	end
	end
	end) 
	function targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX)
	local AURA_OFFSET_Y = 4;
	local LARGE_AURA_SIZE = 18*1.5;
	local SMALL_AURA_SIZE = 18*1.4;
	maxRowWidth = LARGE_AURA_SIZE * 5
	local size;
	local offsetY = AURA_OFFSET_Y;
	local rowWidth = 0;
	local firstBuffOnRow = 1;
	for i=1, numAuras do
	if ( largeAuraList[i] ) then
	size = LARGE_AURA_SIZE;
	offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y;
	else
	size = SMALL_AURA_SIZE;
	end
	if ( i == 1 ) then
	rowWidth = size;
	self.auraRows = self.auraRows + 1;
	else
	rowWidth = rowWidth + size + offsetX;
	end
	if ( rowWidth > maxRowWidth ) then
	updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY);
	rowWidth = size;
	self.auraRows = self.auraRows + 1;
	firstBuffOnRow = i;
	offsetY = AURA_OFFSET_Y;
	else
	updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY);
	end
	end
	end
	hooksecurefunc("TargetFrame_UpdateAuraPositions", targetUpdateAuraPositions)   
end


function updateArenaFrames()
	LoadAddOn("Blizzard_ArenaUI") 
	ArenaEnemyFrame1:ClearAllPoints()
	ArenaEnemyFrame2:ClearAllPoints()
	ArenaEnemyFrame3:ClearAllPoints()
	ArenaEnemyFrame1:SetScale(1.5)
	ArenaEnemyFrame2:SetScale(1.5)
	ArenaEnemyFrame3:SetScale(1.5)
	ArenaEnemyFrame1:SetPoint("CENTER",UIParent,"CENTER",340,60)
	ArenaEnemyFrame2:SetPoint("CENTER",UIParent,"CENTER",340,100)
	ArenaEnemyFrame3:SetPoint("CENTER",UIParent,"CENTER",340,140)
	ArenaEnemyFrame1.SetPoint = function() end
	ArenaEnemyFrame2.SetPoint = function() end
	ArenaEnemyFrame3.SetPoint = function() end
	ArenaPrepFrame1:ClearAllPoints()
	ArenaPrepFrame2:ClearAllPoints()
	ArenaPrepFrame3:ClearAllPoints()
	ArenaPrepFrame1:SetScale(1.5)
	ArenaPrepFrame2:SetScale(1.5)
	ArenaPrepFrame3:SetScale(1.5)
	ArenaPrepFrame1:SetPoint("CENTER",UIParent,"CENTER",340,60)
	ArenaPrepFrame2:SetPoint("CENTER",UIParent,"CENTER",340,100)
	ArenaPrepFrame3:SetPoint("CENTER",UIParent,"CENTER",340,140) 
	ArenaEnemyFrame1Name:SetAlpha(0)
	ArenaEnemyFrame2Name:SetAlpha(0)
	ArenaEnemyFrame3Name:SetAlpha(0)
	ArenaPrepFrame1.SetPoint = function() end
	ArenaPrepFrame2.SetPoint = function() end
	ArenaPrepFrame3.SetPoint = function() end
	ArenaEnemyFrame1PetFrame:ClearAllPoints()
	ArenaEnemyFrame2PetFrame:ClearAllPoints()
	ArenaEnemyFrame3PetFrame:ClearAllPoints()
	ArenaEnemyFrame1PetFrame:SetPoint("CENTER",UIParent,"CENTER",-5000,0)
	ArenaEnemyFrame2PetFrame:SetPoint("CENTER",UIParent,"CENTER",-5000,0)
	ArenaEnemyFrame3PetFrame:SetPoint("CENTER",UIParent,"CENTER",-5000,0)
end
 
function updateRaidFrames()
	LoadAddOn("Blizzard_CompactRaidFrames") 
	CRFSort_Group=function(t1, t2) 
	if UnitIsUnit(t1,"player")
	  then return false
	elseif UnitIsUnit(t2,"player") 
	  then return true 
	else 
	  return t1 < t2 
	end 
	end 
	CompactRaidFrameContainer.flowSortFunc=CRFSort_Group 
	hooksecurefunc("CompactUnitFrame_UpdateRoleIcon",function(self)
		self.roleIcon:Hide()
	end)
	DefaultCompactUnitFrameOptions.displayName = false
	function setMarkersUp()
	if GetRaidTargetIndex("player")~=6 then SetRaidTarget("player",6)end
	if GetRaidTargetIndex("party1")~=2 then SetRaidTarget("party1",2)end
	if GetRaidTargetIndex("party2")~=3 then SetRaidTarget("party2",3)end
	end
	setMarkersUp()
	local Frame = CreateFrame("Frame")
	Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	Frame:SetScript("OnEvent", function(...)
		CompactRaidFrame1DispelDebuff1:SetAlpha(0)
		CompactRaidFrame1DispelDebuff2:SetAlpha(0)
		CompactRaidFrame2DispelDebuff1:SetAlpha(0)
		CompactRaidFrame2DispelDebuff2:SetAlpha(0)
		CompactRaidFrame3DispelDebuff1:SetAlpha(0)
		CompactRaidFrame3DispelDebuff2:SetAlpha(0)
	end)
end


updateNewActionBar()
hideBagMenuBar()
updatePlayerBuffs()
updateCastBar()
updateInterface()
updateTargetFrame()
updateArenaFrames()
updateRaidFrames()
