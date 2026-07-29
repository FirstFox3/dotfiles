import Quickshell.Services.UPower
import QtQuick
import Quickshell
import Quickshell.Widgets

Row {
	function getBatteryIcon() {
		const percentage = (Math.round(UPower.displayDevice.percentage * 10) * 10).toString().padStart(3, '0')

		const state = UPower.displayDevice.state == UPowerDeviceState.Charging ? "-charging" : ""

		return Quickshell.iconPath(`battery-${percentage}${state}-symbolic`)
	}

	Text {
		color: Variables.text_color
		text:  Math.ceil(UPower.displayDevice.percentage * 100) + "%"
		font.family: "monospace"
		anchors.verticalCenter: parent.verticalCenter
		rightPadding: 5
	}

	IconImage {
		source: getBatteryIcon()
		implicitSize: 32
		anchors.verticalCenter: parent.verticalCenter
	}
}
