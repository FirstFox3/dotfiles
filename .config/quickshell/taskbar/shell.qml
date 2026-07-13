import Quickshell
import QtQuick

PanelWindow {
	id: root

	color: Variables.bg_color
	
	anchors {
		top: true
		left: true
		right: true
	}

	implicitHeight: 40

	Time {
		anchors.centerIn: parent
	}

	Battery {
		anchors.verticalCenter: parent.verticalCenter
	}
}
