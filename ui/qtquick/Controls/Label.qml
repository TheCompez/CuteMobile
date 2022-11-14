// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick

Text {
    property bool isBold : false
    font.family: fontSystem.getContentFont.name
    font.pixelSize: isBold ? appStyle.t1 : appStyle.t2
    font.weight: isBold ? Font.Bold : Font.Normal
    color: enabled ? appStyle.foregroundActivated : appStyle.foregroundDeactivated
}
