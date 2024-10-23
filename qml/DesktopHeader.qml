import QtQuick

import ThemeEngine

Rectangle {
    id: appHeader
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

    height: headerHeight
    color: Theme.colorHeader
    clip: false
    z: 10

    property string headerTitle: Qt.application.name
    property int headerHeight: 64
    property int headerPosition: 64

    property bool componentsEnabled: true
    property bool componentsMirrored: false

    ////////////////////////////////////////////////////////////////////////////

    signal backButtonClicked()
    signal rightMenuClicked() // mobile header compatibility

    signal menuComponentsClicked()
    signal menuSettingsClicked()
    signal menuAboutClicked()
    signal menuDeviceClicked()
    signal menuHostInfosClicked()
    signal menuMainViewClicked()

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
        anchors.leftMargin: 6
        width: appHeader.headerHeight
        height: appHeader.headerHeight
        fillMode: Image.PreserveAspectFit
        source: "qrc:/logos/logo.png"
    }

        // Text { // title
        //     id: menuTitle

        //     anchors.left: parent.left
        //     anchors.verticalCenter: parent.verticalCenter

        //     visible: wideMode
        //     text: appHeader.headerTitle
        //     font.bold: true
        //     font.pixelSize: Theme.fontSizeHeader
        //     color: Theme.colorHeaderContent
        // }
    ////////////////////////////////////////////////////////////////////////////

    Row { // menus
        anchors.left: logoImage.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        spacing: 12
        visible: true

        ////////////

        Row {
            id: menuMain
            anchors.left: menuTitle.right
            anchors.leftMargin: 12

            DesktopHeaderItem {
                id: menuMainView
                height: appHeader.height

                colorContent: Theme.colorHeaderContent
                colorHighlight: Theme.colorHeaderHighlight
                highlightMode: "background"

                highlighted: (appContent.state === "MainView")
                text: "设备状态"
                onClicked: menuMainViewClicked()
            }

            DesktopHeaderItem {
                id: menuHostInfos
                height: appHeader.height

                colorContent: Theme.colorHeaderContent
                colorHighlight: Theme.colorHeaderHighlight
                highlightMode: "background"

                highlighted: (appContent.state === "HostInfos")
                text: "刻度定义"
                onClicked: menuHostInfosClicked()
            }

            DesktopHeaderItem {
                id: menuDevice
                height: appHeader.height

                colorContent: Theme.colorHeaderContent
                colorHighlight: Theme.colorHeaderHighlight
                highlightMode: "background"

                highlighted: (appContent.state === "Device")
                source: "qrc:/assets/icons/material-icons/duotone/info.svg"
                onClicked: menuDeviceClicked()
            }
        }
    }

    Row { // menus
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        spacing: 12
        visible: true

        ////////////

        Row {
            id: menuAuxiliary

            DesktopHeaderItem {
                id: menuSettings
                height: appHeader.height

                colorContent: Theme.colorHeaderContent
                colorHighlight: Theme.colorHeaderHighlight
                highlightMode: "background"

                highlighted: (appContent.state === "Settings")
                source: "qrc:/assets/icons/material-icons/duotone/tune.svg"
                onClicked: menuSettingsClicked()
            }

            DesktopHeaderItem {
                id: menuAbout
                height: appHeader.height

                colorContent: Theme.colorHeaderContent
                colorHighlight: Theme.colorHeaderHighlight
                highlightMode: "background"

                highlighted: (appContent.state === "About")
                source: "qrc:/assets/icons/material-icons/duotone/info.svg"
                onClicked: menuAboutClicked()
            }
        }
    }

    ////////////

    // CsdWindows { }

    // CsdLinux { }

}
