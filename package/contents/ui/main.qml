import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.private.kicker as Kicker
import org.kde.coreaddons as KCoreAddons
import "lib"

PlasmoidItem {
	id: widget

	Logger {
		id: logger
		name: 'tiledmenu'
		// showDebug: true
	}

	SearchModel {
		id: search
		Component.onCompleted: {
			search.applyDefaultFilters()
		}
	}

	property alias rootModel: appsModel.rootModel
	AppsModel {
		id: appsModel
	}

	Item {
		// https://invent.kde.org/frameworks/kcoreaddons/-/blob/master/src/qml/kuserproxy.h
		// https://invent.kde.org/frameworks/kcoreaddons/-/blob/master/src/qml/kuserproxy.cpp
		KCoreAddons.KUser {
			id: kuser
			// faceIconUrl is an empty QUrl 'object' when ~/.face.icon doesn't exist.
			// Cast it to string first before checking if it's empty by casting to bool.
			readonly property bool hasFaceIcon: (''+faceIconUrl)
		}

		Kicker.DragHelper {
			id: dragHelper

			dragIconSize: Kirigami.Units.iconSizes.medium

			// Used when we only have a string and don't have a QIcon.
			// DragHelper.startDrag(...) requires a QIcon. See Issue #75.
			// property var defaultIconItem: KQuickControlsAddons.QIconItem {
			// 	id: defaultIconItem
			// }
			// property alias defaultIcon: defaultIconItem.icon
		}

		Kicker.ProcessRunner {
			id: processRunner
			// .runMenuEditor() to run kmenuedit
		}
	}

	AppletConfig {
		id: config
	}

	function logListModel(label, listModel) {
		console.log(label + '.count', listModel.count);
		// logObj(label, listModel);
		for (var i = 0; i < listModel.count; i++) {
			var item = listModel.modelForRow(i);
			var itemLabel = label + '[' + i + ']';
			console.log(itemLabel, item);
			logObj(itemLabel, item);
			if (('' + item).indexOf('Model') >= 0) {
				logListModel(itemLabel, item);
			}
		}
	}

	function logObj(label, obj) {
		// if (obj && typeof obj === 'object') {
		//  console.log(label, Object.keys(obj))
		// }
		
		for (var key in obj) {
			var val = obj[key];
			if (typeof val !== 'function') {
				var itemLabel = label + '.' + key;
				console.log(itemLabel, typeof val, val);
				if (('' + val).indexOf('Model') >= 0) {
					logListModel(itemLabel, val);
				}
			}
		}
	}

	toolTipMainText: ""
	toolTipSubText: ""

	compactRepresentation: LauncherIcon {
		id: panelItem
		iconSource: plasmoid.configuration.icon || "start-here-kde-symbolic"
	}

	hideOnWindowDeactivate: !widget.userConfiguring

	activationTogglesExpanded: true

	onExpandedChanged: function(expanded) {
		if (expanded) {
			search.query = ""
			search.applyDefaultFilters()
			// config.showSearch = false
			// TODO popup is an invalid reference here for some reason

			//fullRepresentationItem.searchView.searchField.forceActiveFocus()
			if (fullRepresentationItem?.searchView?.searchField) {
    			fullRepresentationItem.searchView.searchField.forceActiveFocus()
			}

			fullRepresentationItem.searchView.showDefaultView()

			// Debug TileEditorView
			// fullRepresentationItem.tileGrid.addDefaultTiles()
			// var testTile = fullRepresentationItem.tileGrid.getTileAt(0, 1)
			// fullRepresentationItem.tileGrid.editTile(testTile)

			// Show icon active effect without hovering
			justOpenedTimer.start()
		}
	}

	Timer {
		id: justOpenedTimer
		repeat: false
		interval: 600
	}

	fullRepresentation: Popup {
		id: popup

		// Plasma 6 bug? Resizing only works at initial instaal of the plasmoid.
		// Not working anymore after reboot

		Layout.minimumWidth: config.leftSectionWidth
		Layout.minimumHeight: config.minimumHeight
		Layout.preferredWidth: config.popupWidth
		Layout.preferredHeight: config.popupHeight

		// Make popup resizeable like default Kickoff widget.
		// The FullRepresentation must have an appletInterface property.
		// https://invent.kde.org/plasma/plasma-desktop/-/commit/23c4e82cdcb6c7f251c27c6eefa643415c8c5927
		// https://invent.kde.org/frameworks/plasma-framework/-/merge_requests/500/diffs
		// readonly property var appletInterface: Plasmoid.self // PLasma 5
		readonly property var appletInterface: Plasmoid			// Plasma 6

		// Layout.onPreferredWidthChanged: console.log('popup.size', width, height)
		// Layout.onPreferredHeightChanged: console.log('popup.size', width, height)

		onFocusChanged: {
			if (focus) {
				popup.searchView.searchField.forceActiveFocus()
			}
		}
	}

	Plasmoid.contextualActions: [
		PlasmaCore.Action {
			text: i18n("System Info")
			icon.name: "hwinfo"
			onTriggered: appsModel.launch('org.kde.kinfocenter')
		},
		PlasmaCore.Action {
			text: i18n("Terminal")
			icon.name: "utilities-terminal"
			onTriggered: appsModel.launch(plasmoid.configuration.terminalApp) // TODO: Read SystemSettings
		},
		PlasmaCore.Action {
			isSeparator: true
		},
		PlasmaCore.Action {
			text: i18n("Task Manager")
			icon.name: "utilities-system-monitor"
			onTriggered: appsModel.launch(plasmoid.configuration.taskManagerApp)
		},
		PlasmaCore.Action {
			text: i18n("System Settings")
			icon.name: "systemsettings"
			onTriggered: appsModel.launch('systemsettings')
		},
		PlasmaCore.Action {
			text: i18n("File Manager")
			icon.name: "folder"
			onTriggered: appsModel.launch(plasmoid.configuration.fileManagerApp) // TODO: Read SystemSettings
		},
		PlasmaCore.Action {
			isSeparator: true
		},
		PlasmaCore.Action {
			text: i18n("Edit Applications...")
			icon.name: "kmenuedit"
			onTriggered: processRunner.runMenuEditor()
		}
	]
}
