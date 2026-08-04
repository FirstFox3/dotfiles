import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Variants {
	model: Quickshell.screens

	PanelWindow {
		property var modelData

		property var taggedWorkspace

		id: root

		screen: modelData

		color: "transparent"

		anchors {
			bottom: true
			left: true
			right: true
		}

		implicitHeight: 8

		IpcHandler {
			target: "workspaceBar"

			function swap() {
				if (taggedWorkspace == null) return

				let temp = Hyprland.focusedWorkspace
				taggedWorkspace.activate()
				taggedWorkspace = temp
			}

			function target() {
				taggedWorkspace = Hyprland.focusedWorkspace
			}
		}

		ClippingRectangle {
			color: "white"
			implicitHeight: 5
			implicitWidth: root.width * 0.9
			anchors.verticalCenter: parent.bottom
			anchors.horizontalCenter: parent.horizontalCenter
			radius: height / 2

			RowLayout {
				anchors.fill: parent
				spacing: 0

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

						Layout.fillWidth: true
						Layout.fillHeight: true

						readonly property color inactive_color: Colors.surface
						readonly property color active_color: Colors.primary
						readonly property color tagged_color: Colors.inverse_primary

						readonly property int anim_duration: 200

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
								name: "tagged"
								when: modelData == taggedWorkspace
								PropertyChanges {
									workspaceIdentifier {
										color: tagged_color
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
							},
						]

						transitions: [
							Transition {
								from: "inactive"
								to: "active"

								ColorAnimation {
									property: "color"
									duration: anim_duration
								}
							},
							Transition {
								from: "active"
								to: "inactive"
								
								ColorAnimation {
									property: "color"
									duration: anim_duration
								}
							},
							Transition {
								from: "active"
								to: "tagged"
								
								ColorAnimation {
									property: "color"
									duration: anim_duration
								}
							},
							Transition {
								from: "tagged"
								to: "inactive"
								
								ColorAnimation {
									property: "color"
									duration: anim_duration
								}
							},
						]
					}
				}
			}
		}
	}
}
