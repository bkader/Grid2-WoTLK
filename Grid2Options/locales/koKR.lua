local L =  LibStub:GetLibrary("AceLocale-3.0"):NewLocale("Grid2Options", "koKR")
if not L then return end

--{{{ General options
L["GRID2_WELCOME"] = "Welcome to Grid2"
-- L["GRID2_DESC"] = ""

L["General Settings"] = "일반 설정"

L["statuses"] = "상태"
L["indicators"] = "지시기"

L["Frames"] = "창"
L["frame"] = "창"

-- L["Default Font"] = ""

L["Invert Bar Color"] = "바 색상 반대로"
L["Swap foreground/background colors on bars."] = "바의 전경/배경 색상을 변경합니다."

L["Background Color"] = "배경 색상"
L["Sets the background color of each unit frame"] = "각 유닛 창의 배경 색상을 설정합니다."

L["Mouseover Highlight"] = "마우스 오버 강조"
L["Toggle mouseover highlight."] = "마우스 오버 강조를 사용합니다."

L["Show Tooltip"] = "툴팁 표시"
L["Show unit tooltip.  Choose 'Always', 'Never', or 'OOC'."] = "유닛 툴팁을 표시합니다. '항상', '안함' 또는 '비전투'을 선택합니다."
L["Always"] = "항상"
L["Never"] = "안함"
L["OOC"] = "비전투"

L["Background Texture"] = "배경 무늬"
L["Select the frame background texture."] = "창의 배경 무늬를 선택합니다."

L["Inner Border Size"] = "내부 테두리 크기"
L["Sets the size of the inner border of each unit frame"] = "각 유닛 창의 내부 테두리 크기를 설정합니다."

L["Inner Border Color"] = "내부 테두리 색상"
L["Sets the color of the inner border of each unit frame"] = "각 유닛 창의 내부 테두리 색상을 설정합니다."

L["Frame Width"] = "창 너비"
L["Adjust the width of each unit's frame."] = "각 유닛 창들의 너비를 조정합니다."

L["Frame Height"] = "창 높이"
L["Adjust the height of each unit's frame."] = "각 유닛 창들의 높이를 조정합니다."

L["Orientation of Frame"] = "창의 방향"
L["Set frame orientation."] = "창에 표시되는 생명력 결손 방향을 설정합니다."
L["VERTICAL"] = "세로"
L["HORIZONTAL"] = "가로"

L["Orientation of Text"] = "문자의 방향"
L["Set frame text orientation."] = "창에 표시되는 문자의 방향을 설정합니다."

L["Show Frame"] = "창 표시"
L["Sets when the Grid is visible: Choose 'Always', 'Grouped', or 'Raid'."] = "Grid 표시 설정: '항상', '파티' 또는 '공격대'를 선택합니다."
L["Always"] = "항상"
L["Grouped"] = "파티"
L["Raid"] = "공격대"

L["Layout Anchor"] = "배치 위치"
L["Sets where Grid is anchored relative to the screen."] = "Grid의 화면 위치를 설정합니다."

L["Horizontal groups"] = "그룹 정렬"
L["Switch between horzontal/vertical groups."] = "그룹 표시 방법을 가로/세로로 변경합니다."
L["Clamped to screen"] = "화면에 고정"
L["Toggle whether to permit movement out of screen."] = "화면 밖으로 창이 나가지 않도록 사용합니다."
L["Frame lock"] = "창 고정"
L["Locks/unlocks the grid for movement."] = "배치 창을 고정하거나 이동시킵니다."
L["Click through the Grid Frame"] = "Grid 창 클릭"
L["Allows mouse click through the Grid Frame."] = "Grid 창에 마우스 클릭을 허용합니다."

L["Display"] = "표시"
L["Padding"] = "여백"
L["Adjust frame padding."] = "창의 여백을 조정합니다."
L["Spacing"] = "간격"
L["Adjust frame spacing."] = "창의 간격을 조정합니다."
L["Scale"] = "크기"
L["Adjust Grid scale."] = "Grid 크기를 조정합니다."

L["Group Anchor"] = "그룹 위치"
L["Position and Anchor"] = "위치와 앵커"
L["Sets where groups are anchored relative to the layout frame."] = "그룹 배치 창의 위치를 설정합니다."
L["Resets the layout frame's position and anchor."] = "배경 창의 위치와 앵커를 초기화 합니다."

-- L["Frame Strata"] = ""
-- L["Sets the strata in which the layout frame should be layered."] = ""
-- L["BACKGROUND"] = ""
-- L["LOW"] = ""
-- L["MEDIUM"] = ""
-- L["HIGH"] = ""

--blink
L["Misc"] = "기타"
L["blink"] = "깜박임"
L["Blink effect"] = "깜박임 효과"
L["Select the type of Blink effect used by Grid2."] = "Grid2에 사용할 깜박임 효과의 유형을 선택합니다."
L["None"] = "없음"
L["Blink"] = "깜박임"
L["Flash"] = "반짝임"
L["Blink Frequency"] = "깜박임 빈도"
L["Adjust the frequency of the Blink effect."] = "깜박임 효과의 빈도를 조정합니다."

-- text formatting
L["Text Formatting"] = "문자 형식"
L["Duration Format"] = "지속시간 형식"
L["Examples:\n(%d)\n%d seconds"] = "예:\n(%d)\n%d 초"
L["Duration+Stacks Format"] = "지속시간+중첩 형식"
L["Examples:\n%d/%s\n%s(%d)"] = "예:\n%d/%s\n%s(%d)"
L["Display tenths of a second"] = "2번째 소숫점 표시"
L["When duration<1sec"] = "지속시간이<1초일때"

-- misc
L["Blizzard Raid Frames"] = "블리자드 공격대 창"
L["Hide Blizzard Raid Frames on Startup"] = "블리자드 공격대 창을 숨깁니다."

-- debugging & maintenance
L["debugging"] = "디버깅"
L["Module debugging menu."] = "모듈 디버깅 메뉴를 설정합니다."
L["Debug"] = "디버그"
L["Reset"] = "초기화"
L["Reset and ReloadUI."] = "초기화 및 UI 재시작"
L["Reset Setup"] = "설정 초기화"
L["Reset current setup and ReloadUI."] = "현재 설정 및 UI 재시작을 초기화합니다."
L["Reset Indicators"] = "지시기 초기화"
L["Reset indicators to defaults."] = "기본 지시기로 초기화합니다."
L["Reset Locations"] = "위치 초기화"
L["Reset locations to the default list."] = "기본 목록으로 위치를 초기화합니다."
L["Reset to defaults."] = "기본값으로 초기화합니다."
L["Reset Statuses"] = "상태 초기화"
L["Reset statuses to defaults."] = "기본 상태로 초기화합니다."

L["Warning! This option will delete all settings and profiles, are you sure ?"] = "경고! 이 옵션은 모든 설정 및 프로필을 삭제합니다. 정말 실행하시겠습니까?"

L["About"] = "정보"

--{{{ Layouts options
L["Layout"] = "배치"
L["Layouts"] = "배치"
L["layout"] = "배치"
L["Layouts for each type of groups you're in."] = "당신이 속한 그룹 유형에 따라 배치합니다."
L["Layout Settings"] = "배치 설정"
L["Solo Layout"] = "솔로잉 배치"
L["Select which layout to use for solo."] = "솔로잉에 사용하기 위한 배치를 선택합니다."
L["Party Layout"] = "파티 배치"
L["Select which layout to use for party."] = "파티에 사용하기 위한 배치를 선택합니다."
L["Raid %s Layout"] = "%s인 공격대 배치"
L["Select which layout to use for %s person raids."] = "%s 공격대에 사용하기 위한 배치를 선택합니다."
L["Battleground Layout"] = "전장 배치"
L["Select which layout to use for battlegrounds."] = "전장에 사용하기 위한 배치를 선택합니다."
L["Arena Layout"] = "투기장 배치"
L["Select which layout to use for arenas."] = "투기장에 사용하기 위한 배치를 선택합니다."
L["Test"] = "테스트"
L["Test the layout."] = "배치를 테스트합니다."
L["Select Layout"] = "배치 선택"
L["New Layout Name"] = "새로운 배치 이름"
L["Delete selected layout"] = "선택한 배치 삭제"
L["Refresh"] = "새로고침"
L["Refresh the Layout"] = "배치 새로고침"
L["Toggle for vehicle"] = "차량 탑승 사용"
L["When the player is in a vehicle replace the player frame with the vehicle frame."] = "플레이어가 차량에 탑승하면 차량 창으로 플레이어 창을 변경합니다."
L["Header"] = "제목"
L["Type of units to display"] = "표시할 유닛 형태"
L["Columns"] = "열"
L["Maximum number of columns to display"] = "열당 표시할 최대 숫자를 설정합니다."
L["Units/Column"] = "유닛/열"
L["Maximum number of units per column to display"] = "열당 표시할 유닛의 최대 숫자를 설정합니다."
L["First group"] = "첫번째 그룹"
L["First group to display"] = "표시할 첫번째 그룹을 설정합니다."
L["Last Group"] = "마지막 그룹"
L["Last group to display"] = "표시할 마지막 그룹을 설정합니다."
L["Group by"] = "그룹에 의해"
L["Sort by"] = "정렬에 의해"
L["Action"] = "행동"
L["all"] = "모두"
L["Class"] = "직업"
L["Group"] = "그룹"
L["Role"] = "역할"
L["Name"] = "이름"
L["Index"] = "알파벳"
L["party"] = "파티"
L["raid"] = "공격대"
L["partypet"] = "파티 소환수"
L["raidpet"] = "공격대 소환수"
L["Insert"] = "추가"
L["Copy"] = "복사"

--{{{ Miscelaneous
L["New"] = "신규"
L["Order"] = "순서"
L["Delete"] = "삭제"
L["Color"] = "색상"
L["Color %d"] = "%d 색상"
L["Color for %s."] = "%s 색상입니다."
L["Font"] = "글꼴"
L["Font Border"] = "글꼴 외곽선"
L["Thin"] = "얇게"
L["Thick"] = "두껍게"
-- L["Soft"] = ""
-- L["Sharp"] = ""
L["Adjust the font settings"] = "글꼴 설정을 조정합니다."
L["Border Texture"] = "테두리 무늬"
L["Adjust the border texture."] = "테두리 무늬를 조정합니다."
L["Border"] = "테두리"
L["Border Color"] = "테두리 색상"
L["Background"] = "배경"
L["Enable Background"] = "배경 사용"
L["Adjust border color and alpha."] = "테두리의 색상과 투명도를 조정합니다."
L["Adjust background color and alpha."] = "배경의 색상과 투명도를 조정합니다."
L["Opacity"] = "투명도"
L["Set the opacity."] = "투명도를 설정합니다."
L["<CharacterOnlyString>"] = "<CharacterOnlyString>"
L["Options for %s."] = "%s|1을;를; 위한 옵션을 설정합니다."
-- L["Delete this element"] = ""

--{{{ Indicator management
L["New Indicator"] = "새로운 지시기"
-- L["Create Indicator"] = ""
L["Create a new indicator."] = "새로운 지시기를 만듭니다."
L["Name of the new indicator"] = "새로운 지시기의 이름"
-- L["Enable or disable test mode for indicators"] = ""
L["Appearance"] = "모양"
L["Adjust the border size of the indicator."] = "지시기의 테두리 크기를 조정합니다."
L["Stack Text"] = "중첩 문자"
L["Disable Stack Text"] = "중첩 문자 사용 안함"
L["Disable Cooldown"] = "재사용 대기시간 사용 안함"
L["Disable the Cooldown Frame"] = "재사용 대기시간 창을 사용하지 않습니다."
L["Reverse Cooldown"] = "재사용 대기시간 반대로"
L["Set cooldown to become darker over time instead of lighter."] = "재사용 대기시간 동안 밝은 대신 점점 어둡게합니다."
L["Cooldown"] = "재사용 대기시간"
L["Text Location"] = "문자 위치"
L["Disable OmniCC"] = "OmniCC 사용 안함"
-- L["Animations"] = ""
-- L["Enable animation"] = ""
-- L["Turn on/off zoom animation of icons."] = ""
-- L["Duration"] = ""
-- L["Sets the duration in seconds."] = ""
L["Scale"] = "크기"
-- L["Sets the zoom factor."] = ""

L["Type"] = "타입"
L["Type of indicator"] = "지시기 타입"
L["Type of indicator to create"] = "만들 지시기의 타입을 설정합니다."
-- L["Change type"] = ""
-- L["Change the indicator type"] = ""

L["Text Length"] = "문자 길이"
L["Maximum number of characters to show."] = "캐릭터 이름을 표시할 최대 숫자를 설정합니다."
L["Font Size"] = "글꼴 크기"
L["Adjust the font size."] = "글꼴 크기를 조정합니다."
L["Size"] = "모서리 크기"
L["Adjust the size of the indicator."] = "모서리 지시기의 크기를 조정합니다."
L["Width"] = "너비"
L["Adjust the width of the indicator."] = "지시기의 너비를 조정합니다."
L["Height"] = "높이"
L["Adjust the height of the indicator."] = "지시기의 높이를 조정합니다."
L["Rectangle"] = "직사각형"
L["Allows to independently adjust width and height."] = "독립적으로 너비와 높이 조정을 허락합니다."
L["Use Status Color"] = "상태 색상 사용"
L["Always use the status color for the border"] = "테두리에 대한 상태 색상을 항상 사용합니다."

L["Frame Texture"] = "창 무늬"
L["Adjust the frame texture."] = "창 무늬를 조정합니다."

L["Show stack"] = "중첩 표시"
L["Show the number of stacks."] = "중첩 숫자를 표시합니다."
L["Show duration"] = "지속시간 표시"
L["Show the time remaining."] = "남은 시간을 표시합니다."
L["Show elapsed time"] = "경과 시간"
L["Show the elapsed time."] = "경과 시간을 표시합니다."
L["Show percent"] = "백분율 표시"
L["Show percent value"] = "백분율 값을 표시합니다."

L["Orientation of the Bar"] = "바 방향"
L["Set status bar orientation."] = "상태 바의 방향을 설정합니다."
L["DEFAULT"] = "기본값"
L["Frame Level"] = "창 레벨"
L["Bars with higher numbers always show up on top of lower numbers."] = "높은 번호를 가진 바는 항상 낮은 숫자의 상단에 표시됩니다."
L["Bar Width"] = "바 너비"
L["Choose zero to set the bar to the same width as parent frame"] = "부모 창과 같은 너비의 바를 설정하려면 0를 선택합니다."
L["Bar Height"] = "바 높이"
L["Choose zero to set the bar to the same height as parent frame"] = "부모 창과 같은 높이의 바를 설정하려면 0을 선택합니다."
L["Anchor to"] = "위치"
L["Anchor the indicator to the selected bar."] = "선택바 바의 지시기의 위치입니다."

L["Border Size"] = "테두리 크기"
L["Adjust the border of each unit's frame."] = "각 유닛의 창 테두리를 조정합니다."
L["Border Background Color"] = "테두리 배경 색상"
L["Adjust border background color and alpha."] = "테두리 배경 색상과 투명도를 조정합니다."
L["Border separation"] = "테두리 분리"
L["Adjust the distance between the border and the frame content."] = "테두리와 창 사이의 거리를 조정합니다."

L["Select statuses to display with the indicator"] = "지시기에 표시할 상태를 선택합니다."
L["Available Statuses"] = "사용 가능한 상태"
L["Available statuses you may add"] = "지시기에 당신이 추가할 수 있는 사용 가능 상태"
L["Current Statuses"] = "현재 상태"
L["Current statuses in order of priority"] = "우선 순위 지시기의 현재 상태입니다."
L["Move the status higher in priority"] = "우선 순위를 높은 상태로 움직입니다."
L["Move the status lower in priority"] = "우선 순위를 낮은 상태로 움직입니다."

L["indicator"] = "지시기"

-- indicator types
L["icon"] = "아이콘"
L["square"] = "네모"
L["text"] = "문자"
L["bar"] = "바"

-- indicators
L["corner-top-left"] = "모시리-좌측 상단"
L["corner-top-right"] = "모서리-우측 상단"
L["corner-bottom-right"] = "모서리-우측 하단"
L["corner-bottom-left"] = "모서리-좌측 하단"
L["side-top"] = "사이드-상단"
L["side-right"] = "사이드-우측"
L["side-bottom"] = "사이드-하단"
L["side-left"] = "사이드-좌측"
L["text-up"] = "문자-위"
L["text-down"] = "문자-아래"
L["icon-left"] = "아이콘-좌측"
L["icon-center"] = "아이콘-중앙"
L["icon-right"] = "아이콘-우측"

-- locations
L["CENTER"] = "중앙"
L["TOP"] = "상단"
L["BOTTOM"] = "하단"
L["LEFT"] = "좌측"
L["RIGHT"] = "우측"
L["TOPLEFT"] = "좌측 상단"
L["TOPRIGHT"] = "우측 상단"
L["BOTTOMLEFT"] = "좌측 하단"
L["BOTTOMRIGHT"] = "우측 하단"

L["location"] = "위치"

L["Location"] = "위치"
L["Align my align point relative to"] = "나의 상대 포인트에 정렬"
L["Align Point"] = "포인트 정렬"
L["Align this point on the indicator"] = "지시기에 이 포인트를 정렬"
L["X Offset"] = "X 간격"
L["X - Horizontal Offset"] = "X - 가로 간격"
L["Y Offset"] = "Y 간격"
L["Y - Vertical Offset"] = "Y - 세로 간격"

--{{{ Statuses
L["-color"] = ":색상"
L["-mine"] = ":자신"
L["-not-mine"] = ":다른 플레이어"
L["buff-"] = "버프:"
L["debuff-"] = "디버프:"
L["color-"] = "색상:"

L["status"] = "상태"

L["buff"] = "버프"
L["debuff"] = "디버프"
-- L["debuffType"] = ""

-- L["New Buff"] = ""
-- L["New Debuff"] = ""
L["New Color"] = "새로운 색상"
L["New Status"] = "새로운 상태"
L["Delete Status"] = "상태 삭제"
L["Create a new status."] = "새로운 상태를 만듭니다."
-- L["Create Buff"] = ""
-- L["Create Debuff"] = ""
-- L["Create Color"] = ""

L["Threshold"] = "수치"
L["Thresholds"] = "수치"
L["Threshold at which to activate the status."] = "상태를 활성화할 수치를 설정합니다."

-- L["available statuses"] = ""

-- buff & debuff statuses management
L["Auras"] = "오라들"
L["Buffs"] = "버프들"
L["Debuffs"] = "디버프들"
L["Colors"] = "색상들"
L["Health&Heals"] = "생명력&치유"
L["Mana&Power"] = "마나&파워"
L["Combat"] = "전투"
L["Targeting&Distances"] = "대상&거리"
L["Raid&Party Roles"] = "공격대&파티원 역할"
L["Miscellaneous"] = "기타"

L["Show if mine"] = "자신이 시전한것 표시"
L["Show if not mine"] = "자신이 시전 안한것 표시"
L["Show if missing"] = "사라짐 표시"
L["Display status only if the buff is not active."] = "버프가 사라졌을 경우에만 상태에 표시합니다."
L["Display status only if the buff was cast by you."] = "당신이 버프를 시전했을 경우에만 상태에 표시합니다."
L["Display status only if the buff was not cast by you."] = "당신이 버프를 시전하지 않았을 경우에만 상태에 표시합니다."
L["Color count"] = "색상 카운트"
L["Select how many colors the status must provide."] = "상태에 몇개의 색상을 제공할지 선택합니다."
L["You can include a descriptive prefix using separators \"@#>\""] = "당신은 구분 기호 \"@#>\"을 사용하여 설명하는 접두사를 포함시킬 수 있습니다."
L["examples: Druid@Regrowth Chimaeron>Low Health"] = "예: 드루이드@재생 카마이론>낮은 생명력"
L["Threshold to activate Color"] = "색상을 사용할 수치"
L["Track by SpellId"] = "주문ID 추적"
L["Track by spellId instead of aura name"] = "주문 이름대신 주문ID로 추적합니다."
L["Assigned to"] = "할당"

L["Coloring based on"] = "색상"
L["Number of stacks"] = "중첩 숫자"
L["Remaining time"] = "남은 시간"
-- L["Elapsed time"] = ""

L["Class Filter"] = "직업 필터"
L["Show on %s."] = "%s 표시합니다."

L["Blink Threshold"] = "깜박임 수치"
L["Blink Threshold at which to start blinking the status."] = "상태를 깜박이게 할 수치를 설정합니다."

L["Name or SpellId"] = "이름이나 주문ID"
L["Select Type"] = "타입 선택"
L["Buff"] = "버프"
L["Debuff"] = "디버프"
L["Buffs Group"] = "버프들 그룹"
L["Debuffs Group"] = "디버프들 그룹"
L["Buffs Group: Defensive Cooldowns"] = "버프 그룹: 재사용 대기시간 방어"
L["Debuffs Group: Healing Prevented "] = "디버프 그룹: 치유 방해"
L["Debuffs Group: Healing Reduced"] = "디버프 그룹: 치유량 감소"
L["Filtered debuffs"] = "디버프들 필터"
L["Listed debuffs will be ignored."] = "목록에 기록한 디버프는 무시합니다."

-- general statuses
L["name"] = "이름"
L["mana"] = "마나"
L["power"] = "파워"
L["poweralt"] = "파워"
L["alpha"] = "투명도"
L["border"] = "테두리"
L["heals"] = "치유"
L["health"] = "생명력"
L["charmed"] = "현혹"
L["afk"] = "자리비움"
L["death"] = "죽음"
L["classcolor"] = "직업 색상"
L["creaturecolor"] = "소환수 색상"
L["friendcolor"] = "우호적 색상"
L["feign-death"] = "죽은척하기"
L["heals-incoming"] = "치유 받음"
L["health-current"] = "현재 생명력"
L["health-deficit"] = "결손 생명력"
L["health-low"] = "생명력 낮음"
L["lowmana"] = "마나 낮음"
L["offline"] = "오프라인"
L["raid-icon-player"] = "공격대 아이콘-플레이어"
L["raid-icon-target"] = "공격대 아이콘-대상"
L["range"] = "거리"
L["ready-check"] = "전투 준비 체크"
L["role"] = "역할"
L["dungeon-role"] = "공격대 역할"
L["leader"] = "공격대장"
L["master-looter"] = "전리품 담당자"
L["raid-assistant"] = "부공격대장"
L["target"] = "대상"
L["threat"] = "위협"
L["banzai"] = "위협수준"
L["banzai-threat"] = "banzai-위협수준"
L["vehicle"] = "탈것"
L["voice"] = "음성"
L["pvp"] = "PvP"
L["direction"] = "방향"
L["resurrection"] = "부활"
-- L["self"] = ""

L["Curse"] = "저주"
L["Poison"] = "독"
L["Disease"] = "질병"
L["Magic"] = "마법"

L["raid-debuffs"] = "공격대 디버프들"
L["raid-debuffs2"] = "공격대 디버프들(2)"
L["raid-debuffs3"] = "공격대 디버프들(3)"
L["raid-debuffs4"] = "공격대 디버프들(4)"
L["raid-debuffs5"] = "공격대 디버프들(5)"

L["boss-shields"] = "우두머리-보호막들"

-- class specific buffs & debuffs statuses

-- shaman
L["EarthShield"] = "대지의 보호막"
L["Earthliving"] = "Earthliving"
L["Riptide"] = "Riptide"
L["ChainHeal"] = "연쇄 치유"
L["HealingRain"] = "치유의 물결"

-- Druid
L["Rejuvenation"] = "Rejuvenation"
L["Lifebloom"] = "Lifebloom"
L["Regrowth"] = "Regrowth"
L["WildGrowth"] = "WildGrowth"

-- paladin
L["BeaconOfLight"] = "BeaconOfLight"
L["FlashOfLight"] = "FlashOfLight"
L["DivineShield"] = "DivineShield"
L["DivineProtection"] = "DivineProtection"
L["HandOfProtection"] = "HandOfProtection"
L["HandOfSalvation"] = "HandOfSalvation"
L["Forbearance"] = "Forbearance"

-- priest
L["Grace"] = "Grace"
L["DivineAegis"] = "DivineAegis"
L["InnerFire"] = "InnerFire"
L["PrayerOfMending"] = "PrayerOfMending"
L["PowerWordShield"] = "PowerWordShield"
L["Renew"] = "Renew"
L["WeakenedSoul"] = "WeakenedSoul"
L["SpiritOfRedemption"] = "SpiritOfRedemption"
L["CircleOfHealing"] = "CircleOfHealing"
L["PrayerOfHealing"] = "PrayerOfHealing"

-- mage
L["FocusMagic"] = "마법 집중"
L["IceArmor"] = "얼음 갑옷"
L["IceBarrier"] = "얼음 보호막"

-- rogue
L["Evasion"] = "Evasion"

-- warlock
L["ShadowWard"] = "ShadowWard"
L["SoulLink"] = "SoulLink"
L["DemonArmor"] = "DemonArmor"
L["FelArmor"] = "FelArmor"

-- warrior
L["Vigilance"] = "경계"
L["BattleShout"] = "BattleShout"
L["CommandingShout"] = "CommandingShout"
L["ShieldWall"] = "ShieldWall"
L["LastStand"] = "LastStand"

-- class color, creature color, friend color status
L["%s Color"] = "%s 색상"
L["Player color"] = "플레이어 색상"
L["Pet color"] = "소환수 색상"
L["Color Charmed Unit"] = "현혹된 유닛 색상"
L["Color Units that are charmed."] = "현혹된 유닛의 색상입니다."
L["Unit Colors"] = "유닛 색상"
L["Charmed unit Color"] = "현혹된 유닛 색상"
L["Default unit Color"] = "기본 유닛 색상"
L["Default pet Color"] = "기본 소환수 색상"

L["DEATHKNIGHT"] = "죽음의 기사"
L["DRUID"] = "드루이드"
L["HUNTER"] = "사냥꾼"
L["MAGE"] = "마법사"
L["PALADIN"] = "성기사"
L["PRIEST"] = "사제"
L["ROGUE"] = "도적"
L["SHAMAN"] = "주술사"
L["WARLOCK"] = "흑마법사"
L["WARRIOR"] = "전사"
L["Beast"] = "야수"
L["Demon"] = "악마"
L["Humanoid"] = "인간형"
L["Elemental"] = "정령"

-- heal-current status
L["Full Health"] = "전체 생명력"
L["Medium Health"] = "중간 생명력"
L["Low Health"] = "낮은 생명력"
L["Show dead as having Full Health"] = "죽은 후 모든 생명력 표시"
L["Frequent Updates"] = "자주 업데이트"
L["Instant Updates"] = "즉시 업데이트"

-- range status
L["Range"] = "거리"
L["%d yards"] = "%d 미터"
L["Range in yards beyond which the status will be lost."] = "범위가 사정 거리 밖에 있으면 상태 정보를 가져 올수 없습니다."
L["Default alpha"] = "기본 투명도"
L["Default alpha value when units are way out of range."] = "유닛이 사정거리를 벗어났을 때 기본 투명도 값입니다."
L["Update rate"] = "업데이트 속도"
L["Rate at which the status gets updated"] = "상태창의 업데이트 속도를 설정합니다."

-- ready-check status
L["Delay"] = "지연"
L["Set the delay until ready check results are cleared."] = "준비 체크 결과를 삭제할 지연 시간을 설정합니다."
L["Waiting color"] = "대기 색상"
L["Color for Waiting."] = "대기 상태일 때 색상입니다."
L["Ready color"] = "준비됨 색상"
L["Color for Ready."] = "전투 준비가 되었을 때 색상입니다."
L["Not Ready color"] = "준비 안됨 색상"
L["Color for Not Ready."] = "전투 준비가 되지 않았을 때 색상입니다."
L["AFK color"] = "자리비움 색상"
L["Color for AFK."] = "자리비움 상태일 때 색상입니다."

-- heals-incoming status
L["Include player heals"] = "플레이어 치유 포함"
L["Display status for the player's heals."] = "플레이어의 치유를 상태 창에 표시합니다."
L["Minimum value"] = "최소값"
L["Incoming heals below the specified value will not be shown."] = "지정한 값 이하시 치유량을 표시하지 않습니다."

--target status
L["Your Target"] = "당신의 대상"

--threat status
L["Not Tanking"] = "방어전담 않함"
L["Higher threat than tank."] = "방어 전담을 하지 않습니다."
L["Insecurely Tanking"] = "위험한 방어전담"
L["Tanking without having highest threat."] = "가장 높은 위협 수준 가지지 않고 방어전담을 합니다."
L["Securely Tanking"] = "안전한 방어전담"
L["Tanking with highest threat."] = "가장 높은 위협 수준을 가지고 방어전담을 합니다."
L["Disable Blink"] = "반짬임 사용 안함"

-- voice status
L["Voice Chat"] = "음성 대화"

-- raid debuffs
L["General"] = "일반"
L["Advanced"] = "상세"
L["Enabled raid debuffs modules"] = "공격대 디버프 모듈을 사용합니다."
L["Enabled"] = "사용"
L["Enable All"] = "전체 사용"
L["Disable All"] = "전체 사용 안함"
L["Copy to Debuffs"] = "디버프에 복사"
L["Select module"] = "모듈 선택"
L["Select instance"] = "인던 선택"
L["The Lich King"] = "리치왕의 분노"
L["The Burning Crusade"] = "불타는 성전"
L["New raid debuff"] = "새로운 공격대 디버프"
L["Type the SpellId of the new raid debuff"] = "새로운 공격대 디버프의 주문 ID 입력"
L["Create raid debuff"] = "공격대 디버프 생성"
L["Delete raid debuff"] = "공격대 디버프 삭제"

-- direction
L["Out of Range"] = "거리 벗어남"
L["Display status for units out of range."] = "유닛과의 거리 벗어남을 상태 창에 표시합니다."
L["Visible Units"] = "표시 유닛"
L["Display status for units less than 100 yards away"] = "유닛과의 거리가 100미터 미만이면 상태 창에 표시합니다."
L["Dead Units"] = "죽음 유닛"
L["Display status only for dead units"] = "유닛이 죽었을때 상태 창에 표시합니다."

-- resurrection
L["Casting resurrection"] = "부활 시전"
L["A resurrection spell is being casted on the unit"] = "부활 주문이 유닛에게 시전될때 표시합니다."
L["Resurrected"] = "부활"
L["A resurrection spell has been casted on the unit"] = "부활 주문을 유닛에 받았을때 표시합니다."

-- power
L["Mana"] = "마나"
L["Rage"] = "격노"
L["Focus"] = "집중"
L["Energy"] = "기력"
L["Runic Power"] = "룬 파워"

-- shields status
L["shields"] = "보호막"
L["Maximum shield amount"] = "최대 보호막 양"
L["Maximum shield amount value. Only used by bar indicators."] = "Maximum shield amount value. Only used by bar indicators."
L["Normal"] = "일반"
L["Medium"] = "중간"
L["Low"] = "낮음"
L["Normal shield color"] = "일반 보호막 색상"
L["Medium shield color"] = "중간 보호막 색상"
L["Low shield color"] = "낮은 보호막 색상"
L["Low shield threshold"] = "낮은 보호막 수치"
L["The value below which a shield is considered low."] = "The value below which a shield is considered low."
L["Medium shield threshold"] = "중간 보호막 수치"
L["The value below which a shield is considered medium."] = "The value below which a shield is considered medium."
L["Custom Shields"] = "사용자 보호막"
-- L["Type shield spell IDs separated by commas."] = ""

-- boss-shields status
-- L["Boss"] = ""
-- L["Supported debuffs"] = ""

-- role related statuses
L["Hide in combat"] = "전투시 숨김"
L["Hide Damagers"] = "피해시 숨김"

-- status descriptions
-- L["highlights your target"] = ""
-- L["hostile casts against raid members"] = ""
-- L["advanced threat detection"] = ""
-- L["arrows pointing to each raid member"] = ""
-- L["display remaining amount of heal absorb shields"] = ""

-- aoe heals
L["aoe-"] = "지속-"
L["neighbors"] = "치유 받음"
L["highlighter"] = "강조"
L["OutgoingHeals"] = "치유 보냄"

L["AOE Heals"] = "AOE 치유"
L["Highlight status"] = "상태 강조"
L["Autodetect"] = "자동삭제"
L["Select the status the Highlighter will use."] = "강조를 사용할 상태를 선택합니다."
L["Mouse Enter Delay"] = "마우스 입력 지연"
L["Delay in seconds before showing the status."] = "Delay in seconds before showing the status"
L["Mouse Leave Delay"] = "마우스 사라짐 지연"
L["Delay in seconds before hiding the status."] = "Delay in seconds before hiding the status"
L["Min players"] = "최소 플레이어"
L["Minimum players to enable the status."] = "Minimum players to enable the status"
L["Radius"] = "반지름"
L["Max distance of nearby units."] = "Max distance of nearby units"
L["Health deficit"] = "결손 생명력"
L["Minimum health deficit of units to enable the status."] = "Minimum health deficit of units to enable the status"
L["Keep same targets"] = "같은 대상 유지"
L["Try to keep same heal targets solutions if posible."] = "Try to keep same heal targets solutions if posible"
L["Max solutions"] = "최고 솔루션"
L["Maximum number of solutions to display."] = "Maximum number of solutions to display"
L["Hide on cooldown"] = "재사용 대기시간 숨김"
L["Hide the status while the spell is on cooldown."] = "Hide the status while the spell is on cooldown"
L["Show overlapping heals"] = "오버 치유량 표시"
L["Show heal targets even if they overlap with other heals."] = "Show heal targets even if they overlap with other heals"
L["Show only in combat"] = "전투 상태만 표시"
L["Enable the statuses only in combat."] = "전투 상태일때만 사용합니다."
L["Show only in raid"] = "공격대만 표시"
L["Enable the statuses only in raid."] = "공격대 상태일때만 사용합니다."
L["Active time"] = "활성 시간"
L["Show the status for the specified number of seconds."] = "초로 지정된 번호의 상태를 표시합니다."
L["Spells"] = "주문"
L["You can type spell IDs or spell names."] = "당신은 주문 ID나 주문 이름을 입력할 수 있습니다."

-- Import/export profiles module
L["Import/export options"] = "가져오기/내보내기 옵션"
L["Import profile"] = "프로필 가져오기"
L["Export profile"] = "프로필 내보내기"
L["Network sharing"] = "네트워크 공유"
L["Accept profiles from other players"] = "다른 플레이어의 프로필 수락"
L["Type player name"] = "플레이어 이름 입력"
L["Send current profile"] = "현재 프로필 보내기"
L["Profile import/export"] = "프로필 가져오기/내보내기"
L["Paste here a profile in text format"] = "여기에 문자 형식으로 프로필 붙여넣기"
L["Press CTRL-V to paste a Grid2 configuration text"] = "Press CTRL-V to paste a Grid2 configuration text"
L["This is your current profile in text format"] = "이것은 문자 형식의 현재 프로필입니다."
L["Press CTRL-C to copy the configuration to your clipboard"] = "Press CTRL-C to copy the configuration to your clipboard"
L["Progress"] = "진행"
L["Data size: %.1fKB"] = "데이터 크기: %.1fKB"
L["Transmision progress: %d%%"] = "진행 상황: %d%%"
L["Transmission completed"] = "전송 완료"
L["\"%s\" has sent you a profile configuration. Do you want to activate received profile ?"] = "\"%s\" has sent you a profile configuration. Do you want to activate received profile ?"
L["Include Custom Layouts"] = "사용자 배치 포함"

-- Open manager
-- L["Options management"] = ""
-- L["Load options on demand (requires UI reload)"] = ""
-- L["OPTIONS_ONDEMAND_DESC"] = ""