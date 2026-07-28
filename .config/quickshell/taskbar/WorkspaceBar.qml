import Quickshell
import Quickshell.Widgets
import QtQuick

PanelWindow {
	required property ShellScreen screen

	screen: screen

	color: "transparent"

	anchors {
		bottom: true
	}

	width: screen.width * .9
	implicitHeight: 5

	ClippingRectangle {
		color: Variables.bg_color
		anchors.fill: parent

		radius: 2.5
	}
}
