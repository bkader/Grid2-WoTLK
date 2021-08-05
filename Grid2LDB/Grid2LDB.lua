--[[ Simple DataBroker launcher for Grid2. --]]
local DataBroker = LibStub("LibDataBroker-1.1", true)
if not DataBroker then return end

local Grid2 = Grid2
local Grid2Layout = Grid2Layout
local MenuLayoutsShow

local L = LibStub("AceLocale-3.0"):GetLocale("Grid2")

local Grid2Icon = [[Interface\AddOns\Grid2\media\icon]]
local Grid2LDB = DataBroker:NewDataObject("Grid2", {
	type = "launcher",
	label = GetAddOnInfo("Grid2", "Title"),
	icon = Grid2Icon,
	OnClick = function(self, button)
		if button == "LeftButton" then
			Grid2:OnChatCommand("")
		elseif button == "RightButton" then
			MenuLayoutsShow()
		end
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddLine("Grid2")
		tooltip:AddLine(L["|cffeda55fLeft-Click|r to open configuration"], 0.2, 1, 0.2)
		tooltip:AddLine(L["|cffeda55fRight-Click|r to open layouts menu"], 0.2, 1, 0.2)
	end
})
Grid2.dataobj = Grid2LDB

--
-- Layouts popup menu
--
do
	local menuFrame
	local menuTable
	local partyType
	local layoutName
	local function SetLayout(self)
		if not InCombatLockdown() then
			layoutName = self.value
			Grid2Layout.db.profile.layouts[partyType] = self.value
			Grid2Layout:ReloadLayout()
		end
	end
	local function CreateMenuTable()
		if not layoutName then
			layoutName = Grid2Layout.db.profile.layouts[partyType or "solo"]
		end
		if partyType ~= Grid2Layout.partyType then
			local L = LibStub:GetLibrary("AceLocale-3.0"):GetLocale("Grid2")
			partyType = Grid2Layout.partyType
			local index = 2
			if not menuTable then
				menuTable = {{text = L["Select Layout"], notCheckable = true, isTitle = true}}
			end
			for name, layout in pairs(Grid2Layout.layoutSettings) do
				if layout.meta[partyType] and name ~= "None" then
					local option = menuTable[index]
					if not option then
						option = {func = SetLayout, checked = function() return name == layoutName end}
						menuTable[index] = option
					end
					option.text = L[name]
					option.value = name
					index = index + 1
				end
			end
			while index <= #menuTable do
				wipe(menuTable[index])
			end
			sort(menuTable, function(a, b)
				if a.isTitle then
					return true
				elseif b.isTitle then
					return false
				else
					return a.text < b.text
				end
			end)
		end
	end
	MenuLayoutsShow = function()
		menuFrame = menuFrame or CreateFrame("Frame", "Grid2FreeLayoutMenu", UIParent, "UIDropDownMenuTemplate")
		CreateMenuTable()
		EasyMenu(menuTable, menuFrame, "cursor", 0, 0, "MENU", 1)
	end
end

local LibDBIcon = LibStub("LibDBIcon-1.0", true)
if not LibDBIcon then return end

hooksecurefunc(Grid2, "OnEnable", function(self)
	if not LibDBIcon:IsRegistered("Grid2") then
		LibDBIcon:Register("Grid2", Grid2LDB, Grid2LDB.icon or Grid2Icon)
	end
end)
hooksecurefunc(Grid2, "PLAYER_ENTERING_WORLD", function(self) self:RefreshMMButton() end)

function Grid2:RefreshMMButton()
	LibDBIcon:Refresh("Grid2", Grid2Icon)
	if self.db.profile.mmbutton then
		LibDBIcon:Show("Grid2")
	else
		LibDBIcon:Hide("Grid2")
	end
end