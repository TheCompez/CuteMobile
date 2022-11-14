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
    height: 48
    Layout.fillWidth: true
    Layout.preferredHeight: 42
    Layout.minimumHeight: 42
    color: appStyle.header

    property bool isBold : false

    Rectangle {
        width: parent.width
        Layout.fillWidth: true
        height: 24
    }

    ColumnLayout {

        width: parent.width
        Layout.fillWidth: true
        Layout.fillHeight: true
        visible: userStackLayout.currentIndex === 0 ? true : false

        Controls.VerticalSpacer { }

        Item { height: 5;}

        RowLayout {

            width: parent.width
            Layout.fillWidth: true

            Item { width: 10; }


            Text {
                font.family: fontSystem.getContentFontMedium.name
                font.pixelSize: appStyle.h3
                font.weight: Font.Bold
                font.bold: true
                text: qsTr("Modern Social")
                color: appStyle.foregroundActivated
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: true
            }

            Controls.ActionButton {
                id: directButton
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                setIcon: "\uf1d8"
                onClicked: {
                    rootStackViewMain.push(directPage)
                }
            }

            Item { width: 10; }

        }
    }

    ColumnLayout {

        width: parent.width
        Layout.fillWidth: true
        Layout.fillHeight: true

        Drawer {

            id: createDrawer
            width:  appRoot.width
            height: 310
            edge: Qt.BottomEdge
            interactive: true

            background: Rectangle {
                color: appStyle.backgroundActivated
                radius: 25
                Rectangle {
                    width: parent.width
                    Layout.fillWidth: true
                    height: 25
                    anchors.bottom: parent.bottom
                }
            }

            contentItem: Flickable {
                id: flickable
                contentHeight: columnItem.height
                anchors.fill: parent
                interactive: false

                rebound: Transition {
                    NumberAnimation {
                        properties: "x,y"
                        duration: 500
                        easing.type: Easing.OutBounce
                    }
                }

                ColumnLayout {
                    id: columnItem
                    width: parent.width
                    Layout.fillWidth: true
                    spacing: 10

                    Item { height: 2; }

                    Rectangle {
                        width: 72
                        height: 4
                        radius: 25
                        color: appStyle.borderActivated
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    }

                    Controls.Text {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        text: "Create"
                    }

                    ListModel {
                        id: createMenuItem
                        ListElement {
                            title: "Reel"
                            icon: "\uf401"
                        }
                        ListElement {
                            title: "Post"
                            icon: "\uf5fd"
                        }
                        ListElement {
                            title: "Story"
                            icon: "\uf1da"
                        }
                        ListElement {
                            title: "Live"
                            icon: "\uf8dd"
                        }
                        ListElement {
                            title: "Guide"
                            icon: "\uf5da"
                        }
                    }

                    ListView {
                        width: parent.width
                        Layout.fillWidth: true
                        height: 220
                        model: createMenuItem
                        clip: true
                        interactive: false
                        spacing: 5
                        focus: true
                        delegate: Rectangle {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            width: parent.width
                            Layout.fillWidth: true
                            height: 42
                            color: mouseArea.containsPress ? appStyle.backgroundHovered : appStyle.backgroundActivated
                            Behavior on color {
                                ColorAnimation {
                                    duration: 200
                                }
                            }
                            RowLayout {
                                width: parent.width
                                Layout.fillWidth: true
                                height: 42

                                Item { width: 15; }

                                Row {
                                    spacing: 10
                                    Text {
                                        font.family: fontSystem.getAwesomeRegular.name
                                        font.pixelSize: appStyle.h4
                                        font.bold: false
                                        font.weight: Font.Normal
                                        text: icon
                                        color: appStyle.foregroundActivated
                                    }
                                    Text {
                                        font.family: fontSystem.getContentFont.name
                                        font.pixelSize: appStyle.h5
                                        font.bold: true
                                        font.weight: Font.Normal
                                        text: title
                                        color: appStyle.foregroundActivated
                                    }
                                }

                                Controls.HorizontalSpacer { }
                            }


                            Rectangle {
                                width: parent.width
                                height: 1
                                color: appStyle.borderActivated
                                anchors.top: parent.top

                            }

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                            }
                    }
                }
            }
        }
    }

    visible: userStackLayout.currentIndex === 4 ? true : false

    Item { height: 5;}

    RowLayout {

        width: parent.width
        Layout.fillWidth: true
        spacing: 5

        Item { width: 10; }

        Text {
            font.family: fontSystem.getContentFontMedium.name
            font.pixelSize: appStyle.h3
            font.weight: Font.Bold
            font.bold: true
            text: qsTr("Profile")
            color: appStyle.foregroundActivated
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
        }

        Controls.ActionButton {
            id: addButton
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            setIcon: "\uf0fe"
            onClicked: {
                createDrawer.open()
            }
        }

        Controls.ActionButton {
            id: settingButton
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            setIcon: "\uf141"
            isBold: true
            onClicked: {
                rootStackViewMain.push(directPage)
            }
        }

        Item { width: 10; }

    }
}

}

