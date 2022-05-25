-- Status: Aoe-OutgoingHeals
local Grid2 = Grid2
local AOEM = Grid2:GetModule("Grid2AoeHeals", true)
if not AOEM then return end

local playerClass = AOEM.playerClass
local defaultSpells = {
	["SHAMAN"] = {1064}, -- {Chain Heal, Healing Rain}
	["PRIEST"] = {34861, 23455}, -- {Circle of Healing, Holy Nova, Holy Word: Sanctuary}
	["DRUID"] = {18562} -- {Swiftmend}
}
if not defaultSpells[playerClass] then return end

local next, GetTime = next, GetTime

local OutgoingHeal = Grid2.statusPrototype:new("aoe-OutgoingHeals")
local playerGUID, timer, activeTime, timerDelay
local spells, icons = {}, {}
local heal_cache, time_cache = {}, {}

local function TimerEvent()
	local ct = GetTime()
	for unit, ut in next, time_cache do
		if ct - ut > activeTime then
			heal_cache[unit] = nil
			time_cache[unit] = nil
			OutgoingHeal:UpdateIndicators(unit)
		end
	end
	if not next(time_cache) then
		Grid2:CancelTimer(timer)
		timer = nil
	end
end

local function CombatLogEvent(_, _, subEvent, srcGUID, _, _, dstGUID, _, _, _, spellName)
	if (subEvent == "SPELL_HEAL" or subEvent == "SPELL_PERIODIC_HEAL") and spellName and spells[spellName] and srcGUID == playerGUID then
		local unit = Grid2:GetUnitidByGUID(dstGUID)
		if unit then
			local prev = heal_cache[unit]
			heal_cache[unit] = spellName
			time_cache[unit] = GetTime()
			if prev ~= spellName then
				OutgoingHeal:UpdateIndicators(unit)
				if not timer then
					timer = Grid2:ScheduleRepeatingTimer(TimerEvent, timerDelay)
				end
			end
		end
	end
end

function OutgoingHeal:OnEnable()
	self:UpdateDB()
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", CombatLogEvent)
end

function OutgoingHeal:OnDisable()
	wipe(heal_cache)
	wipe(time_cache)
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

function OutgoingHeal:IsActive(unit)
	if heal_cache[unit] then
		return true
	end
end

function OutgoingHeal:GetColor(unit)
	local c = self.dbx.color1
	return c.r, c.g, c.b, c.a
end

function OutgoingHeal:GetIcon(unit)
	local spell = heal_cache[unit]
	if spell then
		return icons[spell]
	end
end

function OutgoingHeal:GetText(unit)
	return heal_cache[unit]
end

function OutgoingHeal:ResetClassSpells()
	wipe(self.dbx.spells[playerClass])
	for _, spell in next, defaultSpells[playerClass] do
		table.insert(self.dbx.spells[playerClass], spell)
	end
end

function OutgoingHeal:GetSpellID(name)
	local id = 0
	if tonumber(name) then
		return tonumber(name)
	end
	for _, spell in next, defaultSpells[playerClass] do
		local spellName = GetSpellInfo(spell)
		if spellName == name then
			return spell
		end
	end
	local _, _, texture = GetSpellInfo(name)
	for i = 150000, 1, -1 do
		if GetSpellInfo(i) == name then
			id = i
			local _, _, t = GetSpellInfo(i)
			if t == texture then
				return i
			end
		end
	end
	return id
end

function OutgoingHeal:UpdateDB()
	wipe(icons)
	wipe(spells)
	if not self.dbx.spells[playerClass] then
		self:ResetClassSpells()
	end
	for _, spell in next, self.dbx.spells[playerClass] do
		local name, _, icon = GetSpellInfo(spell)
		if name then
			spells[name] = true
			icons[name] = icon
		end
	end
	for i = 1, #defaultSpells[playerClass] do
		if self.dbx.spells[playerClass][i] == nil then
			self.dbx.spells[playerClass][i] = "" --without this it seems to be impossible to actualy delete some spells from the default list
		end
	end
	activeTime = self.dbx.activeTime or 2
	timerDelay = math.min(0.1, activeTime / 2)
end

Grid2.setupFunc["aoe-OutgoingHeals"] = function(baseKey, dbx)
	playerGUID = UnitGUID("player")
	Grid2:RegisterStatus(OutgoingHeal, {"color", "icon", "text"}, baseKey, dbx)
	return OutgoingHeal
end

Grid2:DbSetStatusDefaultValue("aoe-OutgoingHeals", {
	type = "aoe-OutgoingHeals",
	spells = Grid2.CopyTable(defaultSpells),
	activeTime = 2,
	color1 = {r = 0, g = 0.8, b = 1, a = 1}
})