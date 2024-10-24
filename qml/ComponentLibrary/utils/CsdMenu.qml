import QtQuick
import QtQuick.Controls
import QtQuick.Window

import ThemeEngine

Loader {
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.topMargin: 0

    width: active ? Theme.headerHeight * 3 : 0
    height: active ? Theme.headerHeight : 0

    active: (settingsManager.appThemeCSD)
    asynchronous: true

    sourceComponent: Row {
        id: csdMenu
        spacing: 0

        ////////

        Rectangle { // button minimize
            width: Theme.headerHeight; height: Theme.headerHeight;
            color: mouseAreaMin.containsMouse ? "#33aaaaaa" : "transparent"

            Rectangle {
                width: parent.width*0.4; height: 2;
                anchors.centerIn: parent
                color: mouseAreaMin.containsMouse ? Theme.colorHighContrast : Theme.colorIcon
            }

            MouseArea {
                id: mouseAreaMin
                anchors.fill: parent

                hoverEnabled: true
                onClicked: appWindow.showMinimized()
            }
        }

        ////////

        Rectangle { // button maximize
            width: Theme.headerHeight; height: Theme.headerHeight;
            color: mouseAreaMax.containsMouse ? "#33aaaaaa" : "transparent"

            Rectangle {
                width: parent.width*0.4; height: parent.height*0.4;
                anchors.centerIn: parent
                color: "transparent"
                border.width: 2
                border.color: mouseAreaMax.containsMouse ? Theme.colorHighContrast : Theme.colorIcon
            }

            MouseArea {
                id: mouseAreaMax
                anchors.fill: parent

                hoverEnabled: true
                onClicked: {
                    if (appWindow.visibility === ApplicationWindow.Maximized)
                        appWindow.showNormal()
                    else
                        appWindow.showMaximized()
                }
            }
        }

        ////////

        Rectangle { // button close
            width: Theme.headerHeight; height: Theme.headerHeight;
            color: mouseAreaClose.containsMouse ? "red" : "transparent"

            Rectangle {
                width: parent.width*0.5; height: 2;
                anchors.centerIn: parent
                rotation: 45
                color: mouseAreaClose.containsMouse ? "white" : Theme.colorIcon
            }
            Rectangle {
                width: parent.width*0.5; height: 2;
                anchors.centerIn: parent
                rotation: -45
                color: mouseAreaClose.containsMouse ? "white" : Theme.colorIcon
            }

            MouseArea {
                id: mouseAreaClose
                anchors.fill: parent

                hoverEnabled: true
                onClicked: appWindow.close()
            }
        }
    }
}
