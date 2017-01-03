# PHP Docker Image

Dockerfile for telegraf. 

Module are enabled depeding on environment variables

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

## Input Environment Variables
* `INPUT_DOCKER_ENDPOINT`
* `INPUT_ELASTICSEARCH_SERVERS`
* `INPUT_INFLUXDB_SERVERS`
* `INPUT_MYSQL_SERVERS`
* `INPUT_NET_INTERFACES`
* `INPUT_NGINX_SERVERS`
* `INPUT_OS`
* `INPUT_PHPFPM_SERVERS`
* `INPUT_RABBITMQ_SERVER`
* `INPUT_RABBITMQ_USER`
* `INPUT_RABBITMQ_PASSWORD`
* `INPUT_REDIS_SERVERS`
* `INPUT_STATSD_ADDRESS`

## Output Environment Variables
* `OUTPUT_FILE_FILES`
* `OUTPUT_INFLUXDB_SERVERS`
