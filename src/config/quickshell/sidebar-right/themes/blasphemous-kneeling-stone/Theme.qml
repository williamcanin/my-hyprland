import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#cba6f7"
    readonly property color accentDim:       "#22cba6f7"
    readonly property color accentMid:       "#55cba6f7"
    readonly property color accentFaint:     "#0fcba6f7"
    readonly property color accentLight:     "#f5c2e7"

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#cba6f7"
    readonly property color fgText:          "#cdd6f4"
    readonly property color fgDim:           "#bac2de"
    readonly property color fgSubtle:        "#a6adc8"
    readonly property color fgFaint:         "#6c7086"
    readonly property color fgOnAccent:      "#1e1e2e"

    // Background --------------------------------------------------------------
    readonly property color bg:              "#1e1e2e"
    readonly property color bgPanel:         "#b01e1e2e"
    readonly property color bgCard:          "#b0313244"
    readonly property color bgCardAlt:       "#b045475a"
    readonly property color bgHeader:        "#b011111b"
    readonly property color bgItem:          "#0acdd6f4"
    readonly property color bgItemHover:     "#14cdd6f4"
    readonly property color bgActive:        "#22cba6f7"

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#22cba6f7"
    readonly property color borderStrong:    "#55cba6f7"
    readonly property color borderItem:      "#0fcba6f7"
    readonly property color borderSubtle:    "#45475a"

    // Scrollbar
    readonly property color scrollbarFg:     "#cdd6f4"
    readonly property color scrollbarBg:     "#45475a"

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#f38ba8"
    readonly property color dangerDim:       "#f38ba866"
    readonly property color warn:            "#f9e2af"
    readonly property color ok:              "#a6e3a1"

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
