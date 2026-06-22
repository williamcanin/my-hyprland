pragma Singleton
import QtQuick
import QtCore
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // Active theme is read from ~/.config/my-environment/.active-theme
    // The theme file is re-read when the file changes.
    property string themeName: "blasphemous-echoes-of-salt"

    FileView {
        id: themeNameFile
        path: StandardPaths.writableLocation(StandardPaths.HomeLocation) +
              "/.config/my-environment/.active-theme"
        onTextChanged: {
            var n = text().trim()
            if (n !== "") root.themeName = n
        }
    }

    // Delegate to the active theme object.
    // The theme QML file is read as text and compiled via Qt.createQmlObject.
    property var themeObj: null

    FileView {
        id: themeFile
        blockLoading: true
        onTextChanged: {
            var qml = text().trim()
            if (qml === "") return
            var obj = Qt.createQmlObject(qml, root, "themeLoader")
            if (obj) {
                if (root.themeObj && root.themeObj !== obj) root.themeObj.destroy()
                root.themeObj = obj
            }
        }
    }

    function loadTheme() {
        themeFile.path = StandardPaths.writableLocation(StandardPaths.HomeLocation) +
            "/.config/quickshell/sidebar-right/themes/" + themeName + "/Theme.qml"
        themeFile.reload()
    }

    function reloadActiveTheme() {
        themeNameFile.reload()
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: themeNameFile.reload()
    }

    onThemeNameChanged: loadTheme()
    Component.onCompleted: loadTheme()

    // Re-export all properties so consumers do not need to change their code.
    readonly property color accent:          themeObj ? themeObj.accent         : "#cba6f7"
    readonly property color accentDim:       themeObj ? themeObj.accentDim      : "#22cba6f7"
    readonly property color accentMid:       themeObj ? themeObj.accentMid      : "#55cba6f7"
    readonly property color accentFaint:     themeObj ? themeObj.accentFaint    : "#0fcba6f7"
    readonly property color accentLight:     themeObj ? themeObj.accentLight    : "#f5c2e7"
    readonly property color fgTitle:         themeObj ? themeObj.fgTitle        : "#cba6f7"
    readonly property color fgText:          themeObj ? themeObj.fgText         : "#cdd6f4"
    readonly property color fgDim:           themeObj ? themeObj.fgDim          : "#bac2de"
    readonly property color fgSubtle:        themeObj ? themeObj.fgSubtle       : "#a6adc8"
    readonly property color fgFaint:         themeObj ? themeObj.fgFaint        : "#6c7086"
    readonly property color fgOnAccent:      themeObj ? themeObj.fgOnAccent     : "#1e1e2e"
    readonly property color bg:              themeObj ? themeObj.bg             : "#1e1e2e"
    readonly property color bgPanel:         themeObj ? themeObj.bgPanel        : "#b01e1e2e"
    readonly property color bgCard:          themeObj ? themeObj.bgCard         : "#b0313244"
    readonly property color bgCardAlt:       themeObj ? themeObj.bgCardAlt      : "#b045475a"
    readonly property color bgHeader:        themeObj ? themeObj.bgHeader       : "#b011111b"
    readonly property color bgItem:          themeObj ? themeObj.bgItem         : "#0acdd6f4"
    readonly property color bgItemHover:     themeObj ? themeObj.bgItemHover    : "#14cdd6f4"
    readonly property color bgActive:        themeObj ? themeObj.bgActive       : "#22cba6f7"
    readonly property color border:          themeObj ? themeObj.border         : "#22cba6f7"
    readonly property color borderStrong:    themeObj ? themeObj.borderStrong   : "#55cba6f7"
    readonly property color borderItem:      themeObj ? themeObj.borderItem     : "#0fcba6f7"
    readonly property color borderSubtle:    themeObj ? themeObj.borderSubtle   : "#45475a"
    readonly property color scrollbarFg:     themeObj ? themeObj.scrollbarFg    : "#cdd6f4"
    readonly property color scrollbarBg:     themeObj ? themeObj.scrollbarBg    : "#45475a"
    readonly property color danger:          themeObj ? themeObj.danger         : "#f38ba8"
    readonly property color dangerDim:       themeObj ? themeObj.dangerDim      : "#f38ba866"
    readonly property color warn:            themeObj ? themeObj.warn           : "#f9e2af"
    readonly property color ok:              themeObj ? themeObj.ok             : "#a6e3a1"
    readonly property string fontMono:       themeObj ? themeObj.fontMono       : "monospace"
    readonly property string fontIcon:       themeObj ? themeObj.fontIcon       : "Font Awesome 6 Free"
    readonly property int radius:            themeObj ? themeObj.radius         : 8
    readonly property int radiusPill:        themeObj ? themeObj.radiusPill     : 18
    readonly property int radiusSmall:       themeObj ? themeObj.radiusSmall    : 4
    readonly property int animFast:          themeObj ? themeObj.animFast       : 150
    readonly property int animNormal:        themeObj ? themeObj.animNormal     : 220
    readonly property int marginTop:         themeObj ? themeObj.marginTop      : 15
    readonly property int marginBottom:      themeObj ? themeObj.marginBottom   : 15
    readonly property int marginRight:       themeObj ? themeObj.marginRight    : 15
    readonly property int sidebarWidth:      themeObj ? themeObj.sidebarWidth   : 350
}
