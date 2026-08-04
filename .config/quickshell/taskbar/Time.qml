import Quickshell
import Quickshell.Io
import QtQuick
import QtQml

Column {
	id: root

	Text {
		anchors.horizontalCenter: root.horizontalCenter

		color: Colors.on_background

		font.family: "monospace"
		text: Qt.formatTime(clock.date, "h:mm:ss AP")
	}

	Text {
		anchors.horizontalCenter: root.horizontalCenter

		color: Colors.on_background

		font.family: "monospace"
		text: Qt.formatDate(clock.date, "M/d/yy")
	}

	SystemClock {
		id: clock
	}
}
