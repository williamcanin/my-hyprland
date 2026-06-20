import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#3d2932"
    readonly property color accentDim:       "#333d2932"
    readonly property color accentMid:       "#663d2932"
    readonly property color accentFaint:     "#183d2932"
    readonly property color accentLight:     "#5a424a"

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#3d2932"
    readonly property color fgText:          "#2a282c"
    readonly property color fgDim:           "#3d3538"
    readonly property color fgSubtle:        "#7c7578"
    readonly property color fgFaint:         "#8a8284"
    readonly property color fgOnAccent:      "#d9d1d2"

    // Background --------------------------------------------------------------
    readonly property color bg:              "#d9d1d2"
    readonly property color bgPanel:         "#ead9d1d2"
    readonly property color bgCard:          "#eae3ddde"
    readonly property color bgCardAlt:       "#ead5cdce"
    readonly property color bgHeader:        "#c8c0c2"
    readonly property color bgItem:          "#182a282c"
    readonly property color bgItemHover:     "#282a282c"
    readonly property color bgActive:        "#333d2932"

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#333d2932"
    readonly property color borderStrong:    "#663d2932"
    readonly property color borderItem:      "#183d2932"
    readonly property color borderSubtle:    "#c0b8ba"

    // Scrollbar
    readonly property color scrollbarFg:    "#7c7578"
    readonly property color scrollbarBg:    "#c8c0c2"

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#8a4048"
    readonly property color dangerDim:       "#8a404866"
    readonly property color warn:            "#9b7d35"
    readonly property color ok:              "#3d2932"

    // Tipography --------------------------------------------------------------
    readonly property string fontMono:       "monospace"
    readonly property string fontIcon:       "Font Awesome 6 Free"

    // Form --------------------------------------------------------------------
    readonly property int radius:            8
    readonly property int radiusPill:        18
    readonly property int radiusSmall:       4

    // Animations --------------------------------------------------------------
    readonly property int animFast:          150
    readonly property int animNormal:        220
}
