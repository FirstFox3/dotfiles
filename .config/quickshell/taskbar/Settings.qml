pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
	property alias background: settingsId.background

	readonly property url location: Quickshell.dataDir + "/settings.ini"
	FileView {
		path: location
		onAdapterUpdated: writeAdapter()

		onLoadFailed: e => {
			if (e != FileViewError.FileNotFound) {
				// console.log(FileViewError.toString(e))
				return
			}

			Quickshell.execDetached(["touch", location])
			reload()
		}

		JsonAdapter {
			id: settingsId

			property url background
		}
	}
}
