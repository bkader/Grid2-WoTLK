local L =  LibStub:GetLibrary("AceLocale-3.0"):NewLocale("Grid2Options", "zhTW")
if not L then return end

--{{{ General options
L["GRID2_WELCOME"] = "歡迎使用 Grid2"
L["GRID2_DESC"] = "Grid2 隊伍&團隊框架插件，以清楚明瞭的顯示方式提供隊伍&團隊成員的生命及重要資訊。"

L["General Settings"] = "一般設置"

L["statuses"] = "狀態"
L["indicators"] = "指標"

L["Frames"] = "框架"
L["frame"] = "框架"

L["Default Font"] = "預設字型"

L["Invert Bar Color"] = "反轉顏色"
L["Swap foreground/background colors on bars."] = "交換狀態條上前景/背景的顏色。"

L["Background Color"] = "背景顏色"
L["Sets the background color of each unit frame"] = "設定每一個單位框架的背景顏色"

L["Mouseover Highlight"] = "啟用滑鼠懸停高亮"
L["Toggle mouseover highlight."] = "啟用/禁用滑鼠懸停高亮。"

L["Show Tooltip"] = "顯示提示訊息"
L["Show unit tooltip.  Choose 'Always', 'Never', or 'OOC'."] = "顯示單位框架的提示訊息。選擇“總是”，“不顯示”或“非戰鬥”。"
L["Always"] = "總是"
L["Never"] = "不顯示"
L["OOC"] = "離開戰鬥"

L["Background Texture"] = "背景材質"
L["Select the frame background texture."] = "選擇框架背景材質"

L["Tile"] = "標題"
L["Tile the background texture."] = "標題的背景材質。"

L["Tile size"] = "標題大小"
L["The size of the texture pattern."] = "材質圖案的大小"

L["Inner Border Size"] = "內邊框尺寸"
L["Sets the size of the inner border of each unit frame"] = "設定每一個單位框架的內框大小"

L["Inner Border Color"] = "內邊框顏色"
L["Sets the color of the inner border of each unit frame"] = "設定每一個單位框架的內框顏色"

L["Frame Width"] = "框架寬度"
L["Adjust the width of each unit's frame."] = "調整各單位框架的寬度。"

L["Frame Height"] = "框架高度"
L["Adjust the height of each unit's frame."] = "調整各單位框架的高度。"

L["Orientation of Frame"] = "框架方向"
L["Set frame orientation."] = "設定框架方向。"
L["VERTICAL"] = "垂直"
L["HORIZONTAL"] = "水平"

L["Orientation of Text"] = "文字排列方式"
L["Set frame text orientation."] = "設定框架中文字排列方式。"

L["Show Frame"] = "顯示框架"
L["Sets when the Grid is visible: Choose 'Always', 'Grouped', or 'Raid'."] = "選擇什麼時候顯示 Grid：'總是'、'組隊'或'團隊'。"
L["Always"] = "總是"
L["Grouped"] = "組隊"
L["Raid"] = "團隊"

L["Layout Anchor"] = "佈局錨點"
L["Sets where Grid is anchored relative to the screen."] = "設定螢幕中 Grid 的錨點。"

L["Horizontal groups"] = "水平排列隊伍"
L["Switch between horzontal/vertical groups."] = "選擇水平/垂直排列隊伍。"
L["Clamped to screen"] = "限制在螢幕內"
L["Toggle whether to permit movement out of screen."] = "打開/關閉是否允許把框架移到超出螢幕的位置。"
L["Frame lock"] = "鎖定框架"
L["Locks/unlocks the grid for movement."] = "鎖定/解鎖 Grid 框架來讓其移動。"
L["Click through the Grid Frame"] = "透過 Grid 框架點擊"
L["Allows mouse click through the Grid Frame."] = "是否允許滑鼠透過 Grid 框架點擊。"

L["Display"] = "顯示"
L["Padding"] = "填白"
L["Adjust frame padding."] = "調整框架填白。"
L["Spacing"] = "空隙"
L["Adjust frame spacing."] = "調整框架空隙。"
L["Scale"] = "縮放"
L["Adjust Grid scale."] = "調整框架縮放。"

L["Group Anchor"] = "隊伍錨點"
L["Position and Anchor"] = "位置與錨點"
L["Sets where groups are anchored relative to the layout frame."] = "設定佈局中隊伍的錨點。"
L["Resets the layout frame's position and anchor."] = "重置佈局框架的位置和錨點。"

-- L["Frame Strata"] = ""
-- L["Sets the strata in which the layout frame should be layered."] = ""
-- L["BACKGROUND"] = ""
-- L["LOW"] = ""
-- L["MEDIUM"] = ""
-- L["HIGH"] = ""

--blink
L["Misc"] = "雜項"
L["blink"] = "閃爍"
L["Blink effect"] = "閃爍效果"
L["Select the type of Blink effect used by Grid2."] = "選擇 Grid2 閃爍效果。"
L["None"] = "無"
L["Blink"] = "閃爍"
L["Flash"] = "閃光"
L["Blink Frequency"] = "閃爍頻率"
L["Adjust the frequency of the Blink effect."] = "調整閃爍效果頻率。"

-- text formatting
L["Text Formatting"] = "文字格式"
L["Duration Format"] = "持續時間格式"
-- L["Examples:\n(%d)\n%d seconds"] = ""
L["Duration+Stacks Format"] = "持續時間及堆疊格式"
-- L["Examples:\n%d/%s\n%s(%d)"] = ""
L["Display tenths of a second"] = "顯示到1/10秒"
L["When duration<1sec"] = "當持續時間小於1秒"

-- misc
L["Blizzard Raid Frames"] = "暴風雪團隊框架"
L["Hide Blizzard Raid Frames on Startup"] = "啟動後隱藏暴風雪團隊框架"

-- debugging & maintenance
L["debugging"] = "除錯中"
L["Module debugging menu."] = "除錯模組菜單。"
L["Debug"] = "除錯"
L["Reset"] = "重設"
L["Reset and ReloadUI."] = "重設且重載UI"
L["Reset Setup"] = "重新設定"
L["Reset current setup and ReloadUI."] = "重設目前的設定並重載UI"
L["Reset Indicators"] = "重設指標"
L["Reset indicators to defaults."] = "重設指標回預設值"
L["Reset Locations"] = "重設位置"
L["Reset locations to the default list."] = "重設位置至預設清單"
L["Reset to defaults."] = "重設至預設設定"
L["Reset Statuses"] = "重設狀態"
L["Reset statuses to defaults."] = "重設狀態至預設清單"

L["Warning! This option will delete all settings and profiles, are you sure ?"] = "警告！這個選項會刪除所有的設定值和設定檔，你確定嗎？"

L["About"] = "關於"

--{{{ Layouts options
L["Layout"] = "佈局"
L["Layouts"] = "佈局"
L["layout"] = "佈局"
L["Layouts for each type of groups you're in."] = "你所在組的佈局類型。"
L["Layout Settings"] = "佈局設置"
L["Solo Layout"] = "單人佈局"
L["Select which layout to use for solo."] = "選擇使用哪個單人佈局。"
L["Party Layout"] = "隊伍佈局"
L["Select which layout to use for party."] = "選擇使用哪個隊伍佈局。"
L["Raid %s Layout"] = "團隊 %s 佈局"
L["Select which layout to use for %s person raids."] = "選擇使用%s人團隊佈局。"
L["Battleground Layout"] = "戰場佈局"
L["Select which layout to use for battlegrounds."] = "選擇使用哪個戰場佈局。"
L["Arena Layout"] = "競技場佈局"
L["Select which layout to use for arenas."] = "選擇使用哪個競技場佈局。"
L["Test"] = "測試"
L["Test the layout."] = "測試佈局"
L["Select Layout"] = "選擇佈局"
L["New Layout Name"] = "新佈局名稱"
L["Delete selected layout"] = "刪除所選擇的佈局"
L["Refresh"] = "更新"
L["Refresh the Layout"] = "更新佈局"
L["Toggle for vehicle"] = "隨載具切換"
L["When the player is in a vehicle replace the player frame with the vehicle frame."] = "當玩家騎乘載具時以載具框架代替玩家框架"
L["Header"] = "標頭"
L["Type of units to display"] = "顯示單位類別"
L["Columns"] = "列"
L["Maximum number of columns to display"] = "最多顯示列數"
L["Units/Column"] = "單位/列"
L["Maximum number of units per column to display"] = "每一列最多顯示單位數"
L["First group"] = "首隊"
L["First group to display"] = "第一個顯示的小隊"
L["Last Group"] = "末隊"
L["Last group to display"] = "最後顯示的小隊"
L["Group by"] = "分組依據"
L["Sort by"] = "排序依據"
L["Action"] = "指令"
L["all"] = "全部"
L["Class"] = "職業"
L["Group"] = "小隊"
L["Role"] = "角色"
L["Name"] = "名稱"
L["Index"] = "索引"
L["party"] = "隊伍"
L["raid"] = "團隊"
L["partypet"] = "隊伍寵物"
L["raidpet"] = "團隊寵物"
L["Insert"] = "插入"
L["Copy"] = "複製"

--{{{ Miscelaneous
L["New"] = "新增"
L["Order"] = "命令"
L["Delete"] = "刪除"
L["Color"] = "顏色"
L["Color %d"] = "顏色 %d"
L["Color for %s."] = "%s的顏色。"
L["Font"] = "字型"
L["Font Border"] = "字型外框"
L["Thin"] = "細"
L["Thick"] = "粗"
L["Soft"] = "柔和"
L["Sharp"] = "銳利"
L["Adjust the font settings"] = "調整字型設定"
L["Border Texture"] = "邊框材質"
L["Adjust the border texture."] = "調整邊框材質"
L["Border"] = "邊框"
L["Border Color"] = "邊框顏色"
L["Background"] = "背景"
L["Enable Background"] = "啟用背景"
L["Adjust border color and alpha."] = "調整邊框的顏色和透明度。"
L["Adjust background color and alpha."] = "調整背景顏色和透明度。"
L["Opacity"] = "透明度"
L["Set the opacity."] = "設定透明度"
L["<CharacterOnlyString>"] = "從字符串組成唯一文字"
L["Options for %s."] = "%s狀態的選項。"
L["Delete this element"] = "刪除這個元素"

--{{{ Indicator management
L["New Indicator"] = "新指標"
L["Create Indicator"] = "建立指標"
L["Create a new indicator."] = "建立新的指標"
L["Name of the new indicator"] = "新指標名稱"
L["Enable or disable test mode for indicators"] = "啟用或禁用指標的測試模式"
L["Appearance"] = "外觀"
L["Adjust the border size of the indicator."] = "調整指標的邊框尺寸"
L["Stack Text"] = "堆疊文字"
L["Disable Stack Text"] = "禁用堆疊文字"
L["Disable Cooldown"] = "禁用冷卻"
L["Disable the Cooldown Frame"] = "禁用冷卻框架"
L["Reverse Cooldown"] = "反向冷卻"
L["Set cooldown to become darker over time instead of lighter."] = "將冷卻設為隨時間變暗而非變亮"
L["Cooldown"] = "冷卻"
L["Text Location"] = "文字位置"
L["Disable OmniCC"] = "禁用OmniCC"
-- L["Animations"] = ""
-- L["Enable animation"] = ""
-- L["Turn on/off zoom animation of icons."] = ""
-- L["Duration"] = ""
-- L["Sets the duration in seconds."] = ""
L["Scale"] = "縮放"
-- L["Sets the zoom factor."] = ""

L["Type"] = "類型"
L["Type of indicator"] = "指標類型"
L["Type of indicator to create"] = "建立指標類型"
L["Change type"] = "改變類型"
L["Change the indicator type"] = "改變指標類型"

L["Text Length"] = "文字長度"
L["Maximum number of characters to show."] = "顯示最多數量文字"
L["Font Size"] = "字型尺寸"
L["Adjust the font size."] = "調整字型尺寸。"
L["Size"] = "尺寸"
L["Adjust the size of the indicator."] = "調整指標的尺寸。"
L["Width"] = "寬度"
L["Adjust the width of the indicator."] = "調整指標寬度"
L["Height"] = "高度"
L["Adjust the height of the indicator."] = "調整指標高度"
L["Rectangle"] = "矩形"
L["Allows to independently adjust width and height."] = "允許分別調整寬度和高度"
L["Use Status Color"] = "使用狀態顏色"
L["Always use the status color for the border"] = "總是使用狀態顏色邊框"

L["Frame Texture"] = "框架材質"
L["Adjust the frame texture."] = "調整框架材質"

L["Show stack"] = "顯示堆疊"
L["Show the number of stacks."] = "顯示堆疊數"
L["Show duration"] = "顯示持續時間"
L["Show the time remaining."] = "顯示剩餘時間"
L["Show elapsed time"] = "顯示經過時間"
L["Show the elapsed time."] = "顯示已經過的時間"
L["Show percent"] = "顯示百分比"
L["Show percent value"] = "顯示百分比數值"

L["Orientation of the Bar"] = "狀態條增長方向"
L["Set status bar orientation."] = "設定狀態條的增長方向"
L["DEFAULT"] = "預設"
L["Frame Level"] = "框架層級"
L["Bars with higher numbers always show up on top of lower numbers."] = "層級數字較大的狀態條將優先顯示"
L["Bar Width"] = "狀態條寬度"
L["Choose zero to set the bar to the same width as parent frame"] = "0表示與父框架同寬度"
L["Bar Height"] = "狀態條高度"
L["Choose zero to set the bar to the same height as parent frame"] = "0表示與父框架同高度"
L["Anchor to"] = "定位於"
L["Anchor the indicator to the selected bar."] = "將指標定位於所選擇的狀態條"

L["Border Size"] = "邊框尺寸"
L["Adjust the border of each unit's frame."] = "調整所有框架的邊框"
L["Border Background Color"] = "邊框背景顏色"
L["Adjust border background color and alpha."] = "調整邊框顏色和透明度"
L["Border separation"] = "邊框間距"
L["Adjust the distance between the border and the frame content."] = "調整邊框和框架內容的間距"

L["Select statuses to display with the indicator"] = "選擇指標要顯示的狀態"
L["Available Statuses"] = "可用狀態"
L["Available statuses you may add"] = "可自行增加的狀態"
L["Current Statuses"] = "目前狀態"
L["Current statuses in order of priority"] = "目前狀態的優先權順序"
L["Move the status higher in priority"] = "提高狀態優先權"
L["Move the status lower in priority"] = "降低狀態優先權"

L["indicator"] = "指標"

-- L["Maintenance"] = ""
-- L["Create"] = ""
-- L["Icon"] = ""
-- L["Max Icons"] = ""
-- L["Icons per row"] = ""
-- L["Icon Size"] = ""
-- L["Icon Spacing"] = ""
-- L["Direction"] = ""
-- L["Select the direction of the main bar."] = ""

-- L["Blizzard"] = ""
-- L["Blizzard Glow effect is already in use by another indicator, select another effect."] = ""
-- L["Glow Color"] = ""
-- L["Choose how to colorize the glow border."] = ""
-- L["Sets the glow color to use when the indicator is active."] = ""
-- L["Glow Effect"] = ""
-- L["Select the glow effect."] = ""
-- L["Animation Speed"] = ""
-- L["Number of Lines"] = ""
-- L["Thickness"] = ""
-- L["Number of particles"] = ""
-- L["Scale of particles"] = ""
-- L["Pixel"] = ""
-- L["Shine"] = ""

-- indicator types
-- L["background"] = ""
L["bar"] = "狀態條"
-- L["glowborder"] = ""
L["icon"] = "圖示"
-- L["icons"] = ""
-- L["multibar"] = ""
-- L["portrait"] = ""
-- L["shape"] = ""
L["square"] = "正方形"
L["text"] = "文字"

-- indicators
L["corner-top-left"] = "左上角"
L["corner-top-right"] = "右上角"
L["corner-bottom-right"] = "右下角"
L["corner-bottom-left"] = "左下角"
L["side-top"] = "頂部"
L["side-right"] = "右邊"
L["side-bottom"] = "底部"
L["side-left"] = "左邊"
L["text-up"] = "上方文字"
L["text-down"] = "下方文字"
L["icon-left"] = "左圖示"
L["icon-center"] = "中央圖示"
L["icon-right"] = "右圖示"

-- locations
L["CENTER"] = "中央"
L["TOP"] = "上"
L["BOTTOM"] = "下"
L["LEFT"] = "左"
L["RIGHT"] = "右"
L["TOPLEFT"] = "左上"
L["TOPRIGHT"] = "右上"
L["BOTTOMLEFT"] = "左下"
L["BOTTOMRIGHT"] = "右下"

L["location"] = "位置"

L["Location"] = "位置"
L["Align my align point relative to"] = "使我的對齊點靠齊於"
L["Align Point"] = "對齊點"
L["Align this point on the indicator"] = "靠齊該指標的對齊點"
L["X Offset"] = "X 偏移"
L["X - Horizontal Offset"] = "X - 水平偏移"
L["Y Offset"] = "Y 偏移"
L["Y - Vertical Offset"] = "Y - 垂直偏移"

--{{{ Statuses
L["-color"] = "：顏色"
L["-mine"] = "：我的"
L["-not-mine"] = "：不是我的"
L["buff-"] = "增益："
L["debuff-"] = "減益："
L["color-"] = "顏色："

L["status"] = "狀態"

L["buff"] = "增益"
L["debuff"] = "減益"
L["debuffType"] = "減益類型"

L["New Buff"] = "新增益"
L["New Debuff"] = "新減益"
L["New Color"] = "新顏色"
L["New Status"] = "新狀態"
L["Delete Status"] = "刪除狀態"
L["Create a new status."] = "建立新的狀態"
L["Create Buff"] = "建立增益"
L["Create Default Buffs"] = "默认buff"
L["Create Default Buffs for %s."] = "为 %s 创建默认 Buffs。"
L["Create Debuff"] = "建立減益"
L["Create Color"] = "建立顏色"
L["Enabled for"] = "啟用"
-- L["Enable the status only if your character belong to the specified class."] = ""

L["Threshold"] = "臨界值"
L["Thresholds"] = "臨界值設定"
L["Threshold at which to activate the status."] = "啟動該狀態的門檻"

L["available statuses"] = "可用的狀態"

-- buff & debuff statuses management
L["Auras"] = "光環"
L["Buffs"] = "增益"
L["Debuffs"] = "減益"
L["Colors"] = "顏色"
L["Health&Heals"] = "生命&治療"
L["Mana&Power"] = "法力&能量"
L["Combat"] = "戰鬥"
L["Targeting&Distances"] = "目標&距離"
L["Raid&Party Roles"] = "團隊&隊伍角色"
L["Miscellaneous"] = "雜項"

L["Show if mine"] = "顯示自己施放的"
L["Show if not mine"] = "顯示非自身施放的"
L["Show if missing"] = "顯示缺少的"
L["Display status only if the buff is not active."] = "只顯示缺少的增益效果"
L["Display status only if the buff was cast by you."] = "只顯示自己施放的增益效果"
L["Display status only if the buff was not cast by you."] = "不顯示自己施放的增益效果"
L["Color count"] = "顏色數量"
L["Select how many colors the status must provide."] = "選擇該狀態需要提供多少顏色"
L["You can include a descriptive prefix using separators \"@#>\""] = "你可以使用分隔符號\"@#>\"來包含描述性前置詞"
L["examples: Druid@Regrowth Chimaeron>Low Health"] = "範例：德魯伊@癒合 奇瑪隆>低生命值"
L["Threshold to activate Color"] = "啟用顏色的門檻"
L["Track by SpellId"] = "追蹤法術編號"
L["Track by spellId instead of aura name"] = "追蹤法術編號而非名稱"
L["Assigned to"] = "指定到"

L["Coloring based on"] = "著色依據"
L["Number of stacks"] = "堆疊數"
L["Remaining time"] = "剩餘時間"
-- L["Elapsed time"] = ""

L["Class Filter"] = "職業過濾"
L["Show on %s."] = "在 %s 顯示"

L["Blink Threshold"] = "閃爍門檻"
L["Blink Threshold at which to start blinking the status."] = "開始狀態閃爍的門檻"

L["Name or SpellId"] = "名稱或法術編號"
L["Select Type"] = "選擇類型"
L["Buff"] = "增益"
L["Debuff"] = "減益"
L["Buffs Group"] = "增益群組"
L["Debuffs Group"] = "減益群組"
L["Buffs Group: Defensive Cooldowns"] = "增益群組：防禦冷卻"
L["Debuffs Group: Healing Prevented "] = "減益群組：阻止治療效果"
L["Debuffs Group: Healing Reduced"] = "減益群組：降低治療效果"
L["Filtered debuffs"] = "已過濾的減益"
L["Listed debuffs will be ignored."] = "列出的減益效果將被忽略"

-- general statuses
L["name"] = "名字"
L["mana"] = "法力值"
L["power"] = "能源"
L["poweralt"] = "其他能量資源"
L["alpha"] = "透明度"
L["border"] = "邊框"
L["heals"] = "治療"
L["health"] = "生命值"
L["charmed"] = "被魅惑的"
L["afk"] = "暫離"
L["death"] = "死亡"
L["classcolor"] = "職業顏色"
L["creaturecolor"] = "生物類型顏色"
L["friendcolor"] = "友善度顏色"
L["feign-death"] = "瀕死"
L["heals-incoming"] = "治療承受"
L["health-current"] = "目前生命值"
L["health-deficit"] = "生命減損值"
L["health-low"] = "低生命值"
L["health-opacity"] = "健康不透明"
L["lowmana"] = "低法力值"
L["offline"] = "離線"
L["raid-icon-player"] = "團隊標記圖示：玩家"
L["raid-icon-target"] = "團隊標記圖示：目標"
L["range"] = "距離"
L["ready-check"] = "準備確認"
L["role"] = "角色"
L["dungeon-role"] = "地城角色"
L["leader"] = "團隊隊長"
L["master-looter"] = "拾取分配者"
L["raid-assistant"] = "團隊助理"
L["target"] = "目標"
L["threat"] = "仇恨"
L["banzai"] = "點名警示"
L["banzai-threat"] = "點名警示：仇恨"
L["vehicle"] = "載具"
L["voice"] = "語音"
L["pvp"] = "玩家對玩家"
L["direction"] = "方向"
L["resurrection"] = "復活"
-- L["self"] = ""

L["Curse"] = "詛咒"
L["Poison"] = "毒"
L["Disease"] = "疾病"
L["Magic"] = "魔法"

L["raid-debuffs"] = "團隊減益"
L["raid-debuffs2"] = "團隊減益(2)"
L["raid-debuffs3"] = "團隊減益(3)"
L["raid-debuffs4"] = "團隊減益(4)"
L["raid-debuffs5"] = "團隊減益(5)"

-- class specific buffs & debuffs statuses

-- shaman
L["EarthShield"] = "大地之盾"
L["Earthliving"] = "大地生命"
L["Riptide"] = "激流"
L["ChainHeal"] = "治療鍊"

-- Druid
L["Rejuvenation"] = "回春術"
L["Lifebloom"] = "生命之花"
L["Regrowth"] = "癒合"
L["WildGrowth"] = "野性痊癒"

-- paladin
L["BeaconOfLight"] = "聖光信標"
L["FlashOfLight"] = "聖光閃現"
L["DivineShield"] = "聖盾術"
L["DivineProtection"] = "聖佑術"
L["HandOfProtection"] = "保護聖禦"
L["HandOfSalvation"] = "拯救聖禦"
L["Forbearance"] = "自律"

-- priest
L["Grace"] = "恩典"
L["DivineAegis"] = "神禦之盾"
L["InnerFire"] = "心靈之火"
L["PrayerOfMending"] = "癒合禱言"
L["PowerWordShield"] = "真言術:盾"
L["Renew"] = "恢復"
L["WeakenedSoul"] = "虛弱靈魂"
L["SpiritOfRedemption"] = "救贖之靈"
L["CircleOfHealing"] = "治療之環"
L["PrayerOfHealing"] = "治療禱言"

-- mage
L["FocusMagic"] = "魔法凝聚"
L["IceArmor"] = "冰甲術"
L["IceBarrier"] = "寒冰護體"

-- rogue
L["Evasion"] = "閃避"

-- warlock
L["ShadowWard"] = "防護暗影結界"
L["SoulLink"] = "靈魂鏈結"
L["DemonArmor"] = "惡魔護甲"
L["FelArmor"] = "邪甲術"

-- warrior
L["Vigilance"] = "戒備守護"
L["BattleShout"] = "戰鬥怒吼"
L["CommandingShout"] = "命令怒吼"
L["ShieldWall"] = "盾牆"
L["LastStand"] = "破釜沉舟"

-- class color, creature color, friend color status
L["%s Color"] = "%s顏色"
L["Player color"] = "玩家顏色"
L["Pet color"] = "寵物顏色"
L["Color Charmed Unit"] = "高亮被魅惑單位"
L["Color Units that are charmed."] = "高亮顯示被魅惑單位。"
L["Unit Colors"] = "單位顏色"
L["Charmed unit Color"] = "被魅惑單位顏色"
L["Default unit Color"] = "預設單位顏色"
L["Default pet Color"] = "預設寵物顏色"

L["DEATHKNIGHT"] = "死亡騎士"
L["DRUID"] = "德魯伊"
L["HUNTER"] = "獵人"
L["MAGE"] = "法師"
L["PALADIN"] = "聖騎士"
L["PRIEST"] = "牧師"
L["ROGUE"] = "盜賊"
L["SHAMAN"] = "薩滿"
L["WARLOCK"] = "術士"
L["WARRIOR"] = "戰士"
L["Beast"] = "野獸"
L["Demon"] = "惡魔"
L["Humanoid"] = "人型生物"
L["Elemental"] = "元素"

-- heal-current status
L["Full Health"] = "生命值全滿"
L["Medium Health"] = "中等生命值"
L["Low Health"] = "低生命值"
L["Show dead as having Full Health"] = "顯示死亡如同生命值全滿"
L["Frequent Updates"] = "頻繁刷新"
L["Instant Updates"] = "立刻更新"

-- range status
L["Range"] = "距離"
L["%d yards"] = "%d碼"
L["Range in yards beyond which the status will be lost."] = "超出距離以外的狀態都將丟失。"
L["Default alpha"] = "預設透明度"
L["Default alpha value when units are way out of range."] = "當單位超出距離時的預設透明度。"
L["Update rate"] = "更新速度"
L["Rate at which the status gets updated"] = "狀態更新頻率"

-- ready-check status
L["Delay"] = "延遲"
L["Set the delay until ready check results are cleared."] = "設定延遲直到準備確認的結果被清除"
L["Waiting color"] = "等待中的顏色"
L["Color for Waiting."] = "等待中顏色"
L["Ready color"] = "準備完成顏色"
L["Color for Ready."] = "準備就緒顏色"
L["Not Ready color"] = "未準備就緒顏色"
L["Color for Not Ready."] = "未準備就緒顏色"
L["AFK color"] = "暫離顏色"
L["Color for AFK."] = "暫離顏色"

-- heals-incoming status
L["Include player heals"] = "包括玩家治療"
L["Display status for the player's heals."] = "顯示玩家治療狀態"
L["Minimum value"] = "最小值"
L["Incoming heals below the specified value will not be shown."] = "即將到來的治療低於特定值將不會被顯示"
L["Heal filter"] = "治療過濾"
L["Show incoming heals for the selected heal types."] = "顯示治療中選擇的治療類型"
L["Direct heals"] = "直接治療"
L["Include direct heals."] = "加入直接治療"
L["Channeled heals"] = "引導治療"
L["Include channeled heals."] = "加入引導治療"
L["HoT heals"] = "HoT治療"
L["Include heal over time effects."] = "加入(HoT)持續回血效果"

--target status
L["Your Target"] = "你的目標"

--threat status
L["Not Tanking"] = "仇恨超過坦克"
L["Higher threat than tank."] = "仇恨高於坦克"
L["Insecurely Tanking"] = "仇恨不穩定"
L["Tanking without having highest threat."] = "坦克不是最高仇恨"
L["Securely Tanking"] = "仇恨穩定"
L["Tanking with highest threat."] = "坦克最高仇恨"
L["Disable Blink"] = "取消閃爍效果"

-- voice status
L["Voice Chat"] = "語音"

-- raid debuffs
L["General"] = "一般"
L["Advanced"] = "進階"
L["Enabled raid debuffs modules"] = "啟用團隊減益模組"
L["Enabled"] = "啟用"
L["Enable All"] = "啟用所有"
L["Disable All"] = "禁用所有"
L["Copy to Debuffs"] = "複製到減益"
L["Select module"] = "選擇模組"
L["Select instance"] = "選擇副本"
L["The Lich King"] = "巫妖王之怒"
L["The Burning Crusade"] = "燃燒的遠征"
L["New raid debuff"] = "新團隊減益"
L["Type the SpellId of the new raid debuff"] = "輸入新的團隊減益法術編號"
L["Create raid debuff"] = "建立團隊減益"
L["Delete raid debuff"] = "刪除團隊減益"

-- direction
L["Out of Range"] = "超出距離"
L["Display status for units out of range."] = "顯示距離過遠的單位狀態"
L["Visible Units"] = "可見單位"
L["Display status for units less than 100 yards away"] = "替100碼內的單位顯示狀態"
L["Dead Units"] = "死亡單位"
L["Display status only for dead units"] = "只顯示死亡單位的狀態"

-- resurrection
L["Casting resurrection"] = "施放復活中"
L["A resurrection spell is being casted on the unit"] = "正在施放復活法術於該單位"
L["Resurrected"] = "已復活"
L["A resurrection spell has been casted on the unit"] = "已經施放復活法術於該單位"

-- shields status
L["shields"] = "護盾"
L["Maximum shield amount"] = "最多護盾數"
L["Maximum shield amount value. Only used by bar indicators."] = "最多護盾總數 只能用狀態條指標表示"
L["Normal"] = "一般"
L["Medium"] = "中"
L["Low"] = "低"
L["Normal shield color"] = "一般護盾顏色"
L["Medium shield color"] = "中等護盾值顏色"
L["Low shield color"] = "低護盾值顏色"
L["Low shield threshold"] = "低護盾值門檻"
L["The value below which a shield is considered low."] = "護盾值為下方數值時表示低護盾值"
L["Medium shield threshold"] = "中等護盾值門檻"
L["The value below which a shield is considered medium."] = "護盾值為下方數值時表示中等護盾值"
L["Custom Shields"] = "自訂護盾"
-- L["Type shield spell IDs separated by commas."] = ""

-- boss-shields status
L["Boss"] = "頭目"
L["Supported debuffs"] = "支援的減益效果"

-- role related statuses
L["Hide in combat"] = "戰鬥中隱藏"
L["Hide Damagers"] = "隱藏傷害輸出角色"
L["Use alternate icons"] = "Use for raids"
L["Show everywhere"] = "无处不显示"
L["Show even when not in a dungeon"] = "即使不在地牢中也能顯示"

-- status descriptions
L["highlights your target"] = "高亮你的目標"
L["hostile casts against raid members"] = "敵對單位施放於團隊成員"
L["advanced threat detection"] = "進階的仇恨偵測"
L["arrows pointing to each raid member"] = "指向每個團隊成員的箭頭"

-- aoe heals
L["aoe-"] = "範圍效果："
L["neighbors"] = "鄰近單位"
L["highlighter"] = "高亮器"
L["OutgoingHeals"] = "治療輸出"

L["AOE Heals"] = "範圍治療"
L["Highlight status"] = "高亮狀態"
L["Autodetect"] = "自動偵測"
L["Select the status the Highlighter will use."] = "選擇高亮器的使用狀態"
L["Mouse Enter Delay"] = "滑鼠游標移入延遲"
L["Delay in seconds before showing the status."] = "狀態顯示前的延遲秒數"
L["Mouse Leave Delay"] = "滑鼠游標離開延遲"
L["Delay in seconds before hiding the status."] = "狀態隱藏前的延遲秒數"
L["Min players"] = "最少玩家數"
L["Minimum players to enable the status."] = "最少要幾位玩家數以啟用狀態"
L["Radius"] = "範圍半徑"
L["Max distance of nearby units."] = "最大的鄰近單位距離"
L["Health deficit"] = "生命值減損"
L["Minimum health deficit of units to enable the status."] = "單位最少要減損多少生命以啟用狀態"
L["Keep same targets"] = "維持相同目標"
L["Try to keep same heal targets solutions if posible."] = "如果可能盡量維持相同治療目標"
L["Max solutions"] = "最多符合條件的目標數"
L["Maximum number of solutions to display."] = "要顯示的最多符合條件目標數"
L["Hide on cooldown"] = "冷卻時隱藏"
L["Hide the status while the spell is on cooldown."] = "當法術冷卻中時隱藏狀態"
L["Show overlapping heals"] = "顯示重疊治療"
L["Show heal targets even if they overlap with other heals."] = "顯示治療目標 即使他有重疊其他治療"
L["Show only in combat"] = "只在戰鬥中顯示"
L["Enable the statuses only in combat."] = "讓狀態只在戰鬥中顯示"
L["Show only in raid"] = "只在團隊中顯示"
L["Enable the statuses only in raid."] = "讓狀態只在團隊中顯示"
L["Active time"] = "活躍時間"
L["Show the status for the specified number of seconds."] = "指定狀態顯示秒數"
L["Spells"] = "法術"
L["You can type spell IDs or spell names."] = "你可以輸入法術編號或法術名稱"

-- Import/export profiles module
L["Import/export options"] = "匯入/匯出選項"
L["Import profile"] = "匯入設定檔"
L["Export profile"] = "匯出設定檔"
L["Network sharing"] = "網路分享"
L["Accept profiles from other players"] = "從其他玩家處接收設定檔"
L["Type player name"] = "輸入玩家姓名"
L["Send current profile"] = "送出目前的設定檔"
L["Profile import/export"] = "匯入/匯出設定檔"
L["Paste here a profile in text format"] = "將設定檔以文字格式貼在這"
L["Press CTRL-V to paste a Grid2 configuration text"] = "按下 CTRL-V 貼上 Grid2 的設定文字"
L["This is your current profile in text format"] = "這是你目前的設定文字"
L["Press CTRL-C to copy the configuration to your clipboard"] = "按下 CTRL-C 複製 Grid2 的設定到你的剪貼簿"
L["Progress"] = "進展"
L["Data size: %.1fKB"] = "資料量：%.1fKB"
L["Transmision progress: %d%%"] = "傳輸進度：%d%%"
L["Transmission completed"] = "傳輸完成"
L["\"%s\" has sent you a profile configuration. Do you want to activate received profile ?"] = "\"%s\" 發送一份設定檔給你，你是否想啟用他?"
L["Include Custom Layouts"] = "包含自訂佈局"

-- Open manager
L["Options management"] = "選項管理"
L["Load options on demand (requires UI reload)"] = "只在需要時載入選項 (需要重載UI)"
L["OPTIONS_ONDEMAND_DESC"] = "為了減少記憶體使用和載入時間，選項只有在使用者點擊後才會被建立，如果你使用此功能後遇到任何問題請關閉此選項。"