-- bar indicator options

local Grid2Options = Grid2Options
local L = Grid2Options.L

Grid2Options:RegisterIndicatorOptions("bar", true, function(self, indicator)
	local colors, options, statuses = {}, {}, {}
	self:MakeIndicatorBarLocationOptions(indicator, options)
	self:MakeIndicatorBarAppearanceOptions(indicator, options)
	self:MakeIndicatorBarMiscOptions(indicator, options)
	self:MakeIndicatorDeleteOptions(indicator, options)
	self:MakeIndicatorStatusOptions(indicator, statuses)
	self:MakeIndicatorStatusOptions(indicator.sideKick, colors)
	self:AddIndicatorOptions(indicator, statuses, options, colors)
end)

-- Grid2Options:MakeIndicatorBarParentOptions()
do
	local function GetValues(excludeIndicator)
		-- local excludeIndicator = info.arg or info
		local list = {}
		for name, indicator in Grid2:IterateIndicators() do
			if indicator.dbx.type == "bar" and indicator.sideKick and indicator ~= excludeIndicator and (((not indicator.parentIndicator) and (not indicator.childIndicator)) or indicator.childIndicator == excludeIndicator) then
				list[name] = L[name]
			end
		end
		if next(list) then
			list["NONE"] = L["None"]
			return list
		end
	end
	local function SetParent(info, v)
		local child = info.arg
		local parent = v and Grid2.indicators[v]
		local pparent = child.parentIndicator
		if pparent then
			pparent.dbx.childBar, pparent.childIndicator = nil, nil
			child.dbx.parentBar, child.parentIndicator = nil, nil
			pparent:UpdateDB()
		end
		if parent then
			parent.dbx.childBar = child.name
			child.dbx.parentBar = parent.name
			parent:UpdateDB()
		end
		child:UpdateDB()
		if pparent then
			Grid2Frame:WithAllFrames(pparent, "Layout")
		end
		if parent then
			Grid2Frame:WithAllFrames(parent, "Layout")
		end
		if child then
			Grid2Frame:WithAllFrames(child, "Layout")
		end
		Grid2Frame:UpdateIndicators()
		for name, indicator in Grid2:IterateIndicators() do
			if indicator.dbx.type == "bar" and indicator.sideKick then
				Grid2Options:MakeIndicatorOptions(indicator)
			end
		end
	end
	function Grid2Options:MakeIndicatorBarLocationOptions(indicator, options)
		if indicator.parentIndicator then
			self:MakeHeaderOptions(options, "Location")
		else
			self:MakeIndicatorLocationOptions(indicator, options)
		end
		if not indicator.childIndicator then
			local values = GetValues(indicator)
			if values then
				options.parentBar = {
					type = "select",
					order = 3,
					name = L["Anchor to"],
					desc = L["Anchor the indicator to the selected bar."],
					get = function()
						return indicator.dbx.parentBar or "NONE"
					end,
					set = SetParent,
					values = values,
					arg = indicator
				}
			end
		end
	end
end

-- Grid2Options:MakeIndicatorBarDisplayOptions()
function Grid2Options:MakeIndicatorBarAppearanceOptions(indicator, options)
	self:MakeHeaderOptions(options, "Appearance")
	if indicator.dbx.parentBar then
		return
	end
	options.orientation = {
		type = "select",
		width = "double",
		order = 15,
		name = L["Orientation of the Bar"],
		desc = L["Set status bar orientation."],
		get = function()
			return indicator.dbx.orientation or "DEFAULT"
		end,
		set = function(_, v)
			if v == "DEFAULT" then
				v = nil
			end
			indicator:SetOrientation(v)
			Grid2Frame:WithAllFrames(indicator, "Layout")
		end,
		values = {["DEFAULT"] = L["DEFAULT"], ["VERTICAL"] = L["VERTICAL"], ["HORIZONTAL"] = L["HORIZONTAL"]}
	}
	options.barWidth = {
		type = "range",
		order = 30,
		name = L["Bar Width"],
		desc = L["Choose zero to set the bar to the same width as parent frame"],
		min = 0,
		max = 150,
		step = 1,
		get = function()
			return indicator.dbx.width
		end,
		set = function(_, v)
			if v == 0 then
				v = nil
			end
			indicator.dbx.width = v
			self:RefreshIndicator(indicator, "Layout")
		end
	}
	options.barHeight = {
		type = "range",
		order = 40,
		name = L["Bar Height"],
		desc = L["Choose zero to set the bar to the same height as parent frame"],
		min = 0,
		max = 150,
		step = 1,
		get = function()
			return indicator.dbx.height
		end,
		set = function(_, v)
			if v == 0 then
				v = nil
			end
			indicator.dbx.height = v
			self:RefreshIndicator(indicator, "Layout")
		end
	}
	options.enableBack = {
		type = "toggle",
		name = L["Enable Background"],
		desc = L["Enable Background"],
		order = 44,
		get = function()
			return indicator.dbx.backColor ~= nil
		end,
		set = function(_, v)
			if v then
				indicator.dbx.backColor = {r = 0, g = 0, b = 0, a = 1}
			else
				indicator.dbx.backColor = nil
			end
			self:RefreshIndicator(indicator, "Create")
		end
	}
	options.backColor = {
		type = "color",
		order = 45,
		name = L["Background Color"],
		desc = L["Background Color"],
		hasAlpha = true,
		get = function()
			local c = indicator.dbx.backColor
			if c then
				return c.r, c.g, c.b, c.a
			else
				return 0, 0, 0, 1
			end
		end,
		set = function(info, r, g, b, a)
			local c = indicator.dbx.backColor
			if not c then
				c = {}
				indicator.dbx.backColor = c
			end
			c.r, c.g, c.b, c.a = r, g, b, a
			self:RefreshIndicator(indicator, "Layout", "Update")
		end,
		hidden = function()
			return not indicator.dbx.backColor
		end
	}
	options.reverseFill = {
		type = "toggle",
		name = L["Reverse Fill"],
		desc = L["Fill the bar in reverse."],
		order = 47,
		tristate = false,
		get = function()
			return indicator.dbx.reverseFill
		end,
		set = function(_, v)
			indicator.dbx.reverseFill = v or nil
			self:RefreshIndicator(indicator, "Layout")
		end
	}
end

-- Grid2Options:MakeIndicatorBarMiscOptions()
function Grid2Options:MakeIndicatorBarMiscOptions(indicator, options)
	options.texture = {
		type = "select",
		dialogControl = "LSM30_Statusbar",
		order = 20,
		name = L["Frame Texture"],
		desc = L["Adjust the frame texture."],
		get = function(info)
			return indicator.dbx.texture or "Gradient"
		end,
		set = function(info, v)
			indicator.dbx.texture = v
			self:RefreshIndicator(indicator, "Layout")
		end,
		values = AceGUIWidgetLSMlists.statusbar
	}
	options.bgTexture = {
		type = "select",
		dialogControl = "LSM30_Statusbar",
		order = 21,
		name = L["Background Texture"],
		desc = L["Select the frame background texture."],
		get = function(info)
			return indicator.dbx.bgTexture or indicator.dbx.texture or "Gradient"
		end,
		set = function(info, v)
			indicator.dbx.bgTexture = v
			self:RefreshIndicator(indicator, "Layout")
		end,
		values = AceGUIWidgetLSMlists.statusbar
	}
	options.barOpacity = {
		type = "range",
		order = 43,
		width = "double",
		name = L["Opacity"],
		desc = L["Set the opacity."],
		min = 0,
		max = 1,
		step = 0.01,
		bigStep = 0.05,
		get = function()
			return indicator.dbx.opacity or 1
		end,
		set = function(_, v)
			indicator.dbx.opacity = v
			indicator.sideKick:UpdateDB()
			Grid2Frame:UpdateIndicators()
		end
	}
	options.inverColor = {
		type = "toggle",
		name = L["Invert Bar Color"],
		desc = L["Swap foreground/background colors on bars."],
		order = 46,
		tristate = false,
		get = function()
			return indicator.dbx.invertColor
		end,
		set = function(_, v)
			indicator.dbx.invertColor = v or nil
			indicator.sideKick:UpdateDB()
			self:RefreshIndicator(indicator, "Create")
		end,
		hidden = function() return indicator.dbx.backColor == nil end,
		disabled = function() return indicator.dbx.backColor == nil end
	}
	self:MakeHeaderOptions(options, "Display")
	options.duration = {
		type = "toggle",
		name = L["Show duration"],
		desc = L["Show the time remaining."],
		order = 81,
		tristate = false,
		get = function()
			return indicator.dbx.duration
		end,
		set = function(_, v)
			indicator.dbx.duration = v or nil
			self:RefreshIndicator(indicator, "Update")
		end
	}
	options.stack = {
		type = "toggle",
		name = L["Show stack"],
		desc = L["Show the number of stacks."],
		order = 85,
		tristate = false,
		get = function()
			return indicator.dbx.stack
		end,
		set = function(_, v)
			indicator.dbx.stack = v or nil
			self:RefreshIndicator(indicator, "Update")
		end
	}
end