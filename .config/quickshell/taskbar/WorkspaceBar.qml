import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ShellRoot {
	PersistentProperties {
		id: persistent
		reloadableId: "persistent"

		property var trackedWorkspaces: []
	}

	IpcHandler {
		target: "workspaceBar"

		function swap() {
			if (persistent.trackedWorkspaces[Hyprland.focusedMonitor.id] == null) return

			let temp = Hyprland.focusedWorkspace
			persistent.trackedWorkspaces[Hyprland.focusedMonitor.id].activate()
			persistent.trackedWorkspaces[Hyprland.focusedMonitor.id] = temp
		}

		function target() {
			persistent.trackedWorkspaces[Hyprland.focusedMonitor.id] = Hyprland.focusedWorkspace
		}
	}

	Variants {
		model: Quickshell.screens

		PanelWindow {
			property var modelData

			id: root

			screen: modelData

			color: "transparent"

			anchors {
				bottom: true
				left: true
				right: true
			}

			implicitHeight: 8

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
							readonly property color tracked_color: Colors.inverse_primary

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
									name: "tracked"
									when: persistent.trackedWorkspaces.includes(modelData)
									PropertyChanges {
										workspaceIdentifier {
											color: tracked_color
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
									to: "tracked"
									
									ColorAnimation {
										property: "color"
										duration: anim_duration
									}
								},
								Transition {
									from: "tracked"
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
}
