# Telegraf Docker Image

Dockerfile for telegraf. 

Module are enabled depending on environment variables

## Modules
* Outputs 
  * InfluxDb
  * File
* Inputs
  * Docker
  * ElasticSearch
  * InfluxDb
  * Mysql
  * Nginx
  * Os (mem, cpu, process, kernel, ...)
  * PhpFpm
  * RabbitMQ
  * Redis
  * StatsD

## Agent Environment Variables
* `TG_AGENT_HOSTNAME` 
* `TG_AGENT_INTERVAL`

## Input Environment Variables
* `TG_INPUT_DOCKER_ENDPOINT`
* `TG_INPUT_ELASTICSEARCH_SERVERS`
* `TG_INPUT_INFLUXDB_SERVERS`
* `TG_INPUT_INTERNAL`
* `TG_INPUT_MYSQL_SERVERS`
* `TG_INPUT_MYSQL_USER_STATISTICS`
* `TG_INPUT_NET_INTERFACES`
* `TG_INPUT_NGINX_SERVERS`
* `TG_INPUT_OS`
* `TG_INPUT_PHPFPM_SERVERS`
* `TG_INPUT_RABBITMQ_SERVER`
* `TG_INPUT_RABBITMQ_USER`
* `TG_INPUT_RABBITMQ_PASSWORD`
* `TG_INPUT_REDIS_SERVERS`
* `TG_INPUT_STATSD_ADDRESS`

## Output Environment Variables

### File
* `TG_OUTPUT_FILE_FILES`

### InfluxDb 
* `TG_OUTPUT_INFLUXDB_SERVERS`
* `TG_OUTPUT_INFLUXDB_DATABASE`
* `TG_OUTPUT_INFLUXDB_USERNAME`
* `TG_OUTPUT_INFLUXDB_PASSWORD`

