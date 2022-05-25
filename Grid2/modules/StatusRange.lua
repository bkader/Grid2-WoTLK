local Grid2 = Grid2
local Range = Grid2.statusPrototype:new("range")
Range.IsActive = Grid2.statusLibrary.IsActive

local UnitIsUnit, UnitInRange = UnitIsUnit, UnitInRange
local UnitIsFriend, UnitIsDeadOrGhost = UnitIsFriend, UnitIsDeadOrGhost
local IsSpellInRange, IsItemInRange = IsSpellInRange, IsItemInRange
local CheckInteractDistance = CheckInteractDistance
local tostring = tostring

local cache = {}

local Ranges = {
	["10"] = function(unit)
		return CheckInteractDistance(unit, 3)
	end,
	["28"] = function(unit)
		return CheckInteractDistance(unit, 4)
	end,
	["30"] = function(unit)
		return IsItemInRange((UnitIsFriend(unit, "player") and 1180 or 835), unit) == 1
	end, --	1180 = Scroll of Stamina, 835 = Large Rope Net
	["38"] = UnitInRange,
	["40"] = function(unit)
		return IsItemInRange((UnitIsFriend(unit, "player") and 34471 or 28767), unit) == 1
	end, --	34471 = Vial of the Sunwell, 28767 = The Decapitator
	["99"] = UnitIsVisible
}

local UnitRangeCheck
local UnitIsInRange

local _, myclass = UnitClass("player")
local rezSpell = ({DRUID = 20484, PRIEST = 2006, PALADIN = 7328, SHAMAN = 2008, DEATHKNIGHT = 61999, WARLOCK = 20707})[myclass]
if rezSpell then
	rezSpell = GetSpellInfo(rezSpell)
	UnitIsInRange = function(unit)
		local res = nil
		if UnitIsDeadOrGhost(unit) then
			res = UnitIsUnit(unit, "player") or IsSpellInRange(rezSpell, unit) == 1
		else
			res = UnitRangeCheck(unit)
		end
		Grid2:SendMessage("Grid_UnitInRange", unit, res)
		return res
	end
end

-- Roster ranges update function
local function Update(self)
	for unit in Grid2:IterateRosterUnits() do
		local value = UnitIsInRange(unit) and 1 or false
		if value ~= cache[unit] then
			cache[unit] = value
			Range:UpdateIndicators(unit)
		end
	end
	self:Play()
end

-- Range status
function Range:OnEnable()
	self:CreateTimer()
	self:UpdateDB()
	self:RegisterMessage("Grid_UnitUpdated")
	self:RegisterMessage("Grid_UnitLeft")
	self:RegisterMessage("Grid_GroupTypeChanged")
	self.timer:Play()
end

function Range:OnDisable()
	self:UnregisterMessage("Grid_UnitUpdated")
	self:UnregisterMessage("Grid_UnitLeft")
	self:UnregisterMessage("Grid_GroupTypeChanged")
	self.timer:Stop()
end

-- {{ Workaround for WoW 5.0.4 UnitInRange() bug (returns false for player&pet while solo)
local function UnitSoloInRange()
	return true
end

function Range:Grid_GroupTypeChanged(_, groupType)
	Ranges["38"] = groupType == "solo" and UnitSoloInRange or UnitInRange
	if (tostring(self.dbx.range) or "38") == "38" then
		self:UpdateDB()
	end
end
-- }}

function Range:Grid_UnitUpdated(_, unit)
	cache[unit] = UnitIsInRange(unit) and 1 or false
end

function Range:Grid_UnitLeft(_, unit)
	cache[unit] = nil
end

function Range:CreateTimer()
	local timer = CreateFrame("Frame", nil, Grid2LayoutFrame):CreateAnimationGroup()
	timer.animation = timer:CreateAnimation()
	timer.animation:SetOrder(1)
	timer:SetScript("OnFinished", Update)
	self.timer = timer
	self.CreateTimer = Grid2.Dummy
end

function Range:UpdateDB()
	UnitRangeCheck = Ranges[tostring(self.dbx.range) or "38"] or Ranges["38"]
	if not rezSpell then
		UnitIsInRange = UnitRangeCheck
	end
	self.defaultAlpha = self.dbx.default or 0.25
	if self.timer then
		self.timer.animation:SetDuration(self.dbx.elapsed or 0.25)
	end
end

function Range:GetPercent(unit)
	return cache[unit] or self.defaultAlpha
end

function Range:GetRanges()
	return Ranges
end

local function Create(baseKey, dbx)
	Grid2:RegisterStatus(Range, {"percent"}, baseKey, dbx)
	return Range
end

Grid2.setupFunc["range"] = Create
Grid2:DbSetStatusDefaultValue("range", {type = "range", range = 38, default = 0.25, elapsed = 0.5})