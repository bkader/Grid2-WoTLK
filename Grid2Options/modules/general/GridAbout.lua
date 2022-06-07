--[[ About Grid2 ]]--
local Grid2 = Grid2
local Grid2Options = Grid2Options

local GetAddOnMetadata = GetAddOnMetadata
local fmt = string.format
local aboutStr = "\n|cffffd200%s|r:  %s"

local L = Grid2Options.L
local options = {
	d0 = {
		type = "description",
		fontSize = "medium",
		name = L["GRID2_DESC"],
		order = 10
	}
}
-- about about args
for i, field in ipairs({"Version", "Date", "Category", "Author", "Email", "Website", "Discord", "Credits"}) do
	local meta = GetAddOnMetadata("Grid2", field) or GetAddOnMetadata("Grid2", "X-" .. field)
	if meta then
		options["d" .. i] = {
			type = "description",
			name = fmt(aboutStr, L[field], meta),
			fontSize = "medium",
			order = (i * 10) + 10
		}
	end
end
Grid2Options:MakeTitleOptions(options, Grid2.versionstring, L["GRID2_WELCOME"], nil, "Interface\\Addons\\Grid2\\media\\icon")
Grid2Options:AddGeneralOptions("About", nil, options)