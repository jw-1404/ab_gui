import QtQuick
import QtQuick.Controls

import ThemeEngine

Loader {
    id: screenCalib
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenCalib.active = true

        // change screen
        appContent.state = "Calibration"
    }

    active: false
    asynchronous: false

    sourceComponent: Item {
    }

}
