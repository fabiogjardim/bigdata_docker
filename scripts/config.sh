#!/bin/bash

# Cores

COLOR1='\033[1;32m'
NC='\033[0m' # No Color

echo -e "\n${COLOR1}::: CONFIG :::${NC}\n"

# Cria diretorio para carga de dataset dentro do HDFS

hadoop fs -mkdir -p /mba-datasets

# Cria diretorio para area de staging

mkdir -p /mba-datasets/staging

# Cria diretorio para area de backup

mkdir -p /mba-datasets/backup
