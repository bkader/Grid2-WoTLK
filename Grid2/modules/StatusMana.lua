local Grid2 = Grid2
local Mana = Grid2.statusPrototype:new("mana", false)
local LowMana = Grid2.statusPrototype:new("lowmana", false)
local Power = Grid2.statusPrototype:new("power", false)

local max = math.max
local fmt = string.format
local next = next
local tostring = tostring
local UnitMana = UnitMana
local UnitManaMax = UnitManaMax
local UnitPowerType = UnitPowerType
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitIsPlayer = UnitIsPlayer

local statuses = {} -- Enabled statuses

-- Methods shared by MANA statuses
local mana_OnEnable, mana_OnDisable
do
	local frame
	local function Frame_OnEvent(self, event, unit, powerType)
		if UnitIsPlayer(unit) then
			for status in next, statuses do
				status:UpdateIndicators(unit)
			end
		end
	end
	function mana_OnEnable(status)
		if not next(statuses) then
			if not frame then
				frame = CreateFrame("Frame", nil, Grid2LayoutFrame)
			end
			frame:SetScript("OnEvent", Frame_OnEvent)
			frame:RegisterEvent("UNIT_MANA")
			frame:RegisterEvent("UNIT_MAXMANA")
			frame:RegisterEvent("UNIT_DISPLAYPOWER")
		end
		statuses[status] = true
	end
	function mana_OnDisable(status)
		statuses[status] = nil
		if (not next(statuses)) and frame then
			frame:SetScript("OnEvent", nil)
			frame:UnregisterEvent("UNIT_MANA")
			frame:UnregisterEvent("UNIT_MAXMANA")
			frame:UnregisterEvent("UNIT_DISPLAYPOWER")
		end
	end
end

-- Mana status
Mana.GetColor = Grid2.statusLibrary.GetColor
Mana.OnEnable = mana_OnEnable
Mana.OnDisable = mana_OnDisable

function Mana:UpdateUnitPower(unit, powerType)
	if powerType == "MANA" then
		self:UpdateIndicators(unit)
	end
end

function Mana:IsActive(unit)
	return UnitPowerType(unit) == 0
end

function Mana:GetPercent(unit)
	return UnitMana(unit) / UnitManaMax(unit)
end

function Mana:GetText(unit)
	return fmt("%.1fk", UnitMana(unit) / 1000)
end

Grid2.setupFunc["mana"] = function(baseKey, dbx)
	Grid2:RegisterStatus(Mana, {"percent", "text", "color"}, baseKey, dbx)
	return Mana
end

Grid2:DbSetStatusDefaultValue("mana", {type = "mana", color1 = {r = 0, g = 0, b = 1, a = 1}})

-- Low Mana status
LowMana.GetColor = Grid2.statusLibrary.GetColor
LowMana.OnEnable = mana_OnEnable
LowMana.OnDisable = mana_OnDisable

function LowMana:UpdateUnitPower(unit, powerType)
	self:UpdateIndicators(unit)
end

function LowMana:IsActive(unit)
	return (UnitPowerType(unit) == 0) and (Mana:GetPercent(unit) < self.dbx.threshold)
end

Grid2.setupFunc["lowmana"] = function(baseKey, dbx)
	Grid2:RegisterStatus(LowMana, {"color"}, baseKey, dbx)
	return LowMana
end

Grid2:DbSetStatusDefaultValue("lowmana", {type = "lowmana", threshold = 0.75, color1 = {r = 0.5, g = 0, b = 1, a = 1}})

-- Methods shared by all statuses
local events = {
	"UNIT_MAXPOWER",
	"UNIT_MAXENERGY",
	"UNIT_MAXMANA",
	"UNIT_MAXRAGE",
	"UNIT_MAXFOCUS",
	"UNIT_RUNIC_POWER"
}
local replaceEventWithPowerType = {
	UNIT_POWER = "POWER",
	UNIT_MAXPOWER = "POWER",
	UNIT_ENERGY = "ENERGY",
	UNIT_MAXENERGY = "ENERGY",
	UNIT_MANA = "MANA",
	UNIT_MAXMANA = "MANA",
	UNIT_RAGE = "RAGE",
	UNIT_MAXRAGE = "RAGE",
	UNIT_FOCUS = "FOCUS",
	UNIT_MAXFOCUS = "FOCUS",
	UNIT_RUNIC_POWER = "RUNIC_POWER"
}
local power_OnEnable, power_OnDisable
do
	local frame
	local function Frame_OnEvent(self, event, unit, powerType)
		if UnitIsPlayer(unit) then
			powerType = replaceEventWithPowerType[event] or powerType
			local _, ctype = UnitPowerType(unit)
			if powerType == ctype then
				for status in next, statuses do
					status:UpdateUnitPower(unit, powerType)
					--self:UpdateIndicators(unit)
				end
			end
		end
	end
	function power_OnEnable(status)
		if not next(statuses) then
			if not frame then
				frame = CreateFrame("Frame", nil, Grid2LayoutFrame)
			end
			frame:SetScript("OnEvent", Frame_OnEvent)
			for i = 1, #events do
				frame:RegisterEvent(events[i])
				frame:RegisterEvent(string.gsub(events[i], "MAX", ""))
			end
			frame:RegisterEvent("UNIT_DISPLAYPOWER")
		end
		statuses[status] = true
	end
	function power_OnDisable(status)
		statuses[status] = nil
		if (not next(statuses)) and frame then
			frame:SetScript("OnEvent", nil)
			for i = 1, #events do
				frame:UnregisterEvent(events[i])
				frame:UnregisterEvent(string.gsub(events[i], "MAX", ""))
			end
			frame:UnregisterEvent("UNIT_DISPLAYPOWER")
		end
	end
end

local powerColors = {}

Power.OnEnable = power_OnEnable
Power.OnDisable = power_OnDisable

function Power:UpdateUnitPower(unit, powerType)
	if powerColors[powerType] then
		self:UpdateIndicators(unit)
	end
end

function Power:IsActive(unit)
	return UnitIsPlayer(unit)
end

function Power:GetPercent(unit)
	return UnitPower(unit) / UnitPowerMax(unit)
end

function Power:GetText(unit)
	local power = UnitPower(unit)
	if power >= 1000 then
		return fmt("%.1fk", power / 1000)
	else
		return tostring(power)
	end
end

function Power:GetColor(unit)
	local _, type = UnitPowerType(unit)
	local c = powerColors[type] or powerColors["MANA"]
	return c.r, c.g, c.b, c.a
end

function Power:UpdateDB()
	powerColors["MANA"] = self.dbx.color1
	powerColors["RAGE"] = self.dbx.color2
	powerColors["FOCUS"] = self.dbx.color3
	powerColors["ENERGY"] = self.dbx.color4
	powerColors["RUNIC_POWER"] = self.dbx.color5
end

Grid2.setupFunc["power"] = function(baseKey, dbx)
	Grid2:RegisterStatus(Power, {"percent", "text", "color"}, baseKey, dbx)
	Power:UpdateDB()
	return Power
end

Grid2:DbSetStatusDefaultValue("power", {
	type = "power",
	colorCount = 5,
	color1 = {r = 0, g = 0.5, b = 1, a = 1}, -- mana
	color2 = {r = 1, g = 0, b = 0, a = 1}, -- rage
	color3 = {r = 1, g = 0.5, b = 0, a = 1}, -- focus
	color4 = {r = 1, g = 1, b = 0, a = 1}, -- energy
	color5 = {r = 0, g = 0.8, b = 0.8, a = 1} -- runic power
})