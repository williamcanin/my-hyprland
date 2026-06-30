import QtQuick

QtObject {
    // --- Dark mode (default) ---
    readonly property color accent:          "#a2a2a2"
    readonly property color accentDim:       "#222222"
    readonly property color accentMid:       "#3C3C3C"
    readonly property color accentFaint:     "#1C1C1C"
    readonly property color accentLight:     "#4E4E4E"

    readonly property color fgTitle:         "#a2a2a2"
    readonly property color fgText:          "#a2a2a2"
    readonly property color fgDim:           "#a2a2a2"
    readonly property color fgSubtle:        "#a2a2a2"
    readonly property color fgFaint:         "#222222"
    readonly property color fgOnAccent:      "#181818"

    readonly property color bg:              "#181818"
    readonly property color bgPanel:         "#181818"
    readonly property color bgCard:          "#141414"
    readonly property color bgCardAlt:       "#141414"
    readonly property color bgHeader:        "#141414"
    readonly property color bgItem:          "#222222"
    readonly property color bgItemHover:     "#2C2C2C"
    readonly property color bgActive:        "#a2a2a2"

    readonly property color border:          "#a2a2a2"
    readonly property color borderStrong:    "#a2a2a2"
    readonly property color borderItem:      "#a2a2a2"
    readonly property color borderSubtle:    "#a2a2a2"

    readonly property color scrollbarFg:    "#a2a2a2"
    readonly property color scrollbarBg:    "#141414"

    readonly property color danger:          "#a2a2a2"
    readonly property color dangerDim:       "#a2a2a2"
    readonly property color warn:            "#a2a2a2"
    readonly property color ok:              "#a2a2a2"

    readonly property string fontMono:       "monospace"
    readonly property string fontIcon:       "Font Awesome 6 Free"

    readonly property int radius:            0
    readonly property int radiusPill:        0
    readonly property int radiusSmall:       0

    readonly property int animFast:          150
    readonly property int animNormal:        220

    readonly property int marginTop:          1
    readonly property int marginBottom:       1
    readonly property int marginRight:        1
    readonly property int sidebarWidth:       350

    // --- Light mode overrides ---
    readonly property QtObject light: QtObject {
        readonly property color accent:          "#181818"
        readonly property color accentDim:       "#aaaaaa"
        readonly property color accentMid:       "#999999"
        readonly property color accentFaint:     "#d0d0d0"
        readonly property color accentLight:     "#aaaaaa"

        readonly property color fgTitle:         "#181818"
        readonly property color fgText:          "#181818"
        readonly property color fgDim:           "#181818"
        readonly property color fgSubtle:        "#181818"
        readonly property color fgFaint:         "#777777"
        readonly property color fgOnAccent:      "#cccccc"

        readonly property color bg:              "#cccccc"
        readonly property color bgPanel:         "#cccccc"
        readonly property color bgCard:          "#b0b0b0"
        readonly property color bgCardAlt:       "#b0b0b0"
        readonly property color bgHeader:        "#b0b0b0"
        readonly property color bgItem:          "#bfbfbf"
        readonly property color bgItemHover:     "#d0d0d0"
        readonly property color bgActive:        "#181818"

        readonly property color border:          "#181818"
        readonly property color borderStrong:    "#181818"
        readonly property color borderItem:      "#181818"
        readonly property color borderSubtle:    "#181818"

        readonly property color scrollbarFg:    "#181818"
        readonly property color scrollbarBg:    "#b0b0b0"

        readonly property color danger:          "#181818"
        readonly property color dangerDim:       "#181818"
        readonly property color warn:            "#181818"
        readonly property color ok:              "#555555"
    }
}
