-- Misc functions
local Grid2 = Grid2

function Grid2.Dummy() end

function Grid2:HideBlizzardRaidFrames()
	if _G.CompactRaidFrameManager then --check if Blizzard_CompactRaidFrames isn't already disabled by the user
		_G.CompactRaidFrameManager:UnregisterAllEvents()
		_G.CompactRaidFrameManager:Hide()
		if _G.CompactRaidFrameContainer then
			_G.CompactRaidFrameContainer:UnregisterAllEvents()
			_G.CompactRaidFrameContainer:Hide()
		end
	end
end

-- Default Colors
do
	local defaultColors = {
		TRANSPARENT = {r = 0, g = 0, b = 0, a = 0},
		BLACK = {r = 0, g = 0, b = 0, a = 1},
		WHITE = {r = 1, g = 1, b = 1, a = 1}
	}
	function Grid2:MakeColor(color, default)
		return color or defaultColors[default or "TRANSPARENT"]
	end
	Grid2.defaultColors = defaultColors
end

local media = LibStub("LibSharedMedia-3.0", true)
function Grid2:MediaFetch(mediatype, key, def)
	return (key and media:Fetch(mediatype, key)) or (def and media:Fetch(mediatype, def)) or def
end

-- UTF8 string truncate
do
	local strbyte = string.byte
	function Grid2.strcututf8(s, c)
		local l, i = #s, 1
		while c > 0 and i <= l do
			local b = strbyte(s, i)
			if b < 192 then
				i = i + 1
			elseif b < 224 then
				i = i + 2
			elseif b < 240 then
				i = i + 3
			else
				i = i + 4
			end
			c = c - 1
		end
		return s:sub(1, i - 1)
	end
end

-- Table Deep Copy used by GridDefaults.lua
function Grid2.CopyTable(src, dst)
	if type(dst) ~= "table" then
		dst = {}
	end
	for k, v in pairs(src) do
		if type(v) == "table" then
			dst[k] = Grid2.CopyTable(v, dst[k])
		elseif not dst[k] then
			dst[k] = v
		end
	end
	return dst
end

-- Remove item by value in a ipairs table
function Grid2.TableRemoveByValue(t,v)
	for i=#t,1,-1 do
		if t[i]==v then
			tremove(t, i)
			return
		end
	end
end

-- Creates a location table, used by GridDefaults.lua
function Grid2.CreateLocation(a, b, c, d)
	local p = a or "TOPLEFT"
	if type(b) == "string" then
		return {relPoint = p, point = b, x = c or 0, y = d or 0}
	else
		return {relPoint = p, point = p, x = b or 0, y = c or 0}
	end
end

-- Common methods repository for statuses
Grid2.statusLibrary = {
	IsActive = function()
		return true
	end,
	GetBorder = function()
		return 1
	end,
	GetColor = function(self)
		local c = self.dbx.color1
		return c.r, c.g, c.b, c.a
	end,
	GetPercent = function(self)
		return self.dbx.color1.a
	end,
	UpdateAllUnits = function(self)
		for unit in Grid2:IterateRosterUnits() do
			self:UpdateIndicators(unit)
		end
	end
}

-- Used by bar indicators
Grid2.AlignPoints = {
	HORIZONTAL = {"TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT"},
	HORIZONTAL_INVERSE = {"TOPRIGHT", "TOPLEFT", "BOTTOMRIGHT", "BOTTOMLEFT"},
	VERTICAL = {"BOTTOMLEFT", "TOPLEFT", "BOTTOMRIGHT", "TOPRIGHT"},
	VERTICAL_INVERSE = {"TOPLEFT", "BOTTOMLEFT", "TOPRIGHT", "BOTTOMRIGHT"}
}

-- Create/Manage/Sets frame backdrops
do
	local format = string.format
	local tostring = tostring
	local backdrops = {}
	-- Generates a backdrop table, reuses tables avoiding to create duplicates
	function Grid2:GetBackdropTable(edgeFile, edgeSize, bgFile, tile, tileSize, inset)
		inset = inset or edgeSize
		local key = format("%s;%s;%d;%s;%d;%d", bgFile or "", edgeFile or "", edgeSize or -1, tostring(tile), tileSize or -1, inset or -1)
		local backdrop = backdrops[key]
		if not backdrop then
			backdrop = {
				bgFile = bgFile,
				tile = tile,
				tileSize = tileSize,
				edgeFile = edgeFile,
				edgeSize = edgeSize,
				insets = {left = inset, right = inset, top = inset, bottom = inset}
			}
			backdrops[key] = backdrop
		end
		return backdrop
	end
	-- Sets a backdrop only if necessary to alleviate game freezes, see ticket #640
	function Grid2:SetFrameBackdrop(frame, backdrop)
		if backdrop ~= frame.currentBackdrop then
			frame:SetBackdrop(backdrop)
			frame.currentBackdrop = backdrop
		end
	end
end