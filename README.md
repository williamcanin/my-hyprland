<!-- markdownlint-disable MD033 -->

# My Environment

[![GitHub Release](https://img.shields.io/github/v/release/williamcanin/my-environment?style=flat&color=3aa99f&label=Release)](https://github.com/williamcanin/my-environment/releases)

Configuração pessoal de desktop Wayland baseada em [Hyprland](https://hypr.land), com foco em um
ambiente leve, direto e produtivo para [Arch Linux](https://archlinux.org) e [Fedora](https://fedoraproject.org). O repositório reúne os
arquivos de configuração, scripts de automação, temas, fontes e atalhos usados
no meu setup diário.

O visual combina Hyprland com bordas discretas, blur, sombras, wallpaper, tema escuro para GTK/Rofi/terminais, Waybar no topo,
painel lateral de informações do sistema e uma sidebar na direita com Quickshell/QML.

## Sumário

- [Features](#features)
- [Componentes](#componentes)
- [Temas](#temas)
- [Preview](https://williamcanin.github.io/my-environment/gallery/)
- [Sidebar Quickshell](#sidebar-quickshell)
- [Scripts](#scripts)
- [Atalhos principais](#atalhos-principais)
- [Requisitos](#requisitos)
- [Instalador](#instalador)
- [Estrutura](#estrutura)
- [Configurações importantes](#configurações-importantes)
- [Licença](#licença)

## Features

- Hyprland 0.55+ configurado em Lua.
- Layout `dwindle`, gaps, cantos arredondados, blur, sombras e animações.
- Workspaces de 1 a 9, navegação por teclado e modo de resize para janelas flutuantes.
- Agrupamento de janelas em abas e alternância global com `snappy-switcher`.
- Waybar superior com workspaces, janela ativa, MPRIS, áudio, rede, CPU, memória, data/hora, idioma do teclado, bandeja, gravação e menu de energia.
- Waybar lateral de sysinfo com máquina, CPU/GPU, memória, storage, processos, rede e lembrete de atalhos.
- Quickshell sidebar direita com notificações, calendário, clima, volume, rede, CPU/RAM/GPU, layout do teclado e perfis de energia.
- Rofi como launcher, seletor de temas, menu de energia, calculadora e clipboard picker.
- Histórico de clipboard com `cliphist`, `wl-clipboard` e integração com Rofi.
- Screenshots com `hyprshot` e edição de região com `satty`.
- Gravação de tela com `gpu-screen-recorder`, pausa/retomada e status na Waybar.
- Bloqueio com `hyprlock`, wallpaper desfocado gerado por `magick`, idle via `hypridle` e tela de logout com `wlogout`.
- Sistema completo de temas com 10 variações temáticas inspiradas em *Blasphemous*.
- Wofi como launcher alternativo ao Rofi.
- `my-environment/sh/` — biblioteca shell compartilhada com funções de logging, locale, notificações, JSON, manipulação de strings e caminhos.
- Áudio via PipeWire/WirePlumber, controle por `wpctl`, `pamixer` e `pwvucontrol`.
- Suporte a atalhos multimídia, brilho, color picker, emoji picker e navegador padrão.
- Terminais Kitty e Foot com JetBrainsMono Nerd Font, Font Awesome e temas por tema ativo.
- Yazi com flavors customizados (flexoki-dark, flexoki-fragment-of-guilt, repose-of-the-silent-one).
- Configurações Wayland para Firefox, Electron, SDL2, Java, LibreOffice e cursor.
- Tema GTK escuro com Graphite-teal-Dark e Mint-Y-Teal para ícones aplicado pelo instalador.
- Suporte bilíngue (Português/Inglês) em cheatsheets, menus, sidebar e scripts.

## Componentes

| Componente | Uso no setup |
| --- | --- |
| Hyprland | Window manager Wayland |
| Hyprlua | Configuração do Hyprland em Lua |
| Hyprpaper | Wallpaper |
| Hypridle | Idle e bloqueio automático |
| Hyprlock | Tela de bloqueio |
| Waybar | Barra superior + painel lateral de sysinfo |
| Quickshell | Sidebar direita com widgets em QML |
| Rofi | Launcher, seletor de temas, menus e calculadora |
| Wofi | Launcher alternativo |
| Dunst | Notificações |
| Kitty / Foot | Terminais |
| Yazi | File manager TUI com flavors temáticos |
| Nautilus | File manager gráfico |
| Snappy Switcher | Alternância de janelas com `Alt+Tab` |
| PipeWire / WirePlumber | Áudio |
| Cliphist / wl-clipboard | Histórico de clipboard |
| Hyprshot / Satty | Screenshots |
| gpu-screen-recorder | Gravação de tela |
| Bottom / Btop | Monitores de sistema |

## Temas

O projeto possui **10 temas** inspirados na série *Blasphemous* e *Blasphemous II*, com suporte completo a:

- Hyprland (bordas, sombras, gaps)
- Waybar (barra superior + sysinfo)
- Quickshell (sidebar direita)
- Rofi
- Kitty
- Btop / Bottom
- Dunst
- Wlogout
- Snappy-switcher
- Yazi (flavor)
- Hyprlock

### Lista de Temas

| # | Tema | Tipo |
| --- | --- | --- |
| 01 | Blasphemous - Penitent | Monocromático preto + `#e0e0e0` |
| 02 | Blasphemous - Echoes Of Salt | Escuro teal/cyan |
| 03 | Blasphemous - Fragment Of Guilt | Escuro olive/teal |
| 04 | Blasphemous - Kneeling Stone | Escuro roxo (Catppuccin-like) |
| 05 | Blasphemous - Requiem Aeternam | Monocromático preto + `#ba8540` |
| 06 | Blasphemous - Ten Piedad | Escuro terroso/warm |
| 07 | Blasphemous II - Mea Culpa | Escuro warm neutro |
| 08 | Blasphemous II - Repose Of The Silent One | Escuro teal/azulado |
| 09 | Blasphemous II - Red Forest | Claro bege/cinza |
| 10 | Blasphemous II - The Third Sin | Escuro navy/teal |

Você pode ver os PREVIEW dos temas [AQUI](https://williamcanin.github.io/my-environment/gallery/)

### Como usar

```sh
# Com seletor Rofi (menu interativo)
my-environment-theme

# Ou diretamente pelo nome
my-environment-theme blasphemous-echoes-of-salt
```

O tema ativo é armazenado em:

```text
~/.config/my-environment/.active-theme
```

### Estrutura de arquivos do tema

```text
src/config/hypr/themes/<theme>/theme.lua          # Bordas, gaps, sombras
src/config/hypr/themes/<theme>/hyprlock.conf       # Cores do lockscreen
src/config/waybar/themes/<theme>/theme.css         # Cores da waybar topo
src/config/waybar/themes/<theme>/sysinfo-theme.css # Cores do painel sysinfo
src/config/quickshell/sidebar-right/themes/<theme>/Theme.qml  # Cores da sidebar QML
src/config/rofi/themes/<theme>/theme.rasi          # Cores do launcher
src/config/kitty/themes/<theme>/theme.conf         # Esquema de cores do terminal
src/config/btop/themes/<theme>/theme.theme         # Cores do monitor de sistema
src/config/bottom/themes/<theme>/bottom.toml       # Cores do btm
src/config/dunst/themes/<theme>/dunstrc.theme      # Cores das notificações
src/config/wlogout/themes/<theme>/theme.css        # Cores da tela de logout
src/config/snappy-switcher/themes/<theme>/theme.ini # Cores do alternador de janelas
src/config/yazi/themes/<theme>/theme.toml          # Flavor do file manager
```

### Wallpapers

Cada tema possui um wallpaper correspondente em `src/config/hypr/wallpapers/`:

```text
blasphemous-echoes-of-salt.jpeg
blasphemous-fragment-of-guilt.png
blasphemous-kneeling-stone.png
blasphemous-mea-culpa.png
blasphemous-II-repose-of-the-silent-one.jpg
blasphemous-II-red-forest.png
blasphemous-II-the-third-sin.jpg
blasphemous-ten-piedad.jpg
blasphemous-penitent.jpg
blasphemous-requiem-aeternam.jpg
```

### Yazi Flavors

| Flavor | Base |
| --- | --- |
| `flexoki-dark` | Escuro (`#100F0F`) com accent cyan |
| `flexoki-fragment-of-guilt` | Claro (`#EEF7F4`) com accent verde |
| `repose-of-the-silent-one` | Escuro (`#141E1E`) com accent teal |

## Sidebar Quickshell

Sidebar direita com painéis expansíveis em QML:

| Card | Função |
| --- | --- |
| User | Avatar, nome, usuário@hostname |
| Notifications | Histórico do Dunst (9 notificações, paginação) |
| Calendar | Calendário interativo com navegação |
| Weather | Clima via wttr.in (atualização a cada 15min) |
| Volume | Controle de áudio com `wpctl` |
| Network | IP, SSID, velocidades up/down |
| System | CPU, RAM, GPU, VRAM, temperatura GPU |
| Keyboard | Alternador de layout (BR ABNT2 / US) |
| Appearance | Seleção de wallpaper e tema |
| Power | Perfis de energia (powersave/balanced/performance) |

A sidebar carrega o tema dinamicamente — ao trocar o tema, as cores são atualizadas sem reiniciar.

## Scripts

### Hyprland (`src/config/hypr/scripts/`)

| Script | Função |
| --- | --- |
| `init.sh` | Inicialização/restart do ambiente |
| `screenshot.sh` | Screenshot e gravação de tela |
| `wallpaper-pick.sh` | Seletor de wallpaper com Yazi |
| `power-menu.sh` | Menu de energia (lock/suspend/logout/reboot/shutdown) |
| `cheatsheets.sh` | Cheatsheet de atalhos no Rofi |

### Waybar (`src/config/waybar/scripts/`)

| Script | Função |
| --- | --- |
| `taskbar.sh` | Dispatcher de ações da barra |
| `window-or-mpris.sh` | Título da janela ativa ou MPRIS |
| `netctl.sh` | Ativar/desativar interface de rede |

### Sysinfo (`src/config/waybar/scripts/sysinfo/`)

| Script | Função |
| --- | --- |
| `header.sh` | Cabeçalhos do painel (i18n) |
| `machine-info.sh` | SO, kernel, CPU, GPU, uptime |
| `temperature-usage_cpu-gpu.sh` | Temperatura e uso CPU/GPU |
| `memory.sh` | Uso de RAM |
| `storage.sh` | Uso de disco |
| `top-processes.sh` | Top processos por CPU |
| `network.sh` | Informações de rede |
| `gpu.sh` | Detalhes da GPU |

### Shell library (`src/config/my-environment/sh/`)

| Módulo | Função |
| --- | --- |
| `bootstrap.sh` | Carrega todos os módulos |
| `variables.sh` | Variáveis de ambiente do sistema |
| `paths.sh` | Funções `paths_cache()` e `paths_config()` |
| `locale.sh` | Detecção de locale PT/EN |
| `log.sh` | Logging (info, warn, error, die) |
| `notify.sh` | Notificações via notify-send |
| `string.sh` | Utilitários de string (barra de progresso) |
| `json.sh` | Escape e saída JSON para Waybar |
| `hypr.sh` | Parse de caminhos do Hyprland |
| `theme-switch.sh` | Alternância completa de temas |

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
| `Super + Shift + T` | Selecionar tema com Rofi |
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

## Requisitos

- **Arch Linux** ou **Fedora** 41+.
- Sessão Wayland com `systemd`.
- Placa de vídeo e drivers compatíveis com Wayland/Hyprland.

> Nota: os configs incluem ajustes para NVIDIA e Nouveau, como
> `WLR_NO_HARDWARE_CURSORS`, `WLR_RENDERER_ALLOW_SOFTWARE`, `GBM_BACKEND=nvidia-drm`
> e `LIBVA_DRIVER_NAME=nvidia`. Revise esses valores se usar outra GPU.

## Instalador

**Instalação online (RECOMENDADO):**

```sh
sh -c "$(curl -fsSL https://williamcanin.github.io/my-environment/install.sh)"
```

Liste as versões disponíveis:

```sh
sh -c "$(curl -fsSL https://williamcanin.github.io/my-environment/install.sh)" -- --releases
```

Instalar uma versão específica:

```sh
sh -c "$(curl -fsSL https://williamcanin.github.io/my-environment/install.sh)" -- 0.1.0
```

**Instalação offline:**

```sh
git clone --depth=1 https://github.com/williamcanin/my-environment.git && cd my-environment && make install
```

> Nota: Essa forma de instalação é `INSTÁVEL` porque ela faz a instalação usando a branch, o que pode conter arquivos com bugs por falta de revisão, por isso é sempre recomendado instalar sempre a opção `RECOMENDADA` que usa as releases estáveis e as versões revisadas.
>
> Se você guardar o repo git, sempre execute o comando abaixo para atualizar antes de usar o `make install`:

```sh
make upgrade
```

Comandos úteis no modo offline:

```sh
make help
make version
make set-permissions
make install
make upgrade
```

O instalador pergunta qual distribuição instalar e valida se corresponde à que está rodando.

Em resumo, o instalador:

- **Arch**: instala `yay` (se necessário) e pacotes via AUR;
- **Fedora**: ativa COPR `solopasha/hyprland` e instala pacotes via `dnf`;
- copia `src/config/*` para `~/.config`;
- cria backup dos diretórios existentes em `~/.config/*.bak.DATA`;
- copia `src/fonts` para `~/.local/share/fonts`;
- atualiza cache de fontes;
- adiciona `~/.config/term/options.sh` ao shell;
- aplica Firefox como navegador padrão e tema GTK escuro.

> **Fedora**: `hyprshutdown` é compilado do fonte, `rofi-calc` é substituído por `qalculate-gtk`.

## Estrutura

```text
src/
  config/
    hypr/                Hyprland, Hyprpaper, Hypridle, Hyprlock, scripts, docs
    waybar/              Barra superior, painel sysinfo, estilos e scripts
    quickshell/          Sidebar direita em QML/Quickshell (10 cards)
    rofi/                Launcher, seletor de temas, menus, scripts
    wofi/                Launcher alternativo
    wlogout/             Tela de logout
    kitty/               Terminal principal com suporte a temas
    foot/                Terminal alternativo
    yazi/                File manager TUI com flavors e keymaps custom
    dunst/               Notificações com regras por aplicativo
    btop/ bottom/        Monitores de sistema com temas
    snappy-switcher/     Alternância de janelas Alt+Tab
    environment.d/       Variáveis de ambiente Wayland
    term/                Opções compartilhadas do shell
    gtk-3.0/ gtk-4.0/    Temas e configurações GTK3/GTK4
    my-environment/      Tema ativo, bootstrap e biblioteca shell (sh/)
  fonts/                 Font Awesome e Terminus local
```

## Configurações importantes

### Teclado e idioma

Layout `br,us`, variante `abnt2` e alternância com `Alt+Shift`. Suporte bilíngue Português/Inglês.

### Sessão Wayland

Variáveis em `environment.d/wayland.conf` priorizam execução nativa Wayland para Qt, Firefox, Electron, SDL2, Java e LibreOffice.

### Autostart

Ao iniciar o Hyprland, `init.sh --started` sobe:

- `hyprpaper`, `hypridle`
- Waybar superior + Waybar sysinfo
- `qs -c sidebar-right` (Quickshell sidebar)
- `dunst`, `snappy-switcher --daemon`
- `cliphist` watchers (texto e imagem)
- `polkit-gnome-authentication-agent-1`

### Login via TTY

`src/config/profile` serve como referência para iniciar Hyprland do TTY1 com logs em `~/.local/state/hyprland`.

### XWayland

`xwayland.enabled = false`. Se precisar, ative em `hyprland.lua`.

### Wallpaper e lockscreen

Wallpapers em `src/config/hypr/wallpapers/`. O lockscreen usa o wallpaper com blur gerado por ImageMagick.

## Licença

Veja [LICENSE](LICENSE).
