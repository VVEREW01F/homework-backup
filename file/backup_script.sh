!/bin/bash

# Определите дату для создания уникальной папки в /tmp/backup
backup_date=$(date +%Y%m%d)

# Путь к исходной директории (домашняя директория пользователя)
source_dir="/home/artem"

# Путь к целевой директории (локальная директория резервных копий)
backup_dir="/tmp/backup/$backup_date"

# Создание целевой директории, если она не существует
mkdir -p "$backup_dir"

# Выполнение rsync для создания зеркальной копии
rsync -av --checksum --exclude '.*' "$source_dir/" "$backup_dir/"

# Проверка статуса rsync и запись в файл лога
if [ $? -eq 0 ]; then
  echo "Резервная копия успешно создана в $backup_dir" >> /tmp/backup_log.txt
else
  echo "Не удалось создать резервную копию в $backup_dir" >> /tmp/backup_log.txt
fi
