local Grid2 = Grid2
local GSRD = Grid2:GetModule("Grid2RaidDebuffs")

local L = LibStub("AceLocale-3.0"):GetLocale("Grid2Options")

local RDDB = {}
local statuses = {}

local curModule
local curInstance
local curDebuffs = {}
local curDebuffsOrder = {}
local curBossesOrder = {}
local moduleList = {}
local statusesList = {}

local optionModules
local optionInstances
local optionDebuffs
local optionsDebuffsCache = {}

local newSpellId
local newDebuffName
local fmt = string.format
local find = string.find
local tonumber = tonumber
local _

-- forward declarations
local AddBossDebuffOptions

local ICON_SKULL = "Interface\\TargetingFrame\\UI-TargetingFrame-Skull"
local ICON_CHECKED = READY_CHECK_READY_TEXTURE
local ICON_UNCHECKED = READY_CHECK_NOT_READY_TEXTURE

-- Raid Debuffs: Classic, TBC & WoTLK
RDDB["Classic"] = {
	[717] = {
		["[-1]Ayamiss"] = {25725},
		["[-2]Buru"] = {96},
		["[-3]Kurinnaxx"] = {25646, 25656},
		["[-4]Moam"] = {25685},
		["[-4]Ossirian"] = {25176, 25189, 25183},
		["[-5]Rajaxx"] = {25471}
	},
	[766] = {
		["[-1]CThun"] = {},
		["[-2]Fankriss"] = {25646},
		["[-3]Huhuran"] = {26180, 26050},
		["[-4]Ouro"] = {26615},
		["[-5]Sartura"] = {},
		["[-6]Skeram"] = {785},
		["[-7]ThreeBugs"] = {26580},
		["[-8]TwinEmps"] = {},
		["[-9]Viscidus"] = {26034, 26036, 25937}
	},
	[696] = {
		["[-1]Garr"] = {15732},
		["[-2]Geddon"] = {20475},
		["[-3]Gehennas"] = {20277},
		["[-4]Golemagg"] = {20553},
		["[-5]Lucifron"] = {20604},
		["[-6]Magmadar"] = {19451},
		["[-7]Majordomo"] = {},
		["[-8]Ragnaros"] = {},
		["[-9]Shazzrah"] = {19714},
		["[-10]Sulfuron"] = {19779, 19780, 19776, 20294}
	},
	[755] = {
		["[-1]Broodlord"] = {24573},
		["[-2]Chromaggus"] = {23155, 23169, 23153, 23154, 23170, 23128, 23537},
		["[-3]Ebonroc"] = {23340},
		["[-4]Firemaw"] = {},
		["[-5]Flamegor"] = {},
		["[-6]Nefarian"] = {22687, 22667},
		["[-7]Razorgore"] = {23023},
		["[-8]Vaelastrasz"] = {18173}
	},
	[718] = {
		["[-1]Onyxia"] = {18431}
	},
	[697] = {
		["[-1]Arlokk"] = {24210, 24212},
		["[-2]Bloodlord"] = {24314, 24318, 16856},
		["[-3]EdgeOfMadness"] = {24664, 8269},
		["[-4]Gahzranka"] = {},
		["[-5]Hakkar"] = {24327, 24328},
		["[-6]Jeklik"] = {23952},
		["[-7]Jindo"] = {24306, 17172, 24261},
		["[-8]Marli"] = {24111, 24300, 24109},
		["[-9]Thekal"] = {21060, 12540},
		["[-10]Venoxis"] = {23895, 23860, 23865}
	}
}
RDDB["The Burning Crusade"] = {
	[799] = {["-"] = {37066, 29522, 29511, 30753, 30115, 30843}},
	[781] = {["-"] = {43657, 43622, 43299, 43303, 43613, 43501, 43093, 43095, 43150}},
	[780] = {["-"] = {39042, 39044, 38235, 38246, 37850, 38023, 38024, 38025, 37676, 37641, 37749, 38280}},
	[775] = {["-"] = {31249, 31306, 31347, 31341, 31344, 31944, 31972}},
	[796] = {["-"] = {34654, 39674, 41150, 41168, 39837, 40239, 40251, 40604, 40481, 40508, 42005, 41303, 41410, 41376, 40860, 41001, 41485, 41472, 41914, 41917, 40585, 40932}},
	[789] = {["-"] = {46561, 46562, 46266, 46557, 46560, 46543, 46427, 45032, 45034, 45018, 46384, 45150, 45855, 45662, 45402, 45717, 45256, 45333, 46771, 45270, 45347, 45348, 45996, 45442, 45641, 45885, 45737, 45740, 45741}}
}
RDDB["The Lich King"] = {
	[535] = {
		--Naxxramas
		["Trash"] = {
			55314 --Strangulate
		},
		["[-1]Anub'Rekhan"] = {
			28786 --Locust Swarm (N, H)
		},
		["[-2]Grand Widow Faerlina"] = {
			28796, --Poison Bolt Volley (N, H)
			28794 --Rain of Fire (N, H)
		},
		["[-3]Maexxna"] = {
			28622, --Web Wrap (NH)
			54121 --Necrotic Poison (N, H)
		},
		["[-4]Noth the Plaguebringer"] = {
			29213, --Curse of the Plaguebringer (N, H)
			29214, --Wrath of the Plaguebringer (N, H)
			29212 --Cripple (NH)
		},
		["[-5]Heigan the Unclean"] = {
			29998, --Decrepit Fever (N, H)
			29310 --Spell Disruption (NH)
		},
		["[-11]Grobbulus"] = {
			28169 --Mutating Injection (NH)
		},
		["[-12]Gluth"] = {
			54378, --Mortal Wound (NH)
			29306 --Infected Wound (NH)
		},
		["[-13]Thaddius"] = {
			28084, --Negative Charge (N, H)
			28059 --Positive Charge (N, H)
		},
		["[-7]Instructor Razuvious"] = {
			55550 --Jagged Knife (NH)
		},
		["[-14]Sapphiron"] = {
			28522, --Icebolt (NH)
			28542 --Life Drain (N, H)
		},
		["[-15]Kel'Thuzad"] = {
			28410, --Chains of Kel'Thuzad (H)
			27819, --Detonate Mana (NH)
			27808 --Frost Blast (NH)
		}
	},
	[527] = {
		["Malygos"] = {
			56272, --Arcane Breath (N, H)
			57407 --Surge of Power (N, H)
		}
	},
	[531] = {
		["Trash"] = {
			39647, --Curse of Mending
			58936 --Rain of Fire
		},
		["[-1]Sartharion"] = {
			60708, --Fade Armor (N, H)
			57491 --Flame Tsunami (N, H)
		}
	},
	[609] = {
		--The Ruby Sanctum
		["Baltharus the Warborn"] = {
			74502 --Enervating Brand
		},
		["General Zarithrian"] = {
			74367 --Cleave Armor
		},
		["Saviana Ragefire"] = {
			74452 --Conflagration
		},
		["[-1]Halion"] = {
			74562, --Fiery Combustion
			74567, --Mark of Combustion
			74792, --Soul Consumption
			74795 --Mark of Consumption
		}
	},
	[543] = {
		--Trial of the Crusader
		["Gormok the Impaler"] = {
			66331, --Impale(10, 25, 10H, 25H)
			66406 --Snobolled!
		},
		["Acidmaw"] = {
			66819, --Acidic Spew (10, 25, 10H, 25H)
			66821, --Molten Spew (10, 25, 10H, 25H)
			66823, --Paralytic Toxin (10, 25, 10H, 25H)
			66869 --Burning Bile
		},
		["Icehowl"] = {
			66770, --Ferocious Butt(10, 25, 10H, 25H)
			66689, --Arctic Breathe(10, 25, 10H, 25H)
			66683 --Massive Crash
		},
		["[-2]Lord Jaraxxus"] = {
			66532, --Fel Fireball (10, 25, 10H, 25H)
			66237, --Incinerate Flesh (10, 25, 10H, 25H)
			66242, --Burning Inferno (10, 25, 10H, 25H)
			66197, --Legion Flame (10, 25, 10H, 25H)
			66283, --Spinning Pain Spike
			66209, --Touch of Jaraxxus(H)
			66211, --Curse of the Nether(H)
			66333 --Mistress' Kiss (10H, 25H)
		},
		["[-3]Faction Champions"] = {
			65812 --Unstable Affliction (10, 25, 10H, 25H)
			--65960,--Blind
			--65801,--Polymorph
			--65543,--Psychic Scream
			--66054,--Hex
			--65809,--Fear
		},
		["[-4]The Twin Val'kyr"] = {
			67176, --Dark Essence
			67223, --Light Essence
			67282, --Dark Touch
			67297, --Light Touch
			67309 --Twin Spike (10, 25, 10H, 25H)
		},
		["[-5]Anub'arak"] = {
			67574, --Pursued by Anub'arak
			--66240, 67630, 68646, 68647,--Leeching Swarm (10, 25, 10H, 25H)
			66013, --Penetrating Cold (10, 25, 10H, 25H)
			67847, --Expose Weakness
			66012, --Freezing Slash
			67863 --Acid-Drenched Mandibles(25H)
		}
	},
	[529] = {
		--Ulduar
		["Trash"] = {
			62310, --Impale (N, H)
			63612, --Lightning Brand (N, H)
			63615, --Ravage Armor (NH)
			62283, --Iron Roots (N, H)
			63169 --Petrify Joints (N, H)
		},
		["[-3]Razorscale"] = {
			64771 --Fuse Armor (NH)
		},
		["[-2]Ignis the Furnace Master"] = {
			62548, --Scorch (N, H)
			62680, --Flame Jet (N, H)
			62717 --Slag Pot (N, H)
		},
		["[-4]XT-002"] = {
			63024, --Gravity Bomb (N, H)
			63018 --Light Bomb (N, H)
		},
		["[-5]The Assembly of Iron"] = {
			61888, --Overwhelming Power (N, H)
			62269, --Rune of Death (N, H)
			61903, --Fusion Punch (N, H)
			61912 --Static Disruption(N, H)
		},
		["[-6]Kologarn"] = {
			64290, --Stone Grip (N, H)
			63355, --Crunch Armor (N, H)
			62055 --Brittle Skin (NH)
		},
		["[-9]Hodir"] = {
			62469, --Freeze (NH)
			61969, --Flash Freeze (N, H)
			62188 --Biting Cold (NH)
		},
		["[-11]Thorim"] = {
			62042, --Stormhammer (NH)
			62130, --Unbalancing Strike (NH)
			62526, --Rune Detonation (NH)
			62470, --Deafening Thunder (NH)
			62331 --Impale (N, H)
		},
		["[-8]Freya"] = {
			62532, --Conservator's Grip (NH)
			62589, --Nature's Fury (N, H)
			62861 --Iron Roots (N, H)
		},
		["[-10]Mimiron"] = {
			63666, --Napalm Shell (N)
			62997, --Plasma Blast (N)
			64668 --Magnetic Field (NH)
		},
		["[-12]General Vezax"] = {
			63276, --Mark of the Faceless (NH)
			63322 --Saronite Vapors (NH)
		},
		["[-13]Yogg-Saron"] = {
			63147, --Sara's Anger(NH)
			63134, --Sara's Blessing(NH)
			63138, --Sara's Fervor(NH)
			63830, --Malady of the Mind (H)
			63802, --Brain Link(H)
			63042, --Dominate Mind (H)
			64152, --Draining Poison (H)
			64153, --Black Plague (H)
			64125, --Squeeze (N, H)
			64156, --Apathy (H)
			64157 --Curse of Doom (H)
			--63050,--Sanity(NH)
		},
		["[-14]Algalon"] = {
			64412 --Phase Punch
		}
	},
	[532] = {
		--Vault of Archavon
		["[-3]Koralon"] = {
			67332 --Flaming Cinder (10, 25)
		},
		["[-4]Toravon the Ice Watcher"] = {
			72004 --Frostbite
		}
	},
	[604] = {
		--Icecrown Citadel
		["Trash"] = {
			70980, --Web Wrap
			70450, --Blood Mirror
			71089, --Bubbling Pus
			69483, --Dark Reckoning
			71163, --Devour Humanoid
			71127, --Mortal Wound
			70435, --Rend Flesh
			70671, --Leeching Rot
			70432, --Blood Sap
			71257
			--Barbaric Strike
			--71298,--Banish
		},
		["[-1]Lord Marrowgar"] = {
			70823, --Coldflame
			69065, --Impaled
			70835 --Bone Storm
		},
		["[-2]Lady Deathwhisper"] = {
			72109, --Death and Decay
			71289, --Dominate Mind
			71204, --Touch of Insignificance
			67934, --Frost Fever
			71237, --Curse of Torpor
			72491 --Necrotic Strike
		},
		["[-3]Gunship Battle"] = {
			69651 --Wounding Strike
		},
		["[-4]Deathbringer Saurfang"] = {
			72293, --Mark of the Fallen Champion
			72442, --Boiling Blood
			72449, --Rune of Blood
			72769 --Scent of Blood (heroic)
		},
		["[-5]Festergut"] = {
			69290, --Blighted Spore
			69248, --Vile Gas?
			71218, --Vile Gas?
			72219, --Gastric Bloat
			69278 -- Gas Spore
		},
		["[-6]Rotface"] = {
			69674, --Mutated Infection
			71215, --Ooze Flood
			69508, --Slime Spray
			30494 --Sticky Ooze
		},
		["[-7]Professor Putricide"] = {
			70215, --Gaseous Bloat
			72549, --Malleable Goo
			72454, --Mutated Plague
			70341, --Slime Puddle (Spray)
			70342, --Slime Puddle (Pool)
			70911, --Unbound Plague
			69774 --Volatile Ooze Adhesive
		},
		["[-8]Blood Prince Council"] = {
			72999, --Shadow Prison
			71807, --Glittering Sparks
			71911 --Shadow Resonance
		},
		["[-9]Blood-Queen Lana'thel"] = {
			70838, --Blood Mirror
			71623, --Delirious Slash
			70949, --Essence of the Blood Queen (hand icon)
			72151, --Frenzied Bloodthirst (bite icon)
			71340, --Pact of the Darkfallen
			72985, --Swarming Shadows (pink icon)
			70923 --Uncontrollable Frenzy
		},
		["[-10]Valithria Dreamwalker"] = {
			70873, --Emerald Vigor
			70744, --Acid Burst
			70751, --Corrosion
			70633, --Gut Spray
			71941, --Twisted Nightmares
			70766 --Dream State
		},
		["[-11]Sindragosa"] = {
			70107, --Permeating Chill
			70106, --Chilled to the Bone
			69766, --Instability
			71665, --Asphyxiation
			70126, --Frost Beacon
			70157 --Ice Tomb
		},
		["[-12]Lich King"] = {
			72133, --Pain and Suffering
			70337, --Necrotic Plague
			68981, --Remorseless Winter
			69242, --Soul Shriek
			69409, --Soul Reaper
			70541, --Infest
			27177, --Defile
			68980 --Harvest Soul
		}
	}
}

function Grid2Options:GetRaidDebuffsTable()
	return RDDB
end

local function UpdateZoneSpells()
	if curInstance == GSRD:GetCurrentZone() then
		GSRD:UpdateZoneSpells()
	end
end

local function GetOptionsFromCache()
	return optionsDebuffsCache[curModule .. curInstance]
end

local function SetOptionsToCache(options)
	optionsDebuffsCache[curModule .. curInstance] = options
end

local function GetLocalizedStatusName(key)
	local localizedText = L["raid-debuffs"]
	local _, _, index = find(key, "(%d+)")
	return (not index or index == 1) and localizedText or fmt("%s(%d)", localizedText, index)
end

local function GetCustomDebuffs()
	local debuffs = GSRD.db.profile.debuffs
	if debuffs then --updating variables after LibBabble-Zone removal
		for k, v in pairs(debuffs) do
			if type(k) == "string" and GSRD.engMapName_to_mapID[k] then
				debuffs[GSRD.engMapName_to_mapID[k]] = v
				debuffs[k] = nil
			end
		end
	end

	return GSRD.db.profile.debuffs and GSRD.db.profile.debuffs[curInstance] or {}
end

local function GetDebuffOrder(boss, spellId, isCustom, priority)
	local status = curDebuffs[spellId]
	if status then
		return curBossesOrder[boss] * 1000 + statuses[status] * 50 + curDebuffsOrder[spellId]
	else
		return curBossesOrder[boss] * 1000 + (isCustom and 750 or 500) + (priority or 200)
	end
end

local function CalculateAvailableStatuses()
	wipe(statuses)
	for _, status in Grid2:IterateStatuses() do
		if status.dbx and status.dbx.type == "raid-debuffs" then
			statuses[#statuses + 1] = status
		end
	end
	table.sort(statuses, function(a, b)
		local _, _, index_a = find(a.name, "(%d+)")
		local _, _, index_b = find(b.name, "(%d+)")

		index_a = tonumber(index_a) or 1
		index_b = tonumber(index_b) or 1

		return index_a < index_b
	end)
	wipe(statusesList)
	for index, status in ipairs(statuses) do
		statuses[status] = index
		statusesList[index] = GetLocalizedStatusName(status.name)
	end
end

local function LoadEnabledDebuffs()
	curDebuffs = {}
	curDebuffsOrder = {}
	for _, status in ipairs(statuses) do
		local dbx = status.dbx.debuffs[curInstance] or {}
		for index, value in ipairs(dbx) do
			local key = math.abs(value)
			curDebuffs[key] = status
			curDebuffsOrder[key] = index
		end
	end
end

local function ClearEnabledDebuffs()
	curDebuffs = {}
	curDebuffsOrder = {}
end

local function LoadBosses()
	wipe(curBossesOrder)
	local order = 30
	local bosses = RDDB[curModule][curInstance]
	for boss in pairs(bosses) do
		local _, _, EJ_Order = find(boss, "%-(%d+)%]")
		if EJ_Order then
			curBossesOrder[boss] = tonumber(EJ_Order)
		else
			curBossesOrder[boss] = order
			order = order + 1
		end
	end
end

local function LoadModuleList()
	wipe(moduleList)
	local modules = GSRD.db.profile.enabledModules or {}
	for name in pairs(modules) do
		moduleList[name] = L[name]
	end
end

local function ResetAdvancedOptions()
	curModule = ""
	curInstance = ""
	curDebuffs = nil
	curDebuffsOrder = nil
	wipe(optionsDebuffsCache)
	LoadModuleList()
end

local function FormatDebuffName(spellId)
	local name = GetSpellInfo(spellId)
	local status = curDebuffs[spellId]
	local index = statuses[status]
	if status then
		if index == 1 then
			return fmt("  |T%s:0|t%s", ICON_CHECKED, name or spellId)
		else
			return fmt("  |T%s:0|t%s(%d)", ICON_CHECKED, name or spellId, index)
		end
	else
		return fmt("  |T%s:0|t%s", ICON_UNCHECKED, name or spellId)
	end
end

local GetSpellDescription
do
	local lines = {}
	function GetSpellDescription(spellId)
		local tipDebuff = Grid2Options.Tooltip
		wipe(lines)
		tipDebuff:ClearLines()
		local name = GetSpellInfo(spellId)
		if GSRD.debugging then
			local link = GetSpellLink(spellId)
			if not link then -- unavailible spellLink may indicate wrong spellId, thus not providing corect tooltip
				if name then -- this may still work due to having the same name
					GSRD:Debug("|cFF00FFFFSpellLink not Availible|r: %s  (%s)", spellId, name)
				else -- this wont work
					GSRD:Debug("|cFFFF0000Invalid spellId|r: %s", spellId)
				end
			end
		end
		if not name then
			return ""
		end --invalid spellIds break the tooltip
		tipDebuff:SetHyperlink("spell:" .. spellId)

		for i = 2, min(5, tipDebuff:NumLines()) do
			lines[i - 1] = tipDebuff[i]:GetText()
		end
		return table.concat(lines, "\n")
	end
end

local function GetInstances(module)
	local values = {}
	if module and module ~= "" then
		local instances = RDDB[module]
		if instances then
			for mapid, _ in pairs(instances) do
				values[mapid] = Grid2:GetMapNameByID(mapid)
			end
		end
	end
	return values
end

local function SetEnableDebuff(boss, status, spellId, value)
	if not status then
		return
	end
	local dbx = status.dbx
	if value then
		if not dbx.debuffs[curInstance] then
			dbx.debuffs[curInstance] = {}
		end
		local debuffs = dbx.debuffs[curInstance]
		debuffs[#debuffs + 1] = spellId
		curDebuffs[spellId] = status
		curDebuffsOrder[spellId] = #debuffs
	else
		local debuffs = dbx.debuffs[curInstance]
		local index = curDebuffsOrder[spellId]
		table.remove(debuffs, index)
		curDebuffs[spellId] = nil
		curDebuffsOrder[spellId] = nil

		for k, v in pairs(curDebuffs) do
			if status == v and curDebuffsOrder[k] > index then
				curDebuffsOrder[k] = curDebuffsOrder[k] - 1
			end
		end
		if not next(debuffs) then
			dbx.debuffs[curInstance] = nil
		end
	end
	UpdateZoneSpells()
	local option = optionDebuffs.args[tostring(spellId)]
	option.name = FormatDebuffName(spellId)
	option.order = GetDebuffOrder(boss, spellId)
end

local function GetDebuffStatus(spellId)
	local status = curDebuffs[spellId]
	if status then
		return status, curDebuffsOrder[spellId]
	end
end

local function SetDebuffSpellIdTracking(spellId, value)
	local spellName = GetSpellInfo(spellId)
	for spell, status in pairs(curDebuffs) do
		if spellName == GetSpellInfo(spell) then
			local index = curDebuffsOrder[spell]
			status.dbx.debuffs[curInstance][index] = value and -spell or spell
		end
	end
	UpdateZoneSpells()
end

local function EnableInstanceAllDebuffs(curModule, curInstance)
	local debuffs = {}
	local status = statuses[1]
	local dbx = status.dbx
	if not dbx.debuffs then
		dbx.debuffs = {}
	end
	local debuffsall = RDDB[curModule][curInstance]
	for instance, values in pairs(debuffsall) do
		for boss, spellId in ipairs(values) do
			debuffs[#debuffs + 1] = spellId
		end
	end
	-- Enable user defined debuffs
	local rddbx = GSRD.db.profile.debuffs
	if rddbx and rddbx[curInstance] then
		for instance, values in pairs(rddbx[curInstance]) do
			for boss, spellId in ipairs(values) do
				debuffs[#debuffs + 1] = spellId
			end
		end
	end
	dbx.debuffs[curInstance] = debuffs
end

local function DisableInstanceAllDebuffs(curModule, curInstance)
	for index, status in ipairs(statuses) do
		status.dbx.debuffs[curInstance] = nil
	end
end

local function RefreshDebuffsOptions()
	local items = optionDebuffs.args
	for key, value in pairs(items) do
		local spellId = tonumber(key)
		if spellId then
			items[key].name = FormatDebuffName(spellId)
		end
	end
end

local function EnableDisableModule(module, state)
	local rddbx = GSRD.db.profile
	if not rddbx.enabledModules then
		rddbx.enabledModules = {}
	end
	local instances = RDDB[module]
	if state then
		for instance in pairs(instances) do
			EnableInstanceAllDebuffs(module, instance)
			optionsDebuffsCache[module .. instance] = nil
		end
		rddbx.enabledModules[module] = true
		moduleList[module] = L[module]
	else
		for instance in pairs(instances) do
			DisableInstanceAllDebuffs(module, instance)
		end
		if rddbx.enabledModules[module] then
			rddbx.enabledModules[module] = nil
		end
		if not next(rddbx.enabledModules) then
			rddbx.enabledModules = nil
		end
		moduleList[module] = nil
	end
	curModule = ""
	UpdateZoneSpells()
end

local StripEJinfo
do
	local strgsub = string.gsub
	StripEJinfo = function(boss)
		return (strgsub(boss, "%[.-%]", ""))
	end
end

local function CreateStandardDebuff(bossNameKey, spellId, spellName)
	local bossName = StripEJinfo(bossNameKey)
	local baseKey =
		fmt("debuff-%s>%s", string.match(bossName, "^(.-) .*$") or bossName, spellName):gsub('[ %."!\']', "")
	if not Grid2:DbGetValue("statuses", baseKey) then
		-- Save status in database
		local dbx = {type = "debuff", spellName = spellId, color1 = {r = 1, g = 0, b = 0, a = 1}}
		Grid2:DbSetValue("statuses", baseKey, dbx)
		--Create status in runtime
		local status = Grid2.setupFunc[dbx.type](baseKey, dbx)
		--Create the status options
		Grid2Options:MakeStatusOptions(status)
	end
end

local function CreateNewRaidDebuff(boss)
	local spellId = newSpellId
	local spellName = GetSpellInfo(newSpellId)
	local bossStrip = StripEJinfo(boss)
	if spellId and spellName then
		local dbx = GSRD.db.profile
		if not dbx.debuffs then
			dbx.debuffs = {}
		end
		dbx = dbx.debuffs
		if not dbx[curInstance] then
			dbx[curInstance] = {}
		end
		dbx = dbx[curInstance]
		if not dbx[bossStrip] then
			dbx[bossStrip] = {}
		end
		dbx = dbx[bossStrip]
		dbx[#dbx + 1] = spellId
		AddBossDebuffOptions(optionDebuffs.args, boss, spellId, true, #dbx)
	end
	newDebuffName = nil
	newSpellId = nil
end

local function DeleteRaidDebuff(boss, spellId)
	local dbx = GSRD.db.profile
	SetEnableDebuff(boss, curDebuffs[spellId], spellId, false)
	for b, spells in pairs(dbx.debuffs[curInstance]) do
		for i = 1, #spells do
			if spellId == spells[i] then
				optionDebuffs.args[tostring(spellId)] = nil
				table.remove(spells, i)
				if #spells == 0 then
					dbx.debuffs[curInstance][b] = nil
					if not next(dbx.debuffs[curInstance]) then
						dbx.debuffs[curInstance] = nil
						if not next(dbx.debuffs) then
							dbx.debuffs = nil
						end
					end
				end
				return
			end
		end
	end
end

local function MakeDebuffOptions(bossName, spellId, isCustom)
	local spellName, _, spellIcon = GetSpellInfo(spellId)
	local options = {
		spellname = {
			type = "description",
			order = 10,
			name = fmt("%s\n(%d)", spellName or "Unknow", spellId),
			fontSize = "large",
			image = spellIcon
		},
		header1 = {
			type = "header",
			order = 12,
			name = ""
		},
		description = {
			type = "description",
			order = 50,
			fontSize = "medium",
			name = GetSpellDescription(spellId)
		},
		header2 = {
			type = "header",
			order = 40,
			name = ""
		},
		enableSpell = {
			type = "toggle",
			order = 30,
			name = L["Enabled"],
			get = function()
				return curDebuffs[spellId] ~= nil
			end,
			set = function(_, v)
				SetEnableDebuff(bossName, curDebuffs[spellId] or statuses[1], spellId, v)
			end
		},
		header3 = {
			type = "header",
			order = 140,
			name = ""
		},
		assignedStatus = {
			type = "select",
			order = 144,
			name = L["Assigned to"],
			-- desc = "",
			get = function()
				return statuses[curDebuffs[spellId] or statuses[1]]
			end,
			set = function(_, v)
				SetEnableDebuff(bossName, curDebuffs[spellId], spellId, false)
				SetEnableDebuff(bossName, statuses[v], spellId, true)
			end,
			values = statusesList,
			hidden = function()
				return not curDebuffs[spellId]
			end
		},
		idTracking = {
			type = "toggle",
			order = 145,
			-- width = "full",
			name = L["Track by SpellId"],
			desc = L["Track by spellId instead of aura name"],
			get = function()
				local status, index = GetDebuffStatus(spellId)
				if status then
					return status.dbx.debuffs[curInstance][index] < 0
				end
			end,
			set = function(_, v)
				SetDebuffSpellIdTracking(spellId, v)
			end,
			hidden = function()
				return not curDebuffs[spellId]
			end
		},
		header4 = {
			type = "header",
			order = 147,
			name = "",
			hidden = function()
				return not curDebuffs[spellId]
			end
		},
		chatLink = {
			type = "execute",
			order = 149,
			name = L["Link to Chat"],
			func = function()
				local link = GetSpellLink(spellId)
				if link then
					local ChatBox = ChatEdit_ChooseBoxForSend()
					if not ChatBox:HasFocus() then
						ChatFrame_OpenChat(link)
					else
						ChatBox:Insert(link)
					end
				end
			end
		},
		createDebuff = {
			type = "execute",
			order = 150,
			name = L["Copy to Debuffs"],
			func = function()
				CreateStandardDebuff(bossName, spellId, spellName)
			end
		}
	}
	if isCustom then
		options.removeDebuff = {
			type = "execute",
			order = 155,
			name = L["Delete raid debuff"],
			confirm = function() return L["Are you sure you want to delete this status?"] end,
			func = function() DeleteRaidDebuff(bossName, spellId) end
		}
	end
	return options
end

local function MakeDebuffGroup(bossName, spellId, order, isCustom)
	return {
		type = "group",
		name = FormatDebuffName(spellId),
		desc = fmt("     (%d)", spellId),
		order = order,
		args = MakeDebuffOptions(bossName, spellId, isCustom)
	}
end

local function AddInstanceOptions(options)
	options.enableall = {
		type = "execute",
		order = 5,
		name = L["Enable All"],
		func = function()
			EnableInstanceAllDebuffs(curModule, curInstance)
			LoadEnabledDebuffs()
			UpdateZoneSpells()
			RefreshDebuffsOptions()
		end
	}
	options.disableall = {
		type = "execute",
		order = 7,
		name = L["Disable All"],
		func = function()
			DisableInstanceAllDebuffs(curModule, curInstance)
			ClearEnabledDebuffs()
			UpdateZoneSpells()
			RefreshDebuffsOptions()
		end
	}
end

local function AddBossOptions(options, name)
	local order = curBossesOrder[name] * 1000
	local _, _, EJ_Order = find(name, "%-(%d+)%]")
	EJ_Order = EJ_Order and EJ_Order .. ") " or ""
	local bossName = StripEJinfo(name)
	options[name] = {
		type = "group",
		name = fmt("|T%s:0|t%s%s", ICON_SKULL, EJ_Order, bossName),
		order = order,
		args = {
			name = {
				type = "input",
				dialogControl = "Grid2ExpandedEditBox",
				order = 1,
				width = "full",
				name = L["New raid debuff"],
				desc = L["Type the SpellId of the new raid debuff"],
				get = function()
					return newDebuffName
				end,
				set = function(_, v)
					newSpellId = tonumber(v)
					newDebuffName = newSpellId and GetSpellInfo(newSpellId) or nil
					if not newDebuffName or newDebuffName == "" then
						newSpellId = nil
					end
				end
			},
			exec = {
				type = "execute",
				order = 9,
				name = L["Create raid debuff"],
				func = function(info)
					CreateNewRaidDebuff(name)
				end,
				disabled = function()
					return not newSpellId or optionDebuffs.args[tostring(newSpellId)]
				end
			}
		}
	}
end

-- Forward declared, dont add "local function"
function AddBossDebuffOptions(options, boss, spellId, isCustom, priority)
	local order = GetDebuffOrder(boss, spellId, isCustom, priority)
	options[tostring(spellId)] = MakeDebuffGroup(boss, spellId, order, isCustom)
end

local function AddBossDebuffsOptions(options, boss, debuffs, isCustom)
	if not debuffs then
		return
	end
	for index, spellId in ipairs(debuffs) do
		AddBossDebuffOptions(options, boss, spellId, isCustom, index)
	end
end

local function MakeDebuffsOptions()
	LoadBosses()
	LoadEnabledDebuffs()
	local options = GetOptionsFromCache()
	if not options then
		options = {}
		local debuffs = RDDB[curModule][curInstance]
		local custom = GetCustomDebuffs()
		AddInstanceOptions(options)
		for boss, values in pairs(debuffs) do
			AddBossOptions(options, boss)
			AddBossDebuffsOptions(options, boss, values, false)
			local bossStrip = StripEJinfo(boss)
			AddBossDebuffsOptions(options, boss, custom[bossStrip], true)
		end
		SetOptionsToCache(options)
	end
	return options
end

local function MakeModulesListOptions(options)
	local modules = {}
	for name in pairs(RDDB) do
		modules[name] = L[name]
	end
	options.modules = {
		type = "multiselect",
		name = L["Enabled raid debuffs modules"],
		order = 150,
		width = "full",
		get = function(info, key)
			return (moduleList[key] ~= nil)
		end,
		set = function(_, key, value)
			EnableDisableModule(key, value)
		end,
		values = modules
	}
end

local function MakeOneStatusStandardOptions(options, status, index)
	local statusOptions = {}
	options[status.name] = {
		type = "group",
		order = index + 10,
		inline = true,
		name = "",
		args = statusOptions
	}
	Grid2Options:MakeStatusStandardOptions(status, statusOptions, {color1 = GetLocalizedStatusName(status.name), width = "full"})
end

local function MakeStandardOptions(options)
	for index, status in ipairs(statuses) do
		MakeOneStatusStandardOptions(options, status, index)
	end
	options.add = {
		type = "execute",
		order = 50,
		width = "half",
		name = L["New"],
		desc = L["New Status"],
		func = function(info)
			local name = fmt("raid-debuffs%d", #statuses + 1)
			Grid2:DbSetValue("statuses", name, {type = "raid-debuffs", debuffs = {}, color1 = {r = 1, g = .5, b = 1, a = 1}})
			local status = Grid2.setupFunc["raid-debuffs"](name, Grid2:DbGetValue("statuses", name))
			CalculateAvailableStatuses()
			MakeOneStatusStandardOptions(options, status, #statuses)
		end,
		hidden = function()
			return #statuses >= 10
		end
	}
	options.del = {
		type = "execute",
		order = 51,
		width = "half",
		name = L["Delete"],
		desc = L["Delete Status"],
		func = function(info)
			local status = statuses[#statuses]
			options[status.name] = nil
			Grid2:DbSetValue("statuses", status.name, nil)
			Grid2:UnregisterStatus(status)
			CalculateAvailableStatuses()
		end,
		disabled = function()
			local status = statuses[#statuses]
			return status.enabled or next(status.dbx.debuffs)
		end,
		hidden = function()
			return #statuses <= 1
		end
	}
	options.header3 = {type = "header", order = 52, name = ""}
end

local function MakeGeneralOptions(self)
	local options = {}
	CalculateAvailableStatuses()
	self:MakeStatusTitleOptions(statuses[1], options)
	MakeStandardOptions(options)
	MakeModulesListOptions(options)
	return options
end

local function MakeAdvancedOptions(self)
	local options = {}
	ResetAdvancedOptions()
	optionModules = {
		type = "select",
		order = 10,
		name = L["Select module"],
		desc = "",
		get = function()
			if curModule == "" then
				local curZone, curZoneModule = GSRD:GetCurrentZone()
				local lastInst, lastInstModule = GSRD.db.profile.lastSelectedInstance
				for module in next, moduleList do
					if RDDB[module] and RDDB[module][curZone] then
						curZoneModule = module
					elseif RDDB[module] and RDDB[module][lastInst] then
						lastInstModule = module
					end
				end
				if curZoneModule or lastInstModule then
					curModule = curZoneModule or lastInstModule
					curInstance = curZoneModule and curZone or lastInstModule and lastInst
					optionInstances.values = GetInstances(curModule)
					optionDebuffs.name = Grid2:GetMapNameByID(curInstance)
					optionDebuffs.args = MakeDebuffsOptions()
					return curModule
				end
				curModule = next(moduleList) or ""
				curInstance = ""
				optionInstances.values = GetInstances(curModule)
				optionDebuffs.name = ""
				optionDebuffs.args = {}
			end
			return curModule
		end,
		set = function(info, v)
			curModule = v
			curInstance = ""
			optionInstances.values = GetInstances(v)
			optionDebuffs.name = ""
			optionDebuffs.args = {}
		end,
		values = moduleList
	}
	optionInstances = {
		type = "select",
		order = 20,
		name = L["Select instance"],
		desc = "",
		get = function()
			return curInstance
		end,
		set = function(_, v)
			curInstance = v
			optionDebuffs.name = Grid2:GetMapNameByID(v)
			optionDebuffs.args = MakeDebuffsOptions()
			GSRD.db.profile.lastSelectedInstance = v
		end,
		values = {}
	}
	optionDebuffs = {
		type = "group",
		name = "",
		order = 30,
		childGroups = "tree",
		args = {}
	}
	options.modules = optionModules
	options.instances = optionInstances
	options.debuffs = optionDebuffs
	return options
end

-- Notify Grid2Options howto create the options for our status
Grid2Options:RegisterStatusOptions(
	"raid-debuffs",
	"debuff",
	function(self, status, options)
		options.general = {
			type = "group",
			name = L["General Settings"],
			order = 20,
			args = MakeGeneralOptions(self)
		}
		options.advanced = {
			type = "group",
			name = L["Debuff Configuration"],
			order = 10,
			args = MakeAdvancedOptions(self)
		}
	end,
	{
		hideTitle = true,
		childGroups = "tab",
		groupOrder = 5,
		masterStatus = "raid-debuffs",
		titleIcon = [[Interface\Icons\Spell_Shadow_Skull]]
	}
)