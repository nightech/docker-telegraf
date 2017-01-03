#!/usr/bin/env bash

set -e

declare -A ENV_MODULES=()
ENV_MODULES[INPUT_DOCKER_ENDPOINT]="input-docker"
ENV_MODULES[INPUT_ELASTICSEARCH_SERVERS]="input-elasticsearch"
ENV_MODULES[INPUT_INFLUXDB_SERVERS]="input-influxdb"
ENV_MODULES[INPUT_MYSQL_SERVERS]="input-mysql"
ENV_MODULES[INPUT_NET_INTERFACES]="input-net"
ENV_MODULES[INPUT_NGINX_SERVERS]="input-nginx"
ENV_MODULES[INPUT_OS]="input-os"
ENV_MODULES[INPUT_PHPFPM_SERVERS]="input-phpfpm"
ENV_MODULES[INPUT_RABBITMQ_SERVER]="input-rabbitmq"
ENV_MODULES[INPUT_REDIS_SERVERS]="input-redis"
ENV_MODULES[INPUT_STATSD_ADDRESS]="input-statsd"
ENV_MODULES[OUTPUT_FILE_FILES]="output-file"
ENV_MODULES[OUTPUT_INFLUXDB_SERVERS]="output-influxdb"

for KEY in "${!ENV_MODULES[@]}"; do

    if [ -z  ${!KEY} ] ; then
        mv "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".conf" "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".disabled" 2> /dev/null || true
    else
        mv "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".disabled" "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".conf" 2> /dev/null || true
        echo "Module :" ${ENV_MODULES[$KEY]} "enabled"
    fi
done

exec /entrypoint.sh "$@"
