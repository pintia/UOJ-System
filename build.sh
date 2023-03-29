#!/bin/bash

docker build -t uoj-system:db --file install/db/Dockerfile .
docker build -t uoj-system:web --file install/web/Dockerfile .
docker build -t uoj-system:judger --file install/judger/Dockerfile .
