import QtQuick
import QtQuick.Controls

import ThemeEngine

Loader {
    id: screenMainView
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenMainView.active = true

        // change screen
        appContent.state = "MainView"
    }
}
