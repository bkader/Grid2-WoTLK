local Grid2Options = Grid2Options
local L = Grid2Options.L

Grid2Options:RegisterIndicatorOptions("background", false, function(self, indicator)
	local statuses, options = {}, {}
	self:MakeIndicatorBackgroundOptions(indicator, options)
	self:MakeIndicatorStatusOptions(indicator, statuses)
	self:AddIndicatorOptions(indicator, statuses, options)
end)

function Grid2Options:MakeIndicatorBackgroundOptions(indicator, options)
	options.colorBackground = {
		type = "color",
		hasAlpha = true,
		order = 10,
		width = "full",
		name = L["Background Color"],
		desc = L["Sets the background color to use when no status is active."],
		get = function()
			return self:UnpackColor(Grid2Frame.db.profile.frameContentColor)
		end,
		set = function(info, r, g, b, a)
			self:PackColor(r, g, b, a, Grid2Frame.db.profile, "frameContentColor")
			self:RefreshIndicator(indicator, "Update")
		end
	}
	return options
end