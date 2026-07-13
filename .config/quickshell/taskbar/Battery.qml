import Quickshell.Services.UPower
import QtQuick
import Quickshell
import Quickshell.Widgets

Row {
	Text {
		color: Variables.text_color
		text:  Math.ceil(UPower.displayDevice.percentage * 100) + "%"
		font.family: "monospace"
		anchors.verticalCenter: parent.verticalCenter
		rightPadding: 5
	}

	IconImage {
		source: Quickshell.iconPath(UPower.displayDevice.iconName)
		implicitSize: 24
		anchors.verticalCenter: parent.verticalCenter
	}
}
