-- Misc functions
local Grid2 = Grid2
Grid2.callbacks = Grid2.callbacks or LibStub("CallbackHandler-1.0"):New(Grid2)
Grid2.dummyTable = Grid2.dummyTable or {}

function Grid2.Dummy() end

function Grid2:HideBlizzardRaidFrames()
	if _G.CompactRaidFrameManager then --check if Blizzard_CompactRaidFrames isn't already disabled by the user
		_G.CompactRaidFrameManager:UnregisterAllEvents()
		_G.CompactRaidFrameManager:Hide()
		if _G.CompactRaidFrameContainer then
			_G.CompactRaidFrameContainer:UnregisterAllEvents()
			_G.CompactRaidFrameContainer:Hide()
		end
	end
end

-- Default Colors
do
	local defaultColors = {
		TRANSPARENT = {r = 0, g = 0, b = 0, a = 0},
		BLACK = {r = 0, g = 0, b = 0, a = 1},
		WHITE = {r = 1, g = 1, b = 1, a = 1}
	}
	function Grid2:MakeColor(color, default)
		return color or defaultColors[default or "TRANSPARENT"]
	end
	Grid2.defaultColors = defaultColors
end

local media = LibStub("LibSharedMedia-3.0", true)
function Grid2:MediaFetch(mediatype, key, def)
	return (key and media:Fetch(mediatype, key)) or (def and media:Fetch(mediatype, def)) or def
end

-- UTF8 string truncate
do
	local strbyte = string.byte
	function Grid2.strcututf8(s, c)
		local l, i = #s, 1
		while c > 0 and i <= l do
			local b = strbyte(s, i)
			if b < 192 then
				i = i + 1
			elseif b < 224 then
				i = i + 2
			elseif b < 240 then
				i = i + 3
			else
				i = i + 4
			end
			c = c - 1
		end
		return s:sub(1, i - 1)
	end
end

-- Table Deep Copy used by GridDefaults.lua
function Grid2.CopyTable(src, dst)
	if type(dst) ~= "table" then
		dst = {}
	end
	for k, v in pairs(src) do
		if type(v) == "table" then
			dst[k] = Grid2.CopyTable(v, dst[k])
		elseif not dst[k] then
			dst[k] = v
		end
	end
	return dst
end

-- Remove item by value in a ipairs table
function Grid2.TableRemoveByValue(t,v)
	for i=#t,1,-1 do
		if t[i]==v then
			tremove(t, i)
			return
		end
	end
end

-- Creates a location table, used by GridDefaults.lua
function Grid2.CreateLocation(a, b, c, d)
	local p = a or "TOPLEFT"
	if type(b) == "string" then
		return {relPoint = p, point = b, x = c or 0, y = d or 0}
	else
		return {relPoint = p, point = p, x = b or 0, y = c or 0}
	end
end

-- Common methods repository for statuses
Grid2.statusLibrary = {
	IsActive = function()
		return true
	end,
	GetBorder = function()
		return 1
	end,
	GetColor = function(self)
		local c = self.dbx.color1
		return c.r, c.g, c.b, c.a
	end,
	GetPercent = function(self)
		return self.dbx.color1.a
	end,
	UpdateAllUnits = function(self)
		for unit in Grid2:IterateRosterUnits() do
			self:UpdateIndicators(unit)
		end
	end
}

-- Used by bar indicators
Grid2.AlignPoints = {
	HORIZONTAL = {"TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT"},
	HORIZONTAL_INVERSE = {"TOPRIGHT", "TOPLEFT", "BOTTOMRIGHT", "BOTTOMLEFT"},
	VERTICAL = {"BOTTOMLEFT", "TOPLEFT", "BOTTOMRIGHT", "TOPRIGHT"},
	VERTICAL_INVERSE = {"TOPLEFT", "BOTTOMLEFT", "TOPRIGHT", "BOTTOMRIGHT"}
}

-- Specialization Icons
Grid2.SpecIcons = {
	-- Death Knight
	[250] = "Interface\\Icons\\spell_deathknight_bloodpresence", --> Blood
	[251] = "Interface\\Icons\\spell_deathknight_frostpresence", --> Frost
	[252] = "Interface\\Icons\\spell_deathknight_unholypresence", --> Unholy
	-- Druid
	[102] = "Interface\\Icons\\spell_nature_starfall", --> Balance
	[103] = "Interface\\Icons\\ability_druid_catform", --> Feral
	[104] = "Interface\\Icons\\ability_racial_bearform", --> Tank
	[105] = "Interface\\Icons\\spell_nature_healingtouch", --> Restoration
	-- Hunter
	[253] = "Interface\\Icons\\ability_hunter_beasttaming", --> Beastmastery
	[254] = "Interface\\Icons\\ability_hunter_focusedaim", --> Marksmalship
	[255] = "Interface\\Icons\\ability_hunter_swiftstrike", --> Survival
	-- Mage
	[62] = "Interface\\Icons\\spell_holy_magicalsentry", --> Arcane
	[63] = "Interface\\Icons\\spell_fire_flamebolt", --> Fire
	[64] = "Interface\\Icons\\spell_frost_frostbolt02", --> Frost
	-- Paldin
	[65] = "Interface\\Icons\\spell_holy_holybolt", --> Holy
	[66] = "Interface\\Icons\\ability_paladin_shieldofthetemplar", --> Protection
	[70] = "Interface\\Icons\\spell_holy_auraoflight", --> Ret
	-- Priest
	[256] = "Interface\\Icons\\spell_holy_powerwordshield", --> Discipline
	[257] = "Interface\\Icons\\spell_holy_guardianspirit", --> Holy
	[258] = "Interface\\Icons\\spell_shadow_shadowwordpain", --> Shadow
	-- Rogue
	[259] = "Interface\\Icons\\ability_rogue_eviscerate", --> Assassination
	[260] = "Interface\\Icons\\ability_backstab", --> Combat
	[261] = "Interface\\Icons\\ability_stealth", --> Subtlty
	-- Shaman
	[262] = "Interface\\Icons\\spell_nature_lightning", --> Elemental
	[263] = "Interface\\Icons\\spell_shaman_improvedstormstrike", --> Enhancement
	[264] = "Interface\\Icons\\spell_nature_healingwavegreater", --> Restoration
	-- Warlock
	[265] = "Interface\\Icons\\spell_shadow_deathcoil", --> Affliction
	[266] = "Interface\\Icons\\spell_shadow_metamorphosis", --> Demonology
	[267] = "Interface\\Icons\\spell_shadow_rainoffire", --> Destruction
	-- Warrior
	[71] = "Interface\\Icons\\ability_warrior_savageblow", --> Arms
	[72] = "Interface\\Icons\\ability_warrior_innerrage", --> Fury
	[73] = "Interface\\Icons\\ability_warrior_defensivestance" --> Protection
}

-- Create/Manage/Sets frame backdrops
do
	local format = string.format
	local tostring = tostring
	local backdrops = {}
	-- Generates a backdrop table, reuses tables avoiding to create duplicates
	function Grid2:GetBackdropTable(edgeFile, edgeSize, bgFile, tile, tileSize, inset)
		inset = inset or edgeSize
		local key = format("%s;%s;%d;%s;%d;%d", bgFile or "", edgeFile or "", edgeSize or -1, tostring(tile), tileSize or -1, inset or -1)
		local backdrop = backdrops[key]
		if not backdrop then
			backdrop = {
				bgFile = bgFile,
				tile = tile,
				tileSize = tileSize,
				edgeFile = edgeFile,
				edgeSize = edgeSize,
				insets = {left = inset, right = inset, top = inset, bottom = inset}
			}
			backdrops[key] = backdrop
		end
		return backdrop
	end
	-- Sets a backdrop only if necessary to alleviate game freezes, see ticket #640
	function Grid2:SetFrameBackdrop(frame, backdrop)
		if backdrop ~= frame.currentBackdrop then
			frame:SetBackdrop(backdrop)
			frame.currentBackdrop = backdrop
		end
	end
end

-------------------------------------------------------------------------------
-- roster & unit utils.

local GetNumRaidMembers = GetNumRaidMembers
local GetNumPartyMembers = GetNumPartyMembers

function Grid2.IsInRaid()
	return (GetNumRaidMembers() > 0)
end

function Grid2.IsInGroup()
	return (GetNumRaidMembers() > 0 or GetNumPartyMembers() > 0)
end

function Grid2.GetNumGroupMembers()
	return Grid2.IsInRaid() and GetNumRaidMembers() or GetNumPartyMembers()
end

local IsRaidLeader, IsPartyLeader = IsRaidLeader, IsPartyLeader
local GetPartyLeaderIndex, GetRaidRosterInfo = GetPartyLeaderIndex, GetRaidRosterInfo

function Grid2.UnitIsGroupLeader(unit)
	if not Grid2.IsInGroup() then
		return false
	elseif unit == "player" then
		return (Grid2.IsInRaid() and IsRaidLeader() or IsPartyLeader())
	else
		local index = unit:match("%d+")
		if not index then -- to allow other units to be checked
			unit = Grid2.GetUnitIdFromGUID(UnitGUID(unit))
			index = unit and unit:match("%d+")
		end
		if Grid2.IsInRaid() then
			return (index and select(2, GetRaidRosterInfo(index)) == 2)
		end
		return (index and GetPartyLeaderIndex() == tonumber(index))
	end
end

function Grid2.UnitIsGroupAssistant(unit)
	if not Grid2.IsInRaid() then
		return false
	else
		local index = unit:match("%d+")
		if not index then -- to allow other units to be checked
			unit = Grid2.GetUnitIdFromGUID(UnitGUID(unit))
			index = unit and unit:match("%d+")
		end
		return (index and select(2, GetRaidRosterInfo(index)) == 1)
	end
end

function Grid2.GetUnitIdFromGUID(guid)
	for unit, owner in Grid2.UnitIterator() do
		if UnitGUID(unit) == guid then
			return unit
		elseif UnitExists(unit .. "target") and UnitGUID(unit .. "target") == guid then
			return unit .. "target"
		elseif owner and UnitGUID(owner) == guid then
			return owner
		elseif owner and UnitGUID(owner .. "target") == guid then
			return owner .. "target"
		end
	end
end

local LGT = LibStub("LibGroupTalents-1.0")
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local LGTRoleTable = {melee = "DAMAGER", caster = "DAMAGER", healer = "HEALER", tank = "TANK"}

function Grid2.GetUnitRole(unit, class)
	unit = unit or "player" -- always fallback to player

	-- For LFG using "UnitGroupRolesAssigned" is enough.
	local isTank, isHealer, isDamager = UnitGroupRolesAssigned(unit)
	if isTank then
		return "TANK"
	elseif isHealer then
		return "HEALER"
	elseif isDamager then
		return "DAMAGER"
	end

	-- speedup things using classes.
	class = class or select(2, UnitClass(unit))
	if class == "HUNTER" or class == "MAGE" or class == "ROGUE" or class == "WARLOCK" then
		return "DAMAGER"
	end

	return LGTRoleTable[LGT:GetUnitRole(unit)] or "NONE"
end

local specsTable = {
	MAGE = {62, 63, 64},
	PRIEST = {256, 257, 258},
	ROGUE = {259, 260, 261},
	WARLOCK = {265, 266, 267},
	WARRIOR = {71, 72, 73},
	PALADIN = {65, 66, 70},
	DEATHKNIGHT = {250, 251, 252},
	DRUID = {102, 103, 104, 105},
	HUNTER = {253, 254, 255},
	SHAMAN = {262, 263, 264}
}

function Grid2.GetUnitSpec(unit, class)
	local spec  -- start with nil

	if unit and UnitExists(unit) then
		class = class or select(2, UnitClass(unit))
		if class and specsTable[class] then
			local talentGroup = LGT:GetActiveTalentGroup(unit)
			local maxPoints, index = 0, 0

			for i = 1, MAX_TALENT_TABS do
				local _, _, pointsSpent = LGT:GetTalentTabInfo(unit, i, talentGroup)
				if pointsSpent ~= nil then
					if maxPoints < pointsSpent then
						maxPoints = pointsSpent
						if class == "DRUID" and i >= 2 then
							if i == 3 then
								index = 4
							elseif i == 2 then
								local points = LGT:UnitHasTalent(unit, GetSpellInfo(57881))
								index = (points and points > 0) and 3 or 2
							end
						else
							index = i
						end
					end
				end
			end
			spec = specsTable[class][index]
		end
	end

	return spec
end

-------------------------------------------------------------------------------
-- Group iterator

do
	local rmem, pmem, step, count

	local function SelfIterator(excPets)
		while step do
			local unit, owner
			if step == 1 then
				unit, owner, step = "player", nil, 2
			elseif step == 2 then
				if not excPets then
					unit, owner = "playerpet", "player"
				end
				step = nil
			end
			if unit and UnitExists(unit) then
				return unit, owner
			end
		end
	end

	local function PartyIterator(excPets)
		while step do
			local unit, owner
			if step <= 2 then
				unit, owner = SelfIterator(excPets)
				step = step or 3
			elseif step == 3 then
				unit, owner, step = format("party%d", count), nil, 4
			elseif step == 4 then
				if not excPets then
					unit, owner = format("partypet%d", count), format("party%d", count)
				end
				count = count + 1
				step = count <= pmem and 3 or nil
			end
			if unit and UnitExists(unit) then
				return unit, owner
			end
		end
	end

	local function RaidIterator(excPets)
		while step do
			local unit, owner
			if step == 1 then
				unit, owner, step = format("raid%d", count), nil, 2
			elseif step == 2 then
				if not excPets then
					unit, owner = format("raidpet%d", count), format("raid%d", count)
				end
				count = count + 1
				step = count <= rmem and 1 or nil
			end
			if unit and UnitExists(unit) then
				return unit, owner
			end
		end
	end

	function Grid2.UnitIterator(excPets)
		rmem, step = GetNumRaidMembers(), 1
		if rmem == 0 then
			pmem = GetNumPartyMembers()
			if pmem == 0 then
				return SelfIterator, excPets
			end
			count = 1
			return PartyIterator, excPets
		end
		count = 1
		return RaidIterator, excPets
	end
end

-------------------------------------------------------------------------------
-- Status bar
do
	local barFrame = CreateFrame("Frame")
	local barPrototype_SetScript = barFrame.SetScript

	local function barPrototype_Update(self, sizeChanged, width, height)
		local progress = (self.VALUE - self.MINVALUE) / (self.MAXVALUE - self.MINVALUE)

		local align1, align2
		local TLx, TLy, BLx, BLy, TRx, TRy, BRx, BRy
		local TLx_, TLy_, BLx_, BLy_, TRx_, TRy_, BRx_, BRy_
		local xprogress, yprogress

		width = width or self:GetWidth()
		height = height or self:GetHeight()

		if self.ORIENTATION == "HORIZONTAL" then
			xprogress = width * progress -- progress horizontally
			if self.FILLSTYLE == "CENTER" then
				align1, align2 = "TOP", "BOTTOM"
			elseif self.REVERSE or self.FILLSTYLE == "REVERSE" then
				align1, align2 = "TOPRIGHT", "BOTTOMRIGHT"
			else
				align1, align2 = "TOPLEFT", "BOTTOMLEFT"
			end
		elseif self.ORIENTATION == "VERTICAL" then
			yprogress = height * progress -- progress vertically
			if self.FILLSTYLE == "CENTER" then
				align1, align2 = "LEFT", "RIGHT"
			elseif self.REVERSE or self.FILLSTYLE == "REVERSE" then
				align1, align2 = "TOPLEFT", "TOPRIGHT"
			else
				align1, align2 = "BOTTOMLEFT", "BOTTOMRIGHT"
			end
		end

		if self.ROTATE then
			TLx, TLy = 0.0, 1.0
			TRx, TRy = 0.0, 0.0
			BLx, BLy = 1.0, 1.0
			BRx, BRy = 1.0, 0.0
			TLx_, TLy_ = TLx, TLy
			TRx_, TRy_ = TRx, TRy
			BLx_, BLy_ = BLx * progress, BLy
			BRx_, BRy_ = BRx * progress, BRy
		else
			TLx, TLy = 0.0, 0.0
			TRx, TRy = 1.0, 0.0
			BLx, BLy = 0.0, 1.0
			BRx, BRy = 1.0, 1.0
			TLx_, TLy_ = TLx, TLy
			TRx_, TRy_ = TRx * progress, TRy
			BLx_, BLy_ = BLx, BLy
			BRx_, BRy_ = BRx * progress, BRy
		end

		if not sizeChanged then
			self.bg:ClearAllPoints()
			self.bg:SetAllPoints()
			self.bg:SetTexCoord(TLx, TLy, BLx, BLy, TRx, TRy, BRx, BRy)

			self.fg:ClearAllPoints()
			self.fg:SetPoint(align1)
			self.fg:SetPoint(align2)
			self.fg:SetTexCoord(TLx_, TLy_, BLx_, BLy_, TRx_, TRy_, BRx_, BRy_)
		end

		if xprogress then
			self.fg:SetWidth(xprogress > 0 and xprogress or 0.1)
			Grid2.callbacks:Fire("OnValueChanged", self, self.VALUE)
		end
		if yprogress then
			self.fg:SetHeight(yprogress > 0 and yprogress or 0.1)
			Grid2.callbacks:Fire("OnValueChanged", self, self.VALUE)
		end
	end

	local function barPrototype_OnSizeChanged(self, width, height)
		barPrototype_Update(self, true, width, height)
	end

	local barPrototype = setmetatable({
		MINVALUE = 0.0,
		MAXVALUE = 1.0,
		VALUE = 1.0,
		ROTATE = true,
		REVERSE = false,
		ORIENTATION = "HORIZONTAL",
		FILLSTYLE = "STANDARD",

		SetMinMaxValues = function(self, minValue, maxValue)
			assert((type(minValue) == "number" and type(maxValue) == "number"), "Usage: StatusBar:SetMinMaxValues(number, number)")

			if maxValue > minValue then
				self.MINVALUE = minValue
				self.MAXVALUE = maxValue
			else
				self.MINVALUE = 0
				self.MAXVALUE = 1
			end

			if not self.VALUE or self.VALUE > self.MAXVALUE then
				self.VALUE = self.MAXVALUE
			elseif not self.VALUE or self.VALUE < self.MINVALUE then
				self.VALUE = self.MINVALUE
			end

			barPrototype_Update(self)
		end,

		GetMinMaxValues = function(self)
			return self.MINVALUE, self.MAXVALUE
		end,

		SetValue = function(self, value)
			assert(type(value) == "number", "Usage: StatusBar:SetValue(number)")
			if value >= self.MINVALUE and value <= self.MAXVALUE then
				self.VALUE = value
				barPrototype_Update(self)
			end
		end,

		GetValue = function(self)
			return self.VALUE
		end,

		SetOrientation = function(self, orientation)
			if orientation == "HORIZONTAL" or orientation == "VERTICAL" then
				self.ORIENTATION = orientation
				barPrototype_Update(self)
			end
		end,

		GetOrientation = function(self)
			return self.ORIENTATION
		end,

		SetRotatesTexture = function(self, rotate)
			self.ROTATE = (rotate ~= nil and rotate ~= false)
			barPrototype_Update(self)
		end,

		GetRotatesTexture = function(self)
			return self.ROTATE
		end,

		SetReverseFill = function(self, reverse)
			self.REVERSE = (reverse == true)
			barPrototype_Update(self)
		end,

		GetReverseFill = function(self)
			return self.REVERSE
		end,

		SetFillStyle = function(self, style)
			assert(type(style) == "string" or style == nil, "Usage: StatusBar:SetFillStyle(string)")
			if style and style:lower() == "center" then
				self.FILLSTYLE = "CENTER"
				barPrototype_Update(self)
			elseif style and style:lower() == "reverse" then
				self.FILLSTYLE = "REVERSE"
				barPrototype_Update(self)
			else
				self.FILLSTYLE = "STANDARD"
				barPrototype_Update(self)
			end
		end,

		GetFillStyle = function(self)
			return self.FILLSTYLE
		end,

		SetStatusBarTexture = function(self, texture)
			self.fg:SetTexture(texture)
			self.bg:SetTexture(texture)
		end,

		GetStatusBarTexture = function(self)
			return self.fg
		end,

		SetForegroundColor = function(self, r, g, b, a)
			self.fg:SetVertexColor(r, g, b, a)
		end,

		GetForegroundColor = function(self)
			return self.fg
		end,

		SetBackgroundColor = function(self, r, g, b, a)
			self.bg:SetVertexColor(r, g, b, a)
		end,

		GetBackgroundColor = function(self)
			return self.bg:GetVertexColor()
		end,

		SetTexture = function(self, texture)
			self:SetStatusBarTexture(texture)
		end,

		GetTexture = function(self)
			return self.fg:GetTexture()
		end,

		SetStatusBarColor = function(self, r, g, b, a)
			self:SetForegroundColor(r, g, b, a)
		end,

		GetStatusBarColor = function(self)
			return self.fg:GetVertexColor()
		end,

		SetVertexColor = function(self, r, g, b, a)
			self:SetForegroundColor(r, g, b, a)
		end,

		GetVertexColor = function(self)
			return self.fg:GetVertexColor()
		end,

		SetStatusBarGradient = function(self, r1, g1, b1, a1, r2, g2, b2, a2)
			self.fg:SetGradientAlpha(self.ORIENTATION, r1, g1, b1, a1, r2, g2, b2, a2)
		end,

		SetStatusBarGradientAuto = function(self, r, g, b, a)
			self.fg:SetGradientAlpha(self.ORIENTATION, 0.5 + (r * 1.1), g * 0.7, b * 0.7, a, r * 0.7, g * 0.7, 0.5 + (b * 1.1), a)
		end,

		SetStatusBarSmartGradient = function(self, r1, g1, b1, r2, g2, b2)
			self.fg:SetGradientAlpha(self.ORIENTATION, r1, g1, b1, 1, r2 or r1, g2 or g1, b2 or b1, 1)
		end,

		GetObjectType = function(self)
			return "StatusBar"
		end,

		IsObjectType = function(self, otype)
			return (otype == "StatusBar") and 1 or nil
		end,

		SetScript = function(self, event, callback)
			if event == "OnValueChanged" then
				assert(type(callback) == "function", 'Usage: StatusBar:SetScript("OnValueChanged", function)')
				Grid2.RegisterCallback(self, "OnValueChanged", function() callback(self, self.VALUE) end)
			else
				barPrototype_SetScript(self, event, callback)
			end
		end
	}, {__index = barFrame})

	local barPrototype_mt = {__index = barPrototype}

	local function StatusBarPrototype(name, parent)
		-- create the bar and its elements.
		local bar = setmetatable(CreateFrame("Frame", name, parent), barPrototype_mt)
		bar.fg = bar.fg or bar:CreateTexture(name and "$parent.Texture", "ARTWORK")
		bar.bg = bar.bg or bar:CreateTexture(name and "$parent.Background", "BACKGROUND")
		bar.bg:Hide()

		-- do some stuff then return it.
		bar:HookScript("OnSizeChanged", barPrototype_OnSizeChanged)
		bar:SetRotatesTexture(false)
		return bar
	end

	Grid2.StatusBarPrototype = StatusBarPrototype
end