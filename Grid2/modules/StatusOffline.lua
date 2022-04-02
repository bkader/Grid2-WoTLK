local Grid2 = Grid2
local L = Grid2.L

local Offline = Grid2.statusPrototype:new("offline")
Offline.GetColor = Grid2.statusLibrary.GetColor

local GetTime, UnitIsConnected = GetTime, UnitIsConnected
local UnitIterator = Grid2.UnitIterator
local offline = {}

local frequency = 2
local timer = nil
local function Scan()
	for unit, owner in UnitIterator() do
		if owner == nil then
			Offline:SetConnected(unit, UnitIsConnected(unit))
			Offline:UpdateIndicators(unit)
		end
	end
	if timer then
		Grid2:CancelTimer(timer, true)
		timer = nil
	end
end

function Offline:UpdateAllUnits(event)
	if timer then return end
	Grid2:ScheduleTimer(Scan, frequency)
end

function Offline:Grid_UnitUpdated(_, unit)
	if Grid2:IsUnitNoPetInRaid(unit) then
		self:SetConnected(unit, UnitIsConnected(unit))
	end
end

function Offline:Grid_UnitLeft(_, unit)
	offline[unit] = nil
end

function Offline:SetConnected(unit, connected)
	if connected then
		offline[unit] = nil
	else
		offline[unit] = true
	end
end

function Offline:OnEnable()
	self:RegisterEvent("PARTY_MEMBERS_CHANGED", "UpdateAllUnits")
	self:RegisterEvent("RAID_ROSTER_UPDATE", "UpdateAllUnits")
	self:RegisterMessage("Grid_UnitUpdated")
	self:RegisterMessage("Grid_UnitLeft")
	self:UpdateAllUnits()
end

function Offline:OnDisable()
	self:UnregisterEvent("PARTY_MEMBERS_CHANGED", "UpdateAllUnits")
	self:UnregisterEvent("RAID_ROSTER_UPDATE", "UpdateAllUnits")
	self:UnregisterMessage("Grid_UnitUpdated")
	self:UnregisterMessage("Grid_UnitLeft")
	wipe(offline)
end

function Offline:IsActive(unit)
	return offline[unit]
end

local text = L["Offline"]
function Offline:GetText(unit)
	return text
end

function Offline:GetPercent(unit)
	return self.dbx.color1.a, text
end

function Offline:GetTexCoord()
	return 0.2, 0.8, 0.2, 0.8
end

function Offline:GetIcon()
	return "Interface\\CharacterFrame\\Disconnect-Icon"
end

local function Create(baseKey, dbx)
	Grid2:RegisterStatus(Offline, {"color", "icon", "percent", "text"}, baseKey, dbx)

	return Offline
end

Grid2.setupFunc["offline"] = Create
Grid2:DbSetStatusDefaultValue("offline", {type = "offline", color1 = {r = 1, g = 1, b = 1, a = 1}})