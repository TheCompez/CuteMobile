// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "../Controls" as Controls

Item {

    id: item

    width: 128
    height: 128

    property bool hasProfessor : false
    property string setSource : ""
    property bool setIsVideo : false
    property int setTotalLiked : 0
    property bool setHasLiked : false
    property string setAdvPDateTimeInfo : "unknown"
    property string setIdItem : ""
    property string setIdAdverItemViewer : ""

    property double setRadius: 0


    Rectangle {
        id: circleMask
        anchors.fill: parent
        smooth: true
        visible: false
        radius: setRadius
        color: appStyle.backgroundItemActivated
    }


    Text {
        font.family: fontSystem.getAwesomeRegular.name
        font.pixelSize: appStyle.display3
        font.weight: Font.Light
        text: "\uf302"
        color: appStyle.foregroundDeactivated
        visible: !setSource ? true : false
        z: 999
        anchors.centerIn: parent
    }

    ColumnLayout {
        width: parent.width
        height: parent.height
        Layout.fillWidth: true

        Image {
            id: image
            width: parent.width
            height: parent.height
            visible: false
            fillMode: Image.PreserveAspectCrop
            scale: 1.0
            cache: true
            source: setSource
        }

        Text {

            text: qsTr("text")
        }
    }
    Rectangle {
        anchors.fill: parent
        radius: setRadius
        color: appStyle.backgroundItemActivated

        OpacityMask {

            anchors.fill: parent
            maskSource: circleMask
            source: image

            Rectangle {
                id:front
                anchors.fill: parent
                anchors.margins: 5
                radius: setRadius
                color: "transparent"

                BusyIndicator {
                    id: control
                    width: 32
                    height: 32
                    anchors.centerIn: parent
                    running: image.status === Image.Loading

                    contentItem: Item {
                        implicitWidth: 16
                        implicitHeight: 16

                        Item {
                            id: itemProgress
                            x: parent.width / 2 - 16
                            y: parent.height / 2 - 16
                            width: 32
                            height: 32
                            opacity: control.running ? 1 : 0

                            Behavior on opacity {
                                OpacityAnimator {
                                    duration: 250
                                }
                            }

                            RotationAnimator {
                                target: itemProgress
                                running: control.visible && control.running
                                from: 0
                                to: 360
                                loops: Animation.Infinite
                                duration: 1250
                            }

                            Repeater {
                                id: repeater
                                model: 3

                                Rectangle {
                                    x: itemProgress.width / 2 - width / 2
                                    y: itemProgress.height / 2 - height / 2
                                    implicitWidth: 5
                                    implicitHeight: 5
                                    radius: 2.5
                                    color: appStyle.primary
                                    transform: [
                                        Translate {
                                            y: -Math.min(itemProgress.width, itemProgress.height) * 0.5 + 7
                                        },
                                        Rotation {
                                            angle: index / repeater.count * 360
                                            origin.x: 2.5
                                            origin.y: 2.5
                                        }
                                    ]
                                }
                            }
                        }
                    }

                    onRunningChanged: {
                        if (image.status === Image.Ready) {
                            front.visible = false
                        } else {
                            front.visible = true
                        }
                    }
                }

            }

        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
        }
    }

    Item { Layout.fillHeight: true; }
}
