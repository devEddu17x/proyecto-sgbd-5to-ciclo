#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin

echo "[$(date)] Iniciando backup..." >> /home/eddu/upao/sgbd/from_workspace/sgbd/backups/debug.log

# Configuración
DATE=$(date +%F_%H-%M-%S)
BACKUP_DIR=/home/eddu/upao/sgbd/from_workspace/sgbd/backups
CONTAINER=mysql-sgbd
USER=root
PASSWORD=dev
DATABASE=sgbd
FILE=$BACKUP_DIR/backup-$DATABASE-$DATE.sql

mkdir -p $BACKUP_DIR

docker exec $CONTAINER sh -c "mysqldump -u$USER -p$PASSWORD $DATABASE" > $FILE

if [ $? -eq 0 ]; then
  echo "[$(date)] Backup completado: $FILE" >> /home/eddu/upao/sgbd/from_workspace/sgbd/backups/debug.log
else
  echo "[$(date)] Error al realizar backup" >> /home/eddu/upao/sgbd/from_workspace/sgbd/backups/debug.log
fi
