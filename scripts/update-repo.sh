#!/bin/bash

REPO_PATH="/srv/repo"
PACKAGE_DIR="./packages"

# Копируем новые пакеты
rsync -av --delete $PACKAGE_DIR/ $REPO_PATH/packages/

# Обновляем базу репозитория
cd $REPO_PATH
repo-add -R -s myrepo.db.tar.gz packages/*.pkg.tar.zst

# Чистим старые версии пакетов (оставляем только 3 последние)
paccache -r -c $REPO_PATH/packages -k 3
