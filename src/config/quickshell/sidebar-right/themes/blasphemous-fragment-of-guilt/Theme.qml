import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#89b1a9"
    readonly property color accentDim:       "#3389b1a9"
    readonly property color accentMid:       "#6689b1a9"
    readonly property color accentFaint:     "#1889b1a9"
    readonly property color accentLight:     "#a4cec5"

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#89b1a9"
    readonly property color fgText:          "#d8e0de"
    readonly property color fgDim:           "#c0d0cc"
    readonly property color fgSubtle:        "#8a9a96"
    readonly property color fgFaint:         "#5a6a66"
    readonly property color fgOnAccent:      "#282826"

    // Background --------------------------------------------------------------
    readonly property color bg:              "#282826"
    readonly property color bgPanel:         "#e8282826"
    readonly property color bgCard:          "#e8303230"
    readonly property color bgCardAlt:       "#e83c413e"
    readonly property color bgHeader:        "#e8303230"
    readonly property color bgItem:          "#18d8e0de"
    readonly property color bgItemHover:     "#28d8e0de"
    readonly property color bgActive:        "#3389b1a9"

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#3389b1a9"
    readonly property color borderStrong:    "#6689b1a9"
    readonly property color borderItem:      "#1889b1a9"
    readonly property color borderSubtle:    "#3c413e"

    // Scrollbar
    readonly property color scrollbarFg:    "#89b1a9"
    readonly property color scrollbarBg:    "#3c413e"

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#c45a52"
    readonly property color dangerDim:       "#c45a5266"
    readonly property color warn:            "#948f67"
    readonly property color ok:              "#89b1a9"

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

    // Position margins
    readonly property int marginTop:          15
    readonly property int marginBottom:       15
    readonly property int sidebarWidth:       350
    readonly property int marginRight:        15
}
