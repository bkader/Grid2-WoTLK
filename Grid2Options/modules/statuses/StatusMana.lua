local Grid2Options = Grid2Options
local L = Grid2Options.L

Grid2Options:RegisterStatusOptions("lowmana", "mana", Grid2Options.MakeStatusColorThresholdOptions, {titleIcon = "Interface\\Icons\\Inv_potion_86"})
Grid2Options:RegisterStatusOptions("mana", "mana", Grid2Options.MakeStatusColorOptions, {titleIcon = "Interface\\Icons\\Inv_potion_72"})
Grid2Options:RegisterStatusOptions("power", "mana", Grid2Options.MakeStatusColorOptions, {
	color1 = L["Mana"],
	colorDesc1 = L["Mana"],
	color2 = L["Rage"],
	colorDesc2 = L["Rage"],
	color3 = L["Focus"],
	colorDesc3 = L["Focus"],
	color4 = L["Energy"],
	colorDesc4 = L["Energy"],
	color5 = L["Runic Power"],
	colorDesc5 = L["Runic Power"],
	width = "full",
	titleIcon = "Interface\\Icons\\Inv_potion_33"
})