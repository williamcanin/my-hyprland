---
layout: base
title: Instalação
permalink: /install/
---

<a href="{{ '/' | relative_url }}">&larr; Voltar para HOME</a>

# Instalação

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
