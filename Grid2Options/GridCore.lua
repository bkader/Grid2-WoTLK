local Grid2 = Grid2
local Grid2Layout = Grid2Layout

local L = LibStub("AceLocale-3.0"):GetLocale("Grid2Options")
local ACD3

local Grid2Options = {
	options = {
		name = "Grid2",
		type = "group",
		handler = Grid2,
		args = {
			["general"] = {
				order = 10,
				type = "group",
				name = L["General Settings"],
				desc = L["General Settings"],
				childGroups = "tab",
				args = {}
			},
			["indicators"] = {
				order = 20,
				type = "group",
				name = L["indicators"],
				desc = L["indicators"],
				args = {}
			},
			["statuses"] = {
				order = 30,
				type = "group",
				name = L["statuses"],
				desc = L["statuses"],
				args = {}
			}
		}
	},
	typeMakeOptions = {},
	optionParams = {},
	L = L,
	LG = Grid2.L,
	SpellEditDialogControl = type(LibStub("AceGUI-3.0").WidgetVersions["Aura_EditBox"]) == "number" and "Aura_EditBox" or nil
}
LibStub("AceConsole-3.0"):Embed(Grid2Options)

-- Initialize
function Grid2Options:Initialize()
	self:EnableLoadOnDemand(not Grid2.db.global.LoadOnDemandDisabled)

	self:MakeOptions()

	LibStub("AceConfig-3.0"):RegisterOptionsTable("Grid2", self.options)
	ACD3 = ACD3 or LibStub("AceConfigDialog-3.0")
	local sections = self.options.args
	ACD3:AddToBlizOptions("Grid2", sections.general.name, "Grid2", "general")
	ACD3:AddToBlizOptions("Grid2", sections.indicators.name, "Grid2", "indicators")
	ACD3:AddToBlizOptions("Grid2", sections.statuses.name, "Grid2", "statuses")

	self.Initialize = nil
end

-- Called from Grid2 core if profile changes
function Grid2Options:MakeOptions()
	self:MakeStatusesOptions(self.statusOptions)
	self:MakeIndicatorsOptions(self.indicatorOptions)
	collectgarbage("collect")
end

function Grid2Options:OnChatCommand(input)
	ACD3 = ACD3 or LibStub("AceConfigDialog-3.0")
	local arg1, arg2 = self:GetArgs(input, 2)

	if arg1 == nil then
		if (ACD3.OpenFrames["Grid2"]) then
			ACD3:Close("Grid2")
		else
			ACD3:Open("Grid2")
		end
		return
	end

	if arg1 == "toggle" and Grid2LayoutFrame then
		if Grid2LayoutFrame:IsShown() then
			Grid2LayoutFrame:Hide()
		else
			Grid2LayoutFrame:Show()
		end
	elseif arg1 == "show" and Grid2LayoutFrame and not Grid2LayoutFrame:IsShown() then
		Grid2LayoutFrame:Show()
	elseif arg1 == "hide" and Grid2LayoutFrame and Grid2LayoutFrame:IsShown() then
		Grid2LayoutFrame:Hide()
	elseif arg1 == "scale" and tonumber(arg2) then
		local s = tonumber(arg2)
		if s >= 0.5 and s <= 2 then
			Grid2Layout.db.profile.ScaleSize = s
			Grid2Layout:Scale()
		end
	end
end

_G.Grid2Options = Grid2Options