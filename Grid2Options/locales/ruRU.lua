local L =  LibStub:GetLibrary("AceLocale-3.0"):NewLocale("Grid2Options", "ruRU")
if not L then return end

--{{{ General options
L["GRID2_WELCOME"] = "Добро пожаловать в Grid2"
-- L["GRID2_DESC"] = ""

L["General Settings"] = "Основные настройки"

L["statuses"] = "Статус"
-- L["indicators"] = ""

L["Frames"] = "Фреймы"
L["frame"] = "Фрейм"

-- L["Default Font"] = ""

L["Invert Bar Color"] = "Обратить цвет панели"
L["Swap foreground/background colors on bars."] = "Меняет местами окраску передниего плана/заднего на панели."

L["Background Color"] = "Фоновй цвет"
L["Sets the background color of each unit frame"] = "Установить цвет фона для каждого фрейма"

L["Mouseover Highlight"] = "Выделение при наведении мышки."
L["Toggle mouseover highlight."] = "Вкл/Выкл выделение при наведении курсора мыши."

L["Show Tooltip"] = "Показать подсказки"
L["Show unit tooltip.  Choose 'Always', 'Never', or 'OOC'."] = "Показывать подсказку единицы.  Выберите 'Всегда', 'Никогда', или 'Вне боя'."
L["Always"] = "Всегда"
L["Never"] = "Никогда"
L["OOC"] = "Вне боя"

L["Background Texture"] = "Фоновая текстура"
L["Select the frame background texture."] = "Выбрать фоновую текстуру фрейма"

L["Tile"] = "Заполнение"
L["Tile the background texture."] = "Заполнение фоновой текстуры"

L["Tile size"] = "Размер заполнения"
L["The size of the texture pattern."] = "Размер шаблона текстуры."

L["Inner Border Size"] = "Размер внутренней рамки"
L["Sets the size of the inner border of each unit frame"] = "Установить размер внутренней рамки для каждого фрейма"

L["Inner Border Color"] = "Цвет внутренней рамки"
L["Sets the color of the inner border of each unit frame"] = "Установить цвет внутренней рамки для каждого фрейма"

L["Frame Width"] = "Ширина области"
L["Adjust the width of each unit's frame."] = "Регулировка ширины области."

L["Frame Height"] = "Высота области"
L["Adjust the height of each unit's frame."] = "Регулировка высоты области."

L["Orientation of Frame"] = "Ориентация области"
L["Set frame orientation."] = "Настрйока ориентации области."
L["VERTICAL"] = "ВЕРТИКАЛЬНО"
L["HORIZONTAL"] = "ГОРИЗОНТАЛЬНО"

L["Orientation of Text"] = "Ориентация текста"
L["Set frame text orientation."] = "Установить ориентацию текста фреймов"

L["Show Frame"] = "Показать Область"
L["Sets when the Grid is visible: Choose 'Always', 'Grouped', or 'Raid'."] = "Установить отображение Gridа: 'Всегда', 'Группа' или 'Рейд'."
L["Always"] = "Всегда"
L["Grouped"] = "Группа"
L["Raid"] = "Рейд"

L["Layout Anchor"] = "Нахождение якоря"
L["Sets where Grid is anchored relative to the screen."] = "Настривает где якорь Grid будет находиться на экране."

L["Horizontal groups"] = "Группы горизонтально"
L["Switch between horzontal/vertical groups."] = "Переключить между группы вертикально/горизонтально."
L["Clamped to screen"] = "В пределах экрана"
L["Toggle whether to permit movement out of screen."] = "Не позволять перемещать окно за пределы экрана."
L["Frame lock"] = "Закрепить область"
L["Locks/unlocks the grid for movement."] = "Закрепить/открепить окно для передвижения."
L["Click through the Grid Frame"] = "Выбирать через окно Grid"
L["Allows mouse click through the Grid Frame."] = "Разрешает мышкой кликать сквозь окно Grнid."

L["Display"] = "Отображение"
L["Padding"] = "Заполнение"
L["Adjust frame padding."] = "Настройка заполнения области."
L["Spacing"] = "Промежуток"
L["Adjust frame spacing."] = "Настройка промежутка фрейма."
L["Scale"] = "Масштаб"
L["Adjust Grid scale."] = "Настройка масштаба Gridа."

L["Group Anchor"] = "Якорь группы"
L["Position and Anchor"] = "Позиция и якорь"
L["Sets where groups are anchored relative to the layout frame."] = "Настройка местоположения якорей групп относительно расположения области."
L["Resets the layout frame's position and anchor."] = "Обновляет позицию области и якоря."

-- L["Frame Strata"] = ""
-- L["Sets the strata in which the layout frame should be layered."] = ""
-- L["BACKGROUND"] = ""
-- L["LOW"] = ""
-- L["MEDIUM"] = ""
-- L["HIGH"] = ""

--blink
L["Misc"] = "Разное"
L["blink"] = "Мигание"
L["Blink effect"] = "Эффект мерцания"
L["Select the type of Blink effect used by Grid2."] = "Gвыьерите тип эффекта мерцания для использования в Grid2."
L["None"] = "Нет"
L["Blink"] = "Мерцания"
L["Flash"] = "Вспышка"
L["Blink Frequency"] = "Частота мерцания"
L["Adjust the frequency of the Blink effect."] = "Настройка частоты мерцания."

-- text formatting
-- L["Text Formatting"] = ""
-- L["Duration Format"] = ""
-- L["Examples:\n(%d)\n%d seconds"] = ""
-- L["Duration+Stacks Format"] = ""
-- L["Examples:\n%d/%s\n%s(%d)"] = ""
-- L["Display tenths of a second"] = ""
-- L["When duration<1sec"] = ""

-- misc
-- L["Blizzard Raid Frames"] = ""
-- L["Hide Blizzard Raid Frames on Startup"] = ""

-- debugging & maintenance
L["debugging"] = "Отлаживание"
L["Module debugging menu."] = "Модуль отладки меню."
L["Debug"] = "Отладка"
L["Reset"] = "Сброс"
L["Reset and ReloadUI."] = "Сброс и перезагрузка UI"
L["Reset Setup"] = "Reset Setup"
L["Reset current setup and ReloadUI."] = "Reset current setup and ReloadUI."
L["Reset Indicators"] = "Сброс индикаторов"
L["Reset indicators to defaults."] = "Сбросить индикаторы на стандартные."
L["Reset Locations"] = "Сброс расположения"
L["Reset locations to the default list."] = "Сбросить расположения на стандартные."
L["Reset to defaults."] = "Сброс значений на стандартные."
L["Reset Statuses"] = "Сброс статусов"
L["Reset statuses to defaults."] = "Сбросить статусы на стандартные."

L["Warning! This option will delete all settings and profiles, are you sure ?"] = "Внимание! Эта опция будет удалена во всех настройках и профилях, вы уверены?"

L["About"] = "Описание"

--{{{ Layouts options
-- L["Layout"] = ""
L["Layouts"] = "Расположение"
L["layout"] = "Расположение"
L["Layouts for each type of groups you're in."] = "Расположение для каждого типа групп при нахождении в."
L["Layout Settings"] = "Настройки расположения"
L["Solo Layout"] = "Соло Расположение"
L["Select which layout to use for solo."] = "Выбирает расположение для соло."
L["Party Layout"] = "Расположение группы"
L["Select which layout to use for party."] = "Выбирает расположение для группы."
L["Raid %s Layout"] = "Расположение рейда в %sчел"
L["Select which layout to use for %s person raids."] = "Выбирает расположение для рейда в %sчел."
L["Battleground Layout"] = "Расположение для полей битв"
L["Select which layout to use for battlegrounds."] = "Выбирает расположение для полей битв."
L["Arena Layout"] = "Расположение для арены"
L["Select which layout to use for arenas."] = "Выбирает расположение для арен."
-- L["Test"] = ""
-- L["Test the layout."] = ""
-- L["Select Layout"] = ""
-- L["New Layout Name"] = ""
-- L["Delete selected layout"] = ""
-- L["Refresh"] = ""
-- L["Refresh the Layout"] = ""
-- L["Toggle for vehicle"] = ""
-- L["When the player is in a vehicle replace the player frame with the vehicle frame."] = ""
-- L["Header"] = ""
-- L["Type of units to display"] = ""
-- L["Columns"] = ""
-- L["Maximum number of columns to display"] = ""
-- L["Units/Column"] = ""
-- L["Maximum number of units per column to display"] = ""
-- L["First group"] = ""
-- L["First group to display"] = ""
-- L["Last Group"] = ""
-- L["Last group to display"] = ""
-- L["Group by"] = ""
-- L["Sort by"] = ""
-- L["Action"] = ""
-- L["all"] = ""
-- L["Class"] = ""
-- L["Group"] = ""
-- L["Role"] = ""
L["Name"] = "Название"
-- L["Index"] = ""
-- L["party"] = ""
-- L["raid"] = ""
-- L["partypet"] = ""
-- L["raidpet"] = ""
-- L["Insert"] = ""
-- L["Copy"] = ""

--{{{ Miscelaneous
L["New"] = "Новый"
L["Order"] = "Порядок"
L["Delete"] = "Удалить"
L["Color"] = "Цвет"
L["Color %d"] = "Цвет %d"
L["Color for %s."] = "Цвет для %s."
L["Font"] = "Шрифт"
-- L["Font Border"] = ""
-- L["Thin"] = ""
-- L["Thick"] = ""
-- L["Soft"] = ""
-- L["Sharp"] = ""
L["Adjust the font settings"] = "Настройки шрифта."
-- L["Border Texture"] = ""
-- L["Adjust the border texture."] = ""
L["Border"] = "Граница"
-- L["Border Color"] = ""
L["Background"] = "Фон"
-- L["Enable Background"] = ""
L["Adjust border color and alpha."] = "Настройка цвет границы и прозрачность."
L["Adjust background color and alpha."] = "Настройка цвета фона и прозрачности."
L["Opacity"] = "Непрозрачность"
L["Set the opacity."] = "Установка непрозрачности"
L["<CharacterOnlyString>"] = "<CharacterOnlyString>"
L["Options for %s."] = " Опции для %s."
-- L["Delete this element"] = ""

--{{{ Indicator management
L["New Indicator"] = "Новый индикатор"
-- L["Create Indicator"] = ""
L["Create a new indicator."] = "Создать новый индикатор."
L["Name of the new indicator"] = "Название нового индикатора"
-- L["Enable or disable test mode for indicators"] = ""
L["Appearance"] = "Вид true"
L["Adjust the border size of the indicator."] = "Настройка размера границ индикатора."
-- L["Stack Text"] = ""
-- L["Disable Stack Text"] = ""
-- L["Disable Cooldown"] = ""
-- L["Disable the Cooldown Frame"] = ""
L["Reverse Cooldown"] = "Перевернуть восстановление"
L["Set cooldown to become darker over time instead of lighter."] = "Установить для восстановления темную окрску по прошествию времени, вместо светлой."
L["Cooldown"] = "Восстановление"
-- L["Text Location"] = ""
-- L["Disable OmniCC"] = ""
-- L["Animations"] = ""
-- L["Enable animation"] = ""
-- L["Turn on/off zoom animation of icons."] = ""
-- L["Duration"] = ""
-- L["Sets the duration in seconds."] = ""
L["Scale"] = "Масштаб"
-- L["Sets the zoom factor."] = ""

L["Type"] = "Тип"
L["Type of indicator"] = "Тип индикатора"
L["Type of indicator to create"] = "Тип создаваемого индикатора"
-- L["Change type"] = ""
-- L["Change the indicator type"] = ""

L["Text Length"] = "Длина текста"
L["Maximum number of characters to show."] = "Максимальное число отображаемх символов"
L["Font Size"] = "Размер шрифта"
L["Adjust the font size."] = "Настривает размер шрифта."
L["Size"] = "Размер"
L["Adjust the size of the indicator."] = "Настрйока размера индикатора."
-- L["Width"] = ""
-- L["Adjust the width of the indicator."] = ""
-- L["Height"] = ""
-- L["Adjust the height of the indicator."] = ""
-- L["Rectangle"] = ""
-- L["Allows to independently adjust width and height."] = ""
-- L["Use Status Color"] = ""
-- L["Always use the status color for the border"] = ""

L["Frame Texture"] = "Текстура области"
-- L["Adjust the frame texture."] = ""

L["Show stack"] = "Показать сумму"
L["Show the number of stacks."] = "Показывает сумму эффкта."
L["Show duration"] = "Длительность"
L["Show the time remaining."] = "Показывать оставшееся время."
-- L["Show elapsed time"] = ""
-- L["Show the elapsed time."] = ""
-- L["Show percent"] = ""
-- L["Show percent value"] = ""

L["Orientation of the Bar"] = "Ориентация полосы"
L["Set status bar orientation."] = "Установить ориентацию полосы статуса"
L["DEFAULT"] = "ПО УМОЛЧАНИЮ"
L["Frame Level"] = "Уровень фрейма"
L["Bars with higher numbers always show up on top of lower numbers."] = "Полоса с наибольшим номером всегда отображается поверх меньших номеров"
L["Bar Width"] = "Ширина полосы"
L["Choose zero to set the bar to the same width as parent frame"] = "Выберите 0, чтобы установить ширину полосы равную родительской"
L["Bar Height"] = "Высота полосы"
L["Choose zero to set the bar to the same height as parent frame"] = "Выберите 0, чтобы установить высоту полосы равную родительской"
-- L["Anchor to"] = ""
-- L["Anchor the indicator to the selected bar."] = ""

L["Border Size"] = "Размер края"
L["Adjust the border of each unit's frame."] = "Регулировка края области."
L["Border Background Color"] = "Цвет фона рамки"
L["Adjust border background color and alpha."] = "Регулировка цвета и прозрачности фона рамки"
-- L["Border separation"] = ""
-- L["Adjust the distance between the border and the frame content."] = ""

L["Select statuses to display with the indicator"] = "Выберите статусы которые будут отображаться на индикаторе."
L["Available Statuses"] = "Доступные статусы"
L["Available statuses you may add"] = "Доступные статусы которые вы можете добавить на индикатор"
L["Current Statuses"] = "Текущие статусы"
L["Current statuses in order of priority"] = "Текущий статус в индикаторе, в порядке очередности"
L["Move the status higher in priority"] = "Переместитт статус выше по приоритету"
L["Move the status lower in priority"] = "Переместитт статус ниже по приоритету"

L["indicator"] = "Индикатор"

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
L["bar"] = "Полоса"
-- L["glowborder"] = ""
L["icon"] = "Иконка"
L["icons"] = "иконки"
L["multibar"] = "многозадачная полоса"
L["portrait"] = "портрет"
-- L["shape"] = ""
L["square"] = "Квадрат"
L["text"] = "Текст"

-- indicators
L["corner-top-left"] = "в верхнем левом углу"
L["corner-top-right"] = "в верхнем правом углу"
L["corner-bottom-right"] = "в нижнем правом углу"
L["corner-bottom-left"] = "в нижнем левом углу"
L["side-top"] = "по краю вверху"
L["side-right"] = "по краю справа"
L["side-bottom"] = "по краю внизу"
L["side-left"] = "по краю слева"
L["text-up"] = "текст сверху"
L["text-down"] = "текст снизу"
L["icon-left"] = "иконка слева"
L["icon-center"] = "иконка в центре"
L["icon-right"] = "иконка справа"

-- locations
L["CENTER"] = "ЦЕНТР"
L["TOP"] = "ВЕРХ"
L["BOTTOM"] = "ОСНОВАНИЕ"
L["LEFT"] = "СЛЕВА"
L["RIGHT"] = "СПРАВА"
L["TOPLEFT"] = "ВВЕРХУ СЛЕВА"
L["TOPRIGHT"] = "ВВЕРХУ СПРАВА"
L["BOTTOMLEFT"] = "СНИЗУ СЛЕВА"
L["BOTTOMRIGHT"] = "СНИЗУ СПРАВА"

L["location"] = "Расположение"

L["Location"] = "Расположение"
L["Align my align point relative to"] = "Выровнять мою точки относительн к"
L["Align Point"] = "Точка выравнивания"
L["Align this point on the indicator"] = "Выравнивание данной точки на индикаторе"
L["X Offset"] = "Смещение по Х"
L["X - Horizontal Offset"] = "Х - смещение по горизонтале"
L["Y Offset"] = "Смещение по У"
L["Y - Vertical Offset"] = "У - смещение по вертикале"

--{{{ Statuses
L["-color"] = ":цвет"
L["-mine"] = ":моё"
L["-not-mine"] = ":не моё"
L["buff-"] = "бафф: "
L["debuff-"] = "дебафф: "
-- L["color-"] = ""

L["status"] = "Статус"

L["buff"] = "Бафф"
L["debuff"] = "Дебафф"
-- L["debuffType"] = ""

-- L["New Buff"] = ""
-- L["New Debuff"] = ""
-- L["New Color"] = ""
L["New Status"] = "Новый статус"
-- L["Delete Status"] = ""
L["Create a new status."] = "Создать новый статус."
-- L["Create Buff"] = ""
-- L["Create Debuff"] = ""
-- L["Create Color"] = ""
L["Enabled for"] = "Включено для"
L["Enable the status only if your character belong to the specified class."] = "Включайте статус, только если ваш персонаж принадлежит к указанному классу."

L["Threshold"] = "Порог"
-- L["Thresholds"] = ""
L["Threshold at which to activate the status."] = "Порог, при котором активируется статус."

-- L["available statuses"] = ""

-- buff & debuff statuses management
L["Auras"] = "Ауры"
L["Buffs"] = "Баффы"
L["Debuffs"] = "Дебаффы"
L["Colors"] = "Цвета"
-- L["Health&Heals"] = ""
-- L["Mana&Power"] = ""
L["Combat"] = "Бой"
-- L["Targeting&Distances"] = ""
-- L["Raid&Party Roles"] = ""
-- L["Miscellaneous"] = ""

L["Show if mine"] = "Показать если моё"
L["Show if not mine"] = "Показать если НЕ моё"
L["Show if missing"] = "Показывать если пропущен"
L["Display status only if the buff is not active."] = "Показывать статус только если баффы не активны."
L["Display status only if the buff was cast by you."] = "Показывать статус только если баффы применяются на вас"
L["Display status only if the buff was not cast by you."] = "Показывать статус только если баффы применяются НЕ на вас"
L["Color count"] = "Свет счетчика"
L["Select how many colors the status must provide."] = "Выберие, сколько цветов должен поддерживать статус"
L["You can include a descriptive prefix using separators \"@#>\""] = "Вы можете включить описательную приставку, используя разделители \"@#>\""
L["examples: Druid@Regrowth Chimaeron>Low Health"] = "Например: Druid@Regrowth Chimaeron>Low Health"
-- L["Threshold to activate Color"] = ""
-- L["Track by SpellId"] = ""
-- L["Track by spellId instead of aura name"] = ""
-- L["Assigned to"] = ""

-- L["Coloring based on"] = ""
-- L["Number of stacks"] = ""
-- L["Remaining time"] = ""
-- L["Elapsed time"] = ""

L["Class Filter"] = "Фильтр классов"
L["Show on %s."] = "Показать на %s."

L["Blink Threshold"] = "Порог мерцания"
L["Blink Threshold at which to start blinking the status."] = "Порог мерцания, при котором будет начинать мерцание статуса."

-- L["Name or SpellId"] = ""
-- L["Select Type"] = ""
L["Buff"] = "Бафф"
L["Debuff"] = "Дебафф"
-- L["Buffs Group"] = ""
-- L["Debuffs Group"] = ""
-- L["Buffs Group: Defensive Cooldowns"] = ""
-- L["Debuffs Group: Healing Prevented "] = ""
-- L["Debuffs Group: Healing Reduced"] = ""
-- L["Filtered debuffs"] = ""
-- L["Listed debuffs will be ignored."] = ""

-- general statuses
L["name"] = "название"
L["mana"] = "мана"
-- L["power"] = ""
-- L["poweralt"] = ""
L["alpha"] = "прозрачность"
L["border"] = "граница"
L["heals"] = "исцеление"
L["health"] = "здоровье"
L["charmed"] = "зачарованн"
L["afk"] = "афк"
L["death"] = "труп"
L["classcolor"] = "цвет-класса"
-- L["creaturecolor"] = ""
-- L["friendcolor"] = ""
L["feign-death"] = "притворяется"
L["heals-incoming"] = "входящее-исцеление"
L["health-current"] = "здоровье-текущее"
L["health-deficit"] = "нехватка-здоровья"
L["health-low"] = "мало-здоровья"
L["health-opacity"] = "здоровья-прозрачность"
L["lowmana"] = "мало-маны"
L["offline"] = "вне-сети"
L["raid-icon-player"] = "рейд-иконка игрока"
L["raid-icon-target"] = "рейд-иконка цели"
L["range"] = "радиус"
L["ready-check"] = "проверка-готовности"
L["role"] = "роль"
-- L["dungeon-role"] = ""
-- L["leader"] = ""
-- L["master-looter"] = ""
-- L["raid-assistant"] = ""
L["target"] = "цель"
L["threat"] = "угроза"
-- L["banzai"] = ""
-- L["banzai-threat"] = ""
L["vehicle"] = "транспорт"
L["voice"] = "голос"
L["pvp"] = "pvp"
-- L["direction"] = ""
-- L["resurrection"] = ""
-- L["self"] = ""

L["Curse"] = "Проклятье"
L["Poison"] = "Яд"
L["Disease"] = "Болезнь"
L["Magic"] = "Магия"

L["raid-debuffs"] = "рейд-дебаффы"
-- L["raid-debuffs2"] = ""
-- L["raid-debuffs3"] = ""
-- L["raid-debuffs4"] = ""
-- L["raid-debuffs5"] = ""

-- class specific buffs & debuffs statuses

-- shaman
L["EarthShield"] = "Щит земли"
L["Earthliving"] = "Жизнь Земли"
L["Riptide"] = "Быстрина"
-- L["ChainHeal"] = ""

-- Druid
L["Rejuvenation"] = "Омоложение"
L["Lifebloom"] = "Жизнецвет"
L["Regrowth"] = "Восстановление"
L["WildGrowth"] = "Буйный рост"

-- paladin
L["BeaconOfLight"] = "Частица Света"
L["FlashOfLight"] = "Вспышка Света"
L["DivineShield"] = "Божественный щит"
L["DivineProtection"] = "Божественная защита"
L["HandOfProtection"] = "Длань защиты"
L["HandOfSalvation"] = "Длань спасения"
L["Forbearance"] = "Воздержанность"

-- priest
L["Grace"] = "Милость"
L["DivineAegis"] = "Божественное покровительство"
L["InnerFire"] = "Внутренний огонь"
L["PrayerOfMending"] = "Молитва восстановления"
L["PowerWordShield"] = "Слово силы: Щит"
L["Renew"] = "Обновление"
L["WeakenedSoul"] = "Ослабленная душа"
L["SpiritOfRedemption"] = "Дух воздаяния"
-- L["CircleOfHealing"] = ""
-- L["PrayerOfHealing"] = ""

-- mage
L["FocusMagic"] = "Магическая концентрация"
L["IceArmor"] = "Ледяной доспех"
L["IceBarrier"] = "Ледяная преграда"

-- rogue
L["Evasion"] = "Ускользание"

-- warlock
L["ShadowWard"] = "Заслон от темной магии"
L["SoulLink"] = "Родство душ"
L["DemonArmor"] = "Демонический доспех"
L["FelArmor"] = "Доспех Скверны"

-- warrior
L["Vigilance"] = "Бдительность"
L["BattleShout"] = "Боевой крик"
L["CommandingShout"] = "Командирский крик"
L["ShieldWall"] = "Глухая оборона"
L["LastStand"] = "Ни шагу назад"

-- class color, creature color, friend color status
L["%s Color"] = "%s цвет"
-- L["Player color"] = ""
-- L["Pet color"] = ""
L["Color Charmed Unit"] = "Цвет Околдованных Игроков"
L["Color Units that are charmed."] = "Цвет для игроков попавший под разные отрицательные дебаффы и контроль."
L["Unit Colors"] = "Цвет игроков"
L["Charmed unit Color"] = "цвет околодованных игроков"
L["Default unit Color"] = "Цвета игроков по умолчанию"
L["Default pet Color"] = "Цвета питомцев по умолчанию"

L["DEATHKNIGHT"] = "Рыцарь смерти"
L["DRUID"] = "Друид"
L["HUNTER"] = "Охотница"
L["MAGE"] = "Маг"
L["PALADIN"] = "Паладин"
L["PRIEST"] = "Жрица"
L["ROGUE"] = "Разбойница"
L["SHAMAN"] = "Шаманка"
L["WARLOCK"] = "Чернокнижница"
L["WARRIOR"] = "Воин"
L["Beast"] = "Животное"
L["Demon"] = "Демон"
L["Humanoid"] = "Гуманоид"
L["Elemental"] = "Элементаль"

-- heal-current status
-- L["Full Health"] = ""
-- L["Medium Health"] = ""
-- L["Low Health"] = ""
L["Show dead as having Full Health"] = "Показывать мертвого как полным здоровьем"
-- L["Frequent Updates"] = ""
-- L["Instant Updates"] = ""

-- range status
L["Range"] = "Расстояние"
L["%d yards"] = "%d м."
L["Range in yards beyond which the status will be lost."] = "Диапозон вметрах выдя  за который статус будет утерян."
L["Default alpha"] = "Прозрачность по умолчанию"
L["Default alpha value when units are way out of range."] = "Прозрачность по умолчанию в зависимости от дапозона"
L["Update rate"] = "Частота обновления"
-- L["Rate at which the status gets updated"] = ""

-- ready-check status
L["Delay"] = "Задержка"
L["Set the delay until ready check results are cleared."] = "Установка задержки перед очисткой результатов проверки гтовности."
L["Waiting color"] = "Цвет ожидания"
L["Color for Waiting."] = "Цвет обозначающий ожидание"
L["Ready color"] = "Цвет готовности"
L["Color for Ready."] = "Цвет обозначающий готовность."
L["Not Ready color"] = "Цвет не готовности"
L["Color for Not Ready."] = "Цвет обозначающий не готовность."
L["AFK color"] = "Цвет AFK"
L["Color for AFK."] = "Цвет обозначающий отсутствие."

-- heals-incoming status
L["Include player heals"] = "Включая исцеления игрока"
L["Display status for the player's heals."] = "Показывать статус исчелений игрока"
L["Minimum value"] = "Минимальное значение"
L["Incoming heals below the specified value will not be shown."] = "Входящий хил ниже указанного значения показан не будет"
L["Heal filter"] = "Фильтр исцеления"
L["Show incoming heals for the selected heal types."] = "Показывает входящее исцеления для выбранного типа исцеления."
L["Direct heals"] = "Прямое исцеление"
L["Include direct heals."] = "Включить прямое исцеление."
L["Channeled heals"] = "Потоковое исцеление"
L["Include channeled heals."] = "Включить потоковое исцеление."
L["HoT heals"] = "Исцеление за время"
L["Include heal over time effects."] = "Включить исцеление за время (ХоТы)."

--target status
L["Your Target"] = "Ваша Цель"

--threat status
L["Not Tanking"] = "Не танкуется"
L["Higher threat than tank."] = "Высший уровень угрозы чем у танка."
L["Insecurely Tanking"] = "Ненадёжное танкование"
L["Tanking without having highest threat."] = "Танкование без наивысшего уровня угрозы."
L["Securely Tanking"] = "Надёжное танкование"
L["Tanking with highest threat."] = "Танкование с наивысшим уровнем угрозы."
-- L["Disable Blink"] = ""

-- voice status
L["Voice Chat"] = "Голосовой чат"

-- raid debuffs
L["General"] = "Основные"
L["Advanced"] = "Дополнительные"
L["Enabled raid debuffs modules"] = "Включить модуль рейд-дебаффов"
L["Enabled"] = "Включить"
L["Enable All"] = "Включить все"
L["Disable All"] = "Отключить все"
L["Copy to Debuffs"] = "Копировать дебафф"
L["Select module"] = "Выберите расширение"
L["Select instance"] = "Выберите образец"
L["The Lich King"] = "ВоТЛК"
L["The Burning Crusade"] = "БК"
L["New raid debuff"] = "Новый рейд-дебафф"
L["Type the SpellId of the new raid debuff"] = "Определите SpellId (Ид заклинания) для нового рейд-дебаффа"
L["Create raid debuff"] = "Создать рейд-дебафф"
L["Delete raid debuff"] = "Удалить рейд-дебафф"

-- direction
-- L["Out of Range"] = ""
-- L["Display status for units out of range."] = ""
-- L["Visible Units"] = ""
-- L["Display status for units less than 100 yards away"] = ""
L["Dead Units"] = "Мертвые юниты"
-- L["Display status only for dead units"] = ""

-- resurrection
-- L["Casting resurrection"] = ""
-- L["A resurrection spell is being casted on the unit"] = ""
-- L["Resurrected"] = ""
-- L["A resurrection spell has been casted on the unit"] = ""

-- shields status
L["shields"] = "щит"
L["Maximum shield amount"] = "Максимальное количество щитов"
-- L["Maximum shield amount value. Only used by bar indicators."] = ""
L["Normal"] = "Нормал"
L["Medium"] = "Средняя"
L["Low"] = "Низкий"
L["Normal shield color"] = "Нормальный цвет щита"
L["Medium shield color"] = "Цвет для среднего поглощения щита"
L["Low shield color"] = "Низкий цвет щита"
L["Low shield threshold"] = "Низкий порог защиты"
L["The value below which a shield is considered low."] = "Значение, ниже которого щит считается низким."
L["Medium shield threshold"] = "Среднее поглощение щита"
L["The value below which a shield is considered medium."] = "Значение, ниже которого щит считается средним."
-- L["Custom Shields"] = ""
-- L["Type shield spell IDs separated by commas."] = ""

-- boss-shields status
-- L["Boss"] = ""
-- L["Supported debuffs"] = ""

-- role related statuses
-- L["Hide in combat"] = ""
-- L["Hide Damagers"] = ""
-- L["Use alternate icons"] = ""
-- L["Show everywhere"] = ""
-- L["Show even when not in a dungeon"] = ""

-- status descriptions
-- L["highlights your target"] = ""
-- L["hostile casts against raid members"] = ""
-- L["advanced threat detection"] = ""
-- L["arrows pointing to each raid member"] = ""

-- aoe heals
-- L["aoe-"] = ""
-- L["neighbors"] = ""
-- L["highlighter"] = ""
-- L["OutgoingHeals"] = ""

-- L["AOE Heals"] = ""
-- L["Highlight status"] = ""
-- L["Autodetect"] = ""
-- L["Select the status the Highlighter will use."] = ""
-- L["Mouse Enter Delay"] = ""
-- L["Delay in seconds before showing the status."] = ""
-- L["Mouse Leave Delay"] = ""
-- L["Delay in seconds before hiding the status."] = ""
-- L["Min players"] = ""
-- L["Minimum players to enable the status."] = ""
-- L["Radius"] = ""
-- L["Max distance of nearby units."] = ""
-- L["Health deficit"] = ""
-- L["Minimum health deficit of units to enable the status."] = ""
-- L["Keep same targets"] = ""
-- L["Try to keep same heal targets solutions if posible."] = ""
-- L["Max solutions"] = ""
-- L["Maximum number of solutions to display."] = ""
-- L["Hide on cooldown"] = ""
-- L["Hide the status while the spell is on cooldown."] = ""
-- L["Show overlapping heals"] = ""
-- L["Show heal targets even if they overlap with other heals."] = ""
-- L["Show only in combat"] = ""
-- L["Enable the statuses only in combat."] = ""
-- L["Show only in raid"] = ""
-- L["Enable the statuses only in raid."] = ""
-- L["Active time"] = ""
-- L["Show the status for the specified number of seconds."] = ""
-- L["Spells"] = ""
-- L["You can type spell IDs or spell names."] = ""

-- Import/export profiles module
L["Import/export options"] = "Настройки Импорта/Экспорта"
L["Import profile"] = "Импорт профиля"
L["Export profile"] = "Экспорт профиля"
L["Network sharing"] = "<Network sharing>"
L["Accept profiles from other players"] = "Скопировать профиль с другого персонажа"
L["Type player name"] = "Определите имя персонажа"
L["Send current profile"] = "Отправить текущий профиль"
L["Profile import/export"] = "Профиль Импорта/Экспорта"
L["Paste here a profile in text format"] = "Вставить сюда профиль в текстовом формате"
L["Press CTRL-V to paste a Grid2 configuration text"] = "Нажмите CTRL-V для вставки текста настроек Grid2"
L["This is your current profile in text format"] = "Это ваш текущий профиль с текстовом формате"
L["Press CTRL-C to copy the configuration to your clipboard"] = "Нажмите CTRL-С на вашей клавиатуре для копирования настроек профиля"
-- L["Progress"] = ""
L["Data size: %.1fKB"] = "Размер данных: %.1fКБ"
-- L["Transmision progress: %d%%"] = ""
-- L["Transmission completed"] = ""
L["\"%s\" has sent you a profile configuration. Do you want to activate received profile ?"] = "\"%s\" послал вам профиль настроек. Хотите активировать полученный профиль?"
-- L["Include Custom Layouts"] = ""

-- Open manager
-- L["Options management"] = ""
-- L["Load options on demand (requires UI reload)"] = ""
-- L["OPTIONS_ONDEMAND_DESC"] = ""