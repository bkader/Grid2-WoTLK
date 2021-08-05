local Grid2 = Grid2
local Grid2Frame = Grid2:GetModule("Grid2Frame", true)
if not Grid2Frame then return end

local Grid2Layout = Grid2Layout
local L = LibStub("AceLocale-3.0"):GetLocale("Grid2")

local fmt = string.format

local dbx
local SettingUnitsPerColumn
local SettingMaxColumns
local SettingSortType
local SettingSortTanks
local SettingMaxGroup

local curLayoutName
local nameListStr
local nameList, newList = {}, {}
local frameLayout
local frameUnit
local dragUnitName
local queueUpdateRoster
local queueUpdateLayout
local Events = {}

--- "Free Layout" layout management
local FreeLayout = {
	meta = {
		raid25 = true,
		raid20 = true,
		raid15 = true,
		raid10 = true,
		party = true,
		solo = true
	},
	defaults = {
		allowVehicleTarget = true,
		toggleForVehicle = true,
		showPlayer = true,
		showParty = true,
		showRaid = true,
		showSolo = true
	},
	[1] = {
		nameList = "",
		sortMethod = "NAMELIST"
	}
}
Grid2Layout:AddLayout("Free Layout", FreeLayout)

local function LayoutUpdate(NoResize)
	if InCombatLockdown() then
		queueUpdateLayout = true
		return
	end

	local header = Grid2Layout.groups.raid[1] or Grid2Layout.groups.party[1]
	if header then
		local visible = header:IsVisible()
		if visible then
			header:Hide()
		end

		header:ClearChildrenPoints()
		header:SetAttribute("unitsPerColumn", SettingUnitsPerColumn)
		header:SetAttribute("maxColumns", SettingMaxColumns)
		header:SetAttribute("nameList", nameListStr)

		if visible then
			header:Show()
		end

		if not NoResize then
			Grid2Layout:UpdateSize()
		end
	end
	queueUpdateLayout = false
end

local UpdateRoster
do
	local PartyMaxGroup = {raid25 = 5, raid20 = 4, raid15 = 3, raid10 = 2, party = 1, solo = 1}
	local TankKey = {["MAINTANK"] = 0, ["MAINASSIST"] = 1}
	local SortKeyGen = {
		["group"] = function(n, g) return fmt("%d%s", g, n) end,
		["grouptank"] = function(n, g, _, r) return fmt("%d%d%s", g, TankKey[r] or 1, n) end,
		["class"] = function(_, _, c) return c end,
		["classtank"] = function(n, _, c, r) return fmt("%d%s%s", TankKey[r] or 1, c, n) end,
		["name"] = function(n) return n end,
		["nametank"] = function(n, _, _, r) return fmt("%d%s", TankKey[r] or 1, n) end,
		["user"] = function(n, _, _, r) return nameList[n] or 100 end,
		["usertank"] = function(n, _, _, r) return nameList[n] or 100 end
	}
	local function GetPartyRosterInfo(i)
		local unit = i < 2 and "player" or "party" .. (i - 1)
		local name = UnitName(unit)
		if name and name ~= "" then
			local _, class = UnitClass(unit)
			local role = GetPartyAssignment("MAINTANK", unit) and "MAINTANK" or ""
			return name, nil, 1, nil, nil, class, nil, nil, nil, role
		end
	end
	local function GetNumGroupAndRoster()
		local count = GetNumRaidMembers()
		if count > 0 then
			return count, GetRaidRosterInfo
		else
			return GetNumPartyMembers() + 1, GetPartyRosterInfo
		end
	end
	UpdateRoster = function(updateLayout)
		local SortKey = SortKeyGen[SettingSortTanks and SettingSortType .. "tank" or SettingSortType]
		if not SettingMaxGroup then
			SettingMaxGroup = PartyMaxGroup[Grid2Layout.partyType]
		end

		local count, GetGroupRosterInfo = GetNumGroupAndRoster()
		for i = 1, count do
			local name, _, group, _, _, class, _, _, _, role = GetGroupRosterInfo(i)
			if name then
				if group <= SettingMaxGroup then
					newList[#newList + 1] = name
					newList[name] = SortKey(name, group, class, role)
				end
			else
				break
			end
		end

		table.sort(newList, function(a, b) return newList[a] < newList[b] end)

		local modified
		local newListStr = table.concat(newList, ",")
		if newListStr ~= nameListStr then
			nameList, newList, nameListStr = newList, nameList, newListStr
			for i = 1, #nameList do
				nameList[nameList[i]] = i
			end
			modified = true
		end
		wipe(newList)

		local maxColumns = math.ceil(SettingMaxGroup * 5 / SettingUnitsPerColumn)
		if maxColumns ~= SettingMaxColumns then
			SettingMaxColumns = maxColumns
			modified = true
		end

		if updateLayout and modified then
			LayoutUpdate()
		end

		queueUpdateRoster = false
	end
end

local function LayoutSwapUnits(n1, n2)
	local i1, i2 = nameList[n1], nameList[n2]
	if i1 and i2 then
		nameList[i1], nameList[i2] = n2, n1
		nameList[n1], nameList[n2] = i2, i1
	end
	SettingSortType = "user"
	nameListStr = table.concat(nameList, ",")
	dbx.SortType = "user"
	dbx.nameListStr = nameListStr
	LayoutUpdate(true)
end

function Events:RAID_ROSTER_UPDATE()
	if InCombatLockdown() then
		queueUpdateRoster = true
	else
		UpdateRoster(true)
	end
end

function Events:PARTY_MEMBERS_CHANGED()
	-- If party type changes, remove "visible groups" setting defined by the user,
	-- update roster will recalculate the right value for the new party size
	if IsInInstance() then
		SettingMaxGroup = nil
	end

	Events:RAID_ROSTER_UPDATE()
end

local function LayoutLoadConfig()
	dbx = Grid2Layout.db.profile
	if not dbx.FreeLayout then
		dbx.FreeLayout = {}
	end
	dbx = dbx.FreeLayout

	SettingUnitsPerColumn = dbx.UnitsPerColumn or 5
	SettingSortType = dbx.SortType or "group"
	SettingSortTanks = dbx.SortTanks or false

	if SettingSortType == "user" then
		nameListStr = dbx.nameListStr
		if nameListStr and nameListStr ~= "" then
			nameList = {strsplit(",", nameListStr or "")}
			for i = 1, #nameList do
				nameList[nameList[i]] = i
			end
		end
	else
		wipe(nameList)
		nameListStr = nil
	end
end

local function LayoutPrepareForLoad()
	if curLayoutName ~= "Free Layout" then
		frameLayout:RegisterEvent("PARTY_MEMBERS_CHANGED")
		frameLayout:RegisterEvent("RAID_ROSTER_UPDATE")
		frameLayout:RegisterEvent("PLAYER_REGEN_DISABLED")
		frameLayout:RegisterEvent("PLAYER_REGEN_ENABLED")
	end
	LayoutLoadConfig()
	UpdateRoster()
	FreeLayout[1].nameList = nameListStr or ""
	FreeLayout[1].maxColumns = SettingMaxColumns
	FreeLayout[1].unitsPerColumn = SettingUnitsPerColumn
end

local function LayoutPrepareForUnload()
	frameLayout:UnregisterEvent("RAID_ROSTER_UPDATE")
	frameLayout:UnregisterEvent("PARTY_MEMBERS_CHANGED")
	frameLayout:UnregisterEvent("PLAYER_REGEN_DISABLED")
	frameLayout:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

---
--- Unit frames mouse drag management
---

local LayoutDragManagerShow
local LayoutDragManagerHide

local function LayoutDragGetCursorPosition()
	local s = frameLayout:GetEffectiveScale()
	local x, y = GetCursorPosition()
	return x / s, y / s
end

local function LayoutDragGetUnitFromPoint(x, y)
	for _, frame in next, Grid2Frame.registeredFrames do
		if
			frame:IsVisible() and x >= frame:GetLeft() and x <= frame:GetRight() and y >= frame:GetBottom() and
				y <= frame:GetTop()
		 then
			return frame.unit and UnitName(frame.unit) or nil, frame
		end
	end
end

local function LayoutDragStart(frame)
	frameUnit:SetPoint("TOPLEFT", frame, "TOPLEFT")
	frameUnit:Show()
	frameUnit:StartMoving()
end

local function LayoutDragStop()
	dragUnitName = nil
	frameUnit:StopMovingOrSizing()
	frameUnit:Hide()
	frameUnit:ClearAllPoints()
end

local function LayoutDragOnMouseDown(_, button)
	if button == "LeftButton" then
		local frame
		dragUnitName, frame = LayoutDragGetUnitFromPoint(LayoutDragGetCursorPosition())
		if dragUnitName then
			if not frameUnit then
				frameUnit = CreateFrame("Frame", nil, frameLayout)
				frameUnit:SetMovable(true)
				frameUnit:SetBackdrop({
					edgeFile = "Interface\\Addons\\Grid2\\media\\gradient32x32",
					edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2}
				})
				frameUnit:SetBackdropBorderColor(1, 1, 1, 1)
				frameUnit:SetBackdropColor(0, 0, 0, 0)
			end
			frameUnit:SetSize(frame:GetSize())
			LayoutDragStart(frame)
		end
	elseif button == "RightButton" then
		LayoutDragManagerHide()
	end
end

local function LayoutDragOnMouseUp(_, button)
	if dragUnitName then
		local unitName = LayoutDragGetUnitFromPoint(frameUnit:GetCenter())
		if unitName and dragUnitName ~= unitName then
			LayoutSwapUnits(unitName, dragUnitName)
		end
		LayoutDragStop()
	end
end

function LayoutDragShowTooltip()
	local GameTooltip = GameTooltip
	GameTooltip:SetOwner(frameLayout, "ANCHOR_NONE")
	GameTooltip:ClearLines()
	GameTooltip:ClearAllPoints()
	local x, y = frameLayout:GetCenter()
	if y < GetScreenHeight() / 2 then
		GameTooltip:SetPoint("BOTTOM", frameLayout, "TOP", 0, 15)
	else
		GameTooltip:SetPoint("TOP", frameLayout, "BOTTOM", 0, -15)
	end
	GameTooltip:SetText(L["Custom Sort"])
	GameTooltip:AddLine(L["Left Click to drag and rearrange units"], 0, 1, 0)
	GameTooltip:AddLine(L["Right Click to finish config"], 0, 1, 0)
	GameTooltip:Show()
	SetCursor("CAST_CURSOR")
end

function LayoutDragManagerShow()
	local Grid2LayoutFrame = Grid2LayoutFrame
	frameLayout:SetFrameLevel(Grid2LayoutFrame:GetFrameLevel() + 25)
	frameLayout:SetScale(Grid2LayoutFrame:GetScale())
	frameLayout:EnableMouse(true)
	local border = Grid2Layout.db.profile.Spacing * 2
	local width, height = Grid2LayoutFrame:GetSize()
	frameLayout:SetSize(width - border, height - border)
	frameLayout:SetScript("OnMouseDown", LayoutDragOnMouseDown)
	frameLayout:SetScript("OnMouseUp", LayoutDragOnMouseUp)
	frameLayout:SetScript("OnEnter", LayoutDragShowTooltip)
	frameLayout:Show()
	LayoutDragShowTooltip()
end

function LayoutDragManagerHide()
	if frameLayout:IsVisible() then
		if dragUnitName then
			LayoutDragStop()
		end
		frameLayout:EnableMouse(false)
		frameLayout:SetScript("OnMouseDown", nil)
		frameLayout:SetScript("OnMouseUp", nil)
		frameLayout:SetScript("OnEnter", nil)
		frameLayout:Hide()
		GameTooltip:Hide()
	end
end

---
--- Events
---

function Events:PLAYER_REGEN_ENABLED()
	if queueUpdateRoster then
		UpdateRoster()
	end
	if queueUpdateLayout then
		LayoutUpdate()
	end
end

function Events:PLAYER_REGEN_DISABLED()
	LayoutDragManagerHide()
end

---
--- Popup Menu management
---

local LayoutMenuShow
do
	local partyType
	local menuFrame
	local menuFree
	local menuLayouts = {}

	local function MenuGetLayouts(partyType)
		local list = {}
		for name, layout in pairs(Grid2Layout.layoutSettings) do
			if layout.meta[partyType] then
				list[#list + 1] = name
			end
		end
		table.sort(list)
		return list
	end

	local function MenuSetLayout(self)
		if not InCombatLockdown() then
			if self.value ~= curLayoutName then
				if curLayoutName == "Free Layout" then
					ToggleDropDownMenu(1, nil, menuFrame, "cursor", 0, 0, menuFree)
				end
				Grid2Layout.db.profile.layouts[Grid2Layout.partyType] = self.value
				Grid2Layout:ReloadLayout()
			end
		end
	end

	local function MenuSetUnits(self)
		SettingUnitsPerColumn = tonumber(self.value)
		dbx.UnitsPerColumn = SettingUnitsPerColumn
		LayoutUpdate()
	end

	local function MenuSetSort(self)
		SettingSortType = self.value
		dbx.SortType = SettingSortType
		if SettingSortType ~= "user" then
			dbx.nameListStr = nil
		end
		UpdateRoster(true)
	end

	local function MenuSetGroup(self)
		SettingMaxGroup = tonumber(self.value)
		UpdateRoster(true)
	end

	local function MenuSetTank()
		SettingSortTanks = not SettingSortTanks
		dbx.SortTanks = SettingSortTanks
		UpdateRoster(true)
	end

	local function MenuSetDrag()
		LayoutDragManagerShow()
	end

	local function MenuSetOrientation(self)
		Grid2Layout.db.profile.horizontal = (self.value == "horizontal")
		Grid2Layout:ReloadLayout()
	end

	local function MenuCreateLayouts()
		if partyType ~= Grid2Layout.partyType then
			partyType = Grid2Layout.partyType
			wipe(menuLayouts)
			menuLayouts[1] = {text = L["Select Layout"], notCheckable = true, isTitle = true}
			local list = MenuGetLayouts(partyType)
			for _, name in ipairs(list) do
				if name ~= "None" then
					local option = {text = L[name], value = name, checked = function() return curLayoutName == name end, func = MenuSetLayout}
					table.insert(menuLayouts, name == "Free Layout" and 2 or #menuLayouts + 1, option)
				end
			end
		end
	end

	local function MenuCreateFree()
		if not menuFree then
			local unitMenu = {}
			for i = 5, 25, 5 do
				unitMenu[#unitMenu + 1] = {text = tostring(i), checked = function() return SettingUnitsPerColumn == i end, func = MenuSetUnits}
			end
			local groupMenu = {}
			for i = 1, 8 do
				groupMenu[#groupMenu + 1] = {
					text = tostring(i),
					checked = function()
						return SettingMaxGroup >= i
					end,
					func = MenuSetGroup
				}
			end
			menuFree = {}
			menuFree[1] = {text = L["Free Layout"], notCheckable = true, isTitle = true}
			menuFree[2] = {text = L["Sort by Group"], value = "group", checked = function() return SettingSortType == "group" end, func = MenuSetSort}
			menuFree[3] = {text = L["Sort by Class"], value = "class", checked = function() return SettingSortType == "class" end, func = MenuSetSort}
			menuFree[4] = {text = L["Sort by Name"], value = "name", checked = function() return SettingSortType == "name" end, func = MenuSetSort}
			menuFree[5] = {text = L["Custom Sort"], value = "user", checked = function() return SettingSortType == "user" end, func = MenuSetDrag}
			menuFree[6] = {text = L["Tanks First"], checked = function() return SettingSortTanks end, func = MenuSetTank}
			menuFree[7] = {text = "", notCheckable = true, hasArrow = true, menuList = unitMenu}
			menuFree[8] = {text = L["Visible Groups"], notCheckable = true, hasArrow = true, menuList = groupMenu}
			menuFree[9] = {
				text = L["Layout Orientation"],
				notCheckable = true,
				hasArrow = true,
				menuList = {
					{
						text = L["Horizontal"],
						value = "horizontal",
						checked = function()
							return Grid2Layout.db.profile.horizontal
						end,
						func = MenuSetOrientation
					},
					{
						text = L["Vertical"],
						value = "vertical",
						checked = function()
							return not Grid2Layout.db.profile.horizontal
						end,
						func = MenuSetOrientation
					}
				}
			}
			menuFree[10] = {text = L["Change Layout"], notCheckable = true, hasArrow = true, menuList = menuLayouts}
		end
		menuFree[7].text = Grid2Layout.db.profile.horizontal and L["Units per Row"] or L["Units per Column"]
	end

	LayoutMenuShow = function()
		menuFrame = menuFrame or CreateFrame("Frame", "Grid2FreeLayoutMenu", UIParent, "UIDropDownMenuTemplate")
		MenuCreateLayouts()
		MenuCreateFree()
		EasyMenu((curLayoutName == "Free Layout" and menuFree or menuLayouts), menuFrame, "cursor", 0, 0, "MENU", 0)
	end
end

---
--- Layout manager
---

local prev_MouseUpHandler
local function LayoutManagerOpenMenuEvent(self, button, ...)
	prev_MouseUpHandler(self, button, ...)
	if button == "RightButton" and (not InCombatLockdown()) then
		LayoutDragManagerHide()
		LayoutMenuShow()
	end
end

function LayoutInit()
	local Grid2LayoutFrame = Grid2LayoutFrame

	if not frameLayout then
		frameLayout = CreateFrame("Frame", nil, Grid2LayoutFrame)
		frameLayout:SetPoint("CENTER", Grid2LayoutFrame, "CENTER")
		frameLayout:SetScript("OnEvent", function(self, event, ...) Events[event](self, ...) end)
	end

	prev_MouseUpHandler = Grid2LayoutFrame:GetScript("OnMouseUp")
	Grid2LayoutFrame:SetScript("OnMouseUp", LayoutManagerOpenMenuEvent)
end

---
--- Hook to activate Free Layout
---

local prev_LoadLayout = Grid2Layout.LoadLayout
function Grid2Layout:LoadLayout(layoutName)
	if not frameLayout then
		LayoutInit()
	end
	if layoutName == "Free Layout" then
		LayoutPrepareForLoad()
	else
		if curLayoutName == "Free Layout" then
			LayoutPrepareForUnload()
		end
	end
	prev_LoadLayout(self, layoutName)
	curLayoutName = layoutName
end