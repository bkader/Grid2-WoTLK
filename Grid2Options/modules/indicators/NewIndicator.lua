--[[ New indicator options ]] --
local Grid2 = Grid2
local Grid2Options = Grid2Options
local L = Grid2Options.L

local newIndicatorValues = {name = "", type = "square", relPoint = "TOPLEFT"}

local function NewIndicator()
	local newIndicatorName = Grid2Options:GetValidatedName(newIndicatorValues.name)
	if (newIndicatorName and newIndicatorName ~= "") then
		-- save indicator in database
		local defaults = Grid2Options.indicatorDefaultValues
		local dbx = {type = newIndicatorValues.type}
		dbx.location = Grid2.CreateLocation(newIndicatorValues.relPoint)
		if (newIndicatorValues.type == "square") then
			dbx.level = 6
			dbx.size = defaults.square.size
		elseif (newIndicatorValues.type == "icon") then
			dbx.level = 8
			dbx.size = defaults.icon.size
			dbx.fontSize = defaults.icon.fontSize
		elseif (newIndicatorValues.type == "text") then
			dbx.level = 7
			dbx.textlength = defaults.text.textlength
			dbx.fontSize = defaults.text.fontSize
			dbx.font = defaults.text.font
			Grid2:DbSetIndicator(newIndicatorName .. "-color", {type = "text-color"})
		elseif (newIndicatorValues.type == "bar") then
			dbx.level = 3
			dbx.texture = "Gradient"
			local point = newIndicatorValues.relPoint
			if point == "LEFT" or point == "RIGHT" then
				dbx.width = 4
				dbx.orientation = "VERTICAL"
			elseif point ~= "CENTER" then
				dbx.height = 4
				dbx.orientation = "HORIZONTAL"
			end
			Grid2:DbSetIndicator(newIndicatorName .. "-color", {type = "bar-color"})
		elseif (newIndicatorValues.type == "multibar") then
			dbx.level = 3
			dbx.textureColor = {r = 0, g = 0, b = 0, a = 1}
			local point = newIndicatorValues.relPoint
			if point == "LEFT" or point == "RIGHT" then
				dbx.width = 4
				dbx.orientation = "VERTICAL"
			elseif point ~= "CENTER" then
				dbx.height = 4
				dbx.orientation = "HORIZONTAL"
			end
			Grid2:DbSetIndicator(newIndicatorName .. "-color", {type = "multibar-color"})
		elseif (newIndicatorValues.type == "icons") then
			dbx.level = 8
		elseif (newIndicatorValues.type == "portrait") then
			dbx.level = 4
		elseif (newIndicatorValues.type == "shape") then
			dbx.level = 6
			dbx.size = defaults.shape.size
		end
		Grid2:DbSetIndicator(newIndicatorName, dbx)
		-- Create runtime indicator
		local setupFunc = Grid2.setupFunc[dbx.type]
		local indicator = setupFunc(newIndicatorName, dbx)
		Grid2Frame:WithAllFrames(function(f)
			indicator:Create(f)
			indicator:Layout(f)
		end)
		-- Create indicator options
		newIndicatorValues.name = ""
		Grid2Options:MakeIndicatorOptions(indicator)
	end
end

local function NewIndicatorDisabled()
	local name = Grid2Options:GetValidatedName(newIndicatorValues.name)
	if name and name ~= "" then
		if not Grid2.indicators[name] then
			local _, frame = next(Grid2Frame.registeredFrames)
			if frame then
				-- Check if the name is in use by any unit frame child object
				for key, value in pairs(frame) do
					if name == key and type(value) ~= "table" then
						return true
					end
				end
				return false
			end
		end
	end
	return true
end

function Grid2Options:MakeNewIndicatorOptions()
	local options = self.indicatorOptions
	self:MakeTitleOptions(
		options,
		L["indicators"],
		L["Options for %s."]:format(L["indicators"]),
		nil,
		"Interface\\ICONS\\Spell_ChargePositive"
	)
	options.newIndicatorName = {
		type = "input",
		order = 2,
		width = "double",
		name = L["Name"],
		desc = L["Name of the new indicator"],
		usage = L["<CharacterOnlyString>"],
		get = function()
			return newIndicatorValues.name
		end,
		set = function(_, v)
			newIndicatorValues.name = v
		end
	}
	options.newIndicatorType = {
		type = "select",
		order = 3,
		name = L["Type"],
		desc = L["Type of indicator to create"],
		values = Grid2Options.indicatorTypes,
		get = function()
			return newIndicatorValues.type
		end,
		set = function(_, v)
			newIndicatorValues.type = v
			if v == "icon" or v == "text" then
				newIndicatorValues.relPoint = "CENTER"
			elseif v == "bar" then
				newIndicatorValues.relPoint = "BOTTOM"
			else
				newIndicatorValues.relPoint = "TOPLEFT"
			end
		end
	}
	options.newIndicatorLocation = {
		type = "select",
		order = 4,
		name = L["Location"],
		desc = L["Align my align point relative to"],
		values = self.pointValueList,
		get = function()
			return self.pointMap[newIndicatorValues.relPoint]
		end,
		set = function(_, v)
			newIndicatorValues.relPoint = self.pointMap[v]
		end
	}
	options.newIndicator = {
		type = "execute",
		order = 9,
		width = "double",
		name = L["Create Indicator"],
		desc = L["Create a new indicator."],
		func = NewIndicator,
		disabled = NewIndicatorDisabled
	}
	options.resetIndicatorsSpacer = {
		type = "header",
		order = 12,
		name = L["Misc"]
	}
	options.testMode = {
		type = "execute",
		order = 50,
		name = L["Test"],
		width = "half",
		desc = L["Enable or disable test mode for indicators"],
		func = function(info)
			Grid2Options:IndicatorsTestMode()
		end
	}
end