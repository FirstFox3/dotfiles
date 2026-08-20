import "./Widgets"
import Quickshell
import Quickshell.Wayland
import QtQuick

Variants {
	model: Quickshell.screens

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
			anchors.fill: parent
			size: 20
			color: "white"
			corner: RoundedCorners.Corner.TL
		}

		RoundedCorners { 
			anchors.fill: parent
			size: 20
			color: "white"
			corner: RoundedCorners.Corner.TR
		}

		RoundedCorners { 
			anchors.fill: parent
			size: 20
			color: "white"
			corner: RoundedCorners.Corner.BR
		}

		RoundedCorners { 
			anchors.fill: parent
			size: 20
			color: "white"
			corner: RoundedCorners.Corner.BL
		}
	}
}
