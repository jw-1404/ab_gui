import QtQuick
import QtQuick.Controls
import QtQuick.Window

import ThemeEngine

ApplicationWindow {
    id: appWindow
    flags: settingsManager.appThemeCSD ? Qt.Window | Qt.FramelessWindowHint : Qt.Window
    // flags: settingsManager.appThemeCSD ? Qt.Window | Qt.CustomizeWindowHint : Qt.Window

    color: Theme.colorBackground
    // color: settingsManager.appThemeCSD ? "transparent" : Theme.colorBackground
    // background: Image {
    //     id: contentBkg
    //     scale: 0.7
    //     opacity: 0.08
    //     fillMode: Image.PreserveAspectFit
    //     source: "qrc:/logos/background.png"

    // }

    minimumWidth: 800
    minimumHeight: 560

    width: {
        if (settingsManager.initialSize.width > 0)
            return settingsManager.initialSize.width
        else
            return Theme.isHdpi ? 800 : 1280
    }
    height: {
        if (settingsManager.initialSize.height > 0)
            return settingsManager.initialSize.height
        else
            return Theme.isHdpi ? 560 : 720
    }
    x: settingsManager.initialPosition.width
    y: settingsManager.initialPosition.height
    visibility: settingsManager.initialVisibility
    visible: true

    property int screenPaddingStatusbar: 0
    property int screenPaddingNavbar: 0
    property int screenPaddingTop: 0
    property int screenPaddingLeft: 0
    property int screenPaddingRight: 0
    property int screenPaddingBottom: 0

    /////////////// Resize for frameless window

    MouseArea {
       id : resizeRight
       width: 8
       height: parent.height - 8 - Theme.headerHeight
       anchors.right: parent.right
       anchors.top: parent.top
       anchors.topMargin: Theme.headerHeight

       cursorShape: Qt.SizeHorCursor
       acceptedButtons: Qt.LeftButton
       pressAndHoldInterval: 80
       onPressAndHold: {
           appWindow.startSystemResize(Qt.RightEdge)
       }
    }

    MouseArea {
       id : resizeBottom
       height: 8
       width: parent.width - 8
       anchors.left: parent.left
       anchors.bottom: parent.bottom

       cursorShape: Qt.SizeVerCursor
       acceptedButtons: Qt.LeftButton
       pressAndHoldInterval: 80
       onPressAndHold: {
           appWindow.startSystemResize(Qt.BottomEdge)
       }
    }

    MouseArea {
       id : resizeCorner
       width: 8
       height: 8
       anchors.bottom: parent.bottom
       anchors.right: parent.right

       cursorShape: Qt.SizeFDiagCursor
       acceptedButtons: Qt.LeftButton
       pressAndHoldInterval: 80
       onPressAndHold: {
           appWindow.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
       }
    }

    WindowGeometrySaver {
        windowInstance: appWindow
        Component.onCompleted: {
            // Make sure we handle window visibility correctly
            visibility = settingsManager.initialVisibility
        }
    }

    // UI sizes ////////////////////////////////////////////////////////////////

    property bool headerUnicolor: (Theme.colorHeader === Theme.colorBackground)
    property bool sidebarUnicolor: (Theme.colorSidebar === Theme.colorBackground)

    property bool singleColumn: {
        return (appWindow.width < appWindow.height)
    }

    property bool wideMode: (Theme.isDesktop && width >= 560)
    property bool wideWideMode: (width >= 640)

    // Events handling /////////////////////////////////////////////////////////

    Component.onCompleted: {
        //
    }

    Connections {
        target: appHeader

        function onBackButtonClicked() {
            backAction()
        }
        function onRightMenuClicked() {
            //
        }

        function onMenuSettingsClicked() { screenSettings.loadScreen() }
        function onMenuAboutClicked() { screenAbout.loadScreen() }
    }

    Connections {
        target: Qt.application
        function onStateChanged() {
            switch (Qt.application.state) {
                case Qt.ApplicationActive:
                    //console.log("Qt.ApplicationActive")

                    // Check if we need an 'automatic' theme change
                    Theme.loadTheme(settingsManager.appTheme)

                    break
            }
        }
    }

    onActiveFocusItemChanged: {
        //console.log("activeFocusItem:" + activeFocusItem)
    }

    // User generated events handling //////////////////////////////////////////

    function backAction() {
    }

    function forwardAction() {
        //
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.BackButton | Qt.ForwardButton
        onClicked: (mouse) => {
            if (mouse.button === Qt.BackButton) {
                backAction()
            } else if (mouse.button === Qt.ForwardButton) {
                forwardAction()
            }
        }
    }

    Shortcut {
        sequence: StandardKey.Preferences
        onActivated: screenSettings.loadScreen()
    }
    Shortcut {
        sequences: [StandardKey.Close]
        onActivated: appWindow.close()
    }
    Shortcut {
        sequence: StandardKey.Quit
        onActivated: appWindow.exit(0)
    }

    // QML /////////////////////////////////////////////////////////////////////
    DesktopHeader {
        id: appHeader

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    DesktopSidebar {
        id: appSidebar
        z: 2

        anchors.top: appHeader.bottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: appContent

        anchors.top: parent.bottom
        anchors.left: appSidebar.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        color: Theme.colorBackground

        ScreenMainView {
            id: screenMainView
        }
        ScreenDevice {
            id: screenDevice
        }
        ScreenSettings {
            id: screenSettings
        }
        ScreenAbout {
            id: screenAbout
        }

        Component.onCompleted: {
            screenSettings.loadScreen()
        }

        onStateChanged: {
            //
        }

        // Initial state
        state: "Settings"

        states: [
            State {
                name: "MainView"
                PropertyChanges { target: screenMainView; visible: true; enabled: true; focus: true; }
                PropertyChanges { target: screenDevice; visible: false; enabled: false; }
                PropertyChanges { target: screenSettings; visible: false; enabled: false; }
                PropertyChanges { target: screenAbout; visible: false; enabled: false; }
            },
            State {
                name: "Device"
                PropertyChanges { target: screenMainView; visible: false; enabled: false; }
                PropertyChanges { target: screenDevice; visible: true; enabled: true; focus: true; }
                PropertyChanges { target: screenSettings; visible: false; enabled: false; }
                PropertyChanges { target: screenAbout; visible: false; enabled: false; }
            },
            State {
                name: "Settings"
                PropertyChanges { target: screenMainView; visible: false; enabled: false; }
                PropertyChanges { target: screenDevice; visible: false; enabled: false; }
                PropertyChanges { target: screenSettings; visible: true; enabled: true; focus: true; }
                PropertyChanges { target: screenAbout; visible: false; enabled: false; }
            },
            State {
                name: "About"
                PropertyChanges { target: screenMainView; visible: false; enabled: false; }
                PropertyChanges { target: screenDevice; visible: false; enabled: false; }
                PropertyChanges { target: screenSettings; visible: false; enabled: false; }
                PropertyChanges { target: screenAbout; visible: true; enabled: true; focus: true; }
            }
        ]
    }


}
