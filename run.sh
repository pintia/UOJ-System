#!/bin/bash

docker stop uoj-web
docker stop uoj-judger
docker stop uoj-db
docker network rm uoj

docker network create uoj
docker run --name uoj-db -d --rm --network=uoj -e MYSQL_DATABASE=app_uoj233 -e MYSQL_ROOT_PASSWORD=root uoj-system:db
sleep 5
docker run --name uoj-judger -d --rm --cap-add SYS_PTRACE --network=uoj -e UOJ_PROTOCOL=http -e UOJ_HOST=uoj-web -e JUDGER_NAME=compose_judger -e JUDGER_PASSWORD=_judger_password_ -e SOCKET_PORT=2333 -e SOCKET_PASSWORD=_judger_socket_password_ uoj-system:judger
docker run --name uoj-web -d --rm --cap-add SYS_PTRACE --network=uoj -p 8080:80 uoj-system:web

