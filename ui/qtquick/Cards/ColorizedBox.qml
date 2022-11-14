// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Item {

    id: control

    width: 360
    height: 360

    //! [TODO For Video and Multi Image]
    //! [Simple Image]
    property string sourceType : "image"
    property string source : ""
    property color color
    property real blueEffect : 75

    QtObject {
        id: object

        property int    getWidth        : width
        property int    getHeight       : height
        property string getSourceType   : sourceType
        property string getSource       : source
        property color  getColor        : color
        property real   getBlurEffect   : blueEffect
    }

    FastBlur {
        id: blur
        width: image.width - 20
        height: image.height - 20
        anchors.centerIn: image
        anchors.verticalCenterOffset: 15
        anchors.horizontalCenterOffset: 0
        source: image
        radius: object.getBlurEffect
        transparentBorder: true
    }

    Image {
        id: image
        anchors.centerIn: parent
        width: object.getWidth;
        height: object.getHeight;
        fillMode: Image.PreserveAspectCrop
        source: object.getSource
        visible: false
    }

    Rectangle {
        id: rectangleBack
        anchors.fill: image
        radius: 25
        visible: false
    }

    OpacityMask {
        source: image
        anchors.fill: rectangleBack
        maskSource: rectangleBack
    }

    Text {
        id: likedIcon
        font.family: fontSystem.getAwesomeSolid.name
        font.pixelSize: appStyle.display1
        font.bold: true
        font.weight: Font.Bold
        text: "\uf004"
        color: "red"
        anchors.centerIn: parent
        opacity: 0.0
        Behavior on scale {
            NumberAnimation {
                duration: 300
            }
        }
        NumberAnimation {
            id: heartAnimation
            target: likedIcon
            property: "opacity"
            duration: 300
            easing.type: Easing.InOutQuad
            from: 1.0
            to: 0.0
        }
    }

    Timer {
        id: likedTimer
        interval: 10
        onTriggered: {
            likedIcon.scale = 1.0
        }

    }

    TapHandler {
        id: tapHandler
        gesturePolicy: TapHandler.ReleaseWithinBounds
        onDoubleTapped: {
            heartAnimation.start();
            likedIcon.scale = 10;
            likedTimer.start();
        }
    }
}
