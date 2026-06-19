import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#181818"
    readonly property color accentDim:       "#33181818"   // accent 13% opaco (usado em bgActive, borders leves)
    readonly property color accentMid:       "#66181818"   // accent 33% opaco
    readonly property color accentFaint:     "#18181818"   // accent 6% opaco (fundos de item)
    readonly property color accentLight:     "#181818"     // versão mais clara do accent

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#0a0a07"     // títulos de seção, labels de card
    readonly property color fgText:          "#0a0a07"     // texto principal
    readonly property color fgDim:           "#0a0a07"     // texto secundário / valores
    readonly property color fgSubtle:        "#0a0a07"     // texto levemente apagado
    readonly property color fgFaint:         "#0a0a07"     // desabilitado / inativo
    readonly property color fgOnAccent:      "#0a0a07"     // texto sobre fundo accent ativo

    // Background --------------------------------------------------------------
    readonly property color bg:              "#eef7f4"
    readonly property color bgPanel:         "#d8eef7f4"   // painel principal com blur
    readonly property color bgCard:          "#eaf7fbf9"   // card com tint verde escuro
    readonly property color bgCardAlt:       "#e8e5f1ed"   // card alternativo (ex: danger tint)
    readonly property color bgHeader:        "#d8cadbd6"   // header do card
    readonly property color bgItem:          "#33181818"   // item/linha dentro do card
    readonly property color bgItemHover:     "#4d181818"   // item hover
    readonly property color bgActive:        "#33181818"   // estado ativo (mesmo que accentDim)

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#33181818"   // borda padrão de card
    readonly property color borderStrong:    "#66181818"   // borda hover / destaque
    readonly property color borderItem:      "#18181818"   // borda interna de item
    readonly property color borderSubtle:    "#181818"     // borda neutra escura

    // Scrollbar
    readonly property color scrollbarFg:    "#181818"     // scrollbar cor
    readonly property color scrollbarBg:    "#181818"   // scrollbar fundo/track

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#b45a52"
    readonly property color dangerDim:       "#b45a5266"
    readonly property color warn:            "#9b7d35"
    readonly property color ok:              "#181818"

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
