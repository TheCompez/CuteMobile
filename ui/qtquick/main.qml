// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Interface" as Interface
import "./Controls" as Controls
import "./Pages" as Pages
import "./Profile" as Profile

ApplicationWindow {
    id: appRoot
    visible: true

    QtObject {
        id: appAttributes
        property string name: "Cute Mobile"
        property int width: 370
        property int height: 920

        property int interiorWidth : appRoot.width
        property int interiorHeight : appRoot.height / 2
    }

    title: qsTr(appAttributes.name)
    width: appAttributes.width
    height: appAttributes.height
    flags: Qt.WindowNoState

    AppStyle { id: appStyle; }

    FontSystem { id: fontSystem; }

    background: Rectangle{
        id: rootBackground
        anchors.fill: parent
        color: appStyle.pageground
    }

    QtObject {
        id: appRootObjects
        property bool isOnline               : false
        property bool isLogin                : true
        property bool isLeftToRight          : true
    }

    Pages.Story { id: userStory; }

    //![CONTENT]
    contentData: StackView {
        id: rootStackViewMain
        initialItem: mainPage
        width: parent.width
        Layout.fillWidth: true
        height: parent.height
        Layout.fillHeight: true
        spacing: 0

        Page {
            id: mainPage
            background: Rectangle {
                color: "transparent"
            }
            //![MAIN STACKLAYOUT]
            StackLayout {
                id: userStackLayout
                anchors.fill: parent
                currentIndex: 0
                Pages.Home { id: home; } // ID 0 Home Page
                Pages.Explorer { } // ID 1  Explorer
                Pages.Create { id: create; } // ID 2 Create Post / Story
                Pages.Notification { } // ID 3 Notification
                Profile.Account { id: accountPage; } // ID 4 Account
            }

            //![FOOTER]
            footer: Rectangle {
                id: appFooter
                color: "transparent"
                width: parent.width
                height: 72
                Interface.Footer { }
            }
            //![FOOTER]
        }

        Component {
            id: directPage
            Rectangle {
                color: appStyle.pageground
                Text {
                    font.family: fontSystem.getContentFont.name
                    font.pixelSize: appStyle.t1
                    anchors.centerIn: parent
                    text: qsTr("Under Development...")
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rootStackViewMain.pop()
                    }
                }
            }
        }
        Component {
            id: settingPage
            Rectangle {
                color: appStyle.pageground
                Text {
                    font.family: fontSystem.getContentFont.name
                    font.pixelSize: appStyle.t1
                    anchors.centerIn: parent
                    text: qsTr("Under Development...")
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rootStackViewMain.pop()
                    }
                }
            }
        }

    }
}
