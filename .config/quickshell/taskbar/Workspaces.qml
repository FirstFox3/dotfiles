import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import QtQuick

// TODO: Fix animation not occuring on new workspace
RowLayout {
	required property ShellScreen screen

	Repeater {
		function getMonitorsWorkspaces() {
			var currentMonitor = Hyprland.monitorFor(screen);
			var workspaces = Hyprland.workspaces.values;

			// Of all workspaces, return the ones which reside on the correct monitor
			return workspaces.reduce((list, workspace) => 
				workspace.monitor == currentMonitor ? [...list, workspace] : list
			, []);
		}

		model: getMonitorsWorkspaces()

		Rectangle {
			id: workspaceIdentifier

			required property var modelData

			readonly property color inactive_color: "#444444"
			readonly property color active_color: "#66AAFF"
			// TODO: Sync with workspace change duration
			readonly property int anim_duration: 250

			radius: 90
			width: 15
			height: width

			states: [
				State {
					name: "active"
					when: modelData.active
					PropertyChanges {
						workspaceIdentifier {
							color: active_color
						}
					}
				},
				State {
					name: "inactive"
					when: !modelData.active
					PropertyChanges {
						workspaceIdentifier {
							color: inactive_color
						}
					}
				}
			]

			transitions: [
				Transition {
					from: "inactive"
					to: "active"

					ColorAnimation {
						property: "color"

						from: inactive_color
						to: active_color
						duration: anim_duration
					}
				},
				Transition {
					from: "active"
					to: "inactive"
					
					ColorAnimation {
						property: "color"

						from: active_color
						to: inactive_color
						duration: anim_duration
					}
				}
			]
		}
	}
}
