// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick

Item {

    property var getAwesomeBrand: fontAwesomeBrand
    property var getAwesomeRegular: fontAwesomeRegular
    property var getAwesomeSolid: fontAwesomeSolid
    property var getContentFont: contentFontMedium
    property var getContentFontBold: contentFontBold
    property var getContentFontMedium: contentFontMedium
    property var getContentFontLight: contentFontLight
    property var getFontSize: fontSize

    QtObject {
        id: fontSize
        readonly property int       h1 : 32
        readonly property int       h2 : 24
        readonly property double    h3 : 18.72
        readonly property int       h4 : 16
        readonly property double    h5 : 13.28
        readonly property double    h6 : 10.72

        readonly property int content : 14
    }

    FontLoader {
        id: fontAwesomeBrand
        source: "qrc:/Resources/fonts/Font Awesome 5 Brands-Regular-400.otf"
    }

    FontLoader {
        id: fontAwesomeRegular
        source: "qrc:/Resources/fonts/Font Awesome 5 Free-Regular-400.otf"
    }

    FontLoader {
        id: fontAwesomeSolid
        source: "qrc:/Resources/fonts/Font Awesome 5 Free-Solid-900.otf"
    }

    FontLoader {
        id: contentFontLight
        source: "qrc:/Resources/fonts/Nunito-Light.ttf"
    }

    FontLoader {
        id: contentFontBold
        source: "qrc:/Resources/fonts/Nunito-Bold.ttf"
    }


    FontLoader {
        id: contentFontMedium
        source: "qrc:/Resources/fonts/Nunito-Medium.ttf"
    }

}
