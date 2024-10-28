import QtQuick
import QtQuick.Controls

import ThemeEngine

Loader {
    id: screenQC
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenQC.active = true

        // change screen
        appContent.state = "QualityControl"
    }

    active: false
    asynchronous: false

    sourceComponent: Item {
    }

}
