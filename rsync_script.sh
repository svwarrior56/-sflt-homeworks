#!/bin/bash

SOURCE_DIR="/home/vasilevs/" #источник резервирования
BACKUP_DIR="/tmp/backup/" #назначение резервирования
LOG_FILE="/home/vasilevs/rsync_bcp.log" #файл лога операция, куда будет вестись запись

#команда резервирования
rsync -av --delete $SOURCE_DIR $BACKUP_DIR > /dev/null 2>&1

#Проверка статуса выполнения с сохранением результата в лог
if [ $? -eq 0 ]; then
	echo "$(date) - Успех резервирования $SOURCE_DIR" >> $LOG_FILE
else
	echo "$(date) - Ошибка резервирования $SOURCE_DIR" >> $LOG_FILE
fi
