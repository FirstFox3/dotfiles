import "./Widgets"
import Quickshell
import Quickshell.Wayland
import QtQuick

Variants {
	model: Quickshell.screens

	readonly property int radius: 20

	PanelWindow {
		property var modelData

		screen: modelData

		anchors {
			top: true
			left: true
			right: true
			bottom: true
		}

		color: "transparent"
		mask: Region {}
		exclusionMode: ExclusionMode.Ignore

		RoundedCorners { 
			anchors.top: parent.top
			anchors.left: parent.left
			size: radius
			corner: RoundedCorners.Corner.TL
		}

		RoundedCorners { 
			anchors.top: parent.top
			anchors.right: parent.right
			size: radius
			corner: RoundedCorners.Corner.TR
		}

		RoundedCorners { 
			anchors.bottom: parent.bottom
			anchors.right: parent.right
			size: radius
			corner: RoundedCorners.Corner.BR
		}

		RoundedCorners { 
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			size: radius
			corner: RoundedCorners.Corner.BL
		}
	}
}
