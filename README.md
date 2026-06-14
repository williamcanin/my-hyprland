# My Hyprland (EM DESENVOLVIMENTO)

Configuração pessoal de desktop Wayland baseada em [Hyprland](https://hypr.land), com foco em um
ambiente leve, direto e produtivo para [Arch Linux](https://archlinux.org). O repositório reúne os
arquivos de configuração, scripts de automação, temas, fontes e atalhos usados
no meu setup diário.

O visual combina Hyprland com bordas discretas, blur, sombras, wallpaper
Blasphemous, tema escuro para GTK/Rofi/terminais e uma Waybar principal no topo
mais um painel lateral opcional de informações do sistema.

## Features

- Hyprland 0.55+ configurado em Lua via `hyprlua-git`.
- Layout `dwindle`, gaps, cantos arredondados, blur, sombras e animações.
- Workspaces de 1 a 9, navegação por teclado e modo de resize para janelas flutuantes.
- Agrupamento de janelas em abas e alternância global com `snappy-switcher`.
- Waybar superior com workspaces, janela ativa, MPRIS, áudio, rede, CPU, memória,
  data/hora, idioma do teclado, bandeja, gravação e menu de energia.
- Waybar lateral de sysinfo com máquina, CPU/GPU, memória, storage, processos,
  rede e lembrete de atalhos.
- Rofi como launcher, menu de energia, calculadora, clipboard picker e base para
  tema `blasphemous`.
- Histórico de clipboard com `cliphist`, `wl-clipboard` e integração com Rofi.
- Screenshots com `hyprshot` e edição de região com `satty`.
- Gravação de tela com `gpu-screen-recorder`, pausa/retomada e status na Waybar.
- Bloqueio com `hyprlock`, wallpaper desfocado gerado por `magick` e idle via
  `hypridle`.
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
| Waybar | Barra superior e painel lateral de sysinfo |
| Rofi | Launcher, menus e calculadora |
| Mako | Notificações |
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

- Arch Linux ou derivado compatível com pacotes do Arch/AUR.
- Sessão Wayland com `systemd`.
- `git`, `base-devel`, `go` e `gcc` para preparar o `yay`, caso ele ainda não exista.
- Placa de vídeo e drivers compatíveis com Wayland/Hyprland.

> Nota: os configs incluem ajustes para NVIDIA e Nouveau, como
> `WLR_NO_HARDWARE_CURSORS`, `WLR_RENDERER_ALLOW_SOFTWARE`, `GBM_BACKEND=nvidia-drm`
> e `LIBVA_DRIVER_NAME=nvidia`. Revise esses valores se usar outra GPU.

## Instalação

Clone o repositório e execute o instalador:

```sh
git clone --depth=1 https://github.com/williamcanin/my-hyprland.git && cd my-hyprland && make install
```

O instalador faz, em resumo:

- instala `yay`, se necessário;
- instala os pacotes principais do ambiente;
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

## Estrutura

```text
src/
  config/
    hypr/              Hyprland, Hyprpaper, Hypridle, Hyprlock e scripts
    waybar/            Barra superior, painel sysinfo, estilos e scripts
    rofi/              Launcher, menus e tema Blasphemous
    kitty/             Terminal principal e docs de atalhos
    foot/              Terminal alternativo
    yazi/              File manager TUI e tema Flexoki
    mako/              Notificações
    btop/ bottom/      Monitores de sistema
    environment.d/     Variáveis de ambiente Wayland
    term/              Opções compartilhadas do shell
  fonts/               Font Awesome local
```

## Atalhos principais

| Atalho | Ação |
| --- | --- |
| `Super + Enter` | Abrir Kitty |
| `Super + Space` | Abrir Nautilus |
| `Super + D` | Abrir launcher Rofi |
| `Super + Q` | Fechar janela |
| `Super + F` | Alternar fullscreen |
| `Super + W` | Agrupar/desagrupar janelas em abas |
| `Super + Tab` | Navegar entre abas do grupo |
| `Alt + Tab` | Alternar entre janelas com Snappy Switcher |
| `Super + 1..9` | Ir para workspace |
| `Super + Shift + 1..9` | Mover janela para workspace |
| `Super + R` | Entrar no modo resize para janela flutuante |
| `Print` | Capturar região |
| `Super + Print` | Capturar janela |
| `Super + Shift + Print` | Capturar tela inteira |
| `Super + G` | Iniciar, pausar ou retomar gravação |
| `Super + Shift + G` | Parar e salvar gravação |
| `Super + H` | Abrir histórico do clipboard |
| `Super + Shift + H` | Limpar histórico do clipboard |
| `Super + P` | Seletor de cores |
| `Super + C` | Calculadora no Rofi |
| `Super + L` | Bloquear sessão |
| `Super + Shift + E` | Menu de energia |
| `Super + Shift + R` | Recarregar Hyprland |

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
- Waybar superior;
- Waybar lateral de informações do sistema e hardware;
- `mako`;
- `snappy-switcher --daemon`;
- watchers do `cliphist` para texto e imagem.

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

O wallpaper principal fica em:

```text
src/config/hypr/wallpapers/blasphemous-echoes-of-salt.jpeg
```

O lockscreen usa esse wallpaper com blur gerado em `/tmp/hyprlock-wallpaper-blur.png`.

## Comandos úteis

```sh
make help
make version
make set-permissions
make upgrade
```

## Licença

Veja [LICENSE](LICENSE).
