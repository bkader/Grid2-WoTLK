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
			return Grid2.db.profile.mmbutton
		end,
		set = function()
			Grid2.db.profile.mmbutton = not Grid2.db.profile.mmbutton
			Grid2:RefreshMMButton()
		end
	}
})