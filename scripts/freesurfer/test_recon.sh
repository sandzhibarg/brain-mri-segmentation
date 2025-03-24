#!/bin/bash

# Установка переменных окружения FreeSurfer
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=4
export OMP_NUM_THREADS=4
export FS_OPENMP_THREADS=4

# Создание директории для результатов
export SUBJECTS_DIR="/mnt/mydisk/freesurfer"
mkdir -p "$SUBJECTS_DIR"

# Путь к T1w изображению
T1W_FILE="/mnt/mydisk/data/raw/SRPBS/SRPBS_TS/sourcedata/sub-01/ses-siteATV/anat/sub-01_ses-siteATV_T1w.nii.gz"

# Имя субъекта для FreeSurfer
SUBJECT_NAME="sub-01_ses-siteATV"

echo "Начинаем обработку файла: $T1W_FILE"
echo "Результаты будут сохранены в: $SUBJECTS_DIR/$SUBJECT_NAME"

# Запуск recon-all
recon-all -i "$T1W_FILE" -s "$SUBJECT_NAME" -all 