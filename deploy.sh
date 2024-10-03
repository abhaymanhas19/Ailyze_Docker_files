#!/bin/bash
docker compose \
    -f docker-compose.yml \
    -f ./compose-files/backend-oneclickinsight/docker-compose.oneclickinsight.dev.yml \
    -f ./compose-files/others/docker-compose.celery.yml \
    -f ./compose-files/others/docker-compose.redis.yml \
    -f ./compose-files/others/docker-compose.rabbitmq.yml \
    -f ./compose-files/others/docker-compose.prometheus.yml \
    -f ./compose-files/others/docker-compose.grafana.yml \
    "$@";
