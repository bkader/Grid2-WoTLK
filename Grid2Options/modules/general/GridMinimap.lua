--[[ Minimap Options ]]--
local Grid2 = Grid2
if not Grid2.dataobj then return end
local L = Grid2Options.L

local Grid2Options = Grid2Options
Grid2Options:AddGeneralOptions("Misc", "Minimap Button", {
	mmbutton = {
		type = "toggle",
		name = L["Show minimap button"],
		desc = L["Toggles showing the minimap button."],
		order = 130,
		width = "full",
		get = function()
			return not Grid2.db.profile.icon.hide
		end,
		set = function()
			Grid2.db.profile.icon.hide = not Grid2.db.profile.icon.hide
			Grid2:RefreshMMButton()
		end
	}
})