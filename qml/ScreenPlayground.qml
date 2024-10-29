import QtQuick
import QtQuick.Controls

import ThemeEngine

Loader {
    id: screenPlayground
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenPlayground.active = true

        // change screen
        appContent.state = "Playground"
    }

    active: false
    asynchronous: false

    sourceComponent: Item {
    }

}
