local Grid2 = Grid2

local Grid2PopupButtons = {}
local Grid2PopupMenus = {}
local Grid2PopupShown = {}
local Grid2LootMethod = {}

Grid2.PopupButtons = Grid2PopupButtons
Grid2.PopupMenus = Grid2PopupMenus
Grid2.PopupShown = Grid2PopupShown
Grid2.LootMethod = Grid2LootMethod

function Grid2:InitializeUnitPopup()
	-- popup buttons
	Grid2PopupButtons["CANCEL"] = {text = CANCEL, dist = 0, space = 1}
	Grid2PopupButtons["TRADE"] = {text = TRADE, dist = 2}
	Grid2PopupButtons["INSPECT"] = {text = INSPECT, dist = 1}
	Grid2PopupButtons["ACHIEVEMENTS"] = {text = COMPARE_ACHIEVEMENTS, dist = 1}
	Grid2PopupButtons["TARGET"] = {text = TARGET, dist = 0}
	Grid2PopupButtons["IGNORE"] = {text = IGNORE, dist = 0}
	Grid2PopupButtons["REPORT_SPAM"] = {text = REPORT_SPAM, dist = 0}
	Grid2PopupButtons["POP_OUT_CHAT"] = {text = MOVE_TO_WHISPER_WINDOW, dist = 0}
	Grid2PopupButtons["DUEL"] = {text = DUEL, dist = 3, space = 1}
	Grid2PopupButtons["WHISPER"] = {text = WHISPER, dist = 0}
	Grid2PopupButtons["INVITE"] = {text = PARTY_INVITE, dist = 0}
	Grid2PopupButtons["UNINVITE"] = {text = PARTY_UNINVITE, dist = 0}
	Grid2PopupButtons["REMOVE_FRIEND"] = {text = REMOVE_FRIEND, dist = 0}
	Grid2PopupButtons["SET_NOTE"] = {text = SET_NOTE, dist = 0}
	Grid2PopupButtons["BN_REMOVE_FRIEND"] = {text = REMOVE_FRIEND, dist = 0}
	Grid2PopupButtons["BN_SET_NOTE"] = {text = SET_NOTE, dist = 0}
	Grid2PopupButtons["BN_VIEW_FRIENDS"] = {text = VIEW_FRIENDS_OF_FRIENDS, dist = 0}
	Grid2PopupButtons["BN_INVITE"] = {text = PARTY_INVITE, dist = 0}
	Grid2PopupButtons["BN_TARGET"] = {text = TARGET, dist = 0}
	Grid2PopupButtons["BLOCK_COMMUNICATION"] = {text = BLOCK_COMMUNICATION, dist = 0}
	Grid2PopupButtons["CREATE_CONVERSATION_WITH"] = {text = CREATE_CONVERSATION_WITH, dist = 0}
	Grid2PopupButtons["VOTE_TO_KICK"] = {text = VOTE_TO_KICK, dist = 0}
	Grid2PopupButtons["PROMOTE"] = {text = PARTY_PROMOTE, dist = 0}
	Grid2PopupButtons["PROMOTE_GUIDE"] = {text = PARTY_PROMOTE_GUIDE, dist = 0}
	Grid2PopupButtons["GUILD_PROMOTE"] = {text = GUILD_PROMOTE, dist = 0}
	Grid2PopupButtons["GUILD_LEAVE"] = {text = GUILD_LEAVE, dist = 0}
	Grid2PopupButtons["TEAM_PROMOTE"] = {text = TEAM_PROMOTE, dist = 0}
	Grid2PopupButtons["TEAM_KICK"] = {text = TEAM_KICK, dist = 0}
	Grid2PopupButtons["TEAM_LEAVE"] = {text = TEAM_LEAVE, dist = 0}
	Grid2PopupButtons["LEAVE"] = {text = PARTY_LEAVE, dist = 0}
	Grid2PopupButtons["FOLLOW"] = {text = FOLLOW, dist = 4}
	Grid2PopupButtons["PET_DISMISS"] = {text = PET_DISMISS, dist = 0}
	Grid2PopupButtons["PET_ABANDON"] = {text = PET_ABANDON, dist = 0}
	Grid2PopupButtons["PET_PAPERDOLL"] = {text = PET_PAPERDOLL, dist = 0}
	Grid2PopupButtons["PET_RENAME"] = {text = PET_RENAME, dist = 0}
	Grid2PopupButtons["LOOT_METHOD"] = {text = LOOT_METHOD, dist = 0, nested = 1}
	Grid2PopupButtons["FREE_FOR_ALL"] = {text = LOOT_FREE_FOR_ALL, dist = 0}
	Grid2PopupButtons["ROUND_ROBIN"] = {text = LOOT_ROUND_ROBIN, dist = 0}
	Grid2PopupButtons["MASTER_LOOTER"] = {text = LOOT_MASTER_LOOTER, dist = 0}
	Grid2PopupButtons["GROUP_LOOT"] = {text = LOOT_GROUP_LOOT, dist = 0}
	Grid2PopupButtons["NEED_BEFORE_GREED"] = {text = LOOT_NEED_BEFORE_GREED, dist = 0}
	Grid2PopupButtons["RESET_INSTANCES"] = {text = RESET_INSTANCES, dist = 0}
	Grid2PopupButtons["DUNGEON_DIFFICULTY"] = {text = DUNGEON_DIFFICULTY, dist = 0, nested = 1}
	Grid2PopupButtons["DUNGEON_DIFFICULTY1"] = {text = DUNGEON_DIFFICULTY1, dist = 0}
	Grid2PopupButtons["DUNGEON_DIFFICULTY2"] = {text = DUNGEON_DIFFICULTY2, dist = 0}
	Grid2PopupButtons["RAID_DIFFICULTY"] = {text = RAID_DIFFICULTY, dist = 0, nested = 1}
	Grid2PopupButtons["RAID_DIFFICULTY1"] = {text = RAID_DIFFICULTY1, dist = 0}
	Grid2PopupButtons["RAID_DIFFICULTY2"] = {text = RAID_DIFFICULTY2, dist = 0}
	Grid2PopupButtons["RAID_DIFFICULTY3"] = {text = RAID_DIFFICULTY3, dist = 0}
	Grid2PopupButtons["RAID_DIFFICULTY4"] = {text = RAID_DIFFICULTY4, dist = 0}
	Grid2PopupButtons["PVP_FLAG"] = {text = PVP_FLAG, dist = 0, nested = 1}
	Grid2PopupButtons["PVP_ENABLE"] = {text = ENABLE, dist = 0, checkable = 1}
	Grid2PopupButtons["PVP_DISABLE"] = {text = DISABLE, dist = 0, checkable = 1}
	Grid2PopupButtons["LOOT_THRESHOLD"] = {text = LOOT_THRESHOLD, dist = 0, nested = 1}
	Grid2PopupButtons["LOOT_PROMOTE"] = {text = LOOT_PROMOTE, dist = 0}
	Grid2PopupButtons["ITEM_QUALITY2_DESC"] = {text = ITEM_QUALITY2_DESC, dist = 0, color = ITEM_QUALITY_COLORS[2]}
	Grid2PopupButtons["ITEM_QUALITY3_DESC"] = {text = ITEM_QUALITY3_DESC, dist = 0, color = ITEM_QUALITY_COLORS[3]}
	Grid2PopupButtons["ITEM_QUALITY4_DESC"] = {text = ITEM_QUALITY4_DESC, dist = 0, color = ITEM_QUALITY_COLORS[4]}
	Grid2PopupButtons["OPT_OUT_LOOT_TITLE"] = {text = OPT_OUT_LOOT_TITLE, dist = 0, nested = 1, tooltipText = NEWBIE_TOOLTIP_UNIT_OPT_OUT_LOOT}
	Grid2PopupButtons["OPT_OUT_LOOT_ENABLE"] = {text = YES, dist = 0, checkable = 1}
	Grid2PopupButtons["OPT_OUT_LOOT_DISABLE"] = {text = NO, dist = 0, checkable = 1}
	Grid2PopupButtons["BN_REPORT"] = {text = BNET_REPORT, dist = 0, nested = 1}
	Grid2PopupButtons["BN_REPORT_SPAM"] = {text = BNET_REPORT_SPAM, dist = 0}
	Grid2PopupButtons["BN_REPORT_ABUSE"] = {text = BNET_REPORT_ABUSE, dist = 0}
	Grid2PopupButtons["BN_REPORT_THREAT"] = {text = BNET_REPORT_THREAT, dist = 0}
	Grid2PopupButtons["BN_REPORT_NAME"] = {text = BNET_REPORT_NAME, dist = 0}
	Grid2PopupButtons["RAID_LEADER"] = {text = SET_RAID_LEADER, dist = 0}
	Grid2PopupButtons["RAID_PROMOTE"] = {text = SET_RAID_ASSISTANT, dist = 0}
	Grid2PopupButtons["RAID_MAINTANK"] = {text = SET_MAIN_TANK, dist = 0}
	Grid2PopupButtons["RAID_MAINASSIST"] = {text = SET_MAIN_ASSIST, dist = 0}
	Grid2PopupButtons["RAID_DEMOTE"] = {text = DEMOTE, dist = 0}
	Grid2PopupButtons["RAID_REMOVE"] = {text = REMOVE, dist = 0}
	Grid2PopupButtons["PVP_REPORT_AFK"] = {text = PVP_REPORT_AFK, dist = 0}
	Grid2PopupButtons["RAF_SUMMON"] = {text = RAF_SUMMON, dist = 0}
	Grid2PopupButtons["RAF_GRANT_LEVEL"] = {text = RAF_GRANT_LEVEL, dist = 0}
	Grid2PopupButtons["VEHICLE_LEAVE"] = {text = VEHICLE_LEAVE, dist = 0}

	-- Voice Chat Related
	Grid2PopupButtons["MUTE"] = {text = MUTE, dist = 0}
	Grid2PopupButtons["UNMUTE"] = {text = UNMUTE, dist = 0}

	-- Raid Target Icons
	Grid2PopupButtons["RAID_TARGET_ICON"] = {text = RAID_TARGET_ICON, dist = 0, nested = 1}
	Grid2PopupButtons["RAID_TARGET_1"] = {text = RAID_TARGET_1, dist = 0, checkable = 1, color = {r = 1.0, g = 0.92, b = 0}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0, tCoordRight = 0.25, tCoordTop = 0, tCoordBottom = 0.25}
	Grid2PopupButtons["RAID_TARGET_2"] = {text = RAID_TARGET_2, dist = 0, checkable = 1, color = {r = 0.98, g = 0.57, b = 0}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.25, tCoordRight = 0.5, tCoordTop = 0, tCoordBottom = 0.25}
	Grid2PopupButtons["RAID_TARGET_3"] = {text = RAID_TARGET_3, dist = 0, checkable = 1, color = {r = 0.83, g = 0.22, b = 0.9}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.5, tCoordRight = 0.75, tCoordTop = 0, tCoordBottom = 0.25}
	Grid2PopupButtons["RAID_TARGET_4"] = {text = RAID_TARGET_4, dist = 0, checkable = 1, color = {r = 0.04, g = 0.95, b = 0}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.75, tCoordRight = 1, tCoordTop = 0, tCoordBottom = 0.25}
	Grid2PopupButtons["RAID_TARGET_5"] = {text = RAID_TARGET_5, dist = 0, checkable = 1, color = {r = 0.7, g = 0.82, b = 0.875}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0, tCoordRight = 0.25, tCoordTop = 0.25, tCoordBottom = 0.5}
	Grid2PopupButtons["RAID_TARGET_6"] = {text = RAID_TARGET_6, dist = 0, checkable = 1, color = {r = 0, g = 0.71, b = 1}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.25, tCoordRight = 0.5, tCoordTop = 0.25, tCoordBottom = 0.5}
	Grid2PopupButtons["RAID_TARGET_7"] = {text = RAID_TARGET_7, dist = 0, checkable = 1, color = {r = 1.0, g = 0.24, b = 0.168}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.5, tCoordRight = 0.75, tCoordTop = 0.25, tCoordBottom = 0.5}
	Grid2PopupButtons["RAID_TARGET_8"] = {text = RAID_TARGET_8, dist = 0, checkable = 1, color = {r = 0.98, g = 0.98, b = 0.98}, icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.75, tCoordRight = 1, tCoordTop = 0.25, tCoordBottom = 0.5}
	Grid2PopupButtons["RAID_TARGET_NONE"] = {text = RAID_TARGET_NONE, dist = 0, checkable = 1}

	-- Chat Channel Player Commands
	Grid2PopupButtons["CHAT_PROMOTE"] = {text = MAKE_MODERATOR, dist = 0}
	Grid2PopupButtons["CHAT_DEMOTE"] = {text = REMOVE_MODERATOR, dist = 0}
	Grid2PopupButtons["CHAT_OWNER"] = {text = CHAT_OWNER, dist = 0}
	Grid2PopupButtons["CHAT_SILENCE"] = {text = CHAT_SILENCE, dist = 0}
	Grid2PopupButtons["CHAT_UNSILENCE"] = {text = CHAT_UNSILENCE, dist = 0}
	Grid2PopupButtons["PARTY_SILENCE"] = {text = PARTY_SILENCE, dist = 0}
	Grid2PopupButtons["PARTY_UNSILENCE"] = {text = PARTY_UNSILENCE, dist = 0}
	Grid2PopupButtons["RAID_SILENCE"] = {text = RAID_SILENCE, dist = 0}
	Grid2PopupButtons["RAID_UNSILENCE"] = {text = RAID_UNSILENCE, dist = 0}
	Grid2PopupButtons["BATTLEGROUND_SILENCE"] = {text = BATTLEGROUND_SILENCE, dist = 0}
	Grid2PopupButtons["BATTLEGROUND_UNSILENCE"] = {text = BATTLEGROUND_UNSILENCE, dist = 0}
	Grid2PopupButtons["CHAT_KICK"] = {text = CHAT_KICK, dist = 0}
	Grid2PopupButtons["CHAT_BAN"] = {text = CHAT_BAN, dist = 0}

	-- popup menus
	Grid2PopupMenus["SELF"] = {"PVP_FLAG", "LOOT_METHOD", "LOOT_THRESHOLD", "OPT_OUT_LOOT_TITLE", "LOOT_PROMOTE", "DUNGEON_DIFFICULTY", "RAID_DIFFICULTY", "RESET_INSTANCES", "RAID_TARGET_ICON", "LEAVE", "CANCEL"}
	Grid2PopupMenus["PET"] = {"PET_PAPERDOLL", "PET_RENAME", "PET_ABANDON", "PET_DISMISS", "CANCEL"}
	Grid2PopupMenus["PARTY"] = {"MUTE", "UNMUTE", "PARTY_SILENCE", "PARTY_UNSILENCE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "PROMOTE", "PROMOTE_GUIDE", "LOOT_PROMOTE", "VOTE_TO_KICK", "UNINVITE", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL"}
	Grid2PopupMenus["PLAYER"] = {"WHISPER", "INSPECT", "INVITE", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL"}
	Grid2PopupMenus["RAID_PLAYER"] = {"MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "RAID_LEADER", "RAID_PROMOTE", "RAID_DEMOTE", "LOOT_PROMOTE", "RAID_REMOVE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL"}
	Grid2PopupMenus["RAID"] = {"MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "RAID_LEADER", "RAID_PROMOTE", "RAID_MAINTANK", "RAID_MAINASSIST", "LOOT_PROMOTE", "RAID_DEMOTE", "RAID_REMOVE", "PVP_REPORT_AFK", "CANCEL"}
	Grid2PopupMenus["FRIEND"] = {"WHISPER", "POP_OUT_CHAT", "INVITE", "TARGET", "SET_NOTE", "IGNORE", "REPORT_SPAM", "GUILD_PROMOTE", "GUILD_LEAVE", "PVP_REPORT_AFK", "REMOVE_FRIEND", "CANCEL"}
	Grid2PopupMenus["FRIEND_OFFLINE"] = {"SET_NOTE", "IGNORE", "REMOVE_FRIEND", "CANCEL"}
	Grid2PopupMenus["BN_FRIEND"] = {"WHISPER", "POP_OUT_CHAT", "CREATE_CONVERSATION_WITH", "BN_INVITE", "BN_TARGET", "BN_SET_NOTE", "BN_VIEW_FRIENDS", "BLOCK_COMMUNICATION", "BN_REPORT", "BN_REMOVE_FRIEND", "CANCEL"}
	Grid2PopupMenus["BN_FRIEND_OFFLINE"] = {"BN_SET_NOTE", "BN_VIEW_FRIENDS", "BN_REPORT", "BN_REMOVE_FRIEND", "CANCEL"}
	Grid2PopupMenus["TEAM"] = {"WHISPER", "INVITE", "TARGET", "TEAM_PROMOTE", "TEAM_KICK", "TEAM_LEAVE", "CANCEL"}
	Grid2PopupMenus["RAID_TARGET_ICON"] = {"RAID_TARGET_1", "RAID_TARGET_2", "RAID_TARGET_3", "RAID_TARGET_4", "RAID_TARGET_5", "RAID_TARGET_6", "RAID_TARGET_7", "RAID_TARGET_8", "RAID_TARGET_NONE"}
	Grid2PopupMenus["CHAT_ROSTER"] = {"WHISPER", "TARGET", "MUTE", "UNMUTE", "CHAT_SILENCE", "CHAT_UNSILENCE", "CHAT_PROMOTE", "CHAT_DEMOTE", "CHAT_OWNER", "CANCEL"}
	Grid2PopupMenus["VEHICLE"] = {"RAID_TARGET_ICON", "VEHICLE_LEAVE", "CANCEL"}
	Grid2PopupMenus["TARGET"] = {"RAID_TARGET_ICON", "CANCEL"}
	Grid2PopupMenus["ARENAENEMY"] = {"CANCEL"}
	Grid2PopupMenus["FOCUS"] = {"RAID_TARGET_ICON", "CANCEL"}
	Grid2PopupMenus["BOSS"] = {"RAID_TARGET_ICON", "CANCEL"}

	-- Second level menus
	Grid2PopupMenus["PVP_FLAG"] = {"PVP_ENABLE", "PVP_DISABLE"}
	Grid2PopupMenus["LOOT_METHOD"] = {"FREE_FOR_ALL", "ROUND_ROBIN", "MASTER_LOOTER", "GROUP_LOOT", "NEED_BEFORE_GREED", "CANCEL"}
	Grid2PopupMenus["LOOT_THRESHOLD"] = {"ITEM_QUALITY2_DESC", "ITEM_QUALITY3_DESC", "ITEM_QUALITY4_DESC", "CANCEL"}
	Grid2PopupMenus["OPT_OUT_LOOT_TITLE"] = {"OPT_OUT_LOOT_ENABLE", "OPT_OUT_LOOT_DISABLE"}
	Grid2PopupMenus["DUNGEON_DIFFICULTY"] = {"DUNGEON_DIFFICULTY1", "DUNGEON_DIFFICULTY2"}
	Grid2PopupMenus["RAID_DIFFICULTY"] = {"RAID_DIFFICULTY1", "RAID_DIFFICULTY2", "RAID_DIFFICULTY3", "RAID_DIFFICULTY4"}
	Grid2PopupMenus["BN_REPORT"] = {"BN_REPORT_SPAM", "BN_REPORT_ABUSE", "BN_REPORT_NAME"}

	-- shown popups
	Grid2PopupShown[1] = {}
	Grid2PopupShown[2] = {}
	Grid2PopupShown[3] = {}

	-- loot method.
	Grid2LootMethod["freeforall"] = {text = LOOT_FREE_FOR_ALL, tooltipText = NEWBIE_TOOLTIP_UNIT_FREE_FOR_ALL}
	Grid2LootMethod["roundrobin"] = {text = LOOT_ROUND_ROBIN, tooltipText = NEWBIE_TOOLTIP_UNIT_ROUND_ROBIN}
	Grid2LootMethod["master"] = {text = LOOT_MASTER_LOOTER, tooltipText = NEWBIE_TOOLTIP_UNIT_MASTER_LOOTER}
	Grid2LootMethod["group"] = {text = LOOT_GROUP_LOOT, tooltipText = NEWBIE_TOOLTIP_UNIT_GROUP_LOOT}
	Grid2LootMethod["needbeforegreed"] = {text = LOOT_NEED_BEFORE_GREED, tooltipText = NEWBIE_TOOLTIP_UNIT_NEED_BEFORE_GREED}
end

function Grid2:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData)
	local server = nil
	-- Init variables
	dropdownMenu.which = which
	dropdownMenu.unit = unit
	if (unit) then
		name, server = UnitName(unit)
	elseif (name) then
		local n, s = strmatch(name, "^([^-]+)-(.*)")
		if (n) then
			name = n
			server = s
		end
	end
	dropdownMenu.name = name
	dropdownMenu.userData = userData
	dropdownMenu.server = server

	-- Determine which buttons should be shown or hidden
	Grid2:UnitPopup_HideButtons()

	-- If only one menu item (the cancel button) then don't show the menu
	local count = 0
	for index, value in ipairs(Grid2PopupMenus[which]) do
		if (Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] == 1 and value ~= "CANCEL") then
			count = count + 1
		end
	end
	if (count < 1) then
		return
	end

	-- Determine which loot method and which loot threshold are selected and set the corresponding buttons to the same text
	dropdownMenu.selectedLootMethod = Grid2LootMethod[GetLootMethod()].text
	Grid2PopupButtons["LOOT_METHOD"].text = dropdownMenu.selectedLootMethod
	Grid2PopupButtons["LOOT_METHOD"].tooltipText = Grid2LootMethod[GetLootMethod()].tooltipText
	dropdownMenu.selectedLootThreshold = _G["ITEM_QUALITY" .. GetLootThreshold() .. "_DESC"]
	Grid2PopupButtons["LOOT_THRESHOLD"].text = dropdownMenu.selectedLootThreshold
	-- This allows player to view loot settings if he's not the leader
	if (((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) and IsPartyLeader() and not HasLFGRestrictions()) then
		-- If this is true then player is the party leader
		Grid2PopupButtons["LOOT_METHOD"].nested = 1
		Grid2PopupButtons["LOOT_THRESHOLD"].nested = 1
	else
		Grid2PopupButtons["LOOT_METHOD"].nested = nil
		Grid2PopupButtons["LOOT_THRESHOLD"].nested = nil
	end
	-- Set the selected opt out of loot option to the opt out of loot button text
	if (GetOptOutOfLoot()) then
		Grid2PopupButtons["OPT_OUT_LOOT_TITLE"].text = format(OPT_OUT_LOOT_TITLE, Grid2PopupButtons["OPT_OUT_LOOT_ENABLE"].text)
	else
		Grid2PopupButtons["OPT_OUT_LOOT_TITLE"].text = format(OPT_OUT_LOOT_TITLE, Grid2PopupButtons["OPT_OUT_LOOT_DISABLE"].text)
	end
	-- Disable dungeon and raid difficulty in instances except for for leaders in dynamic instances
	local _, instanceType, _, _, _, _, isDynamicInstance = GetInstanceInfo()
	if (isDynamicInstance and CanChangePlayerDifficulty()) then
		selectedRaidDifficulty, allowedRaidDifficultyChange = _GetPlayerDifficultyMenuOptions()
	end
	if (instanceType == "none") then
		Grid2PopupButtons["DUNGEON_DIFFICULTY"].nested = 1
		Grid2PopupButtons["RAID_DIFFICULTY"].nested = 1
		Grid2PopupButtons["DUNGEON_DIFFICULTY"].disabled = nil
		Grid2PopupButtons["RAID_DIFFICULTY"].disabled = nil
	else
		Grid2PopupButtons["DUNGEON_DIFFICULTY"].nested = nil
		Grid2PopupButtons["DUNGEON_DIFFICULTY"].disabled = 1
		if (allowedRaidDifficultyChange) then
			Grid2PopupButtons["RAID_DIFFICULTY"].nested = 1
			Grid2PopupButtons["RAID_DIFFICULTY"].disabled = nil
		else
			Grid2PopupButtons["RAID_DIFFICULTY"].nested = nil
			Grid2PopupButtons["RAID_DIFFICULTY"].disabled = 1
		end
	end

	--Add the cooldown to the RAF Summon
	do
		local start, duration = GetSummonFriendCooldown()
		local remaining = start + duration - GetTime()
		if (remaining > 0) then
			Grid2PopupButtons["RAF_SUMMON"].text = format(RAF_SUMMON_WITH_COOLDOWN, SecondsToTime(remaining, true))
		else
			Grid2PopupButtons["RAF_SUMMON"].text = RAF_SUMMON
		end
	end

	-- If level 2 dropdown
	local info, color, icon
	if (UIDROPDOWNMENU_MENU_LEVEL == 2) then
		dropdownMenu.which = UIDROPDOWNMENU_MENU_VALUE
		-- Set which menu is being opened
		OPEN_DROPDOWNMENUS[UIDROPDOWNMENU_MENU_LEVEL] = {which = dropdownMenu.which, unit = dropdownMenu.unit}
		info = UIDropDownMenu_CreateInfo()
		for index, value in ipairs(Grid2PopupMenus[UIDROPDOWNMENU_MENU_VALUE]) do
			info.text = Grid2PopupButtons[value].text
			info.owner = UIDROPDOWNMENU_MENU_VALUE
			-- Set the text color
			color = Grid2PopupButtons[value].color
			if (color) then
				info.colorCode = string.format("|cFF%02x%02x%02x", color.r * 255, color.g * 255, color.b * 255)
			else
				info.colorCode = nil
			end
			-- Icons
			info.icon = Grid2PopupButtons[value].icon
			info.tCoordLeft = Grid2PopupButtons[value].tCoordLeft
			info.tCoordRight = Grid2PopupButtons[value].tCoordRight
			info.tCoordTop = Grid2PopupButtons[value].tCoordTop
			info.tCoordBottom = Grid2PopupButtons[value].tCoordBottom
			-- Checked conditions
			info.checked = nil
			if (info.text == dropdownMenu.selectedLootMethod) then
				info.checked = 1
			elseif (info.text == dropdownMenu.selectedLootThreshold) then
				info.checked = 1
			elseif (strsub(value, 1, 12) == "RAID_TARGET_") then
				local raidTargetIndex = GetRaidTargetIndex(unit)
				if (raidTargetIndex == index) then
					info.checked = 1
				end
			elseif (strsub(value, 1, 18) == "DUNGEON_DIFFICULTY" and (strlen(value) > 18)) then
				local dungeonDifficulty = GetDungeonDifficulty()
				if (dungeonDifficulty == index) then
					info.checked = 1
				end
				local inParty = 0
				if ((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) then
					inParty = 1
				end
				local isLeader = 0
				if (IsPartyLeader()) then
					isLeader = 1
				end
				local inInstance = IsInInstance()
				if ((inParty == 1 and isLeader == 0) or inInstance) then
					info.disabled = 1
				end
			elseif (strsub(value, 1, 15) == "RAID_DIFFICULTY" and (strlen(value) > 15)) then
				if (isDynamicInstance) then
					if (selectedRaidDifficulty == index) then
						info.checked = 1
					end
				else
					local dungeonDifficulty = GetRaidDifficulty()
					if (dungeonDifficulty == index) then
						info.checked = 1
					end
				end
				local inParty = 0
				if ((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) then
					inParty = 1
				end
				local isLeader = 0
				if (IsPartyLeader()) then
					isLeader = 1
				end
				local inInstance = IsInInstance()
				if ((inParty == 1 and isLeader == 0) or inInstance) then
					info.disabled = 1
				end
				if (allowedRaidDifficultyChange and allowedRaidDifficultyChange == value) then
					info.disabled = nil
				end
			elseif (value == "PVP_ENABLE") then
				if (GetPVPDesired() == 1) then
					info.checked = 1
				end
			elseif (value == "PVP_DISABLE") then
				if (GetPVPDesired() == 0) then
					info.checked = 1
				end
			elseif (value == "OPT_OUT_LOOT_ENABLE") then
				if (GetOptOutOfLoot()) then
					info.checked = 1
				end
			elseif (value == "OPT_OUT_LOOT_DISABLE") then
				if (not GetOptOutOfLoot()) then
					info.checked = 1
				end
			end

			info.value = value
			info.func = function(self)
				Grid2:UnitPopup_OnClick(self)
			end
			-- Setup newbie tooltips
			info.tooltipTitle = Grid2PopupButtons[value].text
			info.tooltipText = _G["NEWBIE_TOOLTIP_UNIT_" .. value]
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		end
		return
	end

	-- Add dropdown title
	if (unit or name) then
		info = UIDropDownMenu_CreateInfo()
		if (name) then
			info.text = name
		else
			info.text = UNKNOWN
		end
		info.isTitle = 1
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info)
	end

	-- Set which menu is being opened
	OPEN_DROPDOWNMENUS[UIDROPDOWNMENU_MENU_LEVEL] = {which = dropdownMenu.which, unit = dropdownMenu.unit}
	-- Show the buttons which are used by this menu
	local tooltipText
	info = UIDropDownMenu_CreateInfo()
	for index, value in ipairs(Grid2PopupMenus[which]) do
		if (Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] == 1) then
			info.text = Grid2PopupButtons[value].text
			info.value = value
			info.owner = which
			info.func = function(self)
				Grid2:UnitPopup_OnClick(self)
			end
			info.notCheckable = (not Grid2PopupButtons[value].checkable) and 1 or nil
			-- Text color
			if (value == "LOOT_THRESHOLD") then
				-- Set the text color
				info.colorCode = ITEM_QUALITY_COLORS[GetLootThreshold()].hex
			else
				color = Grid2PopupButtons[value].color
				if (color) then
					info.colorCode = string.format("|cFF%02x%02x%02x", color.r * 255, color.g * 255, color.b * 255)
				else
					info.colorCode = nil
				end
			end

			-- Icons
			info.icon = Grid2PopupButtons[value].icon
			info.tCoordLeft = Grid2PopupButtons[value].tCoordLeft
			info.tCoordRight = Grid2PopupButtons[value].tCoordRight
			info.tCoordTop = Grid2PopupButtons[value].tCoordTop
			info.tCoordBottom = Grid2PopupButtons[value].tCoordBottom
			-- Checked conditions
			info.checked = nil
			if (strsub(value, 1, 12) == "RAID_TARGET_" and value ~= "RAID_TARGET_ICON") then
				local raidTargetIndex = GetRaidTargetIndex("target")
				info.checked = (raidTargetIndex == index) and 1 or nil
			end

			if (Grid2PopupButtons[value].nested) then
				info.hasArrow = 1
			else
				info.hasArrow = nil
			end

			-- Setup newbie tooltips
			info.tooltipTitle = Grid2PopupButtons[value].text
			tooltipText = _G["NEWBIE_TOOLTIP_UNIT_" .. value]
			if (not tooltipText) then
				tooltipText = Grid2PopupButtons[value].tooltipText
			end
			info.tooltipText = tooltipText
			UIDropDownMenu_AddButton(info)
		end
	end
	PlaySound("igMainMenuOpen")
end

function Grid2:UnitPopup_HideButtons()
	local dropdownMenu = UIDROPDOWNMENU_INIT_MENU
	local inInstance, instanceType = IsInInstance()
	local inParty = 0
	if ((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) then
		inParty = 1
	end

	local inRaid = 0
	if (GetNumRaidMembers() > 0) then
		inRaid = 1
	end

	local isLeader = 0
	if (IsPartyLeader()) then
		isLeader = 1
	end

	local isAssistant = 0
	if (IsRaidOfficer()) then
		isAssistant = 1
	end

	local inBattleground = 0
	if (UnitInBattleground("player")) then
		inBattleground = 1
	end

	local canCoop = 0
	if (dropdownMenu.unit and UnitCanCooperate("player", dropdownMenu.unit)) then
		canCoop = 1
	end

	for index, value in ipairs(Grid2PopupMenus[dropdownMenu.which]) do
		Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 1
		if (value == "TRADE") then
			if (canCoop == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "INVITE") then
			if (dropdownMenu.unit) then
				local _, server = UnitName(dropdownMenu.unit)
				if (canCoop == 0 or UnitIsUnit("player", dropdownMenu.unit) or (server and server ~= "")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			elseif ((dropdownMenu == PVPDropDown) and not PVPDropDown.online) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (dropdownMenu == ChannelRosterDropDown) then
				if (UnitInRaid(dropdownMenu.name) ~= nil) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			else
				if (dropdownMenu.name == UnitName("party1") or dropdownMenu.name == UnitName("party2") or dropdownMenu.name == UnitName("party3") or dropdownMenu.name == UnitName("party4") or dropdownMenu.name == UnitName("player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "FOLLOW") then
			if (canCoop == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "WHISPER") then
			if (dropdownMenu.unit) then
				if (canCoop == 0 or dropdownMenu.name == UnitName("player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			elseif ((dropdownMenu == PVPDropDown) and not PVPDropDown.online) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "CREATE_CONVERSATION_WITH") then
			if (not dropdownMenu.presenceID or not BNFeaturesEnabledAndConnected()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				local presenceID, givenName, surname, toonName, toonID, client, isOnline =
					BNGetFriendInfoByID(dropdownMenu.presenceID)
				if (not isOnline) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "DUEL") then
			if (UnitCanAttack("player", dropdownMenu.unit)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "INSPECT" or value == "ACHIEVEMENTS") then
			if (not dropdownMenu.unit or UnitCanAttack("player", dropdownMenu.unit)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "IGNORE") then
			if (dropdownMenu.name == UnitName("player") and dropdownMenu.unit and canCoop == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "REMOVE_FRIEND") then
			if (not dropdownMenu.friendsList) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "SET_NOTE") then
			if (not dropdownMenu.friendsList) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "BN_SET_NOTE") then
			if (not dropdownMenu.friendsList) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "BN_VIEW_FRIENDS") then
			if (not dropdownMenu.friendsList) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "BN_REMOVE_FRIEND") then
			if (not dropdownMenu.friendsList) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "BLOCK_COMMUNICATION") then
			-- only show it for presence IDs that are not friends
			if (dropdownMenu.presenceID and BNFeaturesEnabledAndConnected()) then
				local presenceID, givenName, surname, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, broadcastText, noteText, isFriend = BNGetFriendInfoByID(dropdownMenu.presenceID)
				if (isFriend) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			else
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "BN_REPORT") then
			if (not dropdownMenu.presenceID or not BNFeaturesEnabledAndConnected()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "REPORT_SPAM") then
			if (not dropdownMenu.lineID or not CanComplainChat(dropdownMenu.lineID)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "POP_OUT_CHAT") then
			if
				((dropdownMenu.chatType ~= "WHISPER" and dropdownMenu.chatType ~= "BN_WHISPER") or
					dropdownMenu.chatTarget == UnitName("player") or
					FCFManager_GetNumDedicatedFrames(dropdownMenu.chatType, dropdownMenu.chatTarget) > 0)
			 then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "TARGET") then
			-- We don't want to show a menu option that will end up being blocked
			if (InCombatLockdown() or not issecure()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif ((dropdownMenu == PVPDropDown) and not PVPDropDown.online) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PROMOTE") then
			if ((inParty == 0) or (isLeader == 0) or HasLFGRestrictions()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PROMOTE_GUIDE") then
			if ((inParty == 0) or (isLeader == 0) or not HasLFGRestrictions()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "GUILD_PROMOTE") then
			if (not IsGuildLeader() or not UnitIsInMyGuild(dropdownMenu.name) or dropdownMenu.name == UnitName("player") or not GuildFrame:IsShown()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "GUILD_LEAVE") then
			if (dropdownMenu.name ~= UnitName("player") or not GuildFrame:IsShown()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "TEAM_PROMOTE") then
			if (dropdownMenu.name == UnitName("player") or not PVPTeamDetails:IsShown()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (PVPTeamDetails:IsShown() and not IsArenaTeamCaptain(PVPTeamDetails.team)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "TEAM_KICK") then
			if (dropdownMenu.name == UnitName("player") or not PVPTeamDetails:IsShown()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (PVPTeamDetails:IsShown() and not IsArenaTeamCaptain(PVPTeamDetails.team)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "TEAM_LEAVE") then
			if (dropdownMenu.name ~= UnitName("player") or not PVPTeamDetails:IsShown()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "UNINVITE") then
			if ((inParty == 0) or (isLeader == 0) or (instanceType == "pvp") or (instanceType == "arena") or HasLFGRestrictions()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "VOTE_TO_KICK") then
			if ((inParty == 0) or (instanceType == "pvp") or (instanceType == "arena") or (not HasLFGRestrictions())) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "LEAVE") then
			if (inParty == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "FREE_FOR_ALL") then
			if ((inParty == 0) or ((isLeader == 0) and (GetLootMethod() ~= "freeforall"))) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "ROUND_ROBIN") then
			if ((inParty == 0) or ((isLeader == 0) and (GetLootMethod() ~= "roundrobin"))) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "MASTER_LOOTER") then
			if ((inParty == 0) or ((isLeader == 0) and (GetLootMethod() ~= "master"))) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "GROUP_LOOT") then
			if ((inParty == 0) or ((isLeader == 0) and (GetLootMethod() ~= "group"))) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "NEED_BEFORE_GREED") then
			if ((inParty == 0) or ((isLeader == 0) and (GetLootMethod() ~= "needbeforegreed"))) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "LOOT_THRESHOLD") then
			if (inParty == 0 or HasLFGRestrictions()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "OPT_OUT_LOOT_TITLE") then
			if (inParty == 0 or (inParty == 1 and GetLootMethod() == "freeforall")) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "LOOT_PROMOTE") then
			local lootMethod
			local partyIndex, raidIndex
			local isMaster = nil
			lootMethod, partyIndex, raidIndex = GetLootMethod()
			if ((dropdownMenu.which == "RAID") or (dropdownMenu.which == "RAID_PLAYER")) then
				if (raidIndex and (dropdownMenu.unit == "raid" .. raidIndex)) then
					isMaster = 1
				end
			elseif (dropdownMenu.which == "SELF") then
				if (partyIndex and (partyIndex == 0)) then
					isMaster = 1
				end
			else
				if (partyIndex and (dropdownMenu.unit == "party" .. partyIndex)) then
					isMaster = 1
				end
			end
			if ((inParty == 0) or (isLeader == 0) or (lootMethod ~= "master") or isMaster) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "LOOT_METHOD") then
			if (inParty == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "RESET_INSTANCES") then
			if ((inParty == 1 and isLeader == 0) or inInstance) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "DUNGEON_DIFFICULTY") then
			if (UnitLevel("player") < 65 and GetDungeonDifficulty() == 1) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "RAID_DIFFICULTY") then
			if (UnitLevel("player") < 65 and GetRaidDifficulty() == 1) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "MUTE") then
			if (not IsVoiceChatEnabled() or (dropdownMenu.unit and not UnitIsConnected(dropdownMenu.unit))) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				-- Hide if already muted.
				if (dropdownMenu.name == UnitName("player") or IsMuted(dropdownMenu.name)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "UNMUTE") then
			if (not IsVoiceChatEnabled()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				-- Hide if not muted or not online.
				if (dropdownMenu.name == UnitName("player") or not IsMuted(dropdownMenu.name)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "RAID_LEADER") then
			if ((isLeader == 0) or UnitIsPartyLeader(dropdownMenu.unit) or not dropdownMenu.name) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "RAID_PROMOTE") then
			if (isLeader == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (isLeader == 1) then
				if (UnitIsRaidOfficer(dropdownMenu.unit)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "RAID_DEMOTE") then
			if ((isLeader == 0 and isAssistant == 0) or not dropdownMenu.name) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (not GetPartyAssignment("MAINTANK", dropdownMenu.name, 1) and not GetPartyAssignment("MAINASSIST", dropdownMenu.name, 1)) then
				if (isLeader == 0 and isAssistant == 1 and UnitIsRaidOfficer(dropdownMenu.unit)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				elseif (isLeader == 1 or isAssistant == 1) then
					if (UnitIsPartyLeader(dropdownMenu.unit) or not UnitIsRaidOfficer(dropdownMenu.unit)) then
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				end
			end
		elseif (value == "RAID_MAINTANK") then
			-- We don't want to show a menu option that will end up being blocked
			local name, rank, subgroup, level, class, fileName, zone, online, isDead, role = GetRaidRosterInfo(dropdownMenu.userData)
			if (not issecure() or (isLeader == 0 and isAssistant == 0) or (role == "MAINTANK") or not dropdownMenu.name) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "RAID_MAINASSIST") then
			-- We don't want to show a menu option that will end up being blocked
			local name, rank, subgroup, level, class, fileName, zone, online, isDead, role = GetRaidRosterInfo(dropdownMenu.userData)
			if (not issecure() or (isLeader == 0 and isAssistant == 0) or (role == "MAINASSIST") or not dropdownMenu.name) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "RAID_REMOVE") then
			if ((isLeader == 0 and isAssistant == 0) or not dropdownMenu.name) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (isLeader == 0 and isAssistant == 1 and UnitIsRaidOfficer(dropdownMenu.unit)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (isLeader == 1 and UnitIsUnit(dropdownMenu.unit, "player")) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PVP_REPORT_AFK") then
			if (inBattleground == 0 or GetCVar("enablePVPNotifyAFK") == "0") then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			elseif (dropdownMenu.unit) then
				if (UnitIsUnit(dropdownMenu.unit, "player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				elseif (not UnitInBattleground(dropdownMenu.unit)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				elseif (PlayerIsPVPInactive(dropdownMenu.unit)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			elseif (dropdownMenu.name) then
				if (dropdownMenu.name == UnitName("player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				elseif (not UnitInBattleground(dropdownMenu.name)) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "RAF_SUMMON") then
			if (not IsReferAFriendLinked(dropdownMenu.unit)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "RAF_GRANT_LEVEL") then
			if (not IsReferAFriendLinked(dropdownMenu.unit)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PET_PAPERDOLL") then
			if (not PetCanBeAbandoned()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PET_RENAME") then
			if (not PetCanBeAbandoned() or not PetCanBeRenamed()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PET_ABANDON") then
			if (not PetCanBeAbandoned()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "PET_DISMISS") then
			if (PetCanBeAbandoned() or not PetCanBeDismissed()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (strsub(value, 1, 12) == "RAID_TARGET_") then
			-- Task #30755. Let any party member mark targets
			-- Task 34355 - But only raid leaders can mark targets.
			if (inRaid == 1 and isLeader == 0 and isAssistant == 0) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
			if (dropdownMenu.which ~= "SELF") then
				if (UnitExists("target") and not UnitPlayerOrPetInParty("target") and not UnitPlayerOrPetInRaid("target")) then
					if (UnitIsPlayer("target") and (not UnitCanCooperate("player", "target") and not UnitIsUnit("target", "player"))) then
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				end
			end
		elseif (value == "CHAT_PROMOTE") then
			if (dropdownMenu.category == "CHANNEL_CATEGORY_GROUP") then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (not IsDisplayChannelOwner() or dropdownMenu.owner or dropdownMenu.moderator or dropdownMenu.name == UnitName("player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "CHAT_DEMOTE") then
			if (dropdownMenu.category == "CHANNEL_CATEGORY_GROUP") then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (not IsDisplayChannelOwner() or dropdownMenu.owner or not dropdownMenu.moderator or dropdownMenu.name == UnitName("player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "CHAT_OWNER") then
			if (dropdownMenu.category == "CHANNEL_CATEGORY_GROUP") then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (not IsDisplayChannelOwner() or dropdownMenu.owner or dropdownMenu.name == UnitName("player")) then
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "CHAT_SILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (IsDisplayChannelModerator() and dropdownMenu.name ~= UnitName("player")) then
					if (IsSilenced(dropdownMenu.name)) then
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "CHAT_UNSILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (IsDisplayChannelModerator()) then
					if (not IsSilenced(dropdownMenu.name)) then
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "PARTY_SILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if ((inParty == 1 and isLeader == 1 and inRaid == 0) and dropdownMenu.name ~= UnitName("player")) then
					if (UnitIsSilenced(dropdownMenu.name, "party")) then
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
					dropdownMenu.channelName = "party"
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "PARTY_UNSILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (inParty == 1 and isLeader == 1 and inRaid == 0) then
					if (not UnitIsSilenced(dropdownMenu.name, "party")) then
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
					dropdownMenu.channelName = "party"
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "RAID_SILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (inBattleground == 0) then
					if ((inParty == 1 and isAssistant == 1 and inRaid == 1) and dropdownMenu.name ~= UnitName("player")) then
						if (UnitIsSilenced(dropdownMenu.name, "raid")) then
							Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
						end
						dropdownMenu.channelName = "raid"
					else
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "RAID_UNSILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (inBattleground == 0) then
					if (inParty == 1 and isAssistant == 1 and inRaid == 1) then
						if (not UnitIsSilenced(dropdownMenu.name, "raid")) then
							Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
						end
						dropdownMenu.channelName = "raid"
					else
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "BATTLEGROUND_SILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (inBattleground == 1) then
					if ((inParty == 1 and isAssistant == 1 and inRaid == 1) and dropdownMenu.name ~= UnitName("player")) then
						if (UnitIsSilenced(dropdownMenu.name, "battleground")) then
							Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
						end
						dropdownMenu.channelName = "battleground"
					else
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "BATTLEGROUND_UNSILENCE") then
			if (not IsVoiceChatEnabled() or not dropdownMenu.name or dropdownMenu.name == UNKNOWNOBJECT or not GetVoiceStatus(dropdownMenu.name)) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			else
				if (inBattleground == 1) then
					if (inParty == 1 and isAssistant == 1 and inRaid == 1) then
						if (not UnitIsSilenced(dropdownMenu.name, "battleground")) then
							Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
						end
						dropdownMenu.channelName = "battleground"
					else
						Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
					end
				else
					Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
				end
			end
		elseif (value == "CHAT_KICK") then
			Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
		elseif (value == "CHAT_LEAVE") then
			if (not dropdownMenu.active or dropdownMenu.group) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		elseif (value == "VEHICLE_LEAVE") then
			if (not CanExitVehicle()) then
				Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0
			end
		end
	end
end

function Grid2:UnitPopup_OnUpdate(elapsed, frame)
	if (not DropDownList1:IsShown()) then
		return
	end

	local currentDropDown = UIDROPDOWNMENU_OPEN_MENU

	local inParty = 0
	if ((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) then
		inParty = 1
	end

	local isLeader = 0
	if (IsPartyLeader()) then
		isLeader = 1
	end
	local isAssistant = 0
	if (IsRaidOfficer()) then
		isAssistant = 1
	end

	-- dynamic difficulty
	local allowedRaidDifficultyChange
	local _, instanceType, _, _, _, _, isDynamicInstance = GetInstanceInfo()
	if (isDynamicInstance and CanChangePlayerDifficulty()) then
		_, allowedRaidDifficultyChange = _GetPlayerDifficultyMenuOptions()
	end

	-- Loop through all menus and enable/disable their buttons appropriately
	local count, tempCount
	local inInstance = IsInInstance()
	for level, dropdownFrame in pairs(OPEN_DROPDOWNMENUS) do
		if (dropdownFrame and Grid2PopupMenus[dropdownFrame.which]) then
			count = 0
			for index, value in ipairs(Grid2PopupMenus[dropdownFrame.which]) do
				if (Grid2PopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] == 1) then
					count = count + 1
					local enable = 1
					if (Grid2PopupButtons[value].dist > 0) then
						if (not CheckInteractDistance(dropdownFrame.unit, Grid2PopupButtons[value].dist)) then
							enable = 0
						end
					end

					if (value == "TRADE") then
						if (UnitIsDeadOrGhost("player") or (not HasFullControl()) or UnitIsDeadOrGhost(dropdownFrame.unit)) then
							enable = 0
						end
					elseif (value == "LEAVE") then
						if (inParty == 0) then
							enable = 0
						end
					elseif (value == "INVITE") then
						if ((inParty == 1 and (isLeader == 0 and isAssistant == 0)) or currentDropDown.server) then
							enable = 0
						end
					elseif (value == "UNINVITE") then
						if (inParty == 0 or (isLeader == 0) or HasLFGRestrictions()) then
							enable = 0
						end
					elseif (value == "BN_INVITE" or value == "BN_TARGET") then
						if (not currentDropDown.presenceID or not CanCooperateWithToon(currentDropDown.presenceID)) then
							enable = 0
						end
					elseif (value == "VOTE_TO_KICK") then
						if (inParty == 0 or not HasLFGRestrictions()) then
							enable = 0
						end
					elseif (value == "PROMOTE" or value == "PROMOTE_GUIDE") then
						if (inParty == 0 or isLeader == 0 or (dropdownFrame.unit and not UnitIsConnected(dropdownFrame.unit))) then
							enable = 0
						end
					elseif (value == "WHISPER") then
						if (dropdownFrame.unit and not UnitIsConnected(dropdownFrame.unit)) then
							enable = 0
						end
					elseif (value == "MUTE") then
						if (dropdownFrame.unit and not UnitIsConnected(dropdownFrame.unit)) then
							enable = 0
						end
					elseif (value == "INSPECT") then
						if (UnitIsDeadOrGhost("player")) then
							enable = 0
						end
					elseif (value == "FOLLOW") then
						if (UnitIsDead("player")) then
							enable = 0
						end
					elseif (value == "DUEL") then
						if (UnitIsDeadOrGhost("player") or (not HasFullControl()) or UnitIsDeadOrGhost(dropdownFrame.unit)) then
							enable = 0
						end
					elseif (value == "LOOT_METHOD") then
						if (isLeader == 0 or HasLFGRestrictions()) then
							enable = 0
						end
					elseif (value == "LOOT_PROMOTE") then
						local lootMethod
						local partyMaster, raidMaster
						lootMethod, partyMaster, raidMaster = GetLootMethod()
						if ((inParty == 0) or (isLeader == 0) or (lootMethod ~= "master")) then
							enable = 0
						else
							local masterName = 0
							if (partyMaster and (partyMaster == 0)) then
								masterName = "player"
							elseif (partyMaster) then
								masterName = "party" .. partyMaster
							elseif (raidMaster) then
								masterName = "raid" .. raidMaster
							end
							if (dropdownFrame.unit and UnitIsUnit(dropdownFrame.unit, masterName)) then
								enable = 0
							end
						end
					elseif (value == "DUNGEON_DIFFICULTY" and inInstance) then
						enable = 0
					elseif ((strsub(value, 1, 18) == "DUNGEON_DIFFICULTY") and (strlen(value) > 18)) then
						if ((inParty == 1 and isLeader == 0) or inInstance or HasLFGRestrictions()) then
							enable = 0
						end
					elseif (value == "RAID_DIFFICULTY" and inInstance and not allowedRaidDifficultyChange) then
						enable = 0
					elseif ((strsub(value, 1, 15) == "RAID_DIFFICULTY") and (strlen(value) > 15)) then
						if ((inParty == 1 and isLeader == 0) or inInstance) then
							enable = 0
						end
						if (allowedRaidDifficultyChange and allowedRaidDifficultyChange == value) then
							enable = 1
						end
					elseif (value == "RESET_INSTANCES") then
						if ((inParty == 1 and isLeader == 0) or inInstance or HasLFGRestrictions()) then
							enable = 0
						end
					elseif (value == "RAF_SUMMON") then
						if (not CanSummonFriend(dropdownFrame.unit)) then
							enable = 0
						end
					elseif (value == "RAF_GRANT_LEVEL") then
						if (not CanGrantLevel(dropdownFrame.unit)) then
							enable = 0
						end
					end

					if (level > 1) then
						tempCount = count
					else
						tempCount = count + 1
					end

					if (enable == 1) then
						UIDropDownMenu_EnableButton(level, tempCount)
					else
						UIDropDownMenu_DisableButton(level, tempCount)
					end
				end
			end
		end
	end
end

function Grid2:UnitPopup_OnClick(btn)
	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
	local button = btn.value
	local unit = dropdownFrame.unit
	local name = dropdownFrame.name
	local server = dropdownFrame.server
	local fullname = name

	if (server and (not unit or not UnitIsSameServer("player", unit))) then
		fullname = name .. "-" .. server
	end

	local isLeader = 0
	if (IsPartyLeader()) then
		isLeader = 1
	end

	if (button == "TRADE") then
		InitiateTrade(unit)
	elseif (button == "WHISPER") then
		ChatFrame_SendTell(fullname, dropdownFrame.chatFrame)
	elseif (button == "CREATE_CONVERSATION_WITH") then
		BNConversationInvite_NewConversation(dropdownFrame.presenceID)
	elseif (button == "INSPECT") then
		InspectUnit(unit)
	elseif (button == "ACHIEVEMENTS") then
		InspectAchievements(unit)
	elseif (button == "TARGET") then
		TargetUnit(fullname, 1)
	elseif (button == "IGNORE") then
		AddOrDelIgnore(fullname)
	elseif (button == "REPORT_SPAM") then
		local dialog = StaticPopup_Show("CONFIRM_REPORT_SPAM_CHAT", name)
		if (dialog) then
			dialog.data = dropdownFrame.lineID
		end
	elseif (button == "POP_OUT_CHAT") then
		FCF_OpenTemporaryWindow(dropdownFrame.chatType, dropdownFrame.chatTarget, dropdownFrame.chatFrame, true)
	elseif (button == "DUEL") then
		StartDuel(unit, 1)
	elseif (button == "INVITE") then
		InviteUnit(fullname)
	elseif (button == "UNINVITE" or button == "VOTE_TO_KICK") then
		UninviteUnit(fullname)
	elseif (button == "REMOVE_FRIEND") then
		RemoveFriend(name)
	elseif (button == "SET_NOTE") then
		FriendsFrame.NotesID = name
		StaticPopup_Show("SET_FRIENDNOTE", name)
		PlaySound("igCharacterInfoClose")
	elseif (button == "BN_REMOVE_FRIEND") then
		local presenceID, givenName, surname = BNGetFriendInfoByID(dropdownFrame.presenceID)
		local dialog = StaticPopup_Show("CONFIRM_REMOVE_FRIEND", string.format(BATTLENET_NAME_FORMAT, givenName, surname))
		if (dialog) then
			dialog.data = presenceID
		end
	elseif (button == "BN_SET_NOTE") then
		FriendsFrame.NotesID = dropdownFrame.presenceID
		StaticPopup_Show("SET_BNFRIENDNOTE", name)
		PlaySound("igCharacterInfoClose")
	elseif (button == "BN_VIEW_FRIENDS") then
		FriendsFriendsFrame_Show(dropdownFrame.presenceID)
	elseif (button == "BN_INVITE") then
		local presenceID, givenName, surname, toonName = BNGetFriendInfoByID(dropdownFrame.presenceID)
		if (toonName) then
			InviteUnit(toonName)
		end
	elseif (button == "BN_TARGET") then
		local presenceID, givenName, surname, toonName = BNGetFriendInfoByID(dropdownFrame.presenceID)
		if (toonName) then
			TargetUnit(toonName, 1)
		end
	elseif (button == "BLOCK_COMMUNICATION") then
		BNSetToonBlocked(dropdownFrame.presenceID, true)
	elseif (button == "PROMOTE" or button == "PROMOTE_GUIDE") then
		PromoteToLeader(unit, 1)
	elseif (button == "GUILD_PROMOTE") then
		local dialog = StaticPopup_Show("CONFIRM_GUILD_PROMOTE", name)
		dialog.data = name
	elseif (button == "GUILD_LEAVE") then
		StaticPopup_Show("CONFIRM_GUILD_LEAVE", GetGuildInfo("player"))
	elseif (button == "TEAM_PROMOTE") then
		local dialog = StaticPopup_Show("CONFIRM_TEAM_PROMOTE", name, GetArenaTeam(PVPTeamDetails.team))
		if (dialog) then
			dialog.data = PVPTeamDetails.team
			dialog.data2 = name
		end
	elseif (button == "TEAM_KICK") then
		local dialog = StaticPopup_Show("CONFIRM_TEAM_KICK", name, GetArenaTeam(PVPTeamDetails.team))
		if (dialog) then
			dialog.data = PVPTeamDetails.team
			dialog.data2 = name
		end
	elseif (button == "TEAM_LEAVE") then
		local dialog = StaticPopup_Show("CONFIRM_TEAM_LEAVE", GetArenaTeam(PVPTeamDetails.team))
		if (dialog) then
			dialog.data = PVPTeamDetails.team
		end
	elseif (button == "LEAVE") then
		LeaveParty()
	elseif (button == "PET_DISMISS") then
		PetDismiss()
	elseif (button == "PET_ABANDON") then
		StaticPopup_Show("ABANDON_PET")
	elseif (button == "PET_PAPERDOLL") then
		--If the frame is already shown, but turned to a different tab (mounts or companions), just change tabs
		if (PetPaperDollFrame.selectedTab == 1 or (not PetPaperDollFrame:IsVisible())) then
			ToggleCharacter("PetPaperDollFrame")
		end
		PetPaperDollFrame_SetTab(1)
	elseif (button == "PET_RENAME") then
		StaticPopup_Show("RENAME_PET")
	elseif (button == "FREE_FOR_ALL") then
		SetLootMethod("freeforall")
		UIDropDownMenu_SetButtonText(btn:GetParent().parentLevel, btn:GetParent().parentID, Grid2PopupButtons[button].text)
		UIDropDownMenu_Refresh(dropdownFrame, nil, 1)
	elseif (button == "ROUND_ROBIN") then
		SetLootMethod("roundrobin")
		UIDropDownMenu_SetButtonText(btn:GetParent().parentLevel, btn:GetParent().parentID, Grid2PopupButtons[button].text)
		UIDropDownMenu_Refresh(dropdownFrame, nil, 1)
	elseif (button == "MASTER_LOOTER") then
		SetLootMethod("master", fullname)
		UIDropDownMenu_SetButtonText(btn:GetParent().parentLevel, btn:GetParent().parentID, Grid2PopupButtons[button].text)
		UIDropDownMenu_Refresh(dropdownFrame, nil, 1)
	elseif (button == "GROUP_LOOT") then
		SetLootMethod("group")
		UIDropDownMenu_SetButtonText(btn:GetParent().parentLevel, btn:GetParent().parentID, Grid2PopupButtons[button].text)
		UIDropDownMenu_Refresh(dropdownFrame, nil, 1)
	elseif (button == "NEED_BEFORE_GREED") then
		SetLootMethod("needbeforegreed")
		UIDropDownMenu_SetButtonText(btn:GetParent().parentLevel, btn:GetParent().parentID, Grid2PopupButtons[button].text)
		UIDropDownMenu_Refresh(dropdownFrame, nil, 1)
	elseif (button == "OPT_OUT_LOOT_ENABLE") then
		SetOptOutOfLoot(1)
		CloseDropDownMenus()
	elseif (button == "OPT_OUT_LOOT_DISABLE") then
		SetOptOutOfLoot(nil)
		CloseDropDownMenus()
	elseif (strsub(button, 1, 18) == "DUNGEON_DIFFICULTY" and (strlen(button) > 18)) then
		local dungeonDifficulty = tonumber(strsub(button, 19, 19))
		SetDungeonDifficulty(dungeonDifficulty)
	elseif (strsub(button, 1, 15) == "RAID_DIFFICULTY" and (strlen(button) > 15)) then
		local raidDifficulty = tonumber(strsub(button, 16, 16))
		SetRaidDifficulty(raidDifficulty)
	elseif (button == "LOOT_PROMOTE") then
		SetLootMethod("master", fullname, 1)
	elseif (button == "PVP_ENABLE") then
		SetPVP(1)
	elseif (button == "PVP_DISABLE") then
		SetPVP(nil)
	elseif (button == "RESET_INSTANCES") then
		StaticPopup_Show("CONFIRM_RESET_INSTANCES")
	elseif (button == "FOLLOW") then
		FollowUnit(fullname, 1)
	elseif (button == "MUTE") then
		AddMute(fullname)
	elseif (button == "UNMUTE") then
		DelMute(fullname)
	elseif (button == "RAID_LEADER") then
		PromoteToLeader(fullname, 1)
	elseif (button == "RAID_PROMOTE") then
		PromoteToAssistant(fullname, 1)
	elseif (button == "RAID_DEMOTE") then
		if (isLeader == 1 and UnitIsRaidOfficer(unit)) then
			DemoteAssistant(fullname, 1)
		end
		if (GetPartyAssignment("MAINTANK", fullname, 1)) then
			ClearPartyAssignment("MAINTANK", fullname, 1)
		elseif (GetPartyAssignment("MAINASSIST", fullname, 1)) then
			ClearPartyAssignment("MAINASSIST", fullname, 1)
		end
	elseif (button == "RAID_MAINTANK") then
		SetPartyAssignment("MAINTANK", fullname, 1)
	elseif (button == "RAID_MAINASSIST") then
		SetPartyAssignment("MAINASSIST", fullname, 1)
	elseif (button == "RAID_REMOVE") then
		UninviteUnit(fullname)
	elseif (button == "PVP_REPORT_AFK") then
		ReportPlayerIsPVPAFK(fullname)
	elseif (button == "RAF_SUMMON") then
		SummonFriend(unit)
	elseif (button == "RAF_GRANT_LEVEL") then
		GrantLevel(unit)
	elseif (button == "ITEM_QUALITY2_DESC" or button == "ITEM_QUALITY3_DESC" or button == "ITEM_QUALITY4_DESC") then
		local id = btn:GetID() + 1
		SetLootThreshold(id)
		UIDropDownMenu_SetButtonText(btn:GetParent().parentLevel, btn:GetParent().parentID, Grid2PopupButtons[button].text)
	elseif (strsub(button, 1, 12) == "RAID_TARGET_" and button ~= "RAID_TARGET_ICON") then
		local raidTargetIndex = strsub(button, 13)
		if (raidTargetIndex == "NONE") then
			raidTargetIndex = 0
		end
		SetRaidTargetIcon(unit, tonumber(raidTargetIndex))
	elseif (button == "CHAT_PROMOTE") then
		ChannelModerator(dropdownFrame.channelName, fullname)
	elseif (button == "CHAT_DEMOTE") then
		ChannelUnmoderator(dropdownFrame.channelName, fullname)
	elseif (button == "CHAT_OWNER") then
		SetChannelOwner(dropdownFrame.channelName, fullname)
	elseif (button == "CHAT_SILENCE" or button == "PARTY_SILENCE" or button == "RAID_SILENCE" or button == "BATTLEGROUND_SILENCE") then
		ChannelSilenceVoice(dropdownFrame.channelName, fullname)
	elseif (button == "CHAT_UNSILENCE" or button == "PARTY_UNSILENCE" or button == "RAID_UNSILENCE" or button == "BATTLEGROUND_UNSILENCE") then
		ChannelUnSilenceVoice(dropdownFrame.channelName, fullname)
	elseif (button == "CHAT_KICK") then
		ChannelKick(dropdownFrame.channelName, fullname)
	elseif (button == "CHAT_BAN") then
		ChannelBan(dropdownFrame.channelName, fullname)
	elseif (button == "VEHICLE_LEAVE") then
		VehicleExit()
	elseif (strsub(button, 1, 10) == "BN_REPORT_") then
		BNet_InitiateReport(dropdownFrame.presenceID, strsub(button, 11))
	end
	PlaySound("UChatScrollButton")
end