// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Layouts

ColumnLayout {

    Layout.fillWidth: true;

    property string setColor : appStyle.lineBorderActivated

    Item { height: 1; }

    Rectangle {

        property int widthSize : parent.width
        property int lineSize : 1

        Layout.fillWidth: true;

        width: widthSize
        height: lineSize
        color: setColor
    }

    Item { height: 1; }

}
