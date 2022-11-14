// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "../" as Parent
import "../Controls" as Controls
import "../Interface" as Interface

Page {

    id: profilePage

    property alias profileStackView : stackLayout

    background: Rectangle {
        color: "transparent"
    }

    Component.onCompleted: {
        if(appRootObjects.isLogin) {
            stackLayout.currentIndex = 0
        } else {
            stackLayout.currentIndex = 1
        }
    }

    header: Interface.Header { }

    StackLayout {
        id: stackLayout
        anchors.fill: parent
        //interactive: true

        Information {
            id: profileInfo
        }

        SignIn {
            id: loginPage
        }

        Verification {
            id: registerPage
        }

    }

    Component {
        id: profileView
        Information {
            id: profileInfo
        }
    }

    Component {
        id: signInView
        SignIn {
            id: loginPage
        }
    }

    Component {
        id: signUpView
        Verification {
            id: registerPage
        }
    }

}
