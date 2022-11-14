// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls as T
import QtQuick.Layouts

T.Switch {
    id: control
    property string title
    property string setIcon
    property bool animation : false

    text: title
    font.family: fontSystem.getContentFont.name
    font.pixelSize: appStyle.t1

    indicator: Rectangle {
        id: rectangle
        implicitWidth: 42
        implicitHeight: 22
        x: control.leftPadding
        radius: 13
        anchors.verticalCenter: parent.verticalCenter
        color: control.checked ? appStyle.primary : appStyle.backgroundActivated
        border.color: control.checked ? appStyle.primary : appStyle.borderActivated

        Rectangle {
            id: rectTwo
            x: control.checked ? parent.width / 1.7 : 5
            width: 13
            height: 13
            radius: width
            anchors.verticalCenter: parent.verticalCenter
            color: control.checked ? appStyle.accent : appStyle.borderFocused
            border.color: control.checked ? appStyle.primary : appStyle.borderFocused

            Behavior on x {
                enabled: true
                NumberAnimation {
                    duration: 50
                    easing.type: Easing.Linear
                }
            }

            Behavior on color { ColorAnimation { duration: 200} }

        }
    }

    contentItem: Text {
        text: control.text
        anchors.verticalCenter: parent.verticalCenter
        font: control.font
        fontSizeMode: Text.Fit
        opacity: enabled ? 1.0 : 0.3
        color: appStyle.foregroundActivated
        leftPadding: control.indicator.width + control.spacing
        wrapMode: Text.WordWrap
        Behavior on color { ColorAnimation { duration: 200} }
    }

}
