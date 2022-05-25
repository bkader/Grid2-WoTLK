local Grid2 = Grid2
local next, pairs = next, pairs
local GetUnitSpec = Grid2.GetUnitSpec

local SpecIcons = Grid2.SpecIcons
local Portraits = {}
local _

local function Portrait_Create(self, parent)
	local frame = self:CreateFrame("Frame", parent)
	frame.portraitTexture = frame.portraitTexture or frame:CreateTexture(nil, "ARTWORK")
	if self.dbx.backColor then
		frame.portraitBack = frame.portraitBack or frame:CreateTexture(nil, "BACKGROUND")
		frame.portraitBack:SetAllPoints()
	end
	self:OnUpdate(parent, "player")
end

local function Portrait_OnUpdateSpec(self, parent, unit)
	local Portrait = parent[self.name]
	local spec = GetUnitSpec(unit)
	if spec and SpecIcons[spec] then
		Portrait.portraitTexture:SetTexture(SpecIcons[spec])
		Portrait.portraitTexture:SetTexCoord(0, 1, 0, 1)
	else
		Portrait.portraitTexture:SetTexture("")
	end
end

local function Portrait_OnUpdateClass(self, parent, unit)
	local Portrait = parent[self.name]
	local _, class = UnitClass(unit)
	if class then
		Portrait.portraitTexture:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
		Portrait.portraitTexture:SetTexCoord(CLASS_ICON_TCOORDS[class][1], CLASS_ICON_TCOORDS[class][2], CLASS_ICON_TCOORDS[class][3], CLASS_ICON_TCOORDS[class][4])
	else
		Portrait.portraitTexture:SetTexture("")
	end
end

local function Portrait_OnUpdate2D(self, parent, unit)
	local Portrait = parent[self.name]
	Portrait.portraitTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	SetPortraitTexture(Portrait.portraitTexture, unit)
end

local function Portrait_Layout(self, parent)
	local Portrait, container = parent[self.name], parent.container
	local dbx = self.dbx
	local l = dbx.location
	Portrait:SetParent(parent)
	Portrait:ClearAllPoints()
	Portrait:SetFrameLevel(parent:GetFrameLevel() + (dbx.level or 4))
	Portrait:SetPoint(l.point, container, l.relPoint, l.x, l.y)
	Portrait:SetWidth(dbx.width or container:GetWidth())
	Portrait:SetHeight(dbx.height or container:GetHeight())
	local b = dbx.innerBorder or 0
	Portrait.portraitTexture:ClearAllPoints()
	Portrait.portraitTexture:SetPoint("TOPLEFT", Portrait, "TOPLEFT", b, -b)
	Portrait.portraitTexture:SetPoint("BOTTOMRIGHT", Portrait, "BOTTOMRIGHT", -b, b)
	Portrait.portraitTexture:Show()
	local c = dbx.backColor
	if c then
		Portrait.portraitBack:SetVertexColor(c.r, c.g, c.b, c.a)
		Portrait.portraitBack:Show()
	end
	Portrait:Show()
end

local function Portrait_Disable(self, parent)
	local f = parent[self.name]
	f:Hide()
	f:SetParent(nil)
	f:ClearAllPoints()
	if f.portraitTexture then
		f.portraitTexture:Hide()
	end
	if f.portraitBack then
		f.portraitBack:Hide()
	end
end

local function Portrait_OnDelete(self)
	Portraits[self] = nil
	if not next(Portraits) then
		Grid2:UnregisterEvent("UNIT_PORTRAIT_UPDATE")
	end
end

local function UpdatePortraits(event, unit)
	for parent in next, Grid2:GetUnitFrames(unit) do
		for indicator in pairs(Portraits) do
			indicator:OnUpdate(parent, unit, event)
		end
	end
end

local function Portrait_UpdateDB(self, dbx)
	dbx = dbx or self.dbx
	if dbx.portraitType == "spec" then
		self.OnUpdate = Portrait_OnUpdateSpec
	elseif dbx.portraitType == "class" then
		self.OnUpdate = Portrait_OnUpdateClass
	else
		self.OnUpdate = Portrait_OnUpdate2D
	end
	if not next(Portraits) then
		Grid2:RegisterEvent("UNIT_PORTRAIT_UPDATE", UpdatePortraits)
	end
	Portraits[self] = true
	self.dbx = dbx
end

local function CreatePortraitIndicator(indicatorKey, dbx)
	local indicator = Grid2.indicators[indicatorKey] or Grid2.indicatorPrototype:new(indicatorKey)
	indicator.dbx = dbx
	indicator.Create = Portrait_Create
	indicator.Layout = Portrait_Layout
	indicator.Disable = Portrait_Disable
	indicator.OnDelete = Portrait_OnDelete
	indicator.UpdateDB = Portrait_UpdateDB
	Portrait_UpdateDB(indicator, dbx)
	Grid2:RegisterIndicator(indicator, {"portrait"})
	return indicator
end

Grid2.setupFunc["portrait"] = CreatePortraitIndicator