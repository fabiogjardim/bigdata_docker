#!/bin/bash

# Executa script de configuracao
cat scripts/config.sh | docker exec -i namenode bash

while true; do
  # Executa job de carga
  cat scripts/job-data.sh | docker exec -i namenode bash

  # Executa job de backup
  cat scripts/job-backup.sh | docker exec -i namenode bash

  # Realiza limpeza de cargas antigas
  cat scripts/delete-old-data.sh | docker exec -i namenode bash

  # Realiza limpeza de cargas antigas
  cat scripts/delete-old-backup.sh | docker exec -i namenode bash

  sleep 10
done