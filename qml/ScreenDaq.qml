import QtQuick
import QtQuick.Controls

import ThemeEngine

Loader {
    id: screenDaq
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenDaq.active = true

        // change screen
        appContent.state = "Acquisition"
    }

    active: false
    asynchronous: false

    sourceComponent: Item {
    }

}
