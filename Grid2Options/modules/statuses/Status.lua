-- Library of common/shared methods
local Grid2Options = Grid2Options
local L = Grid2Options.L

-- Grid2Options:MakeStatusEnabledOptions()
do
	local ClassesValues = {[""] = L["All Classes"], ["multi"] = L["Selected Classes"]}
	local ClassesValues2 = {}
	for class, translation in pairs(LOCALIZED_CLASS_NAMES_MALE) do
		ClassesValues[class] = translation
		ClassesValues2[class] = translation
	end

	local function StatusSetPlayerClass(status, playerClass, ismulti)
		local suspended = nil
		if ismulti then
			status.dbx.playerClass = "multi"
			suspended = (not status.dbx.playerClasses or status.dbx.playerClasses[playerClass] ~= nil)
		else
			suspended = status:IsSuspended()
			status.dbx.playerClass = (playerClass ~= "") and playerClass or nil
			status.dbx.playerClasses = nil -- remove it
		end
		if suspended ~= status:IsSuspended() then
			local name = status.name
			for key, map in pairs(Grid2.db.profile.statusMap) do
				local indicator = Grid2.indicators[key]
				if indicator then
					local priority = map[name]
					if priority then
						if suspended then
							indicator:RegisterStatus(status, priority)
						else
							indicator:UnregisterStatus(status)
						end
						Grid2Frame:WithAllFrames(indicator, "Update")
						Grid2Options:RefreshIndicatorOptions(indicator)
					end
				end
			end
			local group = Grid2Options:GetStatusGroup(status)
			if suspended then
				group.order = group.order - 500
				group.name = strsub(group.name, 11, -3)
			else
				group.order = group.order + 500
				group.name = string.format("|cFF808080%s|r", group.name)
			end
			status:Refresh()
		end
	end
	function Grid2Options:MakeStatusEnabledOptions(status, options, optionParams, headerKey)
		options.playerClass = {
			type = "select",
			width = "full",
			name = L["Enabled for"],
			desc = L["Enable the status only if your character belong to the specified class."],
			order = 1.5,
			get = function()
				return status.dbx.playerClass or ""
			end,
			set = function(_, v)
				StatusSetPlayerClass(status, v)
			end,
			values = ClassesValues
		}
		options.playerClasses = {
			type = "multiselect",
			width = "half",
			name = "",
			order = 1.6,
			hidden = function()
				return (not status.dbx.playerClass or status.dbx.playerClass ~= "multi")
			end,
			get = function(_, c)
				return status.dbx.playerClasses and status.dbx.playerClasses[c]
			end,
			set = function(_, c, v)
				status.dbx.playerClasses = status.dbx.playerClasses or {}
				status.dbx.playerClasses[c] = v or nil
				StatusSetPlayerClass(status, c, true)
			end,
			values = ClassesValues2
		}
		if headerKey ~= false then
			self:MakeHeaderOptions(options, headerKey or "General")
		end
	end
end

do
	local function DeleteStatus(info)
		local status = info.arg.status
		local category = Grid2Options:GetStatusCategory(status)
		Grid2.db.profile.statuses[status.name] = nil
		Grid2:UnregisterStatus(status)
		Grid2Frame:UpdateIndicators()
		Grid2Options:DeleteStatusOptions(category, status)
	end
	function Grid2Options:MakeStatusDeleteOptions(status, options, optionParams)
		self:MakeHeaderOptions(options, "Delete")
		options.delete = {
			type = "execute",
			order = 255,
			name = L["Delete"],
			desc = L["Delete this element"],
			func = DeleteStatus,
			confirm = function() return L["Are you sure you want to delete this status?"] end,
			disabled = function() return next(status.indicators) ~= nil or status:IsSuspended() end,
			arg = {status = status}
		}
		options.deletemsg = {
			type = "description",
			name = L["There are indicators linked to this status or the status is not enabled for this character."],
			fontSize = "small",
			order = 256,
			width = "double",
			hidden = function() return next(status.indicators) == nil and not status:IsSuspended() end
		}
	end
end

-- Grid2Options:MakeStatusColorOptions()
do
	local function GetStatusColor(info)
		local c = info.arg.status.dbx["color" .. (info.arg.colorIndex)]
		return c.r, c.g, c.b, c.a
	end
	local function SetStatusColor(info, r, g, b, a)
		local status = info.arg.status
		local c = status.dbx["color" .. (info.arg.colorIndex)]
		c.r, c.g, c.b, c.a = r, g, b, a
		status:UpdateDB()
		status:UpdateAllIndicators()
	end
	function Grid2Options:MakeStatusColorOptions(status, options, optionParams)
		local colorCount = status.dbx.colorCount or 1
		local name = L["Color"]
		local desc = L["Color for %s."]:format(status.name)
		local width = optionParams and optionParams.width or "half"
		for i = 1, colorCount do
			local colorKey = "color" .. i
			if optionParams and optionParams[colorKey] then
				name = optionParams[colorKey]
			elseif colorCount > 1 then
				name = L["Color %d"]:format(i)
			end
			local colorDescKey = "colorDesc" .. i
			if optionParams and optionParams[colorDescKey] then
				desc = optionParams[colorDescKey]
			elseif colorCount > 1 then
				desc = name
			end
			options[colorKey] = {
				type = "color",
				order = (10 + i),
				width = width,
				name = name,
				desc = desc,
				get = GetStatusColor,
				set = SetStatusColor,
				hasAlpha = true,
				arg = {status = status, colorIndex = i}
			}
		end
	end
end

-- Grid2Options:MakeStatusThresholdOptions()
function Grid2Options:MakeStatusThresholdOptions(status, options, optionParams, min, max, step, bigStep)
	min = min or 0
	max = max or 1
	step = step or 0.01
	bigStep = bigStep or step
	local name = optionParams and optionParams.threshold or L["Threshold"]
	local desc = optionParams and optionParams.thresholdDesc or L["Threshold at which to activate the status."]
	options.threshold = {
		type = "range",
		order = 20,
		name = name,
		desc = desc,
		min = min,
		max = max,
		step = step,
		get = function()
			return status.dbx.threshold
		end,
		set = function(_, v)
			status.dbx.threshold = v
			status:UpdateAllIndicators()
			status:UpdateDB()
		end
	}
end

-- Grid2Options:MakeStatusColorThresholdOptions()
function Grid2Options:MakeStatusColorThresholdOptions(status, options, optionParams)
	self:MakeStatusColorOptions(status, options, optionParams)
	self:MakeStatusThresholdOptions(status, options, optionParams)
end

-- Grid2Options:MakeStatusOpacityOptions()
function Grid2Options:MakeStatusOpacityOptions(status, options, optionParams, min, max, step, bigStep)
	min = min or 0
	max = max or 1
	step = step or 0.01
	bigStep = bigStep or step
	local name = optionParams and optionParams.opacity or L["Opacity"]
	local desc = optionParams and optionParams.opacityDesc or L["Set the opacity."]
	options.opacity = {
		type = "range",
		order = 30,
		name = name,
		desc = desc,
		min = min,
		max = max,
		step = step,
		get = function()
			return status.dbx.opacity
		end,
		set = function(_, v)
			status.dbx.opacity = v
			status:UpdateAllIndicators()
			status:UpdateDB()
		end
	}
end

-- Grid2Options:MakeStatusMissingOptions()
function Grid2Options:MakeStatusMissingOptions(status, options, optionParams)
	options.threshold = {
		type = "toggle",
		name = L["Show if missing"],
		desc = L["Display status only if the buff is not active."],
		order = 110,
		tristate = false,
		get = function()
			return status.dbx.missing
		end,
		set = function(_, v)
			status.dbx.missing = v or nil
			status:UpdateDB()
			status:UpdateAllIndicators()
		end
	}
end

-- Grid2Options:MakeStatusToggleOptions()
function Grid2Options:MakeStatusToggleOptions(status, options, optionParams, toggleKey)
	local name = optionParams and optionParams[toggleKey] or L[toggleKey] or toggleKey
	options[toggleKey] = {
		type = "toggle",
		name = name,
		tristate = false,
		width = optionParams and optionParams.width or nil,
		get = function()
			return status.dbx[toggleKey]
		end,
		set = function(_, v)
			status.dbx[toggleKey] = v or nil
			status:UpdateDB()
			status:UpdateAllIndicators()
		end
	}
end

Grid2Options.MakeStatusStandardOptions = Grid2Options.MakeStatusColorOptions