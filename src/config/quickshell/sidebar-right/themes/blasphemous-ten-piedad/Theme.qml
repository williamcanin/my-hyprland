import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#c8a863"
    readonly property color accentDim:       "#33c8a863"
    readonly property color accentMid:       "#66c8a863"
    readonly property color accentFaint:     "#18c8a863"
    readonly property color accentLight:     "#d4b878"

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#c8a863"
    readonly property color fgText:          "#d4ccb0"
    readonly property color fgDim:           "#c8bda8"
    readonly property color fgSubtle:        "#a09670"
    readonly property color fgFaint:         "#6a6258"
    readonly property color fgOnAccent:      "#45342f"

    // Background --------------------------------------------------------------
    readonly property color bg:              "#45342f"
    readonly property color bgPanel:         "#ea45342f"
    readonly property color bgCard:          "#ea4b4538"
    readonly property color bgCardAlt:       "#ea645d4e"
    readonly property color bgHeader:        "#3d2e2a"
    readonly property color bgItem:          "#18d4ccb0"
    readonly property color bgItemHover:     "#28d4ccb0"
    readonly property color bgActive:        "#33c8a863"

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#33c8a863"
    readonly property color borderStrong:    "#66c8a863"
    readonly property color borderItem:      "#18c8a863"
    readonly property color borderSubtle:    "#645d4e"

    // Scrollbar
    readonly property color scrollbarFg:    "#c8a863"
    readonly property color scrollbarBg:    "#4b4538"

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#7a4a44"
    readonly property color dangerDim:       "#7a4a4466"
    readonly property color warn:            "#c8a863"
    readonly property color ok:              "#a09670"

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
    readonly property int marginRight:        15
}
