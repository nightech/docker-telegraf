#!/usr/bin/env bash

set -e

declare -A ENV_MODULES=()
ENV_MODULES[TG_INPUT_DOCKER_ENDPOINT]="input-docker"
ENV_MODULES[TG_INPUT_ELASTICSEARCH_SERVERS]="input-elasticsearch"
ENV_MODULES[TG_INPUT_INFLUXDB_SERVERS]="input-influxdb"
ENV_MODULES[TG_INPUT_INTERNAL]="input-internal"
ENV_MODULES[TG_INPUT_MYSQL_SERVERS]="input-mysql"
ENV_MODULES[TG_INPUT_NET_INTERFACES]="input-net"
ENV_MODULES[TG_INPUT_NGINX_SERVERS]="input-nginx"
ENV_MODULES[TG_INPUT_OS]="input-os"
ENV_MODULES[TG_INPUT_PHPFPM_SERVERS]="input-phpfpm"
ENV_MODULES[TG_INPUT_RABBITMQ_SERVER]="input-rabbitmq"
ENV_MODULES[TG_INPUT_REDIS_SERVERS]="input-redis"
ENV_MODULES[TG_INPUT_STATSD_ADDRESS]="input-statsd"
ENV_MODULES[TG_OUTPUT_FILE_FILES]="output-file"
ENV_MODULES[TG_OUTPUT_INFLUXDB_SERVERS]="output-influxdb"

for KEY in "${!ENV_MODULES[@]}"; do
    if [ -z  ${!KEY} ] ; then
        mv "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".conf" "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".disabled" 2> /dev/null || true
    else
        mv "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".disabled" "/etc/telegraf/conf.d/"${ENV_MODULES[$KEY]}".conf" 2> /dev/null || true
        echo "Module :" ${ENV_MODULES[$KEY]} "enabled"
    fi
done

for FILE in `find /etc/telegraf/ -type f -name *.conf`;  do
    while IFS='=' read -r -d '' KEY VALUE; do

        perl -i -s -0777 -pe 's/\Q$from\E/$to/' -- -from="%"$KEY"%" -to="$VALUE" $FILE
    done < <(env -0)
done

exec /entrypoint.sh "$@"
