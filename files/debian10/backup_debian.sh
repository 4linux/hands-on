#!/bin/bash
PASTAS_ORIGEM="/home /etc /usr /opt"
PASTA_DESTINO="/net/backup/"
DIA=$(date +"%m-%d-%Y")
SERVIDOR="$(hostname)"

echo $PASTA
echo $DIA

echo "Backup Iniciado..."
echo "Validando Existencia - ${PASTA}"
test -d ${PASTA_DESTINO} || mkdir -p ${PASTA_DESTINO}

echo "Realizando Backup /etc/";
tar zcvf ${PASTA_DESTINO}/$SERVIDOR-${DIA}.tar.gz $PASTAS_ORIGEM &> /dev/null || exit 1;
#tar zcvf ${PASTA_DESTINO}/$SERVIDOR-${DIA}.tar.gz $PASTAS_ORIGEM

echo "Realizando Backup Lista de Programas";
DISTRO="$(source /etc/os-release ; echo $ID)"
if [ "$DISTRO" = "centos" ]; then
rpm -qa > ${PASTA_DESTINO}/programas_instalados-${DIA}.txt 2> /dev/null || exit 2
else
apt list --installed > ${PASTA_DESTINO}/programas_instalados-${DIA}.txt 2> /dev/null || exit 2
fi
