local SLG = LibStub("SpecializedLibGlow-1.0", true)
if not SLG then return end

local Grid2 = Grid2

local colorTable = {}

local function BorderGlow_OnUpdate(self, parent, unit, status)
	if status then
		local color = self.color
		if not color then
			color = colorTable
			colorTable[1], colorTable[2], colorTable[3], colorTable[4] = status:GetColor(unit)
		end
		if self.effect == 1 then
			SLG.PixelGlow_Start(parent, color, self.linesCount, self.frequency, nil, self.thickness, self.offsetX, self.offsetY, false, self.name)
		elseif self.effect == 2 then
			SLG.AutoCastGlow_Start(parent, color, self.particlesCount, self.frequency, self.particlesScale, self.offsetX, self.offsetY, self.name)
		else
			SLG.ButtonGlow_Start(parent, color, self.frequency)
		end
	else
		self.GlowStop(parent, self.name)
	end
end

local function BorderGlow_Disable(self, parent)
	self.GlowStop(parent, self.name)
end

local function BorderGlow_UpdateDB(self, dbx)
	dbx = dbx or self.dbx
	local color = dbx.glowColor
	self.color = color and {color.r, color.g, color.b, color.a} or nil
	self.effect = dbx.glowType or 1
	self.frequency = dbx.frequency or (self.effect == 1 and 0.25) or 0.12
	self.offsetX = dbx.offsetX or 0
	self.offsetY = dbx.offsetY or 0
	self.linesCount = dbx.linesCount or 8
	self.thickness = dbx.thickness or 2
	self.particlesCount = dbx.particlesCount or 4
	self.particlesScale = dbx.particlesScale or 1
	self.GlowStop = (self.effect == 1 and SLG.PixelGlow_Stop) or (self.effect == 2 and SLG.AutoCastGlow_Stop) or SLG.ButtonGlow_Stop
	self.dbx = dbx
end

local function CreateGlowBorder(indicatorKey, dbx)
	local indicator = Grid2.indicators[indicatorKey] or Grid2.indicatorPrototype:new(indicatorKey)
	indicator.dbx = dbx
	indicator.Create = Grid2.Dummy
	indicator.Layout = Grid2.Dummy
	indicator.OnUpdate = BorderGlow_OnUpdate
	indicator.Disable = BorderGlow_Disable
	indicator.UpdateDB = BorderGlow_UpdateDB
	BorderGlow_UpdateDB(indicator, dbx)
	Grid2:RegisterIndicator(indicator, {"color"})
	return indicator
end

Grid2.setupFunc["glowborder"] = CreateGlowBorder