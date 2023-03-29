FROM ubuntu:20.04
MAINTAINER MascoSkray <MascoSkray@gmail.com>
ARG CLONE_ADDFLAG

WORKDIR /opt
#Update apt and install git
# RUN apt-get update && apt-get install -y git
#Update apt source
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#Clone the latest UOJ Community verison to local
# RUN git clone https://github.com/UniversalOJ/UOJ-System.git --depth 1 --single-branch ${CLONE_ADDFLAG} uoj

ENV DEBIAN_FRONTEND noninteractive
RUN sh -c "echo \"deb [trusted=yes] http://ppa.launchpad.net/stesie/libv8/ubuntu bionic main\" | tee /etc/apt/sources.list.d/stesie-libv8.list" && \
    apt-get update && \
    apt-get install -y git vim ntp zip unzip curl wget apache2 libapache2-mod-xsendfile libapache2-mod-php php php-dev php-pear php-zip php-mysql php-mbstring g++ cmake re2c libv8-7.5-dev libyaml-dev && \
    sh -c "printf \"/opt/libv8-7.5\n\n\" | pecl install v8js yaml"

ADD . uoj

#Install environment and set startup script
RUN cd uoj/install/web && sh install.sh -p -i && echo "\
#!/bin/sh\n\
if [ ! -f \"/var/uoj_data/.UOJSetupDone\" ]; then\n\
  cd /opt/uoj/install/web && sh install.sh -i\n\
fi\n\
service ntp start\n\
service apache2 start\n\
exec sleep infinity\n" >/opt/up && chmod +x /opt/up

ENV LANG=C.UTF-8 TZ=Asia/Shanghai
EXPOSE 80 3690
CMD /opt/up
