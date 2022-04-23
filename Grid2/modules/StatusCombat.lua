local Grid2 = Grid2
local L = Grid2.L

-- shared methods
local function GetTexCoordEmpty()
	return 0, 0.05, 0, 0.05
end

local function GetTexCoordIcon()
	return 0.55, 0.93, 0.07, 0.42
end

local text = L["combat"]
local function GetText(self, unit)
	return text
end

local function GetPercent(self, unit)
	return self.dbx.color1.a, text
end

local function GetIcon()
	return [[Interface\CharacterFrame\UI-StateIcon]]
end

-- combat status
do
	local Combat = Grid2.statusPrototype:new("combat")
	local UnitAffectingCombat = UnitAffectingCombat
	local cache = {}
	local timer = nil

	Combat.UpdateAllUnits = Grid2.statusLibrary.UpdateAllUnits
	Combat.GetColor = Grid2.statusLibrary.GetColor
	Combat.GetPercent = GetPercent
	Combat.GetText = GetText
	Combat.GetIcon = GetIcon

	local function UpdateUnits()
		for unit in Grid2:IterateRosterUnits() do
			local value = UnitAffectingCombat(unit)
			if value ~= cache[unit] then
				cache[unit] = value
				Combat:UpdateIndicators(unit)
			end
		end
	end

	function Combat:OnEnable()
		self:UpdateDB()
		self:RegisterMessage("Grid_UnitUpdated")
		self:RegisterMessage("Grid_UnitLeft")
		timer = timer or Grid2:ScheduleRepeatingTimer(UpdateUnits, 1)
	end

	function Combat:OnDisable()
		self:UnregisterMessage("Grid_UnitUpdated")
		self:UnregisterMessage("Grid_UnitLeft")
		wipe(cache)
		Grid2:CancelTimer(timer, true)
		timer = nil
	end

	function Combat:Grid_UnitUpdated(_, unit)
		cache[unit] = UnitAffectingCombat(unit)
	end

	function Combat:Grid_UnitLeft(_, unit)
		cache[unit] = nil
	end

	function Combat:IsActive(unit)
		return cache[unit]
	end

	function Combat:UpdateDB()
		self.GetTexCoord = self.dbx.useEmptyIcon and GetTexCoordEmpty or GetTexCoordIcon
		timer = timer or Grid2:ScheduleRepeatingTimer(UpdateUnits, 1)
	end

	local function CreateCombat(baseKey, dbx)
		Grid2:RegisterStatus(Combat, {"color", "icon", "percent", "text"}, baseKey, dbx)
		return Combat
	end

	Grid2.setupFunc["combat"] = CreateCombat
	Grid2:DbSetStatusDefaultValue("combat", {type = "combat", color1 = {r = 1, g = 0, b = 0, a = 1}})
end

-- combat-mine status
do
	local MyCombat = Grid2.statusPrototype:new("combat-mine")
	local inCombat

	MyCombat.UpdateAllUnits = Grid2.statusLibrary.UpdateAllUnits
	MyCombat.GetColor = Grid2.statusLibrary.GetColor
	MyCombat.GetPercent = GetPercent
	MyCombat.GetText = GetText
	MyCombat.GetIcon = GetIcon

	function MyCombat:IsActive()
		return inCombat
	end

	function MyCombat:OnEnable()
		self:UpdateDB()
		self:RegisterEvent("PLAYER_REGEN_ENABLED", "CombatChanged")
		self:RegisterEvent("PLAYER_REGEN_DISABLED", "CombatChanged")
		inCombat = InCombatLockdown()
	end

	function MyCombat:OnDisable()
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		self:UnregisterEvent("PLAYER_REGEN_DISABLED")
	end

	function MyCombat:CombatChanged(event)
		inCombat = (event == "PLAYER_REGEN_DISABLED")
		self:UpdateAllUnits()
	end

	function MyCombat:UpdateDB()
		self.GetTexCoord = self.dbx.useEmptyIcon and GetTexCoordEmpty or GetTexCoordIcon
	end

	local function CreateCombatMine(baseKey, dbx)
		Grid2:RegisterStatus(MyCombat, {"color", "icon", "percent", "text"}, baseKey, dbx)
		return MyCombat
	end

	Grid2.setupFunc["combat-mine"] = CreateCombatMine
	Grid2:DbSetStatusDefaultValue("combat-mine", {type = "combat-mine", color1 = {r = 1, g = 0, b = 0, a = 1}})
end