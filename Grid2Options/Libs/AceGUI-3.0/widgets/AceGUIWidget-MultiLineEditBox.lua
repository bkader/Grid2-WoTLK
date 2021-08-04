local Type, Version = "MultiLineEditBox", 22
local AceGUI = LibStub and LibStub("AceGUI-3.0", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

-- Lua APIs
local pairs = pairs

-- WoW APIs
local GetCursorInfo, GetSpellName, ClearCursor = GetCursorInfo, GetSpellName, ClearCursor
local CreateFrame, UIParent = CreateFrame, UIParent
local _G = _G

-- Global vars/functions that we don't upvalue since they might get hooked, or upgraded
-- List them here for Mikk's FindGlobals script
-- GLOBALS: ACCEPT, ChatFontNormal

--[[-----------------------------------------------------------------------------
Scripts
-------------------------------------------------------------------------------]]
local function OnClick(self)                                                     -- Button
	self = self.obj
	self.editBox:ClearFocus()
	if not self:Fire("OnEnterPressed", self.editBox:GetText()) then
		self.button:Disable()
	end
end

local function OnCursorChanged(self, _, y, _, cursorHeight)                      -- EditBox
	self, y = self.obj.scrollFrame, -y
	local offset = self:GetVerticalScroll()
	if y < offset then
		self:SetVerticalScroll(y)
	else
		y = y + cursorHeight - self:GetHeight()
		if y > offset then
			self:SetVerticalScroll(y)
		end
	end
end

local function OnEditFocusLost(self)                                             -- EditBox
	self:HighlightText(0, 0)
end

local function OnEnter(self)                                                     -- EditBox / ScrollFrame
	self = self.obj
	if not self.entered then
		self.entered = true
		self:Fire("OnEnter")
	end
end

local function OnLeave(self)                                                     -- EditBox / ScrollFrame
	self = self.obj
	if self.entered then
		self.entered = nil
		self:Fire("OnLeave")
	end
end

local function OnMouseUp(self)                                                   -- ScrollFrame
	self = self.obj.editBox
	self:SetFocus()
	self:SetCursorPosition(self:GetNumLetters())
end

local function OnReceiveDrag(self)                                               -- EditBox / ScrollFrame
	local type, id, info = GetCursorInfo()
	if type == "spell" then
		info, id = GetSpellName(id, info)
		if id and id:match("%d") then
			info = info .. "(" .. id .. ")"
		end
	elseif type ~= "item" then
		return
	end
	ClearCursor()
	self = self.obj
	local editBox = self.editBox
	if not editBox:HasFocus() then
		editBox:SetFocus()
		editBox:SetCursorPosition(editBox:GetNumLetters())
	end
	editBox:Insert(info)
	self.button:Enable()
end

local function OnSizeChanged(self, width, height)                                -- ScrollFrame
	self.obj.editBox:SetWidth(width)
end

local function OnTextChanged(self, userInput)                                    -- EditBox
	if userInput then
		self = self.obj
		self:Fire("OnTextChanged", self.editBox:GetText())
		self.button:Enable()
	end
end

local function OnTextSet(self)                                                   -- EditBox
	self:HighlightText(0, 0)
	self:SetCursorPosition(self:GetNumLetters())
	self:SetCursorPosition(0)
	self.obj.button:Disable()
end

local function OnVerticalScroll(self, offset)                                    -- ScrollFrame
	local editBox = self.obj.editBox
	editBox:SetHitRectInsets(0, 0, offset, editBox:GetHeight() - offset - self:GetHeight())
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]
local methods = {
	["GetText"] = function(self)
		return self.editBox:GetText()
	end,

	["OnAcquire"] = function(self)
		self.editBox:SetText("")
		self:SetDisabled(false)
		self:SetWidth(200)
		self:SetNumLines()
		self.entered = nil
		self:SetMaxLetters(0)
	end,

	["OnRelease"] = function(self)
		self.frame:ClearAllPoints()
		self.frame:Hide()
	end,

	["SetDisabled"] = function(self, disabled)
		local editBox = self.editBox
		if disabled then
			editBox:ClearFocus()
			editBox:EnableMouse(false)
			editBox:SetTextColor(0.5, 0.5, 0.5)
			self.label:SetTextColor(0.5, 0.5, 0.5)
			self.scrollFrame:EnableMouse(false)
			self.button:Disable()
		else
			editBox:EnableMouse(true)
			editBox:SetTextColor(1, 1, 1)
			self.label:SetTextColor(1, 0.82, 0)
			self.scrollFrame:EnableMouse(true)
		end
	end,

	["SetLabel"] = function(self, text)
		if text and text ~= "" then
			self.label:SetText(text)
			if self.labelHeight ~= 10 then
				self.labelHeight = 10
				self.scrollBar:SetPoint("TOP", self.label, "BOTTOM", 0, -19)
				self:SetHeight(self.frame.height + 10)
				self.label:Show()
			end
		elseif self.labelHeight ~= 0 then
			self.labelHeight = 0
			self.label:Hide()
			self.scrollBar:SetPoint("TOP", self.frame, "TOP", 0, -23)
			self:SetHeight(self.frame.height - 10)
		end
	end,

	["SetNumLines"] = function(self, value)
		if not value or value < 4 then
			value = 4
		end
		self:SetHeight(value * 14 + 41 + self.labelHeight)
	end,

	["SetText"] = function(self, text)
		self.editBox:SetText(text)
	end,

	["SetMaxLetters"] = function (self, num)
		self.editBox:SetMaxLetters(num or 0)
	end
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local backdrop = {
	bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = { left = 4, right = 3, top = 4, bottom = 3 }
}

local function Constructor()
	local frame = CreateFrame("Frame", nil, UIParent)
	frame:Hide()
	
	local widgetNum = AceGUI:GetNextWidgetNum(Type)

	local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	label:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, -4)
	label:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, -4)
	label:SetJustifyH("LEFT")
	label:SetText(ACCEPT)
	label:SetHeight(10)

	local button = CreateFrame("Button", ("%s%dButton"):format(Type, widgetNum), frame, "UIPanelButtonTemplate2")
	button:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 4)
	button:SetHeight(22)
	button:SetWidth(label:GetStringWidth() + 24)
	button:SetText(ACCEPT)
	button:SetScript("OnClick", OnClick)
	button:Disable()
	
	local text = button:GetFontString()
	text:ClearAllPoints()
	text:SetPoint("TOPLEFT", button, "TOPLEFT", 5, -5)
	text:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -5, 1)
	text:SetJustifyV("MIDDLE")

	local scrollBG = CreateFrame("Frame", nil, frame)
	scrollBG:SetBackdrop(backdrop)
	scrollBG:SetBackdropColor(0, 0, 0)
	scrollBG:SetBackdropBorderColor(0.4, 0.4, 0.4)

	local scrollFrame = CreateFrame("ScrollFrame", ("%s%dScrollFrame"):format(Type, widgetNum), frame, "UIPanelScrollFrameTemplate")

	local scrollBar = _G[scrollFrame:GetName() .. "ScrollBar"]
	scrollBar:ClearAllPoints()
	scrollBar:SetPoint("TOP", label, "BOTTOM", 0, -19)
	scrollBar:SetPoint("BOTTOM", button, "TOP", 0, 18)
	scrollBar:SetPoint("RIGHT", frame, "RIGHT")

	scrollBG:SetPoint("TOPRIGHT", scrollBar, "TOPLEFT", 0, 19)
	scrollBG:SetPoint("BOTTOMLEFT", button, "TOPLEFT")

	scrollFrame:SetPoint("TOPLEFT", scrollBG, "TOPLEFT", 5, -6)
	scrollFrame:SetPoint("BOTTOMRIGHT", scrollBG, "BOTTOMRIGHT", -4, 4)
	scrollFrame:SetScript("OnEnter", OnEnter)
	scrollFrame:SetScript("OnLeave", OnLeave)
	scrollFrame:SetScript("OnMouseUp", OnMouseUp)
	scrollFrame:SetScript("OnReceiveDrag", OnReceiveDrag)
	scrollFrame:SetScript("OnSizeChanged", OnSizeChanged)
	scrollFrame:HookScript("OnVerticalScroll", OnVerticalScroll)

	local editBox = CreateFrame("EditBox", nil, scrollFrame)
	editBox:SetAllPoints()
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetMultiLine(true)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(false)
	editBox:SetCountInvisibleLetters(false)
	editBox:SetScript("OnCursorChanged", OnCursorChanged)
	editBox:SetScript("OnEditFocusLost", OnEditFocusLost)
	editBox:SetScript("OnEnter", OnEnter)
	editBox:SetScript("OnEscapePressed", editBox.ClearFocus)
	editBox:SetScript("OnLeave", OnLeave)
	editBox:SetScript("OnMouseDown", OnReceiveDrag)
	editBox:SetScript("OnReceiveDrag", OnReceiveDrag)
	editBox:SetScript("OnTextChanged", OnTextChanged)
	editBox:SetScript("OnTextSet", OnTextSet)

	scrollFrame:SetScrollChild(editBox)

	local widget = {
		button      = button,
		editBox     = editBox,
		frame       = frame,
		label       = label,
		labelHeight = 10,
		scrollBar   = scrollBar,
		scrollFrame = scrollFrame,
		type        = Type
	}
	for method, func in pairs(methods) do
		widget[method] = func
	end
	button.obj, editBox.obj, scrollFrame.obj = widget, widget, widget

	AceGUI:RegisterAsWidget(widget)
	return widget
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
