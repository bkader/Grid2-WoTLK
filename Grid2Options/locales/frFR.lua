local L =  LibStub:GetLibrary("AceLocale-3.0"):NewLocale("Grid2Options", "frFR")
if not L then return end

--{{{ General options
L["GRID2_WELCOME"] = "Bienvenue sur Grid2"
L["GRID2_DESC"] = "Grid2 est un addon de cadre d'unité groupe. Il affiche la santé et toutes les informations pertinentes sur les membres du groupe de manière plus compréhensible."

L["General Settings"] = "Paramètres généraux"

L["statuses"] = "Statuts"
L["indicators"] = "Indicateurs"

L["Frames"] = "Cadres"
L["frame"] = "cadre"

L["Default Font"] = "Police par défaut"

L["Invert Bar Color"] = "Inverser les couleurs de barre"
L["Swap foreground/background colors on bars."] = "Intervertir les couleurs avant/arrière des barres."

L["Background Color"] = "Couleur d'arrière-plan"
L["Sets the background color of each unit frame"] = "Définit la couleur d'arrière-plan de chaque cadre d'unité."

L["Mouseover Highlight"] = "Surbrillance au survol"
L["Toggle mouseover highlight."] = "Active ou non la surbrillance lors du passage de la souris."

L["Show Tooltip"] = "Affichage de la bulle d'aide"
L["Show unit tooltip.  Choose 'Always', 'Never', or 'OOC'."] = "Définit quand afficher la bulle d'aide de l'unité. Choisissez entre 'Toujours', 'Jamais' ou 'Hors combat'."
L["Always"] = "Toujours"
L["Never"] = "Jamais"
L["OOC"] = "Hors combat"

L["Background Texture"] = "Texture d'arrière-plan"
L["Select the frame background texture."] = "Définit la texture d'arrière-plan du cadre."

L["Tile"] = "Tuile"
L["Tile the background texture."] = "Tuile la texture de l'arrière-plan"

L["Tile size"] = "Taille des tuiles"
L["The size of the texture pattern."] = "La taille du motif de la texture."

L["Inner Border Size"] = "Taille bordure interne"
L["Sets the size of the inner border of each unit frame"] = "Définit la taille de la bordure interne de chaque cadre d'unité."

L["Inner Border Color"] = "Couleur bordure interne"
L["Sets the color of the inner border of each unit frame"] = "Définit la couleur de la bordure interne de chaque cadre d'unité."

L["Frame Width"] = "Largeur du cadre"
L["Adjust the width of each unit's frame."] = "Définit la largeur de chaque cadre d'unité."

L["Frame Height"] = "Hauteur du cadre"
L["Adjust the height of each unit's frame."] = "Définit la hauteur de chaque cadre d'unité."

L["Orientation of Frame"] = "Orientation du cadre"
L["Set frame orientation."] = "Définit l'orientation du cadre."
L["VERTICAL"] = "VERTICAL"
L["HORIZONTAL"] = "HORIZONTAL"

L["Orientation of Text"] = "Orientation du texte"
L["Set frame text orientation."] = "Détermine l'orientation du texte de la grille."

L["Show Frame"] = "Affichage du cadre"
L["Sets when the Grid is visible: Choose 'Always', 'Grouped', or 'Raid'."] = "Configure la visibilité de Grid : Choisir 'Toujours', 'Groupé', ou 'Raid'."
L["Always"] = "Toujours"
L["Grouped"] = "Groupé"
L["Raid"] = "Raid"

L["Layout Anchor"] = "Ancre de la grille"
L["Sets where Grid is anchored relative to the screen."] = "Configure ou Grid sera ancré sur l'écran"

L["Horizontal groups"] = "Groupes horizontaux"
L["Switch between horzontal/vertical groups."] = "Permute entre des groupes horizontaux et verticaux."
L["Clamped to screen"] = "Restreindre à l'écran"
L["Toggle whether to permit movement out of screen."] = "Permet ou non les déplacements mouvements hors de l'écran."
L["Frame lock"] = "Verrouiller le cadre"
L["Locks/unlocks the grid for movement."] = "Verrouille/Déverrouille la grille."
L["Click through the Grid Frame"] = "Clics à travers la grille"
L["Allows mouse click through the Grid Frame."] = "Autorise les clics de souris au travers de la grille."
L["Minimap Button"] = "Bouton de la minicarte"
L["Show minimap button"] = "Afficher le bouton de la minicarte"
L["Toggles showing the minimap button."] = "Affiche ou non l'icône de la minicarte."

L["Display"] = "Affichage"
L["Padding"] = "Remplissage"
L["Adjust frame padding."] = "Ajuste le remplissage du cadre."
L["Spacing"] = "Espacement"
L["Adjust frame spacing."] = "Ajuster l'espacement des cadres."
L["Scale"] = "Agrandissement"
L["Adjust Grid scale."] = "Ajuster l'agrandissement."

L["Group Anchor"] = "Ancre des groupes"
L["Position and Anchor"] = "Position et Ancrage"
L["Sets where groups are anchored relative to the layout frame."] = "Défini l'ancrage des groupes par rapport au cadre de la grille."
L["Resets the layout frame's position and anchor."] = "Réinitialise la position et l'ancrage du cadre de la grille."

L["Frame Strata"] = "Couche"
L["Sets the strata in which the layout frame should be layered."] = "Détermine la couche sur lesquelles le cadre doit être superposé."
L["BACKGROUND"] = "ARRIÈRE-PLAN"
L["LOW"] = "BAS"
L["MEDIUM"] = "MOYEN"
L["HIGH"] = "HAUT"

--blink
L["Misc"] = "Divers"
L["blink"] = "Clignotement"
L["Blink effect"] = "Effet de clignotement"
L["Select the type of Blink effect used by Grid2."] = "Sélectionner le type de clignotement "
L["None"] = "Aucun"
L["Blink"] = "Clignotement"
L["Flash"] = "Flash"
L["Blink Frequency"] = "Fréquence de clignotement"
L["Adjust the frequency of the Blink effect."] = "Ajuste la fréquence de clignotement de l'effet de clignotement."

-- text formatting
L["Text Formatting"] = "Formatage de texte"
L["Duration Format"] = "Format de la durée "
L["Examples:\n(%d)\n%d seconds"] = "Exemples:\n(%d)\n%d secondes"
L["Duration+Stacks Format"] = "Format de durée + piles"
L["Examples:\n%d/%s\n%s(%d)"] = "Exemples:\n%d/%s\n%s(%d)"
L["Display tenths of a second"] = "Afficher les dixièmes de seconde"
L["When duration<1sec"] = "Quand durée<1sec"

-- misc
L["Blizzard Raid Frames"] = "Fenêtre de raid"
L["Hide Blizzard Raid Frames on Startup"] = "Cacher la fenêtre de raid au démarrage"

-- debugging & maintenance
L["debugging"] = "debugging"
L["Module debugging menu."] = "Menu du module de débugging"
L["Debug"] = "Debug"
L["Reset"] = "Réinitialiser"
L["Reset and ReloadUI."] = "RAZ et reloadUI."
L["Reset Setup"] = "RAZ Setup"
L["Reset current setup and ReloadUI."] = "RAZ paramètres et ReloadUI."
L["Reset Indicators"] = "RAZ des indicateurs"
L["Reset indicators to defaults."] = "Indicateurs par défaut."
L["Reset Locations"] = "RAZ des emplacements"
L["Reset locations to the default list."] = "Emplacements par défaut."
L["Reset to defaults."] = "RAZ"
L["Reset Statuses"] = "RAZ des Statuts"
L["Reset statuses to defaults."] = "Statuts par défaut."

L["Warning! This option will delete all settings and profiles, are you sure ?"] = "Attention ! Cette option supprimera tous les paramètres et tous les profils, êtes-vous sûr ?"

L["About"] = "À propos"

--{{{ Layouts options
L["Layout"] = "Agencement"
L["Layouts"] = "Agencements"
L["layout"] = "agencement"
L["Layouts for each type of groups you're in."] = "Agencements pour chaque type de groupe dans lequel vous êtes."
L["Layout Settings"] = "Paramètres d'agencement"
L["Solo Layout"] = "Agencement quand seul"
L["Select which layout to use for solo."] = "Définit l'agencement à utiliser quand vous êtes seul."
L["Party Layout"] = "Agencement en groupe"
L["Select which layout to use for party."] = "Définit l'agencement à utiliser quand vous êtes en groupe."
L["Raid %s Layout"] = "Agencement en raid %s"
L["Select which layout to use for %s person raids."] = "Définit l'agencement à utiliser quand vous êtes en raid de %s personnes."
L["Battleground Layout"] = "Agencement dans les champs de bataille"
L["Select which layout to use for battlegrounds."] = "Définit l'agencement à utiliser quand vous êtes dans un champ de bataille."
L["Arena Layout"] = "Agencement en arène"
L["Select which layout to use for arenas."] = "Définit l'agencement à utiliser quand vous êtes en arène."
L["Test"] = "Tester"
L["Test the layout."] = "Teste l'agencement."
L["Select Layout"] = "Choix de disposition"
L["New Layout Name"] = "Nom de la nouvelle disposition"
L["Delete selected layout"] = "Supprimer la disposition"
L["Refresh"] = "Rafraîchir"
L["Refresh the Layout"] = "Rafraîchir la disposition"
L["Toggle for vehicle"] = "Afficher pour véhicule"
L["When the player is in a vehicle replace the player frame with the vehicle frame."] = "Lorsque le joueur est dans un véhicule, remplacer son cadre par le cadre du véhicule."
L["Header"] = "Entête"
L["Type of units to display"] = "Type d'unités à afficher"
L["Columns"] = "Colonnes"
L["Maximum number of columns to display"] = "Nombre maximum de colonnes à afficher"
L["Units/Column"] = "Unités/Colonne"
L["Maximum number of units per column to display"] = "Nombre maximum d'unités à afficher par colonne"
L["First group"] = "Premier groupe"
L["First group to display"] = "Premier groupe à afficher"
L["Last Group"] = "Dernier groupe"
L["Last group to display"] = "Dernier groupe à afficher"
L["Group by"] = "Grouper par"
L["Sort by"] = "Trier par"
L["Action"] = "Action"
L["all"] = "tout"
L["Class"] = "Classe"
L["Group"] = "Groupe"
L["Role"] = "Rôle"
L["Name"] = "Nom"
L["Index"] = "Indice"
L["party"] = "groupe"
L["raid"] = "raid"
L["partypet"] = "familier de groupe"
L["raidpet"] = "familier de raid"
L["Insert"] = "Insérer"
L["Copy"] = "Copier"

--{{{ Miscelaneous
L["New"] = "Nouveau"
L["Order"] = "Ordre"
L["Delete"] = "Supprimer"
L["Color"] = "Couleur"
L["Color %d"] = "Couleur %d"
L["Color for %s."] = "Couleur pour %s."
L["Font"] = "Style"
L["Font Border"] = "Bordure de police"
L["Thin"] = "Fin"
L["Thick"] = "Épais"
-- L["Soft"] = ""
-- L["Sharp"] = ""
L["Adjust the font settings"] = "Définit les paramètres de police d'écriture."
L["Border Texture"] = "Texture de bordure"
L["Adjust the border texture."] = "Définit la texture de la bordure."
L["Border"] = "Bordure"
L["Border Color"] = "Couleur de bordure"
L["Background"] = "Arrière-plan"
L["Enable Background"] = "Activer l'arrière-plan"
L["Adjust border color and alpha."] = "Définit la couleur et la transparence de la bordure."
L["Adjust background color and alpha."] = "Définit la couleur et la transparence de l'arrière-plan."
L["Opacity"] = "Opacité"
L["Set the opacity."] = "Définit l'opacité"
L["<CharacterOnlyString>"] = "<StringComposéUniquementDeCaractères>"
L["Options for %s."] = "Options |2 %s."
L["Delete this element"] = "Supprimer cet élément "

--{{{ Indicator management
L["New Indicator"] = "Nouvel indicateur"
L["Create Indicator"] = "Créer indicateur"
L["Create a new indicator."] = "Crée un nouvel indicateur."
L["Name of the new indicator"] = "Nom du nouvel indicateur"
L["Enable or disable test mode for indicators"] = "Activer ou désactiver le mode test pour les indicateurs"
L["Appearance"] = "Apparence"
L["Adjust the border size of the indicator."] = "Définit la taille de la bordure de l'indicateur."
L["Stack Text"] = "Texte de la pile"
L["Disable Stack Text"] = "Désactiver le texte de la pile"
L["Disable Cooldown"] = "Désactiver le temps de recharge"
L["Disable the Cooldown Frame"] = "Désactiver le cadre de temps de recharge"
L["Reverse Cooldown"] = "Compte à Rebours inversé"
L["Set cooldown to become darker over time instead of lighter."] = "Paramètre le CD pour devenir plus sombre suivant le temps écoulé au lieu de plus clair."
L["Cooldown"] = "Temps de recharge"
L["Text Location"] = "Emplacement du texte"
L["Disable OmniCC"] = "Désactiver OmniCC"
L["Animations"] = "Animations"
L["Enable animation"] = "Activer l'animation"
L["Turn on/off zoom animation of icons."] = "Activer/désactiver l'animation de zoom des icônes."
L["Duration"] = "Durée"
L["Sets the duration in seconds."] = "Définir la durée en secondes."
L["Scale"] = "Agrandissement"
L["Sets the zoom factor."] = "Définit le facteur de zoom."

L["Type"] = "Type"
L["Type of indicator"] = "Type d'indicateur"
L["Type of indicator to create"] = "Type d'indicateur à créer"
L["Change type"] = "Changer le type"
L["Change the indicator type"] = "Changer le type d'indicateur"

L["Text Length"] = "Longueur du texte"
L["Maximum number of characters to show."] = "Définit le nombre maximal de caractères à afficher."
L["Font Size"] = "Taille de la police"
L["Adjust the font size."] = "Définit la taille de la police d'écriture."
L["Size"] = "Taille"
L["Adjust the size of the indicator."] = "Définit la taille de l'indicateur."
L["Width"] = "Largeur"
L["Adjust the width of the indicator."] = "Ajuster la largeur de l'indicateur."
L["Height"] = "Hauteur"
L["Adjust the height of the indicator."] = "Ajuster la hauteur de l'indicateur."
L["Rectangle"] = "Rectangle"
L["Allows to independently adjust width and height."] = "Permet de régler indépendamment la largeur et la hauteur."
L["Use Status Color"] = "Utiliser la couleur de statut"
L["Always use the status color for the border"] = "Toujours utiliser la couleur de statut pour la bordure"

L["Frame Texture"] = "Texture du cadre"
L["Adjust the frame texture."] = "Ajuster la texture du cadre."

L["Show stack"] = "Afficher cumul"
L["Show the number of stacks."] = "Affiche le nombre de cumuls."
L["Show duration"] = "Afficher durée"
L["Show the time remaining."] = "Affiche le temps restant."
L["Show elapsed time"] = "Afficher le temps écoulé"
L["Show the elapsed time."] = "Afficher le temps écoulé."
L["Show percent"] = "Afficher pourcentage"
L["Show percent value"] = "Afficher la valeur en pourcentage"

L["Orientation of the Bar"] = "Orientation de la barre"
L["Set status bar orientation."] = "Définit l'orientation de la barre de statut."
L["DEFAULT"] = "DÉFAUT"
L["Frame Level"] = "Niveau du cadre"
L["Bars with higher numbers always show up on top of lower numbers."] = "Les barres avec des niveaux plus élevés apparaissent toujours au-dessus des niveaux inférieurs."
L["Bar Width"] = "Largeur de la barre"
L["Choose zero to set the bar to the same width as parent frame"] = "Choisissez zéro pour définir la barre à la même largeur que le cadre-parent."
L["Bar Height"] = "Hauteur de la barre"
L["Choose zero to set the bar to the same height as parent frame"] = "Choisissez zéro pour définir la barre à la même hauteur que le cadre-parent."
L["Anchor to"] = "Ancrer à"
L["Anchor the indicator to the selected bar."] = "Ancrer l'indicateur à la barre sélectionnée."
L["Reverse Fill"] = "Remplissage inversé"
L["Fill the bar in reverse."] = "Remplir la barre à l'envers."
L["Bars"] = "Barres"
L["Extra Bar"] = "Barre supplémentaire"
L["Main Bar Color"] = "Couleur de la barre principale"
L["Anchor to MainBar"] = "Ancrer à la barre principale"
L["Anchor the background bar to the Main Bar instead of the last bar."] = "Ancrer la barre d'arrière-plan à la barre principale au lieu de la dernière barre."
L["Reverse"] = "Inversé"
L["Overlap"] = "Chevauché"
L["Texture"] = "Texture"
L["Status Color"] = "Couleur du status"
L["Main Bar"] = "Bar principale"
L["Fill bar in reverse"] = "Remplir la barre à l'envers"
L["Anchor & Direction"] = "Position & Direction"
L["Select where to anchor the bar and optional you can reverse the grow direction."] = "Sélectionner où ancrer la barre et éventuellement inverser le sens de remplissage."
L["Previous Bar"] = "Barre précédente"
L["Topmost Bar"] = "Barre la plus haute"
L["Previous Bar & Reverse"] = "Barre précédente & Inversé"

L["Border Size"] = "Taille de la bordure"
L["Adjust the border of each unit's frame."] = "Ajuster la bordure de chaque cadre d'unité."
L["Border Background Color"] = "Couleur arrière-plan bordure"
L["Adjust border background color and alpha."] = "Définit la couleur et la transparence de l'arrière-plan de la bordure."
L["Border separation"] = "Séparation des bordures"
L["Adjust the distance between the border and the frame content."] = "Ajuste la distance entre la bordure et le contenu du cadre."

L["Select statuses to display with the indicator"] = "Sélectionner les statuts à afficher avec l'indicateur"
L["Available Statuses"] = "Statuts disponibles"
L["Available statuses you may add"] = "Statuts disponibles que vous pouvez ajouter"
L["Current Statuses"] = "Statuts actuels"
L["Current statuses in order of priority"] = "Statuts actuels par ordre de priorité"
L["Move the status higher in priority"] = "Bouger le statut en priorité plus haute"
L["Move the status lower in priority"] = "Bouger le statut en priorité plus basse"

L["indicator"] = "indicateur"

L["Maintenance"] = "Maintenance"
L["Create"] = "Créer"
L["Icon"] = "Icône"
L["Max Icons"] = "Icônes max."
L["Icons per row"] = "Icônes par ligne"
L["Icon Size"] = "Taille de l'icône"
L["Icon Spacing"] = "Espacement des icônes"
L["Direction"] = "Direction"
L["Select the direction of the main bar."] = "Choisissez la direction de la barre principale"

-- L["Blizzard"] = ""
L["Blizzard Glow effect is already in use by another indicator, select another effect."] = "L'effet Blizzard Glow est déjà utilisé par un autre indicateur, sélectionnez un autre effet."
L["Glow Color"] = "Couleur de la lueur"
L["Choose how to colorize the glow border."] = "Choisissez comment colorer la lueur de bordure."
L["Sets the glow color to use when the indicator is active."] = "Définit la couleur de lueur à utiliser lorsque l'indicateur est actif."
L["Glow Effect"] = "Effet de lueur"
L["Select the glow effect."] = "Sélectionnez l'effet de lueur."
L["Animation Speed"] = "Vitesse d'animation"
L["Number of Lines"] = "Nombre de lignes"
L["Thickness"] = "Épaisseur"
L["Number of particles"] = "Nombre de particules"
L["Scale of particles"] = "Échelle des particules"
L["Pixel"] = "Pixels"
L["Shine"] = "Éclat"

-- indicator types
L["background"] = "arrière-plan"
L["bar"] = "barre"
L["glowborder"] = "lueur de bordure"
L["icon"] = "icône"
L["icons"] = "icônes"
L["multibar"] = "multi-barre"
L["portrait"] = "portrait"
L["shape"] = "forme"
L["square"] = "carré"
L["text"] = "texte"

-- indicators
L["corner-top-left"] = "coin-haut-gauche"
L["corner-top-right"] = "coin-haut-droit"
L["corner-bottom-right"] = "coin-bas-droit"
L["corner-bottom-left"] = "coin-bas-gauche"
L["side-top"] = "côté-haut"
L["side-right"] = "côté-droit"
L["side-bottom"] = "côté-bas"
L["side-left"] = "côté-gauche"
L["text-up"] = "texte-haut"
L["text-down"] = "texte-bas"
L["icon-left"] = "icône-gauche"
L["icon-center"] = "icône-centre"
L["icon-right"] = "icône-droite"

-- locations
L["CENTER"] = "CENTRE"
L["TOP"] = "HAUT"
L["BOTTOM"] = "BAS"
L["LEFT"] = "GAUCHE"
L["RIGHT"] = "DROITE"
L["TOPLEFT"] = "HAUT GAUCHE"
L["TOPRIGHT"] = "HAUT DROIT"
L["BOTTOMLEFT"] = "BAS GAUCHE"
L["BOTTOMRIGHT"] = "BAS DROIT"

L["location"] = "Position"

L["Location"] = "Emplacement"
L["Align my align point relative to"] = "Aligner le point d'alignement par rapport à "
L["Align Point"] = "Point d'alignement"
L["Align this point on the indicator"] = "Aligner ce point sur l'indicateur"
L["X Offset"] = "Décalage en X"
L["X - Horizontal Offset"] = "X - Décalage horizontal"
L["Y Offset"] = "Décalage en Y"
L["Y - Vertical Offset"] = "Y - Décalage vertical"

L["Adjust the horizontal offset of the text"] = "Ajuster le décalage horizontal du texte"
L["Adjust the vertical offset of the text"] = "Ajuster le décalage vertical du texte"
L["Set the font border type."] = "Définir le type de bordure de police."
L["Orientation"] = "Orientation"
L["Set the icons orientation."] = "Définir l'orientation des icônes."
L["Display Squares"] = "Afficher les carrés"
L["Display flat square textures instead of the icons provided by the statuses."] = "Afficher des textures carrées plates au lieu des icônes fournies par les statuts."
L["Select maximum number of icons to display."] = "Choisir le nombre maximum d'icônes à afficher."
L["Select the number of icons per row."] = "Choisir le nombre d'icônes par ligne."
L["Adjust the size of the icons, select Zero to use the default icon size."] = "Ajuster la taille des icônes, sélectionnez Zéro pour utiliser la taille d'icône par défaut."
L["Adjust the space between icons."] = "Ajuster l'espace entre les icônes."
L["Prev. Bar & Reverse"] = "Barre Préc. & Inversé"
L["Whole Background"] = "Tout l'arrière-plan"
L["Select bar texture."] = "Choisir la texture de la barre."
L["Color Source"] = "Source de couleur"
L["Select how to colorize the main bar."] = "Choisir comment colorer la barre principale."
L["Bar color"] = "Couleur de la barre"
L["Invert"] = "Inverser"
L["Swap foreground/background colors on main bar."] = "Iverser les couleurs premier plan/arrière-plan sur la barre principale."
L["Select howto colorize the bar."] = "Choisir comment colorer la barre."
L["Select bar color"] = "Choisir la couleur de la barre"
L["Anchor"] = "Position"
L["Select how to anchor the background bar."] = "Choisir la position de l'arrière-plan."
L["Add Bar"] = "Nouvelle Barre"
L["Add a new bar"] = "Ajouter une nouvelle barre"
L["Delete Bar"] = "Supp. Barre"
L["Delete last bar"] = "Supprimer la dernière barre."
L["This action cannot be undone. Are you sure?"] = "Cette action est irréversible. Êtes-vous sûr?"
L["Del Background"] = "Supp. arrière-plan"
L["Add Background"] = "Aj. arrière-plan"
L["Enable or disable the background texture"] = "Activer ou désactiver la texture d'arrière-plan"
L["Portrait Type"] = "Type de portrait"
L["Select the portrait to display."] = "Choisir le portrait à afficher."
L["Inner Border"] = "Bordure intérieure"
L["2D Model"] = "Modèle 2D"
L["Class Icon"] = "Icône de classe"
L["Specialization"] = "Spécialisation"
L["Square"] = "Carré"
L["Rounded Square"] = "Carré arrondi"
L["Circle"] = "Cercle"
L["Diamond"] = "Diamant"
L["Triangle"] = "Triangle"
L["Right Triangle"] = "Triangle droit"
L["Semi Circle"] = "Demi-cercle"
L["Quarter Circle"] = "Quart de cercle"
L["0 degrees"] = "0 degrés"
L["90 degrees"] = "90 degrés"
L["180 degrees"] = "180 degrés"
L["270 degrees"] = "270 degrés"
L["Select the shape to display"] = "Choisir la forme à afficher"
L["Rotation"] = "Rotation"
L["Select the shape angle"] = "Choisir l'angle de la forme"
L["Adjust the size of the shape, select zero to use the theme default icon size."] = "Ajuster la taille de la forme, sélectionner zéro pour utiliser la taille d'icône par défaut."
L["Enable Shadow"] = "Activer l'ombre"
L["Display a Shadow under the Shape."] = "Afficher une ombre sous la forme."
L["Extra Size"] = "Taille supplémentaire"
L["Extra size of the shadow shape."] = "Taille supplémentaire de la forme de l'ombre."

--{{{ Statuses
L["-color"] = "-couleur"
L["-mine"] = "-à-moi"
L["-not-mine"] = "-pas-à-moi"
L["buff-"] = "buff-"
L["debuff-"] = "débuff-"
L["color-"] = "couleur-"

L["status"] = "Statut"

L["buff"] = "buff"
L["debuff"] = "débuff"
L["debuffType"] = "type de débuff"

L["New Buff"] = "Nouveau Buff"
L["New Debuff"] = "Nouveau Débuff"
L["New Color"] = "Nouvelle couleur"
L["New Status"] = "Nouveau statut"
L["Delete Status"] = "Supprimer le statut"
L["Create a new status."] = "Créé un nouveau statut."
L["Create Buff"] = "Créer Buff"
L["Create Default Buffs"] = "Créer buffs par défaut"
L["Create Default Buffs for %s."] = "Créer les buffs par défaut pour %s."
L["Create Debuff"] = "Créer Débuff"
L["Create Color"] = "Créer couleur"
L["Enabled for"] = "Activer pour"
L["Enable the status only if your character belong to the specified class."] = "Activer le statut uniquement si votre personnage est de la classe spécifiée."

L["Threshold"] = "Seuil"
L["Thresholds"] = "Seuils"
L["Threshold at which to activate the status."] = "Seuil d'activation du statut."

L["available statuses"] = "statuts disponibles "

-- buff & debuff statuses management
L["Auras"] = "Auras"
L["Buffs"] = "Buffs"
L["Debuffs"] = "Débuffs"
L["Colors"] = "Couleurs"
L["Health&Heals"] = "Vie & Soins"
L["Mana&Power"] = "Mana & Ressource"
L["Combat"] = "Combat"
L["Targeting&Distances"] = "Ciblage & Distances"
L["Raid&Party Roles"] = "Raid & Rôles de groupe"
L["Miscellaneous"] = "Divers"

L["Show if mine"] = "Afficher si le mien"
L["Show if not mine"] = "Afficher si pas le mien"
L["Show if missing"] = "Afficher si manquant"
L["Display status only if the buff is not active."] = "Affiche le statut uniquement si le buff n'est pas actif."
L["Display status only if the buff was cast by you."] = "Affiche le statut uniquement si le buff est le vôtre."
L["Display status only if the buff was not cast by you."] = "Affiche le statut uniquement si le buff n'est pas le vôtre."
L["Color count"] = "Nombre de couleurs"
L["Select how many colors the status must provide."] = "Sélectionnez le nombre de couleurs que le statut doit fournir."
L["You can include a descriptive prefix using separators \"@#>\""] = "Vous pouvez inclure un préfixe descriptif à l'aide de séparateurs \"@#>\""
L["examples: Druid@Regrowth Chimaeron>Low Health"] = "exemples: Druid@Regrowth Chimaeron>Low Health"
L["Threshold to activate Color"] = "Seuil pour activer la couleur "
L["Track by SpellId"] = "Suivi par ID du sort"
L["Track by spellId instead of aura name"] = "Suivi par ID au lieu du nom du sort"
L["Assigned to"] = "Assigné à"

L["Coloring based on"] = "Coloration basée sur"
L["Number of stacks"] = "Nombre de piles"
L["Remaining time"] = "Temps restant"
L["Elapsed time"] = "Temps écoulé "

L["Class Filter"] = "Filtre de classe"
L["Show on %s."] = "Montrer sur %s."

L["Blink Threshold"] = "Seuil de clignotement"
L["Blink Threshold at which to start blinking the status."] = "Seuil pour lequel le clignotement du statut commencera."

L["Name or SpellId"] = "Nom ou ID du sort"
L["Select Type"] = "Choix du type"
L["Buff"] = "Buff"
L["Debuff"] = "Débuff"
L["Buffs Group"] = "Groupe de buffs"
L["Debuffs Group"] = "Groupe de débuffs"
L["Buffs Group: Defensive Cooldowns"] = "Groupe de buffs : sorts défensifs"
L["Debuffs Group: Healing Prevented "] = "Groupe de débuffs : soins empêchés"
L["Debuffs Group: Healing Reduced"] = "Groupe de débuffs : soins réduits"
L["Filtered debuffs"] = "Débuffs filtrés"
L["Listed debuffs will be ignored."] = "Les debuffs listés seront ignorés. "

-- general statuses
L["name"] = "nom"
L["mana"] = "mana"
L["power"] = "ressource"
L["poweralt"] = "puissance-alt"
L["alpha"] = "transparence"
L["border"] = "bordure"
L["heals"] = "soins"
L["health"] = "vie"
L["charmed"] = "charmé"
L["afk"] = "abs"
L["death"] = "mort"
L["classcolor"] = "couleur-classe"
L["creaturecolor"] = "couleur-créature"
L["friendcolor"] = "couleur-amical"
L["feign-death"] = "feint-mort"
L["heals-incoming"] = "soins-entrant"
L["health-current"] = "vie-actuelle"
L["health-deficit"] = "déficit-vie"
L["health-low"] = "vie-faible"
L["health-opacity"] = "vie-transparence"
L["lowmana"] = "mana-faible"
L["offline"] = "déco"
L["raid-icon-player"] = "joueur-icône-raid"
L["raid-icon-target"] = "cible-icône-raid"
L["range"] = "distance"
L["ready-check"] = "appel"
L["role"] = "rôle"
L["spec"] = "spécialisation"
L["dungeon-role"] = "rôle-donjon"
L["leader"] = "chef"
L["master-looter"] = "maître-butin"
L["raid-assistant"] = "assistant-raid"
L["target"] = "cible"
L["threat"] = "menace"
L["banzai"] = "banzai"
-- L["banzai-threat"] = ""
L["vehicle"] = "véhicule"
L["voice"] = "voix"
L["pvp"] = "jcj"
L["direction"] = "direction"
L["resurrection"] = "résurrection"
L["self"] = "soi-même"

L["Curse"] = "Malédiction"
L["Poison"] = "Poison"
L["Disease"] = "Maladie"
L["Magic"] = "Magie"

L["raid-debuffs"] = "Débuffs de raid"
L["raid-debuffs2"] = "Débuffs de raid (2)"
L["raid-debuffs3"] = "Débuffs de raid (3)"
L["raid-debuffs4"] = "Débuffs de raid (4)"
L["raid-debuffs5"] = "Débuffs de raid (5)"

-- class specific buffs & debuffs statuses

-- shaman
L["EarthShield"] = "BouclierDeTerre"
L["Earthliving"] = "Viveterre"
L["Riptide"] = "Remous"
L["ChainHeal"] = "Salve de guérison"

-- Druid
L["Rejuvenation"] = "Récupération"
L["Lifebloom"] = "FleurDeVie"
L["Regrowth"] = "Rétablissement"
L["WildGrowth"] = "CroissanceSauvage"

-- paladin
L["BeaconOfLight"] = "GuideDeLumière"
L["FlashOfLight"] = "ÉclairLumineux"
L["DivineShield"] = "BouclierDivin"
L["DivineProtection"] = "ProtectionDivine"
L["HandOfProtection"] = "MainDeProtection"
L["HandOfSalvation"] = "MainDeSalut"
L["Forbearance"] = "Longanimité"

-- priest
L["Grace"] = "Grâce"
L["DivineAegis"] = "EgideDivine"
L["InnerFire"] = "FeuIntérieur"
L["PrayerOfMending"] = "PrièreDeGuérison"
L["PowerWordShield"] = "MotDePouvoirBouclier"
L["Renew"] = "Rénovation"
L["WeakenedSoul"] = "ÂmeAffaiblie"
L["SpiritOfRedemption"] = "EspritDeRédemption"
L["CircleOfHealing"] = "Cercle de soins"
L["PrayerOfHealing"] = "Prière de soins"

-- mage
L["FocusMagic"] = "FocalisationDeLaMagie"
L["IceArmor"] = "ArmureDeGlace"
L["IceBarrier"] = "BarrièreDeGlace"

-- rogue
L["Evasion"] = "Évasion"

-- warlock
L["ShadowWard"] = "GardienDOmbre"
L["SoulLink"] = "LienSpirituel"
L["DemonArmor"] = "ArmureDémoniaque"
L["FelArmor"] = "Gangrarmure"

-- warrior
L["Vigilance"] = "Vigilance"
L["BattleShout"] = "CriDeGuerre"
L["CommandingShout"] = "CriDeCommandement"
L["ShieldWall"] = "MurProtecteur"
L["LastStand"] = "DernierRempart"

-- class color, creature color, friend color status
L["%s Color"] = "Couleur de %s"
L["Player color"] = "Couleur du joueur"
L["Pet color"] = "Couleur du familier"
L["Color Charmed Unit"] = "Couleur des Unités Charmées"
L["Color Units that are charmed."] = "Colore des Unités Charmées"
L["Unit Colors"] = "Couleur des unités"
L["Charmed unit Color"] = "Couleur des unités Charmées"
L["Default unit Color"] = "Couleur par défaut des unités"
L["Default pet Color"] = "Couleur par défaut des pets"

L["DEATHKNIGHT"] = "Chevalier de la mort"
L["DRUID"] = "Druide"
L["HUNTER"] = "Hunt"
L["MAGE"] = "Mage"
L["PALADIN"] = "Paladin"
L["PRIEST"] = "Prêtre"
L["ROGUE"] = "Voleur"
L["SHAMAN"] = "Shaman"
L["WARLOCK"] = "Démoniste"
L["WARRIOR"] = "Guerrier"
L["Beast"] = "Bête"
L["Demon"] = "Démon"
L["Humanoid"] = "Humanoide"
L["Elemental"] = "Elémentaire"

-- heal-current status
L["Full Health"] = "Pleine santé"
L["Medium Health"] = "Santé moyenne"
L["Low Health"] = "Faible santé"
L["Show dead as having Full Health"] = "Montrer les morts comme par étant full vie"
L["Frequent Updates"] = "Mises à jour fréquentes"
L["Instant Updates"] = "Mises à jour instantanées"

-- health-low status
L["Use Health Percent"] = "Utiliser le pourcentage de santé"

-- range status
L["Range"] = "Distance"
L["%d yards"] = "%d mètres"
L["Range in yards beyond which the status will be lost."] = "Distance en mètres au-dessus de laquelle le statut sera perdu."
L["Default alpha"] = "Transparence par défaut"
L["Default alpha value when units are way out of range."] = "Valeur par défaut de la transparence lorsque les unités sont hors de portée."
L["Update rate"] = "Fréquence de mise à jour"
L["Rate at which the status gets updated"] = "Fréquence à laquelle le statut est mis à jour."

-- ready-check status
L["Delay"] = "Délai"
L["Set the delay until ready check results are cleared."] = "Timer avant disparition des résultats de l'appel"
L["Waiting color"] = "Couleur d'attente"
L["Color for Waiting."] = "Couleur pour l'attente"
L["Ready color"] = "Couleur ok"
L["Color for Ready."] = "Couleur pour prêt"
L["Not Ready color"] = "Couleur nok"
L["Color for Not Ready."] = "Couleur pour non prêt"
L["AFK color"] = "Couleur d'AFK"
L["Color for AFK."] = "Couleur pour AFK"

-- heals-incoming status
L["Include player heals"] = "Inclure les soins du joueur"
L["Display status for the player's heals."] = "Afficher le statut des soins du joueur"
L["Minimum value"] = "Valeur minimale"
L["Incoming heals below the specified value will not be shown."] = "Les soins entrants inférieurs à la valeur spécifiée ne seront pas affichés."
L["Heal filter"] = "Filtre des soins"
L["Show incoming heals for the selected heal types."] = "Afficher les soins entrants pour les types de soins sélectionnés."
L["Direct heals"] = "Soins directs"
L["Include direct heals."] = "Inclure les soins directs."
L["Channeled heals"] = "Soins canalisés"
L["Include channeled heals."] = "Inclure les soins canalisés."
L["HoT heals"] = "Soins HoT"
L["Include heal over time effects."] = "Inclure les effets de guérison sur la durée. "

--target status
L["Your Target"] = "Votre Cible"

--threat status
L["Not Tanking"] = "Ne tank pas"
L["Higher threat than tank."] = "Menace plus élevée que le Tank"
L["Insecurely Tanking"] = "Tanking dangeureux"
L["Tanking without having highest threat."] = "Tank sans avoir la menace la plus élevée."
L["Securely Tanking"] = "Tanking sûr"
L["Tanking with highest threat."] = "Tank avec la menace la plus élevée."
L["Disable Blink"] = "Désactiver le clignotement"

-- voice status
L["Voice Chat"] = "Chat Vocal"

-- raid debuffs
L["General"] = "Général"
L["Advanced"] = "Avancé"
L["Enabled raid debuffs modules"] = "Modules de débuffs en raid activés"
L["Enabled"] = "Activé"
L["Enable All"] = "Tout activer"
L["Disable All"] = "Tout désactiver"
L["Copy to Debuffs"] = "Copier aux débuffs"
L["Select module"] = "Choix du module"
L["Select instance"] = "Choix de l'instance"
L["The Lich King"] = "Lich King"
L["The Burning Crusade"] = "Burning Crusade"
L["New raid debuff"] = "Nouveau débuff de raid"
L["Type the SpellId of the new raid debuff"] = "Tapez l'ID du sort du nouveau débuff de raid."
L["Create raid debuff"] = "Créer ce débuff de raid"
L["Delete raid debuff"] = "Supprimer ce débuff de raid"

-- direction
L["Out of Range"] = "Hors de portée"
L["Display status for units out of range."] = "Affiche les statuts des unités hors de portée."
L["Visible Units"] = "Unités visibles"
L["Display status for units less than 100 yards away"] = "Affiche les statuts des unités à moins de 100 mètres."
L["Dead Units"] = "Unités mortes"
L["Display status only for dead units"] = "Affiche uniquement les statuts des unités décédées."

-- resurrection
L["Casting resurrection"] = "Résurrection en cours"
L["A resurrection spell is being casted on the unit"] = "Un sort de résurrection est en cours d'incantation sur l'unité."
L["Resurrected"] = "Ressuscité"
L["A resurrection spell has been casted on the unit"] = "Un sort de résurrection a été incanté sur l'unité."

-- shields status
L["shields"] = "bouclier"
L["Maximum shield amount"] = "Montant maximal du bouclier"
L["Maximum shield amount value. Only used by bar indicators."] = "Valeur maximale du bouclier. Utilisée uniquement par les indicateurs barres."
L["Normal"] = "Normal"
L["Medium"] = "Moyen"
L["Low"] = "Bas"
L["Normal shield color"] = "Couleur de bouclier normal"
L["Medium shield color"] = "Couleur de bouclier moyen"
L["Low shield color"] = "Couleur de bouclier bas"
L["Low shield threshold"] = "Seuil minimal de bouclier"
L["The value below which a shield is considered low."] = "La valeur en dessous de laquelle les boucliers sont considérés bas."
L["Medium shield threshold"] = "Seul moyen de bouclier"
L["The value below which a shield is considered medium."] = "La valeur en dessous de laquelle les boucliers sont considérés moyens."
L["Custom Shields"] = "Boucliers perso."
L["Type shield spell IDs separated by commas."] = "Entrez les ID des boucliers séparés par des virgules."

-- boss-shields status
-- L["Boss"] = "Boss"
-- L["Supported debuffs"] = ""

-- role related statuses
L["Hide in combat"] = "Cacher en combat"
L["Hide Damagers"] = "Cacher les damagers"
L["Use alternate icons"] = "Utiliser des icônes alternatives"
L["Show everywhere"] = "Afficher partout"
L["Show even when not in a dungeon"] = "Montrer même quand vous n'êtes pas dans un donjon."

-- status descriptions
L["highlights your target"] = "Met en valeur votre cible"
L["hostile casts against raid members"] = "incantations hostiles contre les membres du raid"
L["advanced threat detection"] = "détection avancée de menace"
L["arrows pointing to each raid member"] = "flèches pointant vers chaque membre du raid"
-- L["display remaining amount of heal absorb shields"] = ""
-- L["display damage absorb shields above max hp"] = ""

-- aoe heals
-- L["aoe-"] = ""
L["neighbors"] = "voisins"
L["highlighter"] = "mise en valeur"
L["OutgoingHeals"] = "Soins sortants"

L["AOE Heals"] = "Soins AoE"
L["Highlight status"] = "État de mise en valeur"
L["Autodetect"] = "Détection automatique"
L["Select the status the Highlighter will use."] = "Choisir le statut à utiliser pour mettre en valeur."
L["Mouse Enter Delay"] = "Délai d'entrée de la souris"
L["Delay in seconds before showing the status."] = "Délai en secondes avant d'afficher le statut."
L["Mouse Leave Delay"] = "Délai de sortie de la souris"
L["Delay in seconds before hiding the status."] = "Délai en secondes avant de cacher le statut."
L["Min players"] = "Joueurs minimum"
L["Minimum players to enable the status."] = "Nombre minimum de joueurs pour activer le statut."
L["Radius"] = "Rayon"
L["Max distance of nearby units."] = "Distance maximale des unités à proximité."
L["Health deficit"] = "Déficit de santé"
L["Minimum health deficit of units to enable the status."] = "Déficit de santé minimum pour activer le statut."
L["Keep same targets"] = "Garder les mêmes cibles"
L["Try to keep same heal targets solutions if posible."] = "Essayer de garder les mêmes solutions de cibles de guérison si possible."
L["Max solutions"] = "Solutions maximales"
L["Maximum number of solutions to display."] = "Nombre maximum de solutions à afficher."
L["Hide on cooldown"] = "Cacher pendant la recharge"
L["Hide the status while the spell is on cooldown."] = "Cacher le statut pendant que le sort est en recharge."
L["Show overlapping heals"] = "Afficher les soins qui se superposent"
L["Show heal targets even if they overlap with other heals."] = "Afficher les cibles de soins même si elles se superposent avec d'autres soins."
L["Show only in combat"] = "Afficher uniquement en combat"
L["Enable the statuses only in combat."] = "Activer les statuts uniquement en combat."
L["Show only in raid"] = "Afficher uniquement en raid"
L["Enable the statuses only in raid."] = "Activer les statuts uniquement en raid."
L["Active time"] = "Temps actif"
L["Show the status for the specified number of seconds."] = "Affiche l'état pour le nombre de secondes spécifié."
L["Spells"] = "Sorts"
L["You can type spell IDs or spell names."] = "Vous pouvez saisir des IDs ou des noms de sorts."

-- Import/export profiles module
L["Import/export options"] = "Options d'importation/exportation"
L["Import profile"] = "Importer un profil"
L["Export profile"] = "Exporter un profil"
L["Network sharing"] = "Partage sur le réseau"
L["Accept profiles from other players"] = "Accepter les profils des autres joueurs"
L["Type player name"] = "Nom du joueur"
L["Send current profile"] = "Envoyer profil actuel"
L["Profile import/export"] = "Importation/Exportation de profils"
L["Paste here a profile in text format"] = "Collez ici un profil au format texte"
L["Press CTRL-V to paste a Grid2 configuration text"] = "Ctrl-V pour coller un texte de config. Grid2."
L["This is your current profile in text format"] = "Voici votre profil actuel au format texte"
L["Press CTRL-C to copy the configuration to your clipboard"] = "Ctrl-C pour copier la config. dans votre presse-papier."
L["Progress"] = "Progression"
L["Data size: %.1fKB"] = "Taille des données : %.1fKo"
L["Transmision progress: %d%%"] = "Progression de la transmission : %d%%"
L["Transmission completed"] = "Transmission terminée"
L["\"%s\" has sent you a profile configuration. Do you want to activate received profile ?"] = "\"%s\" vous a envoyé une configuration de profil. Souhaitez-vous activer le profil reçu ?"
L["Include Custom Layouts"] = "Inclure les dispositions personnalisées"

-- Open manager
L["Options management"] = "Gestion des options"
L["Load options on demand (requires UI reload)"] = "Charger les options à la demande (nécessite un rechargement)"
L["OPTIONS_ONDEMAND_DESC"] = "Les options ne sont créées que lorsque l'utilisateur clique dessus, ce qui réduit l'utilisation de la mémoire et le temps de chargement. Si vous rencontrez un problème avec cette fonctionnalité, désactivez cette option."