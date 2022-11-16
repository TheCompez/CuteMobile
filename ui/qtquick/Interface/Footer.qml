// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Controls" as Controls

//![GLOBAL/HOME]
Rectangle {

    width: parent.width
    Layout.fillWidth: true
    height: 100
    Layout.preferredHeight: 100
    Layout.minimumHeight: 100
    color: appStyle.footer
    radius: 40

    property bool isBold : false
    property bool mainMenu : true;
    property bool secondMenu : false;
    property alias footMenuSideAlias : footMenuSide

    QtObject {
        id:footerObject
        property bool main : mainMenu
        property bool second : secondMenu
    }

    ColumnLayout {

        width: parent.width
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 20

        Item {
            height: 5
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Controls.FootMenu {
            id: footMenuSide
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Item {
            height: 5
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Item { height: 15; }
    }

    Rectangle {
        width: parent.width
        height: 36
        color: appStyle.footer
        Layout.fillWidth: true
        anchors.bottom: parent.bottom
        z: -2
    }
}
