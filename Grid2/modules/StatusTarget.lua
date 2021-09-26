local Grid2 = Grid2
local L = Grid2.L

local Target = Grid2.statusPrototype:new("target")
Target.GetColor = Grid2.statusLibrary.GetColor

local UnitIsUnit, UnitGUID = UnitIsUnit, UnitGUID
local curTarget

function Target:OnEnable()
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
end

function Target:PLAYER_TARGET_CHANGED(event)
	if curTarget then
		self:UpdateIndicators(curTarget)
	end
	local guid = UnitGUID("target")
	if guid then
		curTarget = Grid2:GetUnitidByGUID(guid)
		if curTarget then
			self:UpdateIndicators(curTarget)
		end
	else
		curTarget = nil
	end
end

function Target:OnDisable()
	self:UnregisterEvent("PLAYER_TARGET_CHANGED")
	curTarget = nil
end

function Target:IsActive(unit)
	return UnitIsUnit(unit, "target")
end

function Target:GetText()
	return L["target"]
end

local function Create(baseKey, dbx)
	Grid2:RegisterStatus(Target, {"color", "text"}, baseKey, dbx)
	return Target
end

Grid2.setupFunc["target"] = Create
Grid2:DbSetStatusDefaultValue("target", {type = "target", color1 = {r = 0.8, g = 0.8, b = 0.8, a = 0.75}})