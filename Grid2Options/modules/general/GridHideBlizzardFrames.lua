--[[ Hide Raid Frames ]]--
local Grid2 = Grid2
local Grid2Options = Grid2Options
local L = Grid2Options.L

Grid2Options:AddGeneralOptions("Misc", "Blizzard Raid Frames", {
	hideBlizzardRaidFrames = {
		type = "toggle",
		name = L["Hide Blizzard Raid Frames on Startup"],
		desc = L["Hide Blizzard Raid Frames on Startup"],
		width = "full",
		order = 120,
		get = function()
			return Grid2.db.profile.hideBlizzardRaidFrames
		end,
		set = function(_, v)
			Grid2.db.profile.hideBlizzardRaidFrames = v or nil
			if v then
				Grid2:HideBlizzardRaidFrames()
			end
		end
	}
})