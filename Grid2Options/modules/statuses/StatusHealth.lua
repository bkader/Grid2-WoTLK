local Grid2Options = Grid2Options
local L = Grid2Options.L

Grid2Options:RegisterStatusOptions(
	"health-current",
	"health",
	function(self, status, options, optionParams)
		self:MakeStatusColorOptions(status, options, optionParams)
		self:MakeSpacerOptions(options, 30)
		self:MakeStatusToggleOptions(status, options, optionParams, "quickHealth")
		self:MakeStatusToggleOptions(status, options, optionParams, "deadAsFullHealth")
	end,
	{
		deadAsFullHealth = L["Show dead as having Full Health"],
		quickHealth = L["Instant Updates"],
		color1 = L["Full Health"],
		color2 = L["Medium Health"],
		color3 = L["Low Health"],
		width = "full",
		titleIcon = "Interface\\Icons\\Inv_potion_51"
	}
)

Grid2Options:RegisterStatusOptions(
	"heals-incoming",
	"health",
	function(self, status, options, optionParams)
		self:MakeStatusStandardOptions(status, options, optionParams)
		options.includePlayerHeals = {
			type = "toggle",
			order = 110,
			name = L["Include player heals"],
			desc = L["Display status for the player's heals."],
			tristate = false,
			get = function()
				return status.dbx.includePlayerHeals
			end,
			set = function(_, v)
				status.dbx.includePlayerHeals = v or nil
				status:UpdateDB()
			end
		}
		options.healFlags = {
			type = "group",
			name = L["Heal filter"],
			desc = L["Show incoming heals for the selected heal types."],
			inline = true,
			order = 120,
			args = {
				direct = {
					type = "toggle",
					name = L["Direct heals"],
					desc = L["Include direct heals."],
					order = 10,
					get  = function()
						return status.dbx.flags.direct
					end,
					set  = function(v)
						status.dbx.flags.direct = not status.dbx.flags.direct
						status:UpdateDB()
					end
				},
				channel = {
					type = "toggle",
					name = L["Channeled heals"],
					desc = L["Include channeled heals."],
					order = 20,
					get  = function()
						return status.dbx.flags.channel
					end,
					set  = function()
						status.dbx.flags.channel = not status.dbx.flags.channel
						status:UpdateDB()
					end
				},
				hot = {
					type = "toggle",
					name = L["HoT heals"],
					desc = L["Include heal over time effects."],
					order = 30,
					get  = function()
						return status.dbx.flags.hot
					end,
					set  = function()
						status.dbx.flags.hot = not status.dbx.flags.hot
						status:UpdateDB()
					end
				},
			}
		}
		options.minHeals = {
			type = "input",
			order = 130,
			name = L["Minimum value"],
			desc = L["Incoming heals below the specified value will not be shown."],
			get = function()
				return tostring(status.dbx.minimum or 0)
			end,
			set = function(_, v)
				status.dbx.minimum = tonumber(v) or nil
				status:UpdateDB()
			end
		}
		options.timeFrame = {
			type = "range",
			order = 140,
			name = L["HealComm Time Frame"],
			get = function()
				return status.dbx.timeFrame or 0
			end,
			set = function(_, v)
				status.dbx.timeFrame = v
				status:UpdateDB()
			end,
			min = 0,
			max = 5,
			step = 1
		}
	end,
	{titleIcon = "Interface\\Icons\\Spell_Holy_DivineProvidence"}
)

Grid2Options:RegisterStatusOptions(
	"health-low",
	"health",
	function(self, status, options, optionParams)
		local min, max, step
		if status.dbx.threshold > 10 then
			min, max, step = 1000, 100000, 500
		end
		self:MakeStatusColorOptions(status, options, optionParams)
		self:MakeStatusThresholdOptions(status, options, optionParams, min, max, step)
		options.useAbsoluteHealth = {
			type = "toggle",
			order = 110,
			name = L["Use Health Percent"],
			desc = L["Use Health Percent"],
			tristate = false,
			get = function()
				return status.dbx.threshold < 10
			end,
			set = function(_, v)
				status.dbx.threshold = v and 0.4 or 10000
				status:UpdateDB()
				self:MakeStatusOptions(status)
			end
		}
	end,
	{titleIcon = "Interface\\Icons\\Ability_rogue_bloodyeye"}
)

Grid2Options:RegisterStatusOptions(
	"health-opacity",
	"health",
	function(self, status, options, optionParams)
		local min, max, step
		if status.dbx.threshold > 10 then
			min, max, step = 1000, 100000, 500
		end
		self:MakeStatusThresholdOptions(status, options, optionParams, min, max, step)
		self:MakeStatusOpacityOptions(status, options, optionParams, 0, 1, 0.01, 0.1)
	end,
	{titleIcon = "Interface\\Icons\\Ability_Druid_HealingInstincts"}
)

Grid2Options:RegisterStatusOptions("health-deficit", "health", Grid2Options.MakeStatusColorThresholdOptions, {titleIcon = "Interface\\Icons\\Spell_shadow_lifedrain"})
Grid2Options:RegisterStatusOptions("death", "combat", Grid2Options.MakeStatusColorOptions, {titleIcon = "Interface\\ICONS\\Ability_creature_cursed_05"})
Grid2Options:RegisterStatusOptions("feign-death", "combat", Grid2Options.MakeStatusColorOptions, {titleIcon = "Interface\\ICONS\\Ability_fiegndead"})