import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "../Controls" as Controls

//!Send Drawer
Drawer {
    id: control
    width:  appRoot.width
    height: appRoot.height
    edge: Qt.BottomEdge
    interactive: true

    property bool  hasUserStory: false
    property string setAvatar : ""
    property string setUsername : ""
    property string setFullName : ""

    background: Rectangle {
        color: appStyle.primary
    }

    contentItem: Page {
        anchors.fill: parent
        background: Rectangle {
            color: "transparent"
        }
        visible: hasUserStory ? true :  false

        //!Send Drawer
        Drawer {
            id: sendDrawer
            width:  appRoot.width
            height: columnItem.height + 50
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
                anchors.fill: parent
                contentHeight: columnItem.height
                anchors.margins: 15
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

                    ListModel {
                        id: contactItem
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/4066299?v=4"
                            fullname: "Kambiz Asadzadeh"
                            username: "kambizasadzadeh"
                            addNew : false
                            live: false
                            story: false
                            self: true
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/105925065?s=200&v=4"
                            fullname : "Genyleap"
                            username: "thegenyleap"
                            addNew : false
                            live: false
                            story: true
                            self: false
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/10933044?v=4"
                            fullname : "Bjarne Stroustrup"
                            username: "stroustrup"
                            addNew : false
                            live: false
                            story: true
                            self: false
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/1801526?v=4"
                            fullname: "Herb Sutter"
                            username: "sutter"
                            addNew : false
                            live: true
                            story: true
                            self: false
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/1024025?v=4"
                            fullname : "Linus Torvalds"
                            username: "torvalds"
                            addNew : false
                            live: false
                            story: true
                            self: false
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/6557263?v=4"
                            fullname : "Hana Dusíková"
                            username: "hana"
                            addNew : false
                            live: false
                            story: true
                            self: false
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/586816?v=4"
                            fullname: "Arash Milani"
                            username: "arash"
                            addNew : false
                            live: false
                            story: true
                            self: false
                        }
                        ListElement {
                            avatarSource: "https://avatars.githubusercontent.com/u/177011?v=4"
                            fullname : "Daniel Stenberg"
                            username: "stenberg"
                            addNew : false
                            live: false
                            story: true
                            self: false
                        }
                    }

                    Item { height: 10; }

                    ListView {
                        width: parent.width
                        Layout.fillWidth: true
                        height: 220
                        model: contactItem
                        clip: true
                        spacing: 5
                        delegate: RowLayout {
                            width: parent.width
                            Layout.fillWidth: true
                            height: 42

                            Item { width: 5; }

                            Controls.Avatar {
                                width: 32
                                height: 32
                                source: setAvatar
                            }

                            Column {
                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    font.pixelSize: appStyle.t1
                                    font.bold: true
                                    font.weight: Font.Bold
                                    text: setFullName
                                    color: appStyle.foregroundActivated
                                }
                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    font.pixelSize: appStyle.t2
                                    font.bold: false
                                    font.weight: Font.Normal
                                    text: setUsername
                                    color: appStyle.foregroundActivated
                                }
                            }

                            Controls.HorizontalSpacer { }

                            Controls.CircleCheck {
                                id: directButton
                            }

                            Item { width: 5; }

                        }
                        focus: true
                    }

                    Controls.Button {
                        text: "Send"
                        style: appStyle.secondry
                        onClicked: {
                            sendDrawer.close();
                        }
                    }
                }
            }
        }


        header: Column {
            Rectangle {
                width: parent.width
                Layout.fillWidth: true
                height: appSystem.isAndroid ? 10 : (!appSystem.isAndroid  && !appSystem.isIos ? 0 : appSystem.isIos ?48 : 0);
                color: appSystem.isAndroid ? appStyle.primary : appStyle.accent
            }
            Rectangle {

                width: parent.width
                height: 72
                Layout.fillWidth: true
                Layout.preferredHeight: 72
                Layout.minimumHeight: 72
                color: "transparent"

                property bool isBold : false

                Rectangle {
                    width: parent.width
                    Layout.fillWidth: true
                    height: 24
                    color: "transparent"
                }

                ColumnLayout {

                    width: parent.width
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Controls.VerticalSpacer { }

                    Item { height: 5;}

                    RowLayout {

                        width: parent.width
                        Layout.fillWidth: true

                        Item { width: 5; }

                        Controls.Avatar {
                            width: 32
                            height: 32
                            source: setAvatar
                        }

                        Text {
                            font.family: fontSystem.getContentFont.name
                            font.pixelSize: appStyle.t2
                            font.bold: false
                            font.weight: Font.Normal
                            text: "<strong>" + setUsername + "</strong> 21h"
                            color: appStyle.accent
                        }

                        Controls.HorizontalSpacer { }

                        Controls.ActionButton {
                            id: settingButton
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            frontColor: appStyle.accent
                            setIcon: "\uf141"
                            isBold: true
                            onClicked: {

                            }
                        }

                        Controls.ActionButton {
                            id: closeButton
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            frontColor: appStyle.accent
                            setIcon: "\uf00d"
                            isBold: true
                            onClicked: {
                                control.close();
                            }
                        }

                        Item { width: 5; }

                    }
                }
            }
        }

        contentData: Rectangle {
            width: 164
            height: 32
            anchors.centerIn: parent
            radius: 32
            color: appStyle.primaryBack
            Text {
                anchors.centerIn: parent
                font.family: fontSystem.getContentFont.name
                font.pixelSize: appStyle.t1
                color: appStyle.accent
                text: qsTr("No stories available!")
            }
        }

        footer: RowLayout {
            width: parent.width
            Layout.fillWidth: true

            Item { width: 5; }

            Controls.InputBox {
                id: messageBox
            }

            Controls.HorizontalSpacer { }

            Controls.ActionButton {
                id: likeButton
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                frontColor: appStyle.accent
                setIcon: "\uf004"
                onClicked: {

                }
            }

            Controls.ActionButton {
                id: sendButton
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                frontColor: appStyle.accent
                setIcon: "\uf1d8"
                onClicked: {
                    sendDrawer.open()
                }
            }

            Item { width: 15; }

        }
    }

}
