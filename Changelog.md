## v46 - March 30 2024

* **Plasma 6 TODO:**
* Right Clicking Search Results will crash Plasma
* Resizing the Popup no longer auto-resize/snap to the width of a tile
* Drag and Drop is disabled
* App List Transitions/Animations need to be re-implemented
* There's some bugs with Tiles Only mode and Search
* Sidebar Buttons don't use the hover outline effect
* Cannot customize panel icon
* **Plasma 6 Changes:**
* Changed implicit onFoo Connection properties to functions by @BVengo (PR #153)
* Convert to Plasma6's metadata.json
* Add kpac and other scripts to parse metadata.json. The old i18n merge scripts are now part of kpac. TODO: Add a simple bash script to convert .po => .mo for distro packaging.
* PlasmaComponents2.Menu => PlasmaExtras.Menu, Use Screen.devicePixelRatio, QtGraphicalEffects is now in Qt5Compat, PlasmaCore.IconItem => Kirigami.Icon, PlasmaCore.FrameSvgItem => KSvg.FrameSvgItem, KQuickControlsAddons.KCMShell => KCM.KCMLauncher, KQuickControlsAddons.IconDialog => KIconThemes.IconDialog, KCMLauncher.authorize => KConfig.KAuthorized.authorizeControlModule,
* Use Qt.resolvedUrl() instead of plasmoid.file()
* Add LibConfig.FormKCM to force the config window to default to a minimum of 800px wide
* Sync ConfigurationShortcuts.qml with upstream
* Port to Plasmoid.contextualActions
* Drop import versions thanks to Qt6
* QQC1 Buttons+StackView to QQC2
* Remove deprecated Kicker.RootModel properties
* Rename Main.qml => main.qml, use PlasmoidItem
* Remove executable datasource used to open `xdg-user-dir`s and use Qt6's StandardPaths.
* Update to Qt6's new QtDialogs API
* Detect Kicker's disabled Shutdown options (maybe)
* **Plasma 5 Changes:** (Before Plasma 6 fixes)
* Make popup resizeable like default Kickoff widget (Note this hasn't been tested in Plasma 6)
* Make it easier to showRecentDocs by magic index number (Issue #140)
* Add krunner_systemsettings default toggle (Issue #127)
* Add Persian translations by @alr86 (PR 154)
* Updated Traditional Chinese (zh_TW) translations by @kisaragi-hiu (PR #137)
* Updated Japanese translations by @kisaragi-hiu (PR #136)
* Updated Korean translations by @kuroehanako (PR #128)

## v45 - April 28 2022

* Force a minimum popup height of 5 sidebar buttons (Issue #125)
* Fix searching for System Settings categories in Plasma 5.23+ (Issue #127)
* Fix Steam + Lutris Preset Tiles as the current workaround is getting removed in Qt6.
* Filter Default config keys in export tab based on updated ConfigAdvanced.
* Updated Dutch translation by @Vistaus (Pull Request #124)

## v44 - April 7 2022

* In the preset tiles, use YaST Software for the Software Center, not YaST (System Settings app).
* Show tooltip when hovering over a 1x1 tile. By @BVengo (Pull Request #120)
* Default group label alignment is independant of default tile label alignment. By @BVengo (Pull Request #120)
* Fix user avatar when faceIconUrl is empty QUrl() (Issue #16)
* Allow Enter Key on NumPad in SearchField to trigger app (Issue #118)
* Fix hiding the default "Keyboard Shortcuts" tab (we bundle our own to mention how Meta key works).
* Update widget and i18n scripts.

## v43 - November 10 2021

* Refactor config window to use QQC2 controls with a custom LibConfig implementation.
* Port Tile Editor controls to QQC2.
* Ensure group outline thickness is always at least 1px.
* Port scaling to use `PlasmaCore.Units` singleton and cleanup imports.
* Port various text elements to QQC2/PC3 labels.
* Port App List ScrollView to QQC2. The "StackView" is still QQC1 as the QQC2 requires a tree rather than swapping views.
* Port the nested Search Results Filter view to QQC2 since it's a simple tree.
* Support `org.manjaro.pamac.manager` when generating the default tiles.
* Check if libreoffice apps are installed before creating preset tiles.
* When generating preset groups, missing apps will not create empty spaces and will instead align left.
* Change resize popup hint from `Alt+RightClick` to `Meta+RightClick` (new default in Plamsa 5.20). Unfortunately it cannot check System Settings, so it might still be `Alt+RightClick` for users with older installations.
* Added Finnish translation by @mahtiankka (Pull Request #107)
* Added Slovenian translation by @Ugowsky (Issue #110)
* Updated Hebrew translations by @omeritzics (Pull Request #112)
* Updated Dutch translation by @Vistaus (Pull Request #111)
* Updated Turkish translation of widget name+comment by @ekto (Pull Request #105)
* Updated French translations by @Tuxman2 (Issue #113)

## v42 - April 19 2021

* Fix User Manager kcm id in sidebar button (Issue #98)
* Change "Desktop Theme" to newer "Plasma Style" label in the config, using kcm_desktoptheme translation of "Plasma Style".
* Updated pt_BR translations by @DmKaleid (Pull Request #101)
* Updated Spanish translations by https://www.pling.com/u/pirracas/
* Updated Hebrew translations by @omeritzics (Pull Request #102 and #103)
* Use xdg-user-dirs gettext domain instead of Qt's StandardPaths for xdg dir labels.

## v41 - October 23 2020

* Improve display of right to left locales like Hebrew in the config window.
* Added Hebrew translations by @omeritzics (Pull Request #88 and #89)
* Updated Dutch translations by @Vistaus (Pull Request #85)

## v40 - September 8 2020

* Update i18n merge script to translate widget name.
* Updated Spanish translations by https://www.pling.com/u/quasarfreak/
* Updated Russian translation by @Platun0v (Pull Request #84)

## v39 - July 22 2020

* Fix RecentUsage Apps, it now uses iconName instead of icon (Issue #76)
* Added config toggle for hiding the search field (Issue #81)
* Attempt to fix popupHeight shrinking when config is open bug. Only affects certain users with a particular screen scaling. (Issue #79)
* Updated Dutch translations by @Vistaus (Pull Request #82)

## v38 - July 8 2020

* Added Russian translations by @Platun0v (Pull Request #77)
* Added Turkish translations by @oltulu (Pull Request #78)

## v37 - June 29 2020

* Fix right clicking an app (or dragging) to pin an app from the Search Results (Issue #74)
* Added Japanese translations by @ymadd (Pull Request #73)

## v36 - June 23 2020

* Use Math.ceil() to fix popup growing shorter every second (Issue #71)
* Fix tips list getting stuck at 1-2 cols width (Issue #72)
* Updated German translations by @4VRDriver (Pull Request #66)

## v35 - June 10 2020

* Add splash text to help user get started. Includes a button to use a default tile layout with: LibreOffice Writer, Calc, KMail or Gmail, Software Center (Octopi, YaST, Discover), Web Browser, and Steam.
* Add the Productivity/Explore group presets to the context menu when tiles are unlocked. Added the Gmail tile preset to the context menu too.
* Re-Enable the calculator search plugin by default. It was disabled after Plasma 5.9 as it caused Plasma to crash. Please report if you notice any crashes when searching. (Issue #28)
* Implement configuration for default search filters (Issue #28)
* Scale the app list section headers. They'll always be 4pt larger than the app list labels. (Issue #38)
* Add popup height control in config (Issue #57)
* Parse `_NETSCAPE_URL` from firefox/chromium url drag+drop to use the website title for the label.
* Fixed French "Lock Tiles" message by https://www.pling.com/u/eric63/
* Updated Dutch translation by @Vistaus (Pull Request #63)

## v34 - May 8 2020

* Add vertical gradient to tiles, which can be toggle off in the config.
* Only show "Tiles Only" button if it's the default view.
* Update ConfigPage to fix scrollbar overlap (Issue #62)
* Fix xdg folder button labels in the config.
* Remove old code that's no longer used (Issue #13), and update a couple config controls.
* Add Romanian translations by https://www.pling.com/u/sebyx87

## v33 - April 24 2020

* Use QML's internal Drag and Drop instead of Plasma's global drag.
* Fix adding tiles when the launcher is in a subdir (like wine apps).
* Show outline around grouped tiles when hovering group label. Dragged group highlight follows cursor.
* Remove hardcoded font.pointSize=10 assignment in TileItemView.
* Allow groups to have urls / run apps when left clicked.
* Use 350px AppList width when editing a tile (Issue #49)
* Updated German translations by @4tmelDriver (Pull Request #56)
* Prepare vertical gradient code.

## v32 - February 12 2020

* Hide Tiles Only button when tile grid is hidden completely.
* Cleanup a few warnings in plasmashell logs.
* Updated Dutch translation by @Vistaus (Pull Request #51)
* Updated Polish translations by @Qik000 (Issue #55)
* Grab a few translations from KDE as a few messages were changed in Plasma 5.18.

## v31 - October 24 2019

* Configurable sidebar width and icon size. Default sidebar is smaller. Popup buttons have a hover outline. Popup appears above, like other context menus and Win10.
* Close menu right away when launching app via search, instead of waiting for the app to steal focus before closing.
* Add Portuguese (Brazil) translation by @herzenschein (Pull Request #46)
* Update Portuguese (Portugal) translation by @herzenschein (Pull Request #47)
* Add Croatian translation by @VladimirMikulic (Pull Request #50)

## v30 - April 4 2019

* Fix sidebar menus not resizing to fix translated text (Issue #37).
* Add support for a 2x1 Lutris game tile preset.
* Don't "download" the linked file associated with a tile when opening the tile editor unless it's a `*.desktop` file.
* Fix weird drag origins when moving tiles.

## v29 - February 28 2019

* Make sure the AppList area (and TileEditor) is visible when opened from TilesOnly view, and return to TilesOnly view when TileEditor is closed.
* Fix the "desktop theme" search view being slightly visible in TilesOnly view (Issue #40)
* Fix double "Keyboard Shortcut" tab in Plasma 5.15

## v28 - January 28 2019

* Add Indonesian translations by @ardumpl (Issue #34)
* Updated Dutch translations by @Vistaus (Pull Request #36)
* You can now easily import/export a tile layout (Issue #19).
* Can be configured to start in "Tiles Only" mode, revealing the app list after a search.
* The "menu" button showing all the labels has been removed, since you can now hover a button and instantly see the tooltip.
* The "Apps" sidebar tooltip now shows "Alphabetically".
* Sorting Apps Alphabetically and Categorically now have use a bundled icon that better represents them. The icons (including Tiles Only) are highlighted when they are "selected".
* Failed attempt at cancelling a drag event that starts after an app is launched.

## v27 - January 5 2019

* Add Korean translations by @crazyraven (Pull Request #31)
* Updated Dutch translations by @Vistaus (Pull Request #32)
* Add ability to set the number of recent apps (Max=15).
* Show the sidebar item label in a tooltip when hovering it.

## v26 - December 10 2018

* Default to "Most Used" apps instead of "Most Recent" which can be changed back in the config.
* Add ability to move all tiles below a group label when a label is moved.
* Add ability to sort all tiles by name in a tile group.
* Add a tile preset selector for steam game launchers.
* Add a grid column spinbox in the config just in case the user does not notice they can resize with Alt+RightClick.
* Hide the default Global Shortcut config tab, and replace it with a tab mentioning you need `Alt+F1` set for just pressing the `Meta` key to work.

## v25 - November 16 2018

* Update Dutch translations by @Vistaus (Pull Request #23)
* Add Russian translations by @Niksn404 (Pull Request #25)
* Add European Portuguese translations by @nyxerys (Pull Request #26)
* Scale config section rectangles by the dpi.
* Hide tooltip when hovering the panel icon.
* Add 4px spacing between sidebar and app list.
* Hardcode Oxygen theme tile color to 12.5% transparent white.

## v24 - September 22 2018

* Hide the solid sidebar background color. "Desktop theme" styled sidebars remain the same.
* Add Jump to Letter/Category views when clicking the section header.
* Add ability to start in Jump To Letter/Category view when menu opens.
* Fix a binding loop when drawing tile labels which caused a line of text to overflow the bottom of the tile (Issue #11).
* Group apps starting with symbols/punctuation under '&'.

## v23 - August 2 2018

* Added Dutch translation by @Vistaus (Pull Request #15)
* Fix non-default font size causing issues in app list (Issue #7)
* Fix a number of deprecation warnings logged in Qt 5.11.
* Make sure the panel icon should be smooth.
* Focus on searchField when a sidebar menu closes.
* Fix icon sizes in the search filter view.

## v22 - May 15 2018

* Fix error when loading in Kubuntu 18.04 LiveCD. We now lazy load qml-module-qt-labs-platform which was used to retrieve the translated xdg folder names.
* Merge updated Chinese translations by https://github.com/lm789632

## v21 - May 10 2018

* Fix error when opening the config with Qt 5.9 / Kubuntu 18.04.

## v20 - May 9 2018

* Add ability to edit the sidebar shortcuts in the config. By default, only System Settings, Dolphin, ~/Pictures, and ~/Documents is visible. You can drop apps/folders onto the sidebar to add it, though you'll need to open the config to delete it.
* Use a "hover outline" effect for the app list, utilizing several lazy loading tricks to load the list faster. An option to use the Desktop Theme buttons will return in a later version.
* Add option to set the default app list order to "Categories" for when you first login.
* Remember tile drag offset. When you click the bottom right of a tile and drag, the cursor will drop the bottom right of the tile instead of the top left.
* Don't allow creating new groups when tiles are locked.
* Hide "Pin to Menu" and "Edit Tile" items when tiles are locked.
* Add a "Alt+RightClick" to resize hint to the bottom right when widget is in a top panel.
* Add drop shadow to the "power" and "switch user" sidebar submenues.

## v19 - April 1 2018

* Disable push effect when right clicking a tile.
* Add a radial hover effect similar to fluent design.
* Add "group" tile to quickly label a group of tiles. No other features are implmented yet (like moving all tiles in the group or "folders"). Right click the empty grid to add a "group" label.
* Support locking tiles so you don't accidentally drag them. Right click the empty grid > (un)lock tiles.
* Fix tileLabelAlignment, it never got reimplemented after the refactor.

## v18 - September 25 2017

* Fix tiles not launching unless we open and close the tile editor.

## v17 - September 13 2017

* Various fixes to make the menu faster to open (from a cold start).
* Lazy load the tile editor GUI for performance reasons.
* Add button to open the icon selector dialog to the tile editor.
* Configurable search field height.
* Spanish translations by Zipristin.
* Used a fixed panel icon by default, using the same icon size as the other icons in the panel.
* Support reseting a tile bg color to default by deleting the hex color text.

## v16 - June 5 2017

* Can now set a background image on a tile.
* Can edit the margins around the tiles.
* Apps in search now show their description instead the filepath to the shortcut.
* Hide the description if it's the same as the app name.
* Fix a few tile drag glitches when the drag leaves the grid.
* Only remove the right clicked tile when unpining if there are multiple tiles for an app.

## v15 - May 31 2017

* Open the localized version of ~/Music (eg: ~/Musik).

## v14 - May 31 2017

* Resets tiles. There is no migration path. Sorry.
* Tiles can now be placed on an actual grid, rather than a list of tiles that looks like one.
* Can now edit the icon, individual tile color, and set the size to anything. Can toggle the icon/text.
* 1x2, 1x3, 1x4, etc tiles are in a "list" style with the icon to the left of the label.
* Resets the menu width/height of the popup to default.
* You can now set the width of the app list.
* Added option to do a fullscreen popup.
* Rough implementation of filter dropdown menu in the search results.
* Updated zh_CN translations.

## v13 - February 6 2017

* Only support Plasma 5.9+
* Disable the calculator runner in the search. It crashes plasmashell under a certain condition (opening the context menu then searching for anything).
* Add ability to edit the text in tiles. Changing the size of the tile is still a work in progress.
* Add sidebar buttons to open ~/Documents ~/Downloads  ~/Music ~/Pictures ~/Videos have been added depending on how much vertical space there is available. In the future, they will not appear by default and need to be configured in the settings once the UI has been drawn up.
* Replace the sidebar search button (which was fairly useless) with a button to list apps by category. Switching between A-Z and category view is a bit slow atm.
* Follow the default menu widget's (kicker) app list loading pattern.

## v12 - January 13 2016

* Support Plasma 5.9
* Break compatibility with Plasma 5.8 and below.

## v11 - January 13 2016

* Misc work on locale install scripts. Use kreadconfig5 which should be preinstalled.
* Add german translation by rumangerst.
* Lay groundwork for future features: reversing search results (align to bottom), category view, and moving the searchbox to the top.

## v10 - December 30 2016

* Chinese translations by https://github.com/lm789632
* Optimize updating the recent app list so it doesn't lag opening the menu.
* Clicking the user icon will now open a submenu with user manager/lock/logout/change user similar to Win10.

## v9 - December 27 2016

* Use the theme's background color for the sidebar instead of black.
* The app list icon size is now configurable.
* Add dictionary and windowsed widgets (eg: Calculator) to search results.

## v8 - December 21 2016

* Misc work for editing tiles.
* Support linking to user created custom .desktop files. Note that the label will be the filename, but the icon will work.
* You can now drag an app anywhere in the app list (not just the icon).
* Implement the context menu (right click menus) actions that are in the default menus (recent apps/actions/pin to taskbar). I filtered out "Add to Panel" and "Add to Desktop" since it isn't obvious that the user will want "Add as Launcher". The user can always drag the app to where they want as well.
* Make the current search filter button highlighted with a simple line instead of a box.
* Fuss with the A-Z header positioning.
* Expanding the sidebar now has a short transition. Pushing a button also has an effect.
* Prepare the utils for translating this and other widgets.

## v7 - November 26 2016

* Fix the white text on white bg in the "white" searchbox when using breeze dark.
* Support dropping on the empty area below the current favourites.
* Dropping a new favourite item will insert at that location instead of adding to the end of the list.
* Changed the search results to use the same ordering as Application Launcher (Merged) by default. You can also choose to use categorized sorting like Application Menu, but the order might not be ideal as the custom full text sorting was disabled.
* The panel icon now scales by default. A toggle was added to make it a fixed size (for thick panels).
* Added shortcuts to the KSysGuard, Dolphin, SystemSettings, Konsole, and System Info in the context menu.
* Added ability to toggle the Recent Apps.

## v6 - November 23 2016

* Add a push down effect when clicking a favourite.
* Bind Esc to close the menu.
* Support closing the menu with Meta.
* Focus on the search box when clicking the menu background (and dismiss the power/sidebar menu).
* Show the app description after the name by default instead of below it.

## v5 - November 14 2016

* Tile text can now be center or right aligned.
* App description can now be after the app name, or hidden altogether.
* Use the system-search-symbolic icon instead of search and system-search.
* Optionally use the "widget/frame.svg" #raised from the desktop theme for the sidebar. The background color is drawn underneath when the power menu is open (since most themes have the svg transparent).
* Fix the sidebar when an icon doesn't exist in the icon theme.

## v4 - November 12 2016

* Fix a number of scaling issues when using a non default DPI.

## v3 - November 11 2016

* Fix tile/sidebar colors reseting to black when configuring.
* Use sidebar color in power menu.
* Changed the color scheme for sidebar icons.
* Padding to the section headings.
* Assign the description color based on the text color.
* Use the icon hover effect from taskmanager instead of a solid rectangle for the panel icon.

## v2 - November 5 2016

* Configurable tile color (for when the desktop theme uses a weird background color).
* Configurable sidebar color (because black isn't always best).
* Configurable panel icon.
* The search box can now be configured to follow the desktop theme (still default to white though).
* Refactor the search results and app list to resuse the same code.
* Ability to drag files/launchers from dolphin to the favourites grid.
* Hovering the panel icon while dragging opens the menu.
* Use custom config style.

## v1 - October 23 2016

* First release posted on reddit (under the name kickstart).
* No configuration.
