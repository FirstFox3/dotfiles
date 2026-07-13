import Quickshell
import QtQuick
import QtQuick.Shapes

PanelWindow {
	id: root

	anchors {
		left: true
		bottom: true
		right: true
	}

	color: "transparent"

	Shape {
		ShapePath {
			startX: 0
			startY: 0

			PathCubic {
				control1X: 0.5
				control1Y: 1

				control2X: 0.5
				control2Y: 0

				x: 1
				y: 0
			}
		}
	}

	// ListView {
	// 	delegate: Background
	// }
}
