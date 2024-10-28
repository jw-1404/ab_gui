import QtQuick
import QtQuick.Controls

import ThemeEngine

Loader {
    id: screenDatabase
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenDatabase.active = true

        // change screen
        appContent.state = "Database"
    }

    active: false
    asynchronous: false

    sourceComponent: Item {
    }

}
