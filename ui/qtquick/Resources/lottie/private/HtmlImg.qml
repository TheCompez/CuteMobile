import QtQuick 2.12

/**
 * This item emulates an HTML <img> tag
 */
Image {
    // FIXME Why doesn't property alias src: source work?!
    //property alias src: source
    property string src
    source: src

    readonly property real naturalWidth: sourceSize.width
    readonly property real naturalHeight: sourceSize.height

    // Dummy HTML compat APIs
    property string crossOrigin
    property string alt
    readonly property bool complete: status === Image.Ready
    // FIXME why can't I alias this to source?!
    readonly property string currentSrc: src

    function addEventListener(event, cb) {
        switch(event) {
        case "load":
            __loadedCallbacks.push(cb);
            break;
        case "error":
            __errorCallbacks.push(cb);
            break;
        }
    }

    asynchronous: true
    visible: false

    property var __loadedCallbacks: []
    property var __errorCallbacks: []

    onStatusChanged: {
        if (status === Image.Error) {
            __errorCallbacks.forEach(Function.prototype.call, Function.prototype.call);
        } else if (status === Image.Ready) {
            __loadedCallbacks.forEach(Function.prototype.call, Function.prototype.call);
        }
    }
}
