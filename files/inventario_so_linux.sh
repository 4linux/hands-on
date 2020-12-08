#!/bin/bash
# Simples script de inventário para o sistema Operacional Linux
# Escrito por: "dexter@4linux.com.br"
# E-mail: dexter@4linux.com.br
# Data de criação: 08/12/2020
# Exemplo de uso: ./inventario_so_linux.sh

# Declaração de variáveis

HOSTNAME=$(hostname)
DISTRO=$(hostnamectl | grep System | awk -F: '{print $2}')
KERNEL=$(uname -r)
PROCESSOR=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
PROCESSOR_MODEL=$(cat /proc/cpuinfo | grep "model name" | uniq| awk -F: '{print $2}')
PROCESSOR_CORE=$(cat /proc/cpuinfo | grep processor| wc -l)
MEMORY_TOTAL=$(expr $(cat /proc/meminfo | grep MemTotal|tr -d ' '| cut -d: -f2|tr -d kB) / 1024)
MEMORIA_DISPONIVEL=$(expr $(cat /proc/meminfo | grep MemAvailable|tr -d ' '| cut -d: -f2|tr -d kB) / 1024)
NICS=$(ls -A /sys/class/net)
IP=$(ip -4 --color a| grep inet | grep -v 127.0.0.1 | awk '{print $2}')
MOUNTS_POINT=$(df -h| egrep -v '(tmpfs|udev)')
USERS_COUNT=$(awk -F: '($3 >= 1000) {print $1}' /etc/passwd| wc -l)
USERS_COMMON=$(awk -F: '($3 >= 1000) {print $1}' /etc/passwd| wc -l)
UPTIME=$(uptime -s)

#Exibir informações:

echo  "1 - Hostname: $HOSTNAME "
echo  "2 - Distribuição: $DISTRO "
echo  "3 - kernel: $KERNEL  "
echo  "4 - Quantidade de processadores físicos: $PROCESSOR "
echo  "5 - Quantidade de núcleos de processadores disponíveis no sistema: $PROCESSOR_CORE "
echo  "5 - Modelo do processador: $PROCESSOR_MODEL "
echo  "6 - Quantidade de memória total: $MEMORY_TOTAL MB "
echo  "7 - Quantidade de memória disponível: $MEMORIA_DISPONIVEL MB "
echo  "8 - Placas de rede: "
echo  "$NICS"
echo  "9 - Informações de ip: "
echo  "$IP"
echo  "10 - Informações sobre os dispositivos montados: "
echo  "$MOUNTS_POINT"
echo  "11 - Quantidade de usuários: $USERS_COUNT "
echo  "12 - Quantidade de usuários comuns no sistema: $USERS_COMMON"
