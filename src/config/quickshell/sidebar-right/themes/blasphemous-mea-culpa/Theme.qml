import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#8fc7c7"
    readonly property color accentDim:       "#228fc7c7"   // accent 13% opaco (usado em bgActive, borders leves)
    readonly property color accentMid:       "#558fc7c7"   // accent 33% opaco
    readonly property color accentFaint:     "#0f8fc7c7"   // accent 6% opaco (fundos de item)
    readonly property color accentLight:     "#bfcdcc"     // versão mais clara do accent

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#8fc7c7"     // títulos de seção, labels de card
    readonly property color fgText:          "#e7eeed"     // texto principal
    readonly property color fgDim:           "#bfcdcc"     // texto secundário / valores
    readonly property color fgSubtle:        "#8b9795"     // texto levemente apagado
    readonly property color fgFaint:         "#585c5b"     // desabilitado / inativo
    readonly property color fgOnAccent:      "#110f0d"     // texto sobre fundo accent ativo

    // Background --------------------------------------------------------------
    readonly property color bg:              "#110f0d"
    readonly property color bgPanel:         "#d0110f0d"   // painel principal com blur
    readonly property color bgCard:          "#d0241d19"   // card com tint verde escuro
    readonly property color bgCardAlt:       "#d0413730"   // card alternativo (ex: danger tint)
    readonly property color bgHeader:        "#d00c0b0a"   // header do card
    readonly property color bgItem:          "#148fc7c7"   // item/linha dentro do card
    readonly property color bgItemHover:     "#22413730"   // item hover
    readonly property color bgActive:        "#228fc7c7"   // estado ativo (mesmo que accentDim)

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#228fc7c7"   // borda padrão de card
    readonly property color borderStrong:    "#558fc7c7"   // borda hover / destaque
    readonly property color borderItem:      "#0f8fc7c7"   // borda interna de item
    readonly property color borderSubtle:    "#413730"     // borda neutra escura

    // Scrollbar
    readonly property color scrollbarFg:    "#bfcdcc"     // scrollbar cor
    readonly property color scrollbarBg:    "#413730"   // scrollbar fundo/track

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#b85a4a"
    readonly property color dangerDim:       "#b85a4a66"
    readonly property color warn:            "#b78355"
    readonly property color ok:              "#8fc7c7"

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
