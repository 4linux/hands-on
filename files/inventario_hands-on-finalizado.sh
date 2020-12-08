#!/usr/bin/bash
# Script para extrair informações do sistema

echo -n "1 - Hostname: "

hostname

echo -n "2 - Distribuição: "

hostnamectl | grep System

echo -n "3 - Quantidade de processadores físicos: "

grep "physical id" /proc/cpuinfo | sort | uniq | wc -l

echo -n "4 - Quantidade de núcleos de processadores disponíveis no sistema: "

cat /proc/cpuinfo | grep processor| wc -l

echo -n "5 - Modelo do processador: "

cat /proc/cpuinfo | grep "model name" | uniq

echo -n "6 - Quantidade de memória total: "

cat /proc/meminfo | grep MemTotal

echo -n "7 - Quantidade de memória disponível: "

cat /proc/meminfo | grep MemAvailable

echo -n "8 - Informações sobre as placas de rede disponíveis no sistema: "

ls -A /sys/class/net

echo -n "9 - Informações de ip: "
echo ""
ip --color a| grep inet | grep -v 127.0.0.1 | awk '{print $2}'

echo -n "10 - Informações sobre os dispositivos montados: "
echo ""
df -h| egrep "sd|hda"

echo -n "11 - Quantidade de usuários: "

wc -l /etc/passwd| awk '{print $1}'

echo -n "12 - Quantidade de usuários comuns no sistema: "

awk -F: '($3 >= 1000) {print $1}' /etc/passwd| wc -l
