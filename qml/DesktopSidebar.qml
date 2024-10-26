import QtQuick
import QtQuick.Controls

import ThemeEngine

Rectangle {
    id: appSidebar
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.bottom: parent.bottom

    z: 10
    width: Theme.sidebarWidth
    color: Theme.colorSidebar

    ////////////

    DragHandler {
        // Drag on the sidebar to drag the whole window // Qt 5.15+
        // Also, prevent clicks below this area
        onActiveChanged: if (active) appWindow.startSystemMove()
        target: null
    }

    ////////////

    Column { // top menu
        anchors.top: parent.top
        anchors.topMargin: 32
        anchors.left: parent.left
        anchors.right: parent.right

        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/hardware/computer.svg"
            text: "主窗口"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "MainView")
            onClicked: screenMainView.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/hardware/computer.svg"
            text: "数据采集"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Device")
            onClicked: screenDevice.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/hardware/computer.svg"
            text: "系统配置"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Device")
            onClicked: screenDevice.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/duotone/insert_chart.svg"
            text: "刻度定义"
            sourceSize: 40

            // highlightMode: "indicator"
            // highlighted: (appContent.state === "Device")
            // onClicked: screenDevice.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/duotone/chart_data.svg"
            text: "质控图"
            sourceSize: 40

            // highlightMode: "indicator"
            // highlighted: (appContent.state === "Device")
            // onClicked: screenDevice.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/bootstrap/database.svg"
            text: "数据库"
            sourceSize: 40

            // highlightMode: "indicator"
            // highlighted: (appContent.state === "Device")
            // onClicked: screenDevice.loadScreen()
        }
    }

    ////////////

    Column { // bottom menu
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12

        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-icons/duotone/tune.svg"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Settings")

            onClicked: screenSettings.loadScreen()
        }

        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-icons/duotone/info.svg"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "About")

            onClicked: screenAbout.loadScreen()
        }

        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-icons/duotone/exit_to_app.svg"
            sourceSize: 40
            highlightMode: "circle"
            onClicked: Qt.quit()
        }
    }

    ////////////

    Rectangle { // shadow
        anchors.top: parent.top
        anchors.right: parent.left
        anchors.bottom: parent.bottom

        width: 8
        opacity: 0.66

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: Theme.colorSidebarHighlight; }
            GradientStop { position: 1.0; color: Theme.colorBackground; }
        }
    }

    ////////////
}
