import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#3fcfc3"
    readonly property color accentDim:       "#223fcfc3"   // accent 13% opaco (usado em bgActive, borders leves)
    readonly property color accentMid:       "#553fcfc3"   // accent 33% opaco
    readonly property color accentFaint:     "#0f3fcfc3"   // accent 6% opaco (fundos de item)
    readonly property color accentLight:     "#5ecfc5"     // versão mais clara do accent

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#3fcfc3"     // títulos de seção, labels de card
    readonly property color fgText:          "#ffffff"     // texto principal
    readonly property color fgDim:           "#ffffff"     // texto secundário / valores
    readonly property color fgSubtle:        "#dddddd"     // texto levemente apagado
    readonly property color fgFaint:         "#555555"     // desabilitado / inativo
    readonly property color fgOnAccent:      "#181818"     // texto sobre fundo accent ativo

    // Background --------------------------------------------------------------
    readonly property color bg:              "#121212"
    readonly property color bgPanel:         "#b01a1a1a"   // painel principal com blur
    readonly property color bgCard:          "#b01a3a3a"   // card com tint verde escuro
    readonly property color bgCardAlt:       "#b05a2a2a"   // card alternativo (ex: danger tint)
    readonly property color bgHeader:        "#b0101414"   // header do card
    readonly property color bgItem:          "#0affffff"   // item/linha dentro do card
    readonly property color bgItemHover:     "#14ffffff"   // item hover
    readonly property color bgActive:        "#223fcfc3"   // estado ativo (mesmo que accentDim)

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#223fcfc3"   // borda padrão de card
    readonly property color borderStrong:    "#553fcfc3"   // borda hover / destaque
    readonly property color borderItem:      "#0f3fcfc3"   // borda interna de item
    readonly property color borderSubtle:    "#2a2a2a"     // borda neutra escura

    // Scrollbar
    readonly property color scrollbarFg:    "#ffffff"     // scrollbar cor
    readonly property color scrollbarBg:    "#2a2a2a"   // scrollbar fundo/track

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#e05555"
    readonly property color dangerDim:       "#e0555566"
    readonly property color warn:            "#e0a040"
    readonly property color ok:              "#3fcfc3"

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
