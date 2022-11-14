// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "../Controls" as Controls
import "../Cards" as Cards
import "../Interface" as Interface
import "../Profile/Pages" as ProfilePages
import "../Profile/Settings" as ProfileSetting

Page {

    id: profilePage

    background: Rectangle {
        color: "transparent"
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: contentPage.childrenRect.height
        focus: true
        clip: false

        property bool hasBack : false

        ColumnLayout {
            id: contentPage
            width: parent.width
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                width: parent.width
                Layout.fillWidth: true
                Layout.leftMargin: 5
                Layout.rightMargin: 5
                spacing: 0

                Rectangle {
                    width: 86
                    height: 86
                    radius: width/2
                    color: appStyle.backgroundActivated
                    border.width: 2
                    border.color: appStyle.foregroundActivated
                    Layout.leftMargin: 10

                    Controls.Avatar {
                        id: avatarObject
                        width: 86
                        height: 86
                        anchors.centerIn: parent
                        source: "https://avatars.githubusercontent.com/u/4066299?v=4"
                    }
                }

                RowLayout {
                    width: parent.width
                    Layout.fillWidth: true
                    spacing: 25
                    Controls.HorizontalSpacer {}
                    Controls.ExButton {
                        title: "Posts"
                        value: "128"
                    }
                    Controls.ExButton {
                        title: "Followers"
                        value: "4096"
                    }
                    Controls.ExButton {
                        title: "Following"
                        value: "512"
                    }
                    Controls.HorizontalSpacer {}
                }
            }

            ColumnLayout {
                width: parent.width
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 0

                Text {
                    font.family: fontSystem.getContentFontMedium.name
                    font.pixelSize: appStyle.h4
                    font.bold: true
                    font.weight: Font.Normal
                    text: "Kambiz Asadzadeh"
                    color: appStyle.foregroundActivated
                }
                Text {
                    font.family: fontSystem.getContentFontMedium.name
                    font.pixelSize: appStyle.h5
                    text: "Developer"
                    font.bold: true
                    font.weight: Font.Normal
                    color: appStyle.foregroundDeactivated
                }
            }

            Item { height: 5; }

            ColumnLayout {
                width: parent.width
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 2

                Text {
                    id: contentMore
                    width: parent.width
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.family: fontSystem.getContentFontMedium.name
                    font.pixelSize: appStyle.t1
                    font.bold: false
                    font.weight: Font.Normal
                    text: "A computer engineer who believes that #programming and #technology can help people to build a better world by modeling nature and #coding optimal programs.🇮🇷"
                    color: appStyle.foregroundActivated
                    wrapMode: Text.WordWrap
                }

                Text {
                    font.family: fontSystem.getContentFont.name
                    font.pixelSize: appStyle.h5
                    text: "kambizasadzadeh.com"
                    font.bold: false
                    font.weight: Font.Normal
                    color: "#0a8dff"
                }
            }

            Item { height: 5; }

            RowLayout {
                width: parent.width
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                spacing: 10
                Controls.HorizontalSpacer {}
                Controls.MiniButton {
                    text: "Follow"
                    style: appStyle.secondry
                    isDefault: true
                }
                Controls.MiniButton {
                    text: "Message"
                    style: appStyle.primary
                    isDefault: false
                }
                Controls.MiniButton {
                    text: "Contact"
                    style: appStyle.primary
                    isDefault: false
                }
                Controls.HorizontalSpacer {}
            }

            Item { height: 5; }

            RowLayout {
                width: parent.width
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Controls.TabBarButton {
                    Layout.fillWidth: true
                    setIcon: "\uf015"
                    isFocused: swipeView.currentIndex === 0 ? true : false
                    isBold: true
                    onClicked: {
                        swipeView.currentIndex = 0;
                    }

                }
                Controls.TabBarButton {
                    Layout.fillWidth: true
                    setIcon: "\uf87c"
                    isFocused: swipeView.currentIndex === 1 ? true : false
                    isBold: true
                    onClicked: {
                        swipeView.currentIndex = 1;
                    }
                }
                Controls.TabBarButton {
                    Layout.fillWidth: true
                    setIcon: "\uf2bb"
                    isBold: true
                    isFocused: swipeView.currentIndex === 2 ? true : false
                    onClicked: {
                        swipeView.currentIndex = 2;
                    }
                }
            }

            SwipeView {
                id: swipeView
                width: parent.width
                Layout.fillWidth: true
                implicitHeight: flow.childrenRect.height
                Layout.fillHeight: true

                Page {
                    background: Rectangle {
                        color: "transparent"
                    }

                    ListModel {
                        id: postListModel
                        ListElement {
                            sourceImage: "qrc:/Resources/image/01.jpg"
                            avatar: "qrc:/Resources/image/image-01.jpg"
                            fullname: "Kambiz"
                            country : "Iran, Urmia"
                        }
                        ListElement {
                            sourceImage: "qrc:/Resources/image/02.jpg"
                            avatar: "https://avatars.githubusercontent.com/u/10933044?v=4"
                            fullname: "Bjarne Stroustrup"
                            country : "New York, USA"
                        }
                        ListElement {
                            sourceImage: "qrc:/Resources/image/03.jpg"
                            avatar: "qrc:/Resources/image/image-01.jpg"
                            fullname: "Kambiz"
                            country : "Iran, Urmia"
                        }
                        ListElement {
                            sourceImage: "qrc:/Resources/image/04.jpg"
                            avatar: "https://avatars.githubusercontent.com/u/10933044?v=4"
                            fullname: "Bjarne Stroustrup"
                            country : "New York, USA"
                        }
                        ListElement {
                            sourceImage: "qrc:/Resources/image/05.jpg"
                            avatar: "https://avatars.githubusercontent.com/u/10933044?v=4"
                            fullname: "Bjarne Stroustrup"
                            country : "New York, USA"
                        }
                        ListElement {
                            sourceImage: "qrc:/Resources/image/06.jpg"
                            avatar: "https://avatars.githubusercontent.com/u/10933044?v=4"
                            fullname: "Bjarne Stroustrup"
                            country : "New York, USA"
                        }
                        ListElement {
                            sourceImage: "qrc:/Resources/image/07.jpg"
                            avatar: "https://avatars.githubusercontent.com/u/10933044?v=4"
                            fullname: "Bjarne Stroustrup"
                            country : "New York, USA"
                        }
                    }

                    Flow {
                        id: flow
                        anchors.fill: parent
                        anchors.margins: 0
                        spacing: 0
                        Repeater {
                            model: postListModel
                            delegate: Rectangle {
                                width: flickable.width / 3
                                height: width
                                color: "#e4e8ef"
                                border.width: 1
                                border.color: appStyle.primary
                                Cards.MiniCard {
                                    anchors.fill: parent
                                    setSource: sourceImage
                                }
                            }
                        }
                    }
                }
                Page {
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
                Page {
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
            }

        }
    }
}
