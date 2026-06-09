#!/usr/bin/env sh

key="$1"

lang="${LANG%%_*}"

case "$lang:$key" in
    pt:system)      echo "Sistema »" ;;
    pt:cpu_gpu)     echo "Detalhes CPU e GPU »" ;;
    pt:memory)      echo "Memória »" ;;
    pt:storage)     echo "Armazenamento »" ;;
    pt:processes)   echo "Processos »" ;;
    pt:network)     echo "Rede »" ;;
    pt:keys)        echo "Atalhos »" ;;

    en:system)      echo "System »" ;;
    en:cpu_gpu)     echo "CPU and GPU details »" ;;
    en:memory)      echo "Memory »" ;;
    en:storage)     echo "Storage »" ;;
    en:processes)   echo "Processes »" ;;
    en:network)     echo "Network »" ;;
    en:keys)        echo "Shortcuts Menu »" ;;
esac
