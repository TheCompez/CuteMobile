// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "../Controls" as Controls
import "../Interface" as Interface
import "../Cards" as Cards

Page {

    title: "Home"

    background: Rectangle {
        color: appStyle.pageground
        anchors.fill: parent
    }

    Component.onCompleted: {

    }

    Interface.MoreLink {
        id: moreLink
    }


    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: flowMain.childrenRect.height + 300
        focus: true
        clip: false

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

        Page {
            anchors.fill: parent

            background: Rectangle {
                color: appStyle.pageground
                anchors.fill: parent
            }

            header: Column {
                Interface.Header { id: header; visible: userStackLayout.currentIndex > 0 ? false : true }
                RowLayout {
                    width: parent.width
                    Layout.fillWidth: true
                    height: 132
                    spacing: 5
                    clip: true

                    Item { width: 5; }

                    //! STORIES
                    Controls.Stories {
                        id: stories
                        visible: true
                    }

                    Item { width: 5; }
                }
            }

            Flow {
                id: flowMain
                anchors.fill: parent
                anchors.margins: 20

                Repeater {
                    clip: true
                    model: postListModel

                    delegate: Column {
                        id: columnRect
                        width: parent.width
                        height: width + 210
                        spacing: 10

                        RowLayout {
                            width: parent.width
                            Layout.fillWidth: true
                            height: 42

                            Controls.Avatar {
                                width: 32
                                height: 32
                                source: sourceImage
                            }

                            Column {
                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    font.pixelSize: appStyle.t1
                                    font.bold: true
                                    font.weight: Font.Bold
                                    text: fullname
                                    color: appStyle.foregroundActivated
                                }
                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    font.pixelSize: appStyle.t2
                                    font.bold: false
                                    font.weight: Font.Normal
                                    text: country
                                    color: appStyle.foregroundActivated
                                }
                            }

                            Controls.HorizontalSpacer { }

                            Controls.ActionButton {
                                id: menuButton
                                setIcon: "\uf39b"
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                onClicked: {
                                    moreLink.open()
                                }
                            }

                        }

                        Cards.ColorizedBox {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            width: parent.width
                            height: width
                            source: sourceImage
                        }

                        RowLayout {
                            width: parent.width
                            Layout.fillWidth: true
                            height: 42
                            spacing: 10

                            Controls.ActionButton {
                                id: likeButton
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                setIcon: "\uf004"
                                onClicked: {

                                }
                            }

                            Controls.ActionButton {
                                id: commentButton
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                setIcon: "\uf086"
                                onClicked: {

                                }
                            }

                            Controls.ActionButton {
                                id: sendButton
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                setIcon: "\uf1d8"
                                onClicked: {

                                }
                            }

                            Controls.HorizontalSpacer { }

                            Controls.ActionButton {
                                id: saveButton
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                setIcon: "\uf02e"
                                onClicked: {

                                }
                            }
                        }

                        RowLayout {
                            width: parent.width
                            Layout.fillWidth: true
                            height: 32
                            Item { width: 2 }
                            Controls.Avatar {
                                width: 24
                                height: 24
                                source: "https://avatars.githubusercontent.com/u/1801526?v=4"
                            }
                            Text {
                                font.family: fontSystem.getContentFont.name
                                font.pixelSize: appStyle.t2
                                font.bold: false
                                font.weight: Font.Normal
                                text: "Liked by <strong>Herb Sutter</strong> and <strong>800 others</strong>."
                                color: appStyle.foregroundActivated
                            }
                            Controls.HorizontalSpacer { }
                        }

                        RowLayout{
                            width: parent.width
                            Layout.fillWidth: true
                            Item { width: 2 }
                            Text {
                                id: contentMore
                                width: 128
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                font.family: fontSystem.getContentFont.name
                                font.pixelSize: appStyle.t1
                                font.bold: false
                                font.weight: Font.Normal
                                text: "Hey Everyone! 👋 Hope you're having a great weekend 😊 In todays post I'd like to cover the second part of the guide on how to design better buttons."
                                color: appStyle.foregroundActivated
                                wrapMode: Text.WordWrap
                                elide: Text.ElideRight
                                maximumLineCount: 2
                            }
                            Text {
                                Layout.topMargin: 20
                                font.family: fontSystem.getContentFont.name
                                font.pixelSize: appStyle.t1
                                font.bold: false
                                font.weight: Font.Normal
                                text: "more"
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                color: appStyle.foregroundDeactivated
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {

                                    }
                                }
                            }
                        }

                    }
                }
            }
        }
    }
}
