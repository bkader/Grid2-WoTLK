local Grid2 = LibStub("AceAddon-3.0"):NewAddon("Grid2", "AceEvent-3.0", "AceConsole-3.0", "LibCompat-1.0")
_G.Grid2 = Grid2

Grid2.versionstring = "Grid2 v" .. GetAddOnMetadata("Grid2", "Version")
Grid2.L = LibStub("AceLocale-3.0"):GetLocale("Grid2")

Grid2.debugFrame = Grid2DebugFrame or ChatFrame1
function Grid2:Debug(s, ...)
	if self.debugging then
		if s:find("%", nil, true) then
			Grid2:Print(self.debugFrame, "DEBUG", self.name, s:format(...))
		else
			Grid2:Print(self.debugFrame, "DEBUG", self.name, s, ...)
		end
	end
end

Grid2.defaults = {
	profile = {
		debug = false,
		versions = {},
		indicators = {},
		statuses = {},
		statusMap = {},
		icon = {hide = false, radius = 80, minimapPos = 165}
	}
}

-- type setup functions for non-unique objects: "buff" statuses / "icon" indicators / etc.
Grid2.setupFunc = {}

--{{{  Module prototype
local modulePrototype = {}
modulePrototype.core = Grid2
modulePrototype.Debug = Grid2.Debug

function modulePrototype:OnInitialize()
	if not self.db then
		self.db = self.core.db:RegisterNamespace(self.moduleName or self.name, self.defaultDB or {})
	end
	self.debugFrame = Grid2.debugFrame
	self.debugging = self.db.profile.debug
	if self.OnModuleInitialize then
		self:OnModuleInitialize()
		self.OnModuleInitialize = nil
	end
	self:Debug("OnInitialize")
end

function modulePrototype:OnEnable()
	if self.OnModuleEnable then
		self:OnModuleEnable()
	end
end

function modulePrototype:OnDisable()
	if self.OnModuleDisable then
		self:OnModuleDisable()
	end
end

function modulePrototype:OnUpdate()
	if self.OnModuleUpdate then
		self:OnModuleUpdate()
	end
end

Grid2:SetDefaultModulePrototype(modulePrototype)
Grid2:SetDefaultModuleLibraries("AceEvent-3.0")

-- Modules management
function Grid2:EnableModules()
	for _, module in self:IterateModules() do
		module:OnEnable()
	end
end

function Grid2:DisableModules()
	for _, module in self:IterateModules() do
		module:OnDisable()
	end
end

function Grid2:UpdateModules()
	for _, module in self:IterateModules() do
		module:OnUpdate()
	end
end

function Grid2:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("Grid2DB", self.defaults)

	self.debugging = self.db.profile.debug
	self.playerClass = select(2, UnitClass("player"))

	local LibDualSpec = LibStub("LibDualSpec-1.0", true)
	if LibDualSpec then
		LibDualSpec:EnhanceDatabase(self.db, "Grid2")
	end

	local media = LibStub("LibSharedMedia-3.0", true)
	media:Register("statusbar", "Gradient", "Interface\\Addons\\Grid2\\media\\gradient32x32")
	media:Register("statusbar", "Grid2 Flat", "Interface\\Addons\\Grid2\\media\\white16x16")
	media:Register("statusbar", "Grid2 GlowH", "Interface\\Addons\\Grid2\\media\\glowh")
	media:Register("statusbar", "Grid2 GlowV", "Interface\\Addons\\Grid2\\media\\glowv")
	media:Register("statusbar", "RaidFrame: HP Fill", "Interface\\Addons\\Grid2\\media\\RaidFrame\\raid-bar-hp-fill")
	media:Register("statusbar", "RaidFrame: HP BG", "Interface\\Addons\\Grid2\\media\\RaidFrame\\raid-bar-hp-bg")
	media:Register("statusbar", "RaidFrame: Resource Fill", "Interface\\Addons\\Grid2\\media\\RaidFrame\\raid-bar-resource-fill")
	media:Register("statusbar", "RaidFrame: Resource BG", "Interface\\Addons\\Grid2\\media\\RaidFrame\\raid-bar-resource-bg")
	media:Register("statusbar", "RaidFrame: Shield Fill", "Interface\\Addons\\Grid2\\media\\RaidFrame\\shield-fill")
	media:Register("border", "Grid2 Flat", "Interface\\Addons\\Grid2\\media\\white16x16")
	media:Register("border", "Grid2 Pixel", "Interface\\Addons\\Grid2\\media\\border1px")
	media:Register("background", "Blizzard Quest Title Highlight", "Interface\\QuestFrame\\UI-QuestTitleHighlight")
	media:Register("background", "Blizzard ChatFrame Background", "Interface\\ChatFrame\\ChatFrameBackground")

	self:InitializeOptions()

	self.OnInitialize = nil
end

function Grid2:OnEnable()
	self:RegisterEvent("PARTY_MEMBERS_CHANGED", "GroupChanged")
	self:RegisterEvent("RAID_ROSTER_UPDATE", "GroupChanged")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_PET")
	self:RegisterEvent("UNIT_NAME_UPDATE")

	self.db.RegisterCallback(self, "OnProfileChanged", "ProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "ProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "ProfileChanged")

	self:LoadConfig()

	self:SendMessage("Grid_Enabled")
end

function Grid2:OnDisable()
	self:SendMessage("Grid_Disabled")
end

function Grid2:LoadConfig()
	self:UpdateDefaults()
	self:Setup()
end

function Grid2:InitializeOptions()
	self:RegisterChatCommand("grid2", "OnChatCommand")
	self:RegisterChatCommand("gr2", "OnChatCommand")
	local optionsFrame = CreateFrame("Frame", nil, UIParent)
	optionsFrame.name = "Grid2"
	InterfaceOptions_AddCategory(optionsFrame)
	optionsFrame:SetScript("OnShow", function(self, ...)
		if not Grid2Options then
			Grid2:LoadGrid2Options()
		end
		self:SetScript("OnShow", nil)
	end)
	self.optionsFrame = optionsFrame
	self.InitializeOptions = nil
end

function Grid2:OnChatCommand(input)
	if not Grid2Options then
		Grid2:LoadGrid2Options()
	end
	if Grid2Options then
		Grid2Options:OnChatCommand(input)
	end
end

function Grid2:LoadGrid2Options()
	if not IsAddOnLoaded("Grid2Options") then
		if InCombatLockdown() then
			Grid2:Print("Grid2Options cannot be loaded in combat.")
			return
		end
		LoadAddOn("Grid2Options")
	end
	if Grid2Options then
		self:LoadOptions()
		self.LoadGrid2Options = nil
	else
		Grid2:Print("You need Grid2Options addon enabled to be able to configure Grid2.")
	end
end

-- Hook this to load any options addon (see RaidDebuffs & AoeHeals modules)
function Grid2:LoadOptions()
	Grid2Options:Initialize()
	Grid2Options.LoadOptions = nil
end

function Grid2:ProfileChanged()
	self:Debug("Loaded profile (", self.db:GetCurrentProfile(), ")")
	self:DisableModules()
	self:LoadConfig()
	self:UpdateModules()
	self:EnableModules()
	if Grid2Options then
		Grid2Options:MakeOptions()
	end
end