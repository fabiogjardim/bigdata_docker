#!/bin/bash

# vars
COLOR1='\033[1;32m'
COLOR2='\033[1;36m'
NC='\033[0m' # No Color
hostname=http://www4.bcb.gov.br/Download/fechamento/
dat_carga_origem=$(TZ=America/Sao_Paulo date -d "1 day ago" +'%Y%m%d')
dat_partition=$(TZ=America/Sao_Paulo date -d "1 day ago" +'%Y%m%d-%H%M%S')

echo -e "\n${COLOR1}::: JOB - CARGA - INICIANDO :::${NC}\n"

# define nome do arquivo a ser baixado
filename="${hostname}${dat_carga_origem}.csv"

# baixa arquivo para area de staging
echo -e "Origem: ${COLOR2}${filename}${NC}"
echo -e "Destino: ${COLOR2}/mba-datasets/$dat_partition/dataset.csv${NC}\n"

curl -L -o /mba-datasets/staging/dataset.csv $filename

# cria diretorio para a carga do dia atual no HDFS
hadoop fs -mkdir -p /mba-datasets/$dat_partition

# copia dataset da area de staging para HDFS
hadoop fs -put /mba-datasets/staging/dataset.csv /mba-datasets/$dat_partition

# limpa area de staging
rm /mba-datasets/staging/dataset.csv

# lista ultimas 10 cargas no HDFS
echo -e "\nUltimas 10 cargas:"
hadoop fs -ls -h -R /mba-datasets | grep -e "^-" | tail -n10

