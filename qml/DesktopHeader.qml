import QtQuick

import ThemeEngine

Rectangle {
    id: appHeader
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

    height: Theme.headerHeight
    color: Theme.colorHeader
    clip: false
    z: 10

    property string headerTitle: Qt.application.name
    property int headerHeight: Theme.headerHeight
    property int headerPosition: 64

    property bool componentsEnabled: true
    property bool componentsMirrored: false

    ////////////////////////////////////////////////////////////////////////////

    signal backButtonClicked()
    signal fwdButtonClicked()
    signal rightMenuClicked()

    signal menuSettingsClicked()
    signal menuAboutClicked()

    ////////////////////////////////////////////////////////////////////////////

    DragHandler {
        // Drag on the sidebar to drag the whole window // Qt 5.15+
        // Also, prevent clicks below this area
        onActiveChanged: if (active) appWindow.startSystemMove()
        target: null
    }

    Image {
        id: logoImage
        anchors.left: parent.left
        width: Theme.sidebarWidth
        height: headerHeight
        scale: 0.9
        fillMode: Image.PreserveAspectFit
        source: "qrc:/logos/logo.png"
    }


    Row { // navigation arrows
        id: navigationButtons
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: logoImage.right
        anchors.top: parent.top

        spacing: 6
        visible: true

        Rectangle { // separator
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height - 10
            width: Theme.componentBorderWidth
            color: Theme.colorHeaderHighlight
        }

        RoundButtonSunken { // buttonBack
            width: parent.height
            height: parent.height

            enabled: (source !== "qrc:/assets/icons/material-symbols/arrow_back.svg" || wideMode)
            visible: enabled

            colorBackground: Theme.colorHeader
            colorHighlight: Theme.colorHeaderHighlight
            colorIcon: Theme.colorHeaderContent

            source: "qrc:/assets/icons/material-symbols/arrow_back.svg"
            onClicked: backButtonClicked()
        }

        RoundButtonSunken { // buttonFwd
            width: parent.height
            height: parent.height
            rotation: 180

            enabled: (source !== "qrc:/assets/icons/material-symbols/arrow_back.svg" || wideMode)
            visible: enabled

            colorBackground: Theme.colorHeader
            colorHighlight: Theme.colorHeaderHighlight
            colorIcon: Theme.colorHeaderContent

            source: "qrc:/assets/icons/material-symbols/arrow_back.svg"
            onClicked: fwdButtonClicked()
        }

        Rectangle { // separator
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height - 10
            width: Theme.componentBorderWidth
            color: Theme.colorHeaderHighlight
        }
    }

    Text {
        id: stateTitle
        anchors.left: navigationButtons.right
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr(appContent.state)
        color: Theme.colorHeaderContent
        font.bold: true
        font.pixelSize: Theme.fontSizeHeader - 10
    }
    ////////////////////////////////////////////////////////////////////////////

    Row { // auxiliary Menu
        anchors.right: parent.right
        anchors.rightMargin: 2
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        visible: true
        spacing: 6

        ////////////
        DesktopHeaderItem {
            id: menuSettings

            colorContent: Theme.colorHeaderContent
            colorHighlight: Theme.colorHeaderHighlight
            highlightMode: "background"

            highlighted: (appContent.state === "Settings")
            source: "qrc:/assets/icons/material-icons/duotone/tune.svg"
            onClicked: menuSettingsClicked()
        }
        DesktopHeaderItem {
            id: menuAbout
            height: parent.height

            colorContent: Theme.colorHeaderContent
            colorHighlight: Theme.colorHeaderHighlight
            highlightMode: "background"

            highlighted: (appContent.state === "About")
            source: "qrc:/assets/icons/material-icons/duotone/info.svg"
            onClicked: menuAboutClicked()
        }

        // Rectangle { // separator
        //     anchors.verticalCenter: parent.verticalCenter
        //     height: parent.height
        //     width: 12
        //     color: Theme.colorHeader
        // }

        CsdMenu { }

    }

    ////////////

}
