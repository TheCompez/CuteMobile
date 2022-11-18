// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls as T
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "../Controls" as Controls

T.Button {
    id: control

    property bool isDefault : true
    property bool isBold : true

    property string setIcon : ""
    property string style : appStyle.primary
    property string sizeType : "normal"

    width: setIcon ? 110 * 1.5 : 110
    implicitHeight: 46
    Layout.fillWidth: true
    implicitWidth: 110

    opacity: control.enabled ? 1 : 0.5

    contentItem: RowLayout {

        width: parent.width
        Layout.fillWidth: true
        spacing: 0

        Item { width: 5; }

        Text {
            text: control.text
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            font.family: fontSystem.getContentFont.name
            font.pixelSize: isBold ? appStyle.t1 : appStyle.t1
            font.bold: isBold ? Font.Bold : Font.Normal
            font.weight: isBold ? Font.Bold : Font.Normal
            color: isDefault ? appStyle.accent : appStyle.foregroundFocused

            Behavior on color {
                ColorAnimation {
                    duration: appStyle.duration;
                    easing.type: Easing.Linear;
                }
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            scale: control.pressed ? 0.9 : 1.0
            Behavior on scale { NumberAnimation { duration: 200; } }
        }

        Controls.HorizontalSpacer { visible: setIcon ? true : false }

        Text {
            text: setIcon
            font.family: fontSystem.getAwesomeRegular.name
            font.pixelSize: isBold ? appStyle.t1 : appStyle.t1
            font.weight: isBold ? Font.Normal : Font.Light
            font.bold: isBold ? Font.Bold : Font.Normal
            color: isDefault ? appStyle.accent : appStyle.foregroundFocused
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            visible: setIcon ? true : false
            scale: control.pressed ? 0.9 : 1.0
            Behavior on scale { NumberAnimation { duration: 200; } }
        }

        Item { width: 5; }
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        Layout.fillWidth: true
        radius: width
        color: isDefault ? style : "transparent";
        border.width: isDefault ? 0 : 1
        border.color: isDefault ? "transparent" : style

        visible: false

        Behavior on color {
            ColorAnimation {
                duration: appStyle.duration;
                easing.type: Easing.Linear;
            }
        }

        Rectangle {
            id: indicator
            property int mx
            property int my
            x: mx - width / 2
            y: my - height / 2
            height: width
            radius: width / 2
            color: Qt.lighter(style)
        }
    }

    Rectangle {
        id: mask
        radius: width
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: background
        source: background
        maskSource: mask
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
    }

    ParallelAnimation {
        id: anim
        NumberAnimation {
            target: indicator
            property: 'width'
            from: 0
            to: control.width * 2.5
            duration: appStyle.duration
        }
        NumberAnimation {
            target: indicator;
            property: 'opacity'
            from: 0.9
            to: 0
            duration: appStyle.duration
        }
    }

    onPressed: {
        indicator.mx = mouseArea.mouseX
        indicator.my = mouseArea.mouseY
        anim.restart();
    }
}
