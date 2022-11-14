// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../Controls" as Controls

Page {
    id: createPage

    QtObject {
        id: objectCatSelector
        property int getBackwardId : 0
        property int getForwardId : 0
        property int getParentId : 0
    }

    background: Rectangle {
        color: "transparent"
    }

    contentData: Text {
        font.family: fontSystem.getContentFont.name
        font.pixelSize: appStyle.t1
        anchors.centerIn: parent
        text: qsTr("Under Development...")
    }

}
