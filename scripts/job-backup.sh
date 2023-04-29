#!/bin/bash

# vars
COLOR1='\033[1;32m'
COLOR2='\033[1;36m'
NC='\033[0m' # No Color

echo -e "\n${COLOR1}::: JOB - BACKUP - INICIANDO :::${NC}\n"

# copia ultima carga do HDFS para area de backup
file_path=$(hadoop fs -ls /mba-datasets | grep "^d" | tail -n1 | awk '{print $8}')
hadoop fs -get $file_path /mba-datasets/backup

# lista ultimos arquivos carregados no backup
echo -e "Backups:"
ls -h /mba-datasets/backup
