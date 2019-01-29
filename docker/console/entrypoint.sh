#!/usr/bin/env bash
set -e

if [ -z "${UID}" ]; then
    echo "Необходимо задать значение переменной окружения UID"
    exit 1
fi

if [ -z "${GID}" ]; then
    echo "Необходимо задать значение переменной окружения GID"
    exit 1
fi


#TODO: проверка на необходимость смены GID и UID

groupmod -g ${GID} hostuser
usermod -u ${UID} hostuser  > /dev/null 2>&1

exec runuser -u hostuser -- "$@"