$frmBot = GUICreate($sBotTitle, 417, 430, 207, 158)
GUISetIcon(@ScriptDir & "\Icons\cocbot.ico")
TraySetIcon(@ScriptDir & "\Icons\cocbot.ico")
$txtLog = _GUICtrlRichEdit_Create($frmBot, "", 16, 40, 385, 230, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, 8912))
$tabMain = GUICtrlCreateTab(8, 8, 403, 395)
GUICtrlSetOnEvent(-1, "tabMain")

;Buttons at bottom of all tabs

$btnStart = GUICtrlCreateButton("Start Bot", 50, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnStart")
$btnStop = GUICtrlCreateButton("Stop Bot", 50, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnStop")
GUICtrlSetState(-1, $GUI_HIDE)
$btnHide = GUICtrlCreateButton("Hide BS", 130, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnHide")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkBackground = GUICtrlCreateCheckbox("Background Mode", 245, 369, 115, 17)
GUICtrlSetOnEvent(-1, "chkBackground")
GUICtrlSetState(-1, $GUI_UNCHECKED)


;General Tab
$pageGeneral = GUICtrlCreateTabItem("General")
$Controls = GUICtrlCreateGroup("Controls", 15, 270, 385, 41)
$chkBotStop = GUICtrlCreateCheckbox("", 37, 289, 16, 16)
$cmbBotCommand = GUICtrlCreateCombo("", 60, 285, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Halt Attack|Shutdown PC|Sleep PC", "Halt Attack")
$lblPC = GUICtrlCreateLabel("IF :", 158, 289, 25, 17)
$cmbBotCond = GUICtrlCreateCombo("", 178, 285, 150, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "G and E Full and Max.Trophy|(G and E) Full or Max.Trophy|(G or E) Full and Max.Trophy|G or E Full or Max.Trophy|Gold and Elixir Full|Gold or Elixir Full|Gold Full and Max.Trophy|Elixir Full and Max.Trophy|Gold Full or Max.Trophy|Elixir Full or Max.Trophy|Gold Full|Elixir Full|Reach Max. Trophy|Bot running for", "Bot running for")
$cmbHoursStop = GUICtrlCreateCombo("", 328, 285, 65, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "-|1 Hour|2 Hours|3 Hours|4 Hours|5 Hours|6 Hours|7 Hours|8 Hours|9 Hours|10 Hours|11 Hours|12 Hours|13 Hours|14 Hours|15 Hours|16 Hours|17 Hours|18 Hours|19 Hours|20 Hours|21 Hours|22 Hours|23 Hours|24 Hours", "1 Hour")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$otherSettings = GUICtrlCreateGroup("Other Settings", 15, 315, 385, 41)
$lblBoostBarracks = GUICtrlCreateLabel("Barracks Boosts left :", 37, 332, 100, 17)
$cmbBoostBarracks = GUICtrlCreateCombo("", 150, 328, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "0")
$lblMaxTrophy = GUICtrlCreateLabel("Max Trophy :", 230, 332, 66, 17)
$txtMaxTrophy = GUICtrlCreateInput("3000", 298, 328, 71, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetTip(-1, "Bot will lose trophies if your trophy is greater than this.")
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Search Tab
$pageSearchSetting = GUICtrlCreateTabItem("Search")
$Searchonly = GUICtrlCreateGroup("Search Only", 15, 315, 385, 41)
$btnSearchMode = GUICtrlCreateButton("Search Mode", 24, 327, 368, 25)
GUICtrlSetOnEvent(-1, "btnSearchMode")
GUICtrlSetTip(-1, "Does not attack. Searches for base that meets conditions.")
$Conditions = GUICtrlCreateGroup("Conditions", 16, 40, 193, 217)
$chkMeetGxE = GUICtrlCreateRadio("Meet Gold and Elixir", 40, 64, 113, 17)
$chkMeetGorE = GUICtrlCreateRadio("Meet Gold or Elixir", 40, 88, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkMeetDE = GUICtrlCreateCheckbox("Meet Dark Elixir", 40, 112, 97, 17)
$chkMeetTrophy = GUICtrlCreateCheckbox("Meet Trophy Count", 40, 136, 113, 17)
$chkMeetTH = GUICtrlCreateCheckbox("Meet Townhall Level", 40, 160, 115, 17)
$chkMeetTHO = GUICtrlCreateCheckbox("Meet Townhall Outside", 40, 184, 125, 17)
$chkMeetOne = GUICtrlCreateCheckbox("Meet One Then Attack", 40, 208, 125, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Resources = GUICtrlCreateGroup("Resources and TH", 208, 40, 193, 217)
$lblMinGold = GUICtrlCreateLabel("Minimum Gold: ", 216, 65, 76, 17)
$lblMinElixir = GUICtrlCreateLabel("Minimum Elixir:", 216, 89, 72, 17)
$lblMinDarkElixir = GUICtrlCreateLabel("Minimum Dark Elixir:", 216, 113, 98, 17)
$lblMinTrophy = GUICtrlCreateLabel("Minimum Trophy Count:", 216, 137, 115, 17)
$lblMinTH = GUICtrlCreateLabel("Maximal TH Level:", 216, 161, 115, 17)
$txtMinGold = GUICtrlCreateInput("80000", 330, 62, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$txtMinElixir = GUICtrlCreateInput("80000", 330, 86, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$txtMinDarkElixir = GUICtrlCreateInput("0", 330, 110, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$txtMinTrophy = GUICtrlCreateInput("0", 330, 134, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$cmbTH = GUICtrlCreateCombo("", 330, 158, 61, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
$lblResources = GUICtrlCreateLabel("Bot will stop when a base is found with resources higher or equal to the minimum resources.", 220, 193, 168, 51, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherSearchSettings = GUICtrlCreateGroup("Other Search Settings", 15, 262, 385, 55)
$chkAlertSearch = GUICtrlCreateCheckbox("Alert when Base Found", 50, 287, 132, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkTakeTownSS = GUICtrlCreateCheckbox("Take All Towns Snapshot", 220, 275, 142, 17)
$chkTakeLootSS = GUICtrlCreateCheckbox("Take All Loots Snapshot", 220, 295, 132, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Attack Tab
$pageAttackSettings = GUICtrlCreateTabItem("Attack")
$WeakBaseSettings = GUICtrlCreateGroup("Weak Base Settings", 15, 35, 130, 230)
$lblMortar = GUICtrlCreateLabel("Max Mortar Lvl:", 20, 58, 77, 17)
$cmbMortar = GUICtrlCreateCombo("", 100, 55, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8", "5")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWizardTower = GUICtrlCreateLabel("Wiz Tower Lvl:", 20, 83, 75, 17)
$cmbWizTower = GUICtrlCreateCombo("", 100, 80, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8", "4")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblCannon = GUICtrlCreateLabel("Cannon Lvl:", 20, 108, 61, 17)
$lblArcher = GUICtrlCreateLabel("Archer Lvl:", 20, 133, 55, 17)
$chkWithKing = GUICtrlCreateCheckbox("Attack their King", 20, 180, 112, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_RIGHTBUTTON))
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkWithQueen = GUICtrlCreateCheckbox("Attack their Queen", 20, 200, 112, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_RIGHTBUTTON))
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbCannon = GUICtrlCreateCombo("", 100, 105, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "8")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbArcher = GUICtrlCreateCombo("", 100, 130, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "8")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWeakDescription = GUICtrlCreateLabel("Bot will attack bases that meet requirement.", 17, 225, 125, 32, $SS_CENTER)
$lblxBow = GUICtrlCreateLabel("X-Bow Lvl:", 20, 158, 55, 17)
$cmbxBow = GUICtrlCreateCombo("", 100, 155, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "0")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$AttackMode = GUICtrlCreateGroup("Attack Mode", 150, 35, 250, 93)
$radDeadBases = GUICtrlCreateRadio("Dead Bases - Meets condition, full collectors", 160, 55, 238, 17)
$radWeakBases = GUICtrlCreateRadio("Weak Bases - Meets condition and able 50%", 160, 75, 228, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$radAllBases = GUICtrlCreateRadio("All Bases - Attack all that meets search.", 160, 95, 228, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$HeroesSettings = GUICtrlCreateGroup("Royals and Clan Castle Settings", 150, 130, 250, 135)
$lblKingSettings = GUICtrlCreateLabel("King Settings:", 165, 150, 69, 17)
$chkKingAttackDeadBases = GUICtrlCreateCheckbox("Atk Dead Bases", 165, 170, 97, 17)
$chkKingAttackWeakBases = GUICtrlCreateCheckbox("Atk Weak Bases", 165, 190, 97, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkKingAttackAllBases = GUICtrlCreateCheckbox("Atk All Bases", 165, 210, 97, 17)
$lblQueenSettings = GUICtrlCreateLabel("Queen Settings:", 285, 150, 80, 17)
$chkQueenAttackDeadBases = GUICtrlCreateCheckbox("Atk Dead Bases", 285, 170, 97, 17)
$chkQueenAttackWeakBases = GUICtrlCreateCheckbox("Atk Weak Bases", 285, 190, 97, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkQueenAttackAllBases = GUICtrlCreateCheckbox("Atk All Bases", 285, 210, 97, 17)
$chkUseClanCastle = GUICtrlCreateCheckbox("Atk using Clan Castle troops if available", 165, 235, 210, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$deploySettings = GUICtrlCreateGroup("Deploy Settings", 15, 270, 385, 85)
$chkAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 250, 320, 142, 17)
$cmbDeploy = GUICtrlCreateCombo("", 30, 290, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on a single side, penetrates through base|Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbAlgorithm = GUICtrlCreateCombo("", 30, 320, 215, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks|Use All Troops", "Use All Troops") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Donate Tab
$pageDonateSettings = GUICtrlCreateTabItem("Donate")
$Donation = GUICtrlCreateGroup("", 15, 30, 385, 325)
$Barbarians = GUICtrlCreateGroup("Barbarians", 20, 70, 120, 235)
$chkDonateAllBarbarians = GUICtrlCreateCheckbox("Donate to All", 30, 95, 97, 17)
$txtDonateBarbarians = GUICtrlCreateEdit("", 25, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("barbarians\r\nbarb\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Barbarians")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Archers = GUICtrlCreateGroup("Archers", 148, 70, 120, 235)
$chkDonateAllArchers = GUICtrlCreateCheckbox("Donate to All", 155, 95, 97, 17)
$txtDonateArchers = GUICtrlCreateEdit("", 153, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("archers\r\narch\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Archers")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Giants = GUICtrlCreateGroup("Giants", 275, 70, 120, 235)
$chkDonateAllGiants = GUICtrlCreateCheckbox("Donate to All", 285, 95, 97, 17)
$txtDonateGiants = GUICtrlCreateEdit("", 280, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("giants\r\ngiant\r\nany\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Giants")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$chkDonateGiants = GUICtrlCreateCheckbox("Donate Giants", 275, 305, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateArchers = GUICtrlCreateCheckbox("Donate Archers", 149, 305, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateBarbarians = GUICtrlCreateCheckbox("Donate Barbarians", 20, 305, 112, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkRequest = GUICtrlCreateCheckbox("Request for :", 30, 45, 82, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUISetOnEvent(-1, "chkRequest")
$txtRequest = GUICtrlCreateInput("any", 115, 45, 276, 21)
GUICtrlSetTip(-1, "Request for input.")
$btnLocateClanCastle = GUICtrlCreateButton("Locate Clan Castle Manually", 25, 325, 365, 25)
GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
GUICtrlCreateGroup("", -99, -99, 1, 1)


;Troops Tab
$pageTroopSettings = GUICtrlCreateTabItem("Troops")
$Barracks = GUICtrlCreateGroup("Troops", 20, 40, 185, 215)
$lblBarbarians = GUICtrlCreateLabel("Barbarians :", 30, 68, 60, 17)
$lblArchers = GUICtrlCreateLabel("Archers :", 30, 93, 46, 17)
$lblGoblins = GUICtrlCreateLabel("Goblins :", 30, 118, 45, 17)
$lblCapacity = GUICtrlCreateLabel("Troops Capacity :", 30, 143, 95, 17)
$txtBarbarians = GUICtrlCreateInput("30", 120, 65, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
$txtArchers = GUICtrlCreateInput("60", 120, 90, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
$txtGoblins = GUICtrlCreateInput("10", 120, 115, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
$txtCapacity = GUICtrlCreateInput("0", 120, 140, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
$lblPercentBarbarians = GUICtrlCreateLabel("%", 180, 68, 12, 17)
$lblPercentArchers = GUICtrlCreateLabel("%", 180, 93, 12, 17)
$lblPercentGoblins = GUICtrlCreateLabel("%", 180, 118, 12, 17)
$cmbTroopComp = GUICtrlCreateCombo("", 45, 175, 131, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUISetOnEvent(-1, "cmbTroopComp")
GUICtrlSetData(-1, "Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops", "Use Barracks") ;"Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops"
$lblBarracks = GUICtrlCreateLabel("Must equal 100% to fully distribute the troops with maximum amount efficiency.", 40, 205, 140, 67, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherTroops = GUICtrlCreateGroup("Other Troops", 210, 40, 185, 85)
$lblGiants = GUICtrlCreateLabel("Number of Giants:", 215, 68, 89, 17)
$lblWallBreakers = GUICtrlCreateLabel("Number of Wall Breakers:", 215, 93, 125, 17)
$txtNumGiants = GUICtrlCreateInput("4", 340, 65, 46, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetLimit(-1, 3)
$txtNumWallbreakers = GUICtrlCreateInput("4", 340, 90, 46, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetLimit(-1, 3)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$BarrackGroup = GUICtrlCreateGroup("Barracks", 210, 130, 185, 125)
$lblBarrack1 = GUICtrlCreateLabel("Barrack 1:", 220, 153, 53, 17)
$lblBarrack2 = GUICtrlCreateLabel("Barrack 2:", 220, 178, 53, 17)
$lblBarrack3 = GUICtrlCreateLabel("Barrack 3:", 220, 203, 53, 17)
$lblBarrack4 = GUICtrlCreateLabel("Barrack 4:", 220, 228, 53, 17)
$cmbBarrack1 = GUICtrlCreateCombo("", 275, 150, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Barbarians") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack2 = GUICtrlCreateCombo("", 275, 175, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Archers") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack3 = GUICtrlCreateCombo("", 275, 200, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Archers") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack4 = GUICtrlCreateCombo("", 275, 225, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers|Giants|Goblins", "Goblins") ; "Barbarians|Archers|Giants|Goblins"
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherBarrackSettings = GUICtrlCreateGroup("Other Settings", 20, 255, 375, 100)
;$btnLocateCollectors = GUICtrlCreateButton("Locate Collectors Manually", 32, 280, 351, 25)
;GUICtrlSetOnEvent(-1, "btnLocateCollectors")
$btnLocateBarracks = GUICtrlCreateButton("Locate Barracks Manually", 32, 315, 351, 25)
GUICtrlSetOnEvent(-1, "btnLocateBarracks")
;$btnLocateBarracks = GUICtrlCreateButton("Locate Barracks Manually", 213, 315, 170, 25)
;GUICtrlSetOnEvent(-1, "btnLocateBarracks")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

;Other Tab
$pageOtherSettings = GUICtrlCreateTabItem("Other Settings")
$Walls = GUICtrlCreateGroup("Walls", 20, 40, 375, 125)
$chkWalls = GUICtrlCreateCheckbox("Auto Walls Upgrade", 46, 60, 115, 17)
$UseGold = GUICtrlCreateRadio("Use Only Gold", 46, 85, 115, 17)
$WallMinGold = GUICtrlCreateLabel("Minimum Gold: ", 216, 90, 76, 17)
$txtWallMinGold = GUICtrlCreateInput("1300000", 310, 85, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
$UseElixir = GUICtrlCreateRadio("Use Only Elixir", 46, 110, 115, 17)
$WallMinElixir = GUICtrlCreateLabel("Minimum Elixir:", 216, 115, 72, 17)
$txtWallMinElixir = GUICtrlCreateInput("1300000", 310, 110, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
$UseGoldElix = GUICtrlCreateRadio("Use Elixir. If not enough, Gold", 46, 135, 160, 17)
$lblWalls = GUICtrlCreateLabel("Current Wall Level:", 216, 62, 100, 17)
$cmbWalls = GUICtrlCreateCombo("", 320, 58, 40, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4|5|6|7|8|9|10", "4")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$AtkSpeed = GUICtrlCreateGroup("Attack Speed", 20, 170, 375, 110)
$lblUnitDelay = GUICtrlCreateLabel("Unit Delay:", 46, 190, 75, 17)
$lblWaveDelay = GUICtrlCreateLabel("Wave Delay:", 216, 190, 75, 17)
$cmbUnitDelay = GUICtrlCreateCombo("", 120, 186, 72, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Fast|1|2|3|4|5|6|7|8|9|Slow", "5")
$cmbWaveDelay = GUICtrlCreateCombo("", 300, 186, 70, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Fast|1|2|3|4|5|6|7|8|9|Slow", "5")
$Randomspeedatk = GUICtrlCreateCheckbox("Random Deployment Speeds", 110, 220, 190, 17)
$lblAttackdelay = GUICtrlCreateLabel("This delays the deployment of troops, fast = like a Bot, slow = Like a Human. Random will make bot more varied and closer to a person.", 20, 245, 350, 67, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherBarrackSettings = GUICtrlCreateGroup("Other Settings", 20, 285, 375, 68)
$chkTrap = GUICtrlCreateCheckbox("Auto Rearm Traps", 35, 300, 115, 17)
$btnLocateTrap = GUICtrlCreateButton("Locate Trap Manually", 32, 320, 351, 25)
GUICtrlSetOnEvent(-1, "btnLocateTrap")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

;Bottom status bar
$statLog = _GUICtrlStatusBar_Create($frmBot)
_GUICtrlStatusBar_SetSimple($statLog)
_GUICtrlStatusBar_SetText($statLog, "Status : Idle")
$tiAbout = TrayCreateItem("About")
TrayCreateItem("")
$tiExit = TrayCreateItem("Exit")
GUISetState(@SW_SHOW)