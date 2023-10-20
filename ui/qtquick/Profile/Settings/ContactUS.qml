// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import "../../Controls" as Controls
import "../../Interface" as Interface


Page {

    title: "Contact"
    background: Rectangle {
        color: appStyle.pageground
    }

    contentItem: Flickable {
        id: flickable
        anchors.fill: parent
        anchors.margins: 10
        contentHeight: boothContentColumn.height
        clip: true
        focus: true

        Keys.onUpPressed: scrollBar.decrease()
        Keys.onDownPressed: scrollBar.increase()

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            parent: flickable.parent
            anchors.top: flickable.top
            anchors.left: flickable.right
            anchors.bottom: flickable.bottom
            rightPadding: 6
        }


        ColumnLayout {
            id: boothContentColumn
            width: parent.width
            Layout.fillWidth: true
            spacing: 10

            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: fontSystem.getAwesomeRegular.name
                font.pixelSize: appStyle.h1
                font.weight: Font.Light
                text: "\uf071"
                color: appStyle.warning
            }

            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: appStyle.h6
                font.weight: Font.Normal
                text: "Under Development..."
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: appStyle.foregroundActivated
            }
        }
    }
}
