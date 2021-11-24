local Grid2 = Grid2
local L = Grid2.L

local Resurrection = Grid2.statusPrototype:new("resurrection")
Resurrection.GetBorder = Grid2.statusLibrary.GetBorder

local LRC = LibStub:GetLibrary("LibResComm-1.0")

local next, GetTime, UnitExists = next, GetTime, UnitExists
local o_UnitIsDeadOrGhost = UnitIsDeadOrGhost

local res_cache, res_time, timer = {}, {}, nil

local function UnitIsDeadOrGhost(unit)
	return o_UnitIsDeadOrGhost(unit) == 1
end

function Resurrection:Timer()
	for unit in next, res_cache do
		if not (UnitExists(unit) and UnitIsDeadOrGhost(unit)) then
			res_cache[unit] = nil
			self:UpdateIndicators(unit)
		end
	end
	if not next(res_cache) then
		Grid2:CancelTimer(timer, true)
		timer = nil
	end
end

function Resurrection.CheckResTimers(self)
	local t, n = GetTime(), 0
	for unit, val in pairs(res_cache) do
		if val == 0 then
			n = n + 1
			if res_time[unit] < t then
				res_cache[unit] = nil
				self:UpdateIndicators(unit)
				n = n - 1
			end
		end
	end
	if n == 0 then
		if timer then
			Grid2:CancelTimer(timer, true)
			timer = nil
		end
	else
		if not timer then
			timer = Grid2:ScheduleTimer(Resurrection.CheckResTimers, 0.25, Resurrection)
		end
	end
end

function Resurrection:UNIT_HEALTH(event, unit)
	if not res_cache[unit] then return end
	if UnitHealth(unit) > 0 then
		res_cache[unit] = nil
		self:UpdateIndicators(unit)
	end
end

function Resurrection:OnEnable()
	self:RegisterEvent("UNIT_HEALTH")
	LRC.RegisterCallback(self, "ResComm_ResStart")
	LRC.RegisterCallback(self, "ResComm_ResEnd")
	LRC.RegisterCallback(self, "ResComm_CanRes")
	LRC.RegisterCallback(self, "ResComm_Ressed")
	LRC.RegisterCallback(self, "ResComm_ResExpired")
end

function Resurrection:ResComm_ResStart(event, resser, endTime, target)
	local unit = Grid2:GetUnitByFullName(target)
	if unit and UnitIsDeadOrGhost(unit) then
		if LRC:IsUnitBeingRessed(target) then
			if res_cache[unit] ~= 1 then
				res_cache[unit] = 1
				self:UpdateIndicators(unit)
			end
		end
	end
end

--Fired when a resurrection cast ended. This can either mean it has failed or completed.
-- Use ResComm_Ressed to check if someone actually ressed.
function Resurrection:ResComm_ResEnd(event, resser, target)
	if not target then return end
	local unit = Grid2:GetUnitByFullName(target)
	if unit and (res_cache[unit] or 0) ~= 0 then
		res_cache[unit] = nil
		self:UpdateIndicators(unit)
	end
end

--Fired when someone can use a soulstone or ankh.
function Resurrection:ResComm_CanRes(event, name, typeToken, typeString)
	local unit = Grid2:GetUnitByFullName(name)
	res_cache[name] = typeString
	self:UpdateIndicators(unit)
end

--Fired when someone actually sees the accept resurrection box.
function Resurrection:ResComm_Ressed(event, name)
	local unit = Grid2:GetUnitByFullName(name)
	res_cache[unit] = 0
	self:UpdateIndicators(unit)
end

--Fired when the accept resurrection box dissapears/is declined.
function Resurrection:ResComm_ResExpired(event, name)
	local unit = Grid2:GetUnitByFullName(name)
	res_cache[unit] = nil
	self:UpdateIndicators(unit)
end

function Resurrection:OnDisable()
	wipe(res_cache)
end

function Resurrection:IsActive(unit)
	if res_cache[unit] then
		return true
	end
end

function Resurrection:GetColor(unit)
	local c = res_cache[unit] == 0 and self.dbx.color2 or self.dbx.color1
	return c.r, c.g, c.b, c.a
end

function Resurrection:GetIcon(unit)
	return "Interface\\Icons\\Spell_Holy_Resurrection"
end

local resText = {[0] = L["Revived"], [1] = L["Reviving"]}
function Resurrection:GetText(unit)
	return resText[res_cache[unit]] or res_cache[unit]
end

local function Create(baseKey, dbx)
	Grid2:RegisterStatus(Resurrection, {"text", "icon", "color"}, baseKey, dbx)
	return Resurrection
end

Grid2.setupFunc["resurrection"] = Create

Grid2:DbSetStatusDefaultValue("resurrection", {
	type = "resurrection",
	colorCount = 2,
	color1 = {r = 0, g = 1, b = 0, a = 1},
	color2 = {r = 1, g = 1, b = 0, a = 0.75}
})