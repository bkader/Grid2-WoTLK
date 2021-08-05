local Grid2 = Grid2
local Border = Grid2.indicatorPrototype:new("border")
Border.Create = Grid2.Dummy
Border.Layout = Grid2.Dummy

function Border:OnUpdate(parent, unit, status)
	if status then
		parent:SetBackdropBorderColor(status:GetColor(unit))
	else
		local c = self.dbx.color1
		parent:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
	end
end

local function Create(indicatorKey, dbx)
	Border.dbx = dbx
	Grid2:RegisterIndicator(Border, {"color"})
	return Border
end

Grid2.setupFunc["border"] = Create