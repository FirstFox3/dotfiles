import QtQuick.Shapes
import QtQuick

Shape {
	id: root

	enum Corner {
		TL,
		TR,
		BR,
		BL
	}

	required property int size
	required property int corner
	property color color: "black"

	transform: Rotation {
		angle: {
			switch (corner) {
				case RoundedCorners.Corner.TL: return 0;
				case RoundedCorners.Corner.TR: return 90;
				case RoundedCorners.Corner.BR: return 180;
				case RoundedCorners.Corner.BL: return 270;
			}
		}

		origin.x: size / 2
		origin.y: size / 2
	}

	ShapePath {
		fillColor: color
		strokeWidth: 0

		startX: 0
		startY: size

		PathArc {
			x: size
			y: 0

			radiusX: size
			radiusY: size
		}

		PathLine {
			x: 0
			y: 0
		}
	}
}
