import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#5a8a8a"
    readonly property color accentDim:       "#225a8a8a"   // accent 13% opaco (usado em bgActive, borders leves)
    readonly property color accentMid:       "#555a8a8a"   // accent 33% opaco
    readonly property color accentFaint:     "#0f5a8a8a"   // accent 6% opaco (fundos de item)
    readonly property color accentLight:     "#b0c0be"     // versão mais clara do accent

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#5a8a8a"     // títulos de seção, labels de card
    readonly property color fgText:          "#d8e0de"     // texto principal
    readonly property color fgDim:           "#b0c0be"     // texto secundário / valores
    readonly property color fgSubtle:        "#7a9a9a"     // texto levemente apagado
    readonly property color fgFaint:         "#505a5a"     // desabilitado / inativo
    readonly property color fgOnAccent:      "#141e1e"     // texto sobre fundo accent ativo

    // Background --------------------------------------------------------------
    readonly property color bg:              "#141e1e"
    readonly property color bgPanel:         "#d0141e1e"   // painel principal com blur
    readonly property color bgCard:          "#d0243434"   // card com tint escuro
    readonly property color bgCardAlt:       "#d0354a4a"   // card alternativo (ex: danger tint)
    readonly property color bgHeader:        "#d00f1717"   // header do card
    readonly property color bgItem:          "#145a8a8a"   // item/linha dentro do card
    readonly property color bgItemHover:     "#22354a4a"   // item hover
    readonly property color bgActive:        "#225a8a8a"   // estado ativo (mesmo que accentDim)

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#225a8a8a"   // borda padrão de card
    readonly property color borderStrong:    "#555a8a8a"   // borda hover / destaque
    readonly property color borderItem:      "#0f5a8a8a"   // borda interna de item
    readonly property color borderSubtle:    "#354a4a"     // borda neutra escura

    // Scrollbar
    readonly property color scrollbarFg:    "#b0c0be"     // scrollbar cor
    readonly property color scrollbarBg:    "#354a4a"     // scrollbar fundo/track

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#a85a5a"
    readonly property color dangerDim:       "#a85a5a66"
    readonly property color warn:            "#a88a6a"
    readonly property color ok:              "#5a8a8a"

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
