import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#a0c3bc"
    readonly property color accentDim:       "#22a0c3bc"
    readonly property color accentMid:       "#55a0c3bc"
    readonly property color accentFaint:     "#0fa0c3bc"
    readonly property color accentLight:     "#bcd5d0"

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#a0c3bc"
    readonly property color fgText:          "#ffffff"
    readonly property color fgDim:           "#ffffff"
    readonly property color fgSubtle:        "#d0ddd8"
    readonly property color fgFaint:         "#6a7a7e"
    readonly property color fgOnAccent:      "#171e26"

    // Background --------------------------------------------------------------
    readonly property color bg:              "#171e26"
    readonly property color bgPanel:         "#b0171e26"
    readonly property color bgCard:          "#b01a2632"
    readonly property color bgCardAlt:       "#b057292e"
    readonly property color bgHeader:        "#b0121820"
    readonly property color bgItem:          "#0affffff"
    readonly property color bgItemHover:     "#14ffffff"
    readonly property color bgActive:        "#22a0c3bc"

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#22a0c3bc"
    readonly property color borderStrong:    "#55a0c3bc"
    readonly property color borderItem:      "#0fa0c3bc"
    readonly property color borderSubtle:    "#2a3a3e"

    // Scrollbar
    readonly property color scrollbarFg:    "#a0c3bc"
    readonly property color scrollbarBg:    "#2a3a3e"

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#57292e"
    readonly property color dangerDim:       "#57292e66"
    readonly property color warn:            "#8a5a40"
    readonly property color ok:              "#a0c3bc"

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
