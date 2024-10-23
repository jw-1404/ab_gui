import QtQuick
import QtQuick.Layouts

import ThemeEngine

Loader {
    id: screenDevice
    anchors.fill: parent

    function loadScreen() {
        // load screen
        screenDevice.active = true

        // change screen
        appContent.state = "Playground"
    }

    function backAction() {
        if (screenDevice.status === Loader.Ready)
            screenDevice.item.backAction()
    }

    ////////////////////////////////////////////////////////////////////////////

    active: false
    asynchronous: false

    sourceComponent: Item {
        anchors.fill: parent
        anchors.margins: 32

        ////////

        function backAction() {
            if (isDesktop) screenDesktopComponents.loadScreen()
            else if (isMobile) screenMobileComponents.loadScreen()
        }
        ////////
    }

    ////////////////////////////////////////////////////////////////////////////
}
