import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtMultimedia
import QtQuick
import QtCore

ShellRoot {
	Settings {
		property alias backgroundSource: persistent.backgroundSource
	}

	PersistentProperties {
		id: persistent
		reloadableId: "backgroundPersistent"

		property url backgroundSource
	}

	IpcHandler {
		target: "background"
		
		function setBackground(fileName: string) {
			persistent.backgroundSource = `/usr/share/wallpapers/${fileName}`
			Quickshell.execDetached([Quickshell.shellDir + "/Scripts/updateTheme.sh", `${persistent.backgroundSource}`])
		}
	}

	
	Variants {
		model: Quickshell.screens

		PanelWindow {

			required property var modelData

			screen: modelData
			id: root

			exclusionMode: ExclusionMode.Ignore

			WlrLayershell.layer: WlrLayer.Background
			WlrLayershell.namespace: "quickshell:background"

			anchors {
				bottom: true
				left: true
				right: true
				top: true
			}

			color: "transparent"

			Image {
				anchors.fill: root.contentItem
				source: "/usr/share/wallpapers/frameOne.jpg"
				sourceSize.width: 1920
				sourceSize.height: 1080
			}

			MediaPlayer {
				source: persistent.backgroundSource
				loops: MediaPlayer.Infinite

				videoOutput: video

				onSourceChanged: {
					console.log("Source changed: " + persistent.backgroundSource)
					play()
				}

				Component.onCompleted: {
					console.log("Completed: " + persistent.backgroundSource)
					play()
				}
			}

			VideoOutput {
				id: video
				anchors.fill: root.contentItem
			}
		}
	}
}
