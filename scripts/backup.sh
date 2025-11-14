#!/bin/bash

# Fecha actual para nombrar el backup
DATE=$(date +"%Y%m%d-%H%M")

# Crear carpeta local si no existe
backupDir="backups/backup-$DATE"
mkdir -p "$backupDir"

# Ejecutar mongodump dentro del contenedor mongo
docker exec parcial_mongo mongodump --uri="mongodb://admin:admin123@mongo:27017" --out="/data/db/backup-$DATE"

# Copiar el backup del contenedor a tu máquina local
docker cp "parcial_mongo:/data/db/backup-$DATE" "$backupDir"

echo "✔ Backup guardado en $backupDir"