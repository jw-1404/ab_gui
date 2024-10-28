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
        anchors.topMargin: 6
        anchors.left: parent.left
        anchors.right: parent.right

        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/home.svg"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "MainView")
            onClicked: screenMainView.loadScreen()
        }
        DesktopSidebarItem {
            // source: "qrc:/assets/icons/material-symbols/hardware/computer.svg"
            source: "qrc:/assets/icons/material-symbols/memory.svg"
            // text: "数据采集"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Acquisition")
            onClicked: screenDaq.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/settings.svg"
            // text: "设备配置"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Device")
            onClicked: screenDevice.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/duotone/insert_chart.svg"
            // text: "标定配置"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Calibration")
            onClicked: screenCalib.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/duotone/chart_data.svg"
            // text: "质控图"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "QualityControl")
            onClicked: screenQC.loadScreen()
        }
        DesktopSidebarItem {
            source: "qrc:/assets/icons/bootstrap/database.svg"
            // text: "数据库"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Database")
            onClicked: screenDatabase.loadScreen()
        }
    }

    ////////////

    Column { // bottom menu
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        // anchors.bottomMargin: 12

        DesktopSidebarItem {
            source: "qrc:/assets/icons/material-symbols/bug_report.svg"
            sourceSize: 40

            highlightMode: "indicator"
            highlighted: (appContent.state === "Demo")

            onClicked: screenDemo.loadScreen()
        }

        // DesktopSidebarItem {
        //     source: "qrc:/assets/icons/material-icons/duotone/exit_to_app.svg"
        //     sourceSize: 40
        //     highlightMode: "circle"
        //     onClicked: Qt.quit()
        // }
    }

    ////////////

    // Rectangle { // shadow
    //     anchors.top: parent.top
    //     anchors.right: parent.left
    //     anchors.bottom: parent.bottom

    //     width: 6
    //     opacity: 1

    //     gradient: Gradient {
    //         orientation: Gradient.Horizontal
    //         GradientStop { position: 0.0; color: Theme.colorSidebarHighlight; }
    //         GradientStop { position: 1.0; color: Theme.colorBackground; }
    //     }
    // }

    ////////////
}
