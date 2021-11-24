local Grid2 = Grid2
local Grid2Frame = Grid2Frame
local GetTime = GetTime
local min = min

local StatusBarPrototype = Grid2.StatusBarPrototype
local AlignPoints = Grid2.AlignPoints

local defaultColor = {r = 0, g = 0, b = 0, a = 1}

local function Bar_CreateHH(self, parent)
	local bar = parent[self.name] or StatusBarPrototype(nil, parent)
	parent[self.name] = bar
	bar:SetStatusBarColor(0, 0, 0, 0)
	bar:SetMinMaxValues(0, 1)
	bar:SetValue(0)
	if self.backColor then
		bar.bg:Show()
	end
	bar:Show()
end

local function Bar_Layout(self, parent)
	local chBar
	local Bar = parent[self.name]
	local width = self.width or parent.container:GetWidth()
	local height = self.height or parent.container:GetHeight()
	local orient = self.orientation or Grid2Frame.db.profile.orientation
	local points = AlignPoints[orient]
	local level = parent:GetFrameLevel() + self.frameLevel
	Bar:SetFrameLevel(level)
	Bar:ClearAllPoints()
	Bar:SetPoint(self.anchor, parent.container, self.anchorRel, self.offsetx, self.offsety)
	Bar:SetOrientation(orient)
	Bar:SetReverseFill(self.reverseFill)
	Bar:SetStatusBarTexture(self.texture)
	Bar:SetSize(width, height)
	if self.childIndicator then
		chBar = parent[self.childIndicator.name]
		chBar:SetOrientation(orient)
		chBar:SetStatusBarTexture(self.childIndicator.texture)
		chBar:SetFrameLevel(level)
		chBar:ClearAllPoints()
		chBar:SetPoint(points[1], Bar.fg, points[2], 0, 0)
		chBar:SetPoint(points[3], Bar.fg, points[4], 0, 0)
		if orient == "HORIZONTAL" then
			chBar:SetWidth(width)
		else
			chBar:SetHeight(height)
		end
	end
	if self.backColor then
		local color = self.dbx.backColor
		Bar.bg:SetVertexColor(color.r, color.g, color.b, color.a)
		Bar.bg:SetTexture(self.bgTexture or self.texture)
		Bar.bg:Show()
	elseif Bar.bg then
		Bar.bg:Hide()
	end
end

local function Bar_GetBlinkFrame(self, parent)
	return parent[self.name]
end

--{{{ Bar OnUpdate
local durationTimers = {}
local expirations = {}
local durations = {}
local function tevent(bar)
	local timeLeft = expirations[bar] - GetTime()
	bar:SetValue(timeLeft > 0 and timeLeft / durations[bar] or 0)
end
local function tcancel(bar)
	if durationTimers[bar] then
		Grid2:CancelTimer(durationTimers[bar], true)
		durationTimers[bar], expirations[bar], durations[bar] = nil, nil, nil
	end
end

local function Bar_OnUpdateD(self, parent, unit, status)
	local bar, value = parent[self.name], 0
	if status then
		local expiration = status:GetExpirationTime(unit)
		if expiration then
			local now = GetTime()
			local timeLeft = expiration - now
			if timeLeft > 0 then
				local duration = status:GetDuration(unit) or timeLeft
				expirations[bar] = expiration
				durations[bar] = duration
				if not durationTimers[bar] then
					durationTimers[bar] = Grid2:ScheduleTimer(tevent, duration > 3 and 0.2 or 0.1, bar)
				end
				value = timeLeft / duration
			else
				tcancel(bar)
			end
		end
	else
		tcancel(bar)
	end
	bar:SetValue(value)
end

local function Bar_OnUpdateS(self, parent, unit, status)
	parent[self.name]:SetValue(status and status:GetCount(unit) / status:GetCountMax(unit) or 0)
end

local function Bar_OnUpdate(self, parent, unit, status)
	parent[self.name]:SetValue(status and status:GetPercent(unit) or 0)
end
--}}}

local function Bar_SetOrientation(self, orientation)
	self.orientation = orientation
	self.dbx.orientation = orientation
end

local function Bar_Disable(self, parent)
	local bar = parent[self.name]
	bar:Hide()
	if bar.bg then
		bar.bg:Hide()
	end
	self.parentIndicator = nil
	self.childIndicator = nil
	self.Layout = nil
	self.OnUpdate = nil
end

local function Bar_UpdateDB(self, dbx)
	dbx = dbx or self.dbx
	self.texture = Grid2:MediaFetch("statusbar", dbx.texture, "Gradient")
	self.bgTexture = Grid2:MediaFetch("statusbar", dbx.bgTexture or dbx.texture, "Gradient")
	local l = dbx.location
	self.frameLevel = dbx.level or 1
	self.anchor = l.point
	self.anchorRel = l.relPoint
	self.offsetx = l.x
	self.offsety = l.y
	self.width = dbx.width
	self.height = dbx.height
	self.orientation = dbx.orientation
	self.reverseFill = dbx.reverseFill
	self.backColor = dbx.backColor
	self.Create = Bar_CreateHH
	self.GetBlinkFrame = Bar_GetBlinkFrame
	self.OnUpdate = Bar_OnUpdate
	self.SetOrientation = Bar_SetOrientation
	self.Disable = Bar_Disable
	self.UpdateDB = Bar_UpdateDB
	self.Layout = dbx.parentBar and Grid2.Dummy or Bar_Layout
	self.OnUpdate = (dbx.duration and Bar_OnUpdateD) or (dbx.stack and Bar_OnUpdateS) or Bar_OnUpdate
	self.dbx = dbx
	if dbx.parentBar and Grid2.indicators[dbx.parentBar] then
		self.parentIndicator = Grid2.indicators[dbx.parentBar]
		self.parentIndicator.childIndicator = self
	end
	if dbx.childBar and Grid2.indicators[dbx.childBar] then
		self.childIndicator = Grid2.indicators[dbx.childBar]
		self.childIndicator.parentIndicator = self
	end
end

local function BarColor_OnUpdate(self, parent, unit, status)
	if status then
		self:SetBarColor(parent, status:GetColor(unit))
	else
		self:SetBarColor(parent, 0, 0, 0, 0)
	end
end

local function BarColor_SetBarColor(self, parent, r, g, b, a)
	local bar = parent[self.BarName]
	bar:SetForegroundColor(r, g, b, min(self.opacity, a or 1))
	local color = self.dbx.backColor or defaultColor
	bar:SetBackgroundColor(color.r, color.g, color.b, min(self.opacity, color.a or 1))
end

local function BarColor_SetBarColorInverted(self, parent, r, g, b, a)
	local bar = parent[self.BarName]
	local color = self.dbx.backColor or defaultColor
	bar:SetForegroundColor(color.r, color.g, color.b, min(self.opacity, 0.8))
	if not self.dbx.parentBar then
		bar:SetBackgroundColor(r, g, b, a)
	end
end

local function BarColor_UpdateDB(self)
	if self.dbx.invertColor then
		self.SetBarColor = BarColor_SetBarColorInverted
	else
		self.SetBarColor = BarColor_SetBarColor
	end
	self.opacity = self.dbx.opacity or 1
end

local function Create(indicatorKey, dbx)
	local Bar = Grid2.indicators[indicatorKey] or Grid2.indicatorPrototype:new(indicatorKey)
	Bar_UpdateDB(Bar, dbx)
	Grid2:RegisterIndicator(Bar, {"percent"})

	local colorKey = indicatorKey .. "-color"
	local BarColor = Grid2.indicators[colorKey] or Grid2.indicatorPrototype:new(colorKey)
	BarColor.dbx = dbx
	BarColor.BarName = indicatorKey
	BarColor.Create = Grid2.Dummy
	BarColor.Layout = Grid2.Dummy
	BarColor.OnUpdate = BarColor_OnUpdate
	BarColor.UpdateDB = BarColor_UpdateDB
	BarColor_UpdateDB(BarColor)
	Grid2:RegisterIndicator(BarColor, {"color"})

	Bar.sideKick = BarColor

	return Bar, BarColor
end

Grid2.setupFunc["bar"] = Create
Grid2.setupFunc["bar-color"] = Grid2.Dummy