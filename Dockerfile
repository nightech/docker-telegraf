FROM telegraf

COPY ./overlay/ /

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["telegraf", "--config", "/etc/telegraf/telegraf.conf", "--config-directory", "/etc/telegraf/conf.d/"]
