local Grid2 = Grid2
local L = Grid2.L

local Status = Grid2.statusPrototype:new("self")
Status.GetColor = Grid2.statusLibrary.GetColor
local UnitIsUnit = UnitIsUnit

function Status:IsActive(unit)
	return UnitIsUnit(unit, "player")
end

function Status:GetText()
	return L["Me"]
end

local function Create(baseKey, dbx)
	Grid2:RegisterStatus(Status, {"color", "text"}, baseKey, dbx)
	return Status
end

Grid2.setupFunc["self"] = Create
Grid2:DbSetStatusDefaultValue("self", {type = "self", color1 = {r = 0.25, g = 1.0, b = 0.25, a = 1}})