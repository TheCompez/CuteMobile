// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic as T

T.TabButton {

    id:control

    property string title
    property string description
    property string setIcon : ""

    text: title

    contentItem: RowLayout {

        LayoutMirroring.enabled: appRootObjects.isLeftToRight ? (Qt.application.layoutDirection === Qt.RightToLeft) : false
        LayoutMirroring.childrenInherit: appRootObjects.isLeftToRight ? true : false
        visible:  appRoot.width < appRoot.height ? false : true

        Text {
            width: parent.width
            Layout.fillWidth: true;
            font.family: fontSystem.getTitleBoldFont.name
            font.pixelSize:appStyle.t1
            font.weight:  Font.Bold
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            opacity: enabled ? 1.0 : 0.3
            color: control.checked ? appStyle.primary : appStyle.foregroundActivated
            text: control.text
        }
    }

    background: ColumnLayout {
        anchors.fill: parent
        VerticalSpacer { }
        Rectangle {
            implicitWidth: parent.width
            implicitHeight: 2
            height: 2
            radius: 5
            color: control.checked ? appStyle.primary: appStyle.borderActivated
            opacity: enabled ? 1 : 0.3
            Behavior on color {
                ColorAnimation {
                    duration: appStyle.duration;
                    easing.type: Easing.Linear;
                }
            }
        }
    }
}
