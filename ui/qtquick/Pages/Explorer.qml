// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../Controls" as Controls
import "../Interface" as Interface

Page {
    id: explorerPage

    QtObject {
        id: objectCatSelector
        property int getBackwardId : 0
        property int getForwardId : 0
        property int getParentId : 0
    }

    background: Rectangle {
        color: "transparent"
    }

    header: ColumnLayout {
        width: parent.width
        Layout.fillWidth: true
        Item {height: 5;}
        RowLayout {
            width: parent.width
            Layout.fillWidth: true
            Item { width: 5;}
            Text {
                font.family: fontSystem.getContentFont.name
                font.pixelSize: appStyle.h2
                font.weight: Font.Bold
                font.bold: true
                text: qsTr("Search...")
            }
            Item { width: 5;}
        }
    }

    contentData: Text {
        font.family: fontSystem.getContentFont.name
        font.pixelSize: appStyle.t1
        anchors.centerIn: parent
        text: qsTr("Under Development...")
    }

}
