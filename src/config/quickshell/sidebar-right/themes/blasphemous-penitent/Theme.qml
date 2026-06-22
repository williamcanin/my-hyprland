import QtQuick

QtObject {
    readonly property color accent:          "#e0e0e0"
    readonly property color accentDim:       "#22e0e0e0"
    readonly property color accentMid:       "#55e0e0e0"
    readonly property color accentFaint:     "#0fe0e0e0"
    readonly property color accentLight:     "#ffffff"

    readonly property color fgTitle:         "#e0e0e0"
    readonly property color fgText:          "#e0e0e0"
    readonly property color fgDim:           "#cccccc"
    readonly property color fgSubtle:        "#888888"
    readonly property color fgFaint:         "#444444"
    readonly property color fgOnAccent:      "#000000"

    readonly property color bg:              "#000000"
    readonly property color bgPanel:         "#e8000000"
    readonly property color bgCard:          "#e8050505"
    readonly property color bgCardAlt:       "#e80a0a0a"
    readonly property color bgHeader:        "#050505"
    readonly property color bgItem:          "#18e0e0e0"
    readonly property color bgItemHover:     "#28e0e0e0"
    readonly property color bgActive:        "#22e0e0e0"

    readonly property color border:          "#22e0e0e0"
    readonly property color borderStrong:    "#55e0e0e0"
    readonly property color borderItem:      "#0fe0e0e0"
    readonly property color borderSubtle:    "#1a1a1a"

    readonly property color scrollbarFg:    "#e0e0e0"
    readonly property color scrollbarBg:    "#1a1a1a"

    readonly property color danger:          "#e0e0e0"
    readonly property color dangerDim:       "#e0e0e066"
    readonly property color warn:            "#e0e0e0"
    readonly property color ok:              "#e0e0e0"

    readonly property string fontMono:       "monospace"
    readonly property string fontIcon:       "Font Awesome 6 Free"

    readonly property int radius:            8
    readonly property int radiusPill:        18
    readonly property int radiusSmall:       4

    readonly property int animFast:          150
    readonly property int animNormal:        220

    // Position margins
    readonly property int marginTop:          15
    readonly property int marginRight:        15
}
