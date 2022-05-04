local Grid2Options = Grid2Options
local L = Grid2Options.L

local BuffSubTypes = {
	["Buff"] = 1,
	["Buffs Group"] = {},
	["Buffs Group: Defensive Cooldowns"] = {
		-- Paladin
		6940, --Hand of Sacrifice
		31850, --Ardent Defender
		498, --Divine Protection
		-- Warrior
		2565, --Shield Block
		871, --Shield Wall
		12975, --Last Stand
		-- Druid
		61336, --Survival Instincts
		22812, --Barkskin
		22842, --Frenzied Regeneration
		-- Death Knight
		55233, --Vampiric Blood
		49028, --Dancing Rune Weapon
		48792, --Icebound Fortitude
		48707, --Anti-Magic Shell
		-- Priest
		33206, --Pain Suppression
		47788 --Guardian Spirit
	}
}

local DefaultClassAuras = {
	SHAMAN = {
		{type = "buff", spellName = 61295, mine = true, color1 = {r = .8, g = .6, b = 1, a = 1}},
		{type = "buff", spellName = 51945, mine = true, color1 = {r = .8, g = 1, b = .5, a = 1}},
		{type = "buff", spellName = 974, color1 = {r = .8, g = .8, b = .2, a = 1}},
		{type = "buff", spellName = 974, mine = true, colorCount = 2, color1 = {r = .9, g = .9, b = .4, a = 1}, color2 = {r = .9, g = .9, b = .4, a = 1}},
	},
	DRUID = {
		{type = "buff", spellName = 33763, mine = true, colorCount = 3, color1 = {r = .2, g = .7, b = .2, a = 1}, color2 = {r = .6, g = .9, b = .6, a = 1}, color3 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 774, mine = true, color1 = {r = 1, g = 0, b = .6, a = 1}},
		{type = "buff", spellName = 8936, mine = true, color1 = {r = .5, g = 1, b = 0, a = 1}},
		{type = "buff", spellName = 48438, mine = true, color1 = {r = 0.2, g = .9, b = .2, a = 1}},
	},
	PALADIN = {
		{type = "buff", spellName = 53563, color1 = {r = .7, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 53563, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 642, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 498, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 1022, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 1038, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 1038, mine = true, color1 = {r = .8, g = .8, b = .7, a = 1}},
	},
	PRIEST = {
		{type = "buff", spellName = 47509, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 588, missing = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 17, color1 = {r = 0, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 139, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 27827, blinkThreshold = 3, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 33076, mine = true, colorCount = 5, color1 = {r = 1, g = .2, b = .2, a = 1}, color2 = {r = 1, g = 1, b = .4, a = .4}, color3 = {r = 1, g = .6, b = .6, a = 1}, color4 = {r = 1, g = .8, b = .8, a = 1}, color5 = {r = 1, g = 1, b = 1, a = 1}},
	},
	MAGE = {
		{type = "buff", spellName = 54646, color1 = {r = .11, g = .22, b = .33, a = 1}},
		{type = "buff", spellName = 7302, mine = true, missing = true, color1 = {r = .2, g = .4, b = .4, a = 1}},
		{type = "buff", spellName = 11426, mine = true, missing = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
	},
	ROGUE = {
		{type = "buff", spellName = 5277, mine = true, color1 = {r = .1, g = .1, b = 1, a = 1}},
	},
	WARLOCK = {
		{type = "buff", spellName = 6229, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 19028, mine = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 687, mine = true, missing = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
		{type = "buff", spellName = 28176, mine = true, missing = true, color1 = {r = 1, g = 1, b = 1, a = 1}},
	},
	WARRIOR = {
		{type = "buff", spellName = 50720, mine = true, color1 = {r = .1, g = .1, b = 1, a = 1}},
		{type = "buff", spellName = 6673, mine = true, color1 = {r = .1, g = .1, b = 1, a = 1}},
		{type = "buff", spellName = 871, mine = true, color1 = {r = .1, g = .1, b = 1, a = 1}},
		{type = "buff", spellName = 12975, mine = true, color1 = {r = .1, g = .1, b = 1, a = 1}},
		{type = "buff", spellName = 469, mine = true, color1 = {r = .1, g = .1, b = 1, a = 1}},
	}
}

local _, engClass = UnitClass("player")
local DebuffSubTypes = {["Debuff"] = 1, ["Debuffs Group"] = {}}
local ColorCountValues = {1, 2, 3, 4, 5, 6, 7, 8, 9}
local ColorizeByValues = {L["Number of stacks"], L["Remaining time"]}

local NewAuraUsageDescription = L['You can include a descriptive prefix using separators "@#>"'] .. " " .. L["examples: Druid@Regrowth Chimaeron>Low Health"]

-- Shared code
local NewAuraHandlerMT = {
	Init = function(self)
		self.name = ""
		self.mine = 1
		self.colorCount = 1
		self.spellName = nil
	end,
	GetKey = function(self)
		local name = self.name:gsub('[ %."]', "")
		if name == "" then
			return
		end
		if self.type == "debuff" then
			return self.type .. "-" .. name
		else
			local mine = self.mine
			if mine == 2 then
				mine = "-not-mine"
			elseif mine then
				mine = "-mine"
			else
				mine = ""
			end
			return self.type .. "-" .. name .. mine
		end
	end,
	GetName = function(self)
		return self.name
	end,
	SetName = function(self, info, value)
		local spellName
		local prefix, spell = string.match(value, "^(.-[@#>])(.*)$")
		if not spell then
			spell, prefix = value, ""
		end
		spellName = tonumber(spell) or spell
		if type(spellName) == "number" then
			spell = GetSpellInfo(spellName)
			if spell == nil then
				spell, spellName = "", nil
			end
		end
		self.spellName = spellName
		self.name = prefix .. spell
	end,
	GetMine = function(self)
		return self.mine == 1
	end,
	SetMine = function(self, info, value)
		self.mine = value and 1
	end,
	GetNotMine = function(self)
		return self.mine == 2
	end,
	SetNotMine = function(self, info, value)
		self.mine = value and 2
	end,
	GetColorCount = function(self)
		return self.colorCount
	end,
	SetColorCount = function(self, info, value)
		self.colorCount = value
	end,
	GetAvailableSubTypes = function(self)
		local result = {}
		for k in pairs(self.subTypes) do
			result[k] = L[k]
		end
		return result
	end,
	GetSubType = function(self)
		return self.subType
	end,
	SetSubType = function(self, info, value)
		self.subType = value
		if type(self.subTypes[value]) == "table" then
			self.spellName = value
			self.name = L[value]
			self.mine = nil
		else
			self.spellName = nil
			self.name = ""
			self.mine = 1
		end
	end,
	Create = function(self)
		local baseKey = self:GetKey()
		if baseKey then
			--Add to options and runtime db
			local dbx
			if self.type == "debuff" then
				dbx = {type = self.type, spellName = self.spellName, color1 = self.color}
			else
				dbx = {type = self.type, spellName = self.spellName, mine = self.mine, color1 = self.color}
				if self.colorCount > 1 then
					dbx.colorCount = self.colorCount
					for i = 2, self.colorCount do
						dbx["color" .. i] = {r = 1, g = 1, b = 1, a = 1}
					end
				end
			end
			local subType = self.subTypes[self.subType]
			if type(subType) == "table" then -- Buffs or Debuffs Group
				dbx.auras = {}
				for i, v in pairs(subType) do
					dbx.auras[i] = v
				end
			end
			Grid2.db.profile.statuses[baseKey] = dbx
			--Create the status
			local status = Grid2.setupFunc[dbx.type](baseKey, dbx)
			--Create the status options
			Grid2Options:MakeStatusOptions(status)
			self:Init()
		end
	end,
	IsDisabled = function(self)
		local key = self:GetKey()
		if key and self.spellName then
			return not (not Grid2.statuses[key])
		end
		return true
	end,
	isDefaultAurasButtonDisabled = function(self)
		local auras = DefaultClassAuras[engClass]
		return auras == nil
	end,
	CreateDefaultBuffs = function(self)
		local auras = DefaultClassAuras[engClass]
		for i = 1, #auras do
			local aura = auras[i]
			if aura.spellName ~= nil then
				aura.name = GetSpellInfo(aura.spellName)
				aura.colorCount = 1
				aura.subTypes = BuffSubTypes
				aura.color = {r = 1, g = 1, b = 1, a = 1}
				aura.Init = self.Init
				aura.GetKey = self.GetKey
				self.Create(aura)
			end
		end
	end,
}
NewAuraHandlerMT.__index = NewAuraHandlerMT

-- Buff Creation options
local NewBuffHandler = setmetatable({type = "buff", subType = "Buff", subTypes = BuffSubTypes, color = {r = 1, g = 1, b = 1, a = 1}}, NewAuraHandlerMT)

NewBuffHandler.options = {
	newStatusBuffType = {
		type = "select",
		order = 5,
		width = "full",
		name = L["Select Type"],
		desc = L["Select Type"],
		get = "GetSubType",
		set = "SetSubType",
		values = "GetAvailableSubTypes",
		handler = NewBuffHandler
	},
	newStatusBuffName = {
		type = "input",
		dialogControl = "EditBoxGrid2Buffs",
		order = 5.1,
		width = "full",
		name = L["Name or SpellId"],
		usage = NewAuraUsageDescription,
		get = "GetName",
		set = "SetName",
		handler = NewBuffHandler
	},
	newStatusBuffMine = {
		type = "toggle",
		order = 5.2,
		name = L["Show if mine"],
		desc = L["Display status only if the buff was cast by you."],
		get = "GetMine",
		set = "SetMine",
		disabled = "GetNotMine",
		handler = NewBuffHandler
	},
	newStatusBuffNotMine = {
		type = "toggle",
		order = 5.3,
		name = L["Show if not mine"],
		desc = L["Display status only if the buff was not cast by you."],
		get = "GetNotMine",
		set = "SetNotMine",
		disabled = "GetMine",
		handler = NewBuffHandler
	},
	newStatusColorCount = {
		type = "select",
		order = 5.4,
		width = "half",
		name = L["Color count"],
		desc = L["Select how many colors the status must provide."],
		get = "GetColorCount",
		set = "SetColorCount",
		values = ColorCountValues,
		handler = NewBuffHandler
	},
	newStatusBuffSpacer = {
		type = "header",
		order = 5.5,
		name = ""
	},
	newStatusBuff = {
		type = "execute",
		order = 5.6,
		name = L["Create Buff"],
		desc = L["Create a new status."],
		func = "Create",
		disabled = "IsDisabled",
		handler = NewBuffHandler
	},
	DefaultBuffsExecute = {
		type = "execute",
		order = 10,
		name = L["Create Default Buffs"],
		desc = format(L["Create Default Buffs for %s."], L[engClass]),
		func = "CreateDefaultBuffs",
		disabled = "isDefaultAurasButtonDisabled",
		handler = NewBuffHandler
	},
}
NewBuffHandler:Init()

Grid2Options:RegisterStatusCategoryOptions("buff", NewBuffHandler.options)

-- Debuff Creation options
local NewDebuffHandler = setmetatable({type = "debuff", subType = "Debuff", subTypes = DebuffSubTypes, color = {r = 1, g = .2, b = .2, a = 1}}, NewAuraHandlerMT)

NewDebuffHandler.options = {
	newStatusDebuffType = {
		type = "select",
		order = 5.1,
		width = "full",
		name = L["Select Type"],
		desc = L["Select Type"],
		get = "GetSubType",
		set = "SetSubType",
		values = "GetAvailableSubTypes",
		handler = NewDebuffHandler
	},
	newStatusDebuffName = {
		type = "input",
		dialogControl = "EditBoxGrid2Debuffs",
		order = 5.2,
		width = "full",
		name = L["Name or SpellId"],
		usage = NewAuraUsageDescription,
		get = "GetName",
		set = "SetName",
		handler = NewDebuffHandler
	},
	newStatusDebuff = {
		type = "execute",
		order = 5.3,
		name = L["Create Debuff"],
		desc = L["Create a new status."],
		func = "Create",
		disabled = "IsDisabled",
		handler = NewDebuffHandler
	}
}
NewDebuffHandler:Init()

Grid2Options:RegisterStatusCategoryOptions("debuff", NewDebuffHandler.options)