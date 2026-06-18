<!-- markdownlint-disable MD033 -->

# My Environment

[![GitHub Release](https://img.shields.io/github/v/release/williamcanin/my-environment?style=flat&color=3aa99f&label=Release)](https://github.com/williamcanin/my-environment/releases)

Configuração pessoal de desktop Wayland baseada em [Hyprland](https://hypr.land), com foco em um
ambiente leve, direto e produtivo para [Arch Linux](https://archlinux.org) e [Fedora](https://fedoraproject.org). O repositório reúne os
arquivos de configuração, scripts de automação, temas, fontes e atalhos usados
no meu setup diário.

O visual combina Hyprland com bordas discretas, blur, sombras, wallpaper, tema escuro para GTK/Rofi/terminais, Waybar no topo,
painel lateral de (informações do sistema) e uma sidebar na direita com Quickshell/QML.

<table>
  <tr>
    <td align="center">
      <b>Desktop</b><br>
      <a href="https://raw.githubusercontent.com/williamcanin/my-environment/main/.docs/images/preview-1.png" target="_blank">
        <img src=".docs/images/preview-1.png" width="200" alt="Preview 1">
      </a>
    </td>
    <td align="center">
      <b>Rofi</b><br>
      <a href="https://raw.githubusercontent.com/williamcanin/my-environment/main/.docs/images/preview-2.png" target="_blank">
        <img src=".docs/images/preview-2.png" width="200" alt="Preview 2">
      </a>
    </td>
    <td align="center">
      <b>Nautilus</b><br>
      <a href="https://raw.githubusercontent.com/williamcanin/my-environment/main/.docs/images/preview-3.png" target="_blank">
        <img src=".docs/images/preview-3.png" width="200" alt="Preview 3">
      </a>
    </td>
  </tr>
  <tr>
    <td align="center">
      <b>Kitty e Yazi</b><br>
      <a href="https://raw.githubusercontent.com/williamcanin/my-environment/main/.docs/images/preview-4.png" target="_blank">
        <img src=".docs/images/preview-4.png" width="200" alt="Preview 4">
      </a>
    </td>
    <td align="center">
      <b>Sidebar Notifications</b><br>
      <a href="https://raw.githubusercontent.com/williamcanin/my-environment/main/.docs/images/preview-5.png" target="_blank">
        <img src=".docs/images/preview-5.png" width="200" alt="Preview 5">
      </a>
    </td>
    <td align="center">
      <b>Bottom (btm)</b><br>
      <a href="https://raw.githubusercontent.com/williamcanin/my-environment/main/.docs/images/preview-6.png" target="_blank">
        <img src=".docs/images/preview-6.png" width="200" alt="Preview 6">
      </a>
    </td>
  </tr>
</table>

## Features

- Hyprland 0.55+ configurado em Lua.
- Layout `dwindle`, gaps, cantos arredondados, blur, sombras e animações.
- Workspaces de 1 a 9, navegação por teclado e modo de resize para janelas flutuantes.
- Agrupamento de janelas em abas e alternância global com `snappy-switcher`.
- Waybar superior com workspaces, janela ativa, MPRIS, áudio, rede, CPU, memória,
  data/hora, idioma do teclado, bandeja, gravação e menu de energia.
- Waybar lateral de sysinfo com máquina, CPU/GPU, memória, storage, processos,
  rede e lembrete de atalhos.
- Quickshell sidebar direita com notificações, calendário, clima, volume, rede,
  CPU/RAM/GPU, layout do teclado e perfis de energia.
- Rofi como launcher, menu de energia, calculadora, clipboard picker e base para
  tema `blasphemous`.
- Histórico de clipboard com `cliphist`, `wl-clipboard` e integração com Rofi.
- Screenshots com `hyprshot` e edição de região com `satty`.
- Gravação de tela com `gpu-screen-recorder`, pausa/retomada e status na Waybar.
- Bloqueio com `hyprlock`, wallpaper desfocado gerado por `magick`, idle via
  `hypridle` e tela de logout com `wlogout`.
- Wofi como launcher alternativo ao Rofi.
- `my-environment/sh/` — biblioteca shell compartilhada com funções de logging,
  locale, notificações, JSON, manipulação de strings e caminhos.
- Áudio via PipeWire/WirePlumber, controle por `wpctl`, `pamixer` e `pwvucontrol`.
- Suporte a atalhos multimídia, brilho, color picker, emoji picker e navegador padrão.
- Terminais Kitty e Foot com JetBrainsMono Nerd Font, Font Awesome e cores escuras.
- Yazi com flavor `flexoki-dark`.
- Configurações Wayland para Firefox, Electron, SDL2, Java, LibreOffice e cursor.
- Tema GTK escuro com Graphite-teal-Dark e Mint-Y-Teal para icones aplicado pelo instalador.

## Componentes

| Componente | Uso no setup |
| --- | --- |
| Hyprland | Window manager Wayland |
| Hyprlua | Configuração do Hyprland em Lua |
| Hyprpaper | Wallpaper |
| Hypridle | Idle e bloqueio automático |
| Hyprlock | Tela de bloqueio |
| Waybar | Barra superior, painel lateral de sysinfo |
| Quickshell | Sidebar direita com widgets em QML |
| Rofi | Launcher, menus e calculadora |
| Wofi | Launcher alternativo |
| Dunst | Notificações |
| Kitty / Foot | Terminais |
| Yazi | File manager TUI |
| Nautilus | File manager gráfico |
| Snappy Switcher | Alternância de janelas com `Alt+Tab` |
| PipeWire / WirePlumber | Áudio |
| Cliphist / wl-clipboard | Histórico de clipboard |
| Hyprshot / Satty | Screenshots |
| gpu-screen-recorder | Gravação de tela |
| Bottom / Btop | Monitores de sistema |

## Requisitos

- **Arch Linux** ou **Fedora** 41+.
- Sessão Wayland com `systemd`.
- Placa de vídeo e drivers compatíveis com Wayland/Hyprland.

> Nota: os configs incluem ajustes para NVIDIA e Nouveau, como
> `WLR_NO_HARDWARE_CURSORS`, `WLR_RENDERER_ALLOW_SOFTWARE`, `GBM_BACKEND=nvidia-drm`
> e `LIBVA_DRIVER_NAME=nvidia`. Revise esses valores se usar outra GPU.

## Instalação

Clone o repositório e execute o instalador:

```sh
git clone --depth=1 https://github.com/williamcanin/my-environment.git && cd my-environment && make install
```

O instalador pergunta qual distribuição usar:

```sh
→ Select your distribution:
  [1] Arch Linux
  [2] Fedora
Reply >
```

E valida se a distribuição escolhida corresponde à que está rodando.

O instalador faz, em resumo:

- **Arch**: instala `yay` (se necessário) e pacotes via AUR;
- **Fedora**: ativa COPR `solopasha/hyprland` e instala pacotes via `dnf`;
- copia os diretórios de `src/config/*` para `~/.config`;
- cria backup dos diretórios existentes em `~/.config/*.bak.DATA`;
- copia fontes de `src/fonts` para `~/.local/share/fonts`;
- atualiza o cache de fontes;
- adiciona `~/.config/term/options.sh` ao shell para cores de terminal;
- aplica Firefox como navegador padrão e tema GTK escuro.

Para atualizar depois:

```sh
make upgrade
```

> **Fedora**: `hyprshutdown` é compilado do fonte, `rofi-calc` é substituído
> por `qalculate-gtk`, e os pacotes indisponíveis (`smog-bin`, `kooha`,
> `cosmic-files`, `cosmic-settings`, `uwsm`) são ignorados automaticamente.

## Estrutura

```text
src/
  config/
    hypr/              Hyprland, Hyprpaper, Hypridle, Hyprlock e scripts
    waybar/            Barra superior, painel sysinfo, estilos e scripts
    quickshell/        Sidebar direita em QML/Quickshell
    rofi/              Launcher, menus e tema Blasphemous
    wofi/              Launcher alternativo
    wlogout/           Tela de logout
    kitty/             Terminal principal e docs de atalhos
    foot/              Terminal alternativo
    yazi/              File manager TUI e tema Flexoki
    dunst/             Notificações
    btop/ bottom/      Monitores de sistema
    snappy-switcher/   Alternância de janelas Alt+Tab
    environment.d/     Variáveis de ambiente Wayland
    term/              Opções compartilhadas do shell
    gtk-3.0/ gtk-4.0/  Temas e configurações GTK3/GTK4
    my-environment/    Biblioteca shell compartilhada (sh/)
  fonts/               Font Awesome e Terminus local
```

## Atalhos principais

| Atalho | Ação |
| --- | --- |
| `Super + Enter` | Abrir Kitty |
| `Super + Space` | Abrir Nautilus |
| `Super + D` | Abrir launcher Rofi |
| `Super + B` | Abrir navegador padrão |
| `Super + Q` | Fechar janela |
| `Super + F` | Alternar fullscreen |
| `Super + S` | Alternar maximizado |
| `Super + E` | Alternar direção do split |
| `Super + W` | Agrupar/desagrupar janelas em abas |
| `Super + Tab` | Navegar entre abas do grupo |
| `Alt + Tab` | Alternar entre janelas com Snappy Switcher |
| `Super + ,` | Abrir/fechar sidebar Quickshell |
| `Super + 1..9` | Ir para workspace |
| `Super + Shift + 1..9` | Mover janela para workspace |
| `Ctrl + Alt + ←/→` | Navegar workspaces (loop) |
| `Super + ↑/↓/←/→` | Foco direcional |
| `Super + Shift + ↑/↓/←/→` | Mover janela na direção |
| `Super + R` | Entrar no modo resize para janela flutuante |
| `Super + H` | Abrir histórico do clipboard |
| `Super + Shift + H` | Limpar histórico do clipboard |
| `Super + P` | Seletor de cores (hyprpicker) |
| `Super + C` | Calculadora no Rofi |
| `Super + .` | Seletor de emoji (rofimoji) |
| `Super + L` | Bloquear sessão |
| `Super + Esc` | Sair do sistema |
| `Super + Shift + M` | Alternar DPMS do monitor |
| `Super + Shift + R` | Recarregar Hyprland |
| `Print` | Capturar região (hyprshot + satty) |
| `Super + Print` | Capturar janela |
| `Super + Shift + Print` | Capturar tela inteira |
| `Super + G` | Iniciar, pausar ou retomar gravação |
| `Super + Shift + G` | Parar e salvar gravação |

Para ver a lista completa dentro da sessão:

```text
Super + Shift + /?
```

Os textos completos ficam em:

- `src/config/hypr/docs/cheatsheets/pt.txt`
- `src/config/hypr/docs/cheatsheets/en.txt`
- `src/config/kitty/docs/cheatsheets/pt.txt`
- `src/config/kitty/docs/cheatsheets/en.txt`

## Configurações importantes

### Teclado e idioma

O ambiente usa `pt_BR.UTF-8`, layout `br,us`, variante `abnt2` e alternância de
layout com `Alt+Shift`.

### Sessão Wayland

As variáveis em `src/config/environment.d/wayland.conf` priorizam execução nativa
em Wayland para Qt, Firefox, Electron, SDL2, Java e LibreOffice.

### Autostart

Ao iniciar o Hyprland, `src/config/hypr/scripts/init.sh --started` sobe:

- `hyprpaper`;
- `hypridle`;
- Waybar superior + Waybar painel sysinfo;
- `qs -c sidebar-right` (sidebar Quickshell);
- `dunst`;
- `snappy-switcher --daemon`;
- watchers do `cliphist` para texto e imagem (wl-paste);
- `polkit-gnome-authentication-agent-1`;
- `bluetooth` + `blueman-applet`. (desabilitado)

### Login via TTY

O arquivo `src/config/profile` serve como referência para iniciar Hyprland direto
do TTY1, gerar logs em `~/.local/state/hyprland` e manter apenas os logs recentes.
Use esse arquivo como base para seu `~/.zprofile`, `~/.bash_profile` ou profile
equivalente.

Ou você simplesmente pode fazer um importe do mesmo no seu profile, assim:

```sh
. "$HOME/.config/profile"
```

### XWayland

O Hyprland está com `xwayland.enabled = false`. Se algum aplicativo depender de
XWayland, ative essa opção em `src/config/hypr/hyprland.lua` e revise as regras de
janela comentadas no mesmo arquivo.

### Wallpaper e lockscreen

Os wallpapers principais fica em:

```text
src/config/hypr/wallpapers/
```

O lockscreen usa o wallpaper definido com blur gerando o `~/.cache/hypr/hyprlock-wallpaper-blur.png`.

## Comandos úteis

```sh
make help
make version
make set-permissions
make upgrade
```

## Licença

Veja [LICENSE](LICENSE).
