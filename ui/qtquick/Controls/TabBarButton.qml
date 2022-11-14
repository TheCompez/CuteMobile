// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic as T
import QtQuick.Layouts

T.TabButton {
    id:controlTabButton
    property string title : ""
    property bool setStatus : true
    property int setSelect
    property bool isBold: false
    property string setIcon : "\uf39b"
    property int count : 0
    property bool isFocused: false
    width: 120
    height: 36

    text: title

    contentItem: RowLayout
    {
        width: parent.width
        Layout.fillWidth: true
        HorizontalSpacer { }

        Text {
            font.family: fontSystem.getAwesomeRegular.name
            color: controlTabButton.isFocused ? appStyle.primary : appStyle.backgroundDeactivated
            font.pixelSize: appStyle.h3
            font.bold: isBold ? true : false
            font.weight: isBold ? Font.Bold : Font.Light
            text: setIcon
        }

        Text {
            font.family: fontSystem.getContentFont.name
            font.pixelSize: appStyle.t1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: count
            color: controlTabButton.isFocused ? appStyle.primary : appStyle.foregroundDeactivated
            visible: title.length > 0 ? true : false
        }

        HorizontalSpacer { }

    }

    background: Rectangle {
        id: rect
        width: parent.width
        height: 2
        anchors.bottom: controlTabButton.bottom
        color: controlTabButton.isFocused ? appStyle.primary : appStyle.backgroundDeactivated
        radius: 5
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
}

