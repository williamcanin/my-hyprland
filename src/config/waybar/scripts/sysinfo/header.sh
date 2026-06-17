#!/usr/bin/env sh

# shellcheck disable=SC1091
. "$HOME/.config/my-hyprland/sh/bootstrap.sh"

key="$1"

if locale_is_pt; then
  case "$key" in
    system)    echo "Sistema »" ;;
    cpu_gpu)   echo "Detalhes CPU e GPU »" ;;
    memory)    echo "Memória »" ;;
    storage)   echo "Armazenamento »" ;;
    processes) echo "Processos »" ;;
    network)   echo "Rede »" ;;
    keys)      echo "Atalhos »" ;;
  esac
else
  case "$key" in
    system)    echo "System »" ;;
    cpu_gpu)   echo "CPU and GPU details »" ;;
    memory)    echo "Memory »" ;;
    storage)   echo "Storage »" ;;
    processes) echo "Processes »" ;;
    network)   echo "Network »" ;;
    keys)      echo "Cheatsheets Menu »" ;;
  esac
fi
