import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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

    sourceComponent: Page {
        id: tabPage

        StackLayout {
            id: tabView
            anchors.fill: parent
            currentIndex: tabBar.currentIndex

            Repeater {
                model: 4

                Pane {
                    width: tabView.width
                    height: tabView.height

                    Column {
                        spacing: 40
                        width: parent.width

                        Label {
                            width: parent.width
                            wrapMode: Label.Wrap
                            horizontalAlignment: Qt.AlignHCenter
                            text: "Tab " + index
                        }

                        Button {
                            width: parent.width * 0.1
                            height: 60
                            anchors.centerIn: parent
                            text: "click me"
                            PopupMessage {
                                id: popupMessage
                            }
                            onClicked: popupMessage.open()
                        }
                    }
                }
            }
        }

        footer: TabBar {
            id: tabBar
            width: parent.width

            Repeater {
                model: ["First", "Second", "Third", "Fourth"]

                TabButton {
                    text: modelData
                    width: Math.max(100, tabBar.width / 4)
                }
            }
        }
    }

}
