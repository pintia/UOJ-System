FROM mysql:latest
MAINTAINER MascoSkray <MascoSkray@gmail.com>

#Update apt and install curl
# RUN apt-get update && apt-get install -y curl
#Run the latest UOJ Community verison db install script
# RUN export RAW_URL=https://raw.githubusercontent.com/UniversalOJ/UOJ-System/master && curl $RAW_URL/install/db/install.sh | sh

ADD install/db/install.sh /install.sh
ADD install/db/app_uoj233.sql /docker-entrypoint-initdb.d/001-app_uoj233.sql
ADD install/judger/add_judger.sql /docker-entrypoint-initdb.d/002-add_judger.sql

RUN sh /install.sh

ENV LANG=C.UTF-8 TZ=Asia/Shanghai
