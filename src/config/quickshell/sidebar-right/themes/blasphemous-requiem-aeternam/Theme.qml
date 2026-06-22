import QtQuick

QtObject {
    readonly property color accent:          "#ba8540"
    readonly property color accentDim:       "#22ba8540"
    readonly property color accentMid:       "#55ba8540"
    readonly property color accentFaint:     "#0fba8540"
    readonly property color accentLight:     "#d49e52"

    readonly property color fgTitle:         "#ba8540"
    readonly property color fgText:          "#ba8540"
    readonly property color fgDim:           "#c8a060"
    readonly property color fgSubtle:        "#8a6030"
    readonly property color fgFaint:         "#4a3520"
    readonly property color fgOnAccent:      "#000000"

    readonly property color bg:              "#000000"
    readonly property color bgPanel:         "#e8000000"
    readonly property color bgCard:          "#e8050302"
    readonly property color bgCardAlt:       "#e80a0805"
    readonly property color bgHeader:        "#050302"
    readonly property color bgItem:          "#18ba8540"
    readonly property color bgItemHover:     "#28ba8540"
    readonly property color bgActive:        "#22ba8540"

    readonly property color border:          "#22ba8540"
    readonly property color borderStrong:    "#55ba8540"
    readonly property color borderItem:      "#0fba8540"
    readonly property color borderSubtle:    "#1a1510"

    readonly property color scrollbarFg:    "#ba8540"
    readonly property color scrollbarBg:    "#1a1510"

    readonly property color danger:          "#ba8540"
    readonly property color dangerDim:       "#ba854066"
    readonly property color warn:            "#ba8540"
    readonly property color ok:              "#ba8540"

    readonly property string fontMono:       "monospace"
    readonly property string fontIcon:       "Font Awesome 6 Free"

    readonly property int radius:            8
    readonly property int radiusPill:        18
    readonly property int radiusSmall:       4

    readonly property int animFast:          150
    readonly property int animNormal:        220

    // Position margins
    readonly property int marginTop:          15
    readonly property int marginBottom:       15
    readonly property int sidebarWidth:       350
    readonly property int marginRight:        15
}
