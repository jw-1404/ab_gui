import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

import ThemeEngine

T.RangeSlider {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            first.implicitHandleWidth + leftPadding + rightPadding,
                            second.implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             first.implicitHandleHeight + topPadding + bottomPadding,
                             second.implicitHandleHeight + topPadding + bottomPadding)

    padding: 8
    topPadding: control.horizontal ? 22 : 8
    leftPadding: control.horizontal ? 8 : 22

    first.value: 0.25
    second.value: 0.75
    snapMode: T.RangeSlider.SnapAlways

    // settings
    property int ticksCount: ((to - from) / stepSize)

    // colors
    property color colorBackground: Theme.colorComponentBackground
    property color colorForeground: Theme.colorPrimary
    property color colorTicks: Theme.colorComponentDown

    ////////////////

    background: Rectangle {
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        implicitWidth: control.horizontal ? 200 : 4
        implicitHeight: control.horizontal ? 4 : 200
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight

        radius: 2
        color: control.colorBackground
        opacity: control.enabled ? 1 : 0.66
        scale: control.horizontal && control.mirrored ? -1 : 1

        clip: true
        Repeater { // ticks
            width: control.availableWidth
            model: (control.ticksCount - 1)
            Rectangle {
                x: control.horizontal ? ((control.availableWidth / control.ticksCount) * (index+1)) : 0
                y: control.horizontal ? 0 : ((control.availableHeight / control.ticksCount) * (index+1))
                width: control.horizontal ? 2 : parent.height
                height: control.horizontal ? parent.height : 2
                color: control.colorTicks
            }
        }

        Rectangle {
            x: control.horizontal ? control.first.visualPosition * control.availableWidth : 0
            y: control.horizontal ? 0 : control.second.visualPosition * control.availableHeight
            width: control.horizontal ? control.second.visualPosition * control.availableWidth - control.first.visualPosition * control.availableWidth : 4
            height: control.horizontal ? 4 : control.second.position * parent.height - control.first.position * parent.height

            radius: 2
            color: control.colorForeground
        }
    }

    ////////////////

    first.handle: Rectangle {
        x: (control.horizontal ? control.leftPadding + Math.round(first.visualPosition * control.availableWidth) - (width / 2) : -2)
        y: (control.horizontal ? 0 : control.topPadding + Math.round(first.visualPosition * control.availableHeight) - (height / 2))
        width: 16
        height: 12
        rotation: control.horizontal ? 0 : -90
        opacity: control.enabled ? 1 : 0.8
        color: first.pressed ? Theme.colorSecondary : control.colorForeground

        Rectangle {
            width: 10
            height: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.bottom

            z: -1
            rotation: 45
            color: parent.color
        }
    }

    ////////////////

    second.handle: Rectangle {
        x: (control.horizontal ? control.leftPadding + Math.round(second.visualPosition * control.availableWidth) - (width / 2) : -2)
        y: (control.horizontal ? 0 : control.topPadding + Math.round(second.visualPosition * control.availableHeight) - (height / 2))
        width: 16
        height: 12
        rotation: control.horizontal ? 0 : -90
        opacity: control.enabled ? 1 : 0.8
        color: second.pressed ? Theme.colorSecondary : control.colorForeground

        Rectangle {
            width: 10
            height: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.bottom

            z: -1
            rotation: 45
            color: parent.color
        }
    }

    ////////////////
}
