FROM ubuntu:18.04
MAINTAINER MascoSkray <MascoSkray@gmail.com>
ARG CLONE_ADDFLAG

WORKDIR /opt
#Update apt source
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#Clone the latest UOJ Community verison to local
# RUN git clone https://github.com/UniversalOJ/UOJ-System.git --depth 1 --single-branch ${CLONE_ADDFLAG} uoj

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y vim ntp zip unzip curl wget build-essential fp-compiler python python3 python3-requests openjdk-8-jdk openjdk-11-jdk

#Add project file into docker
ADD . uoj

#Install environment and set startup script
RUN cd uoj/install/judger && sh install.sh -p && echo "\
#!/bin/sh\n\
if [ ! -f \"/opt/uoj/judger/.conf.json\" ]; then\n\
  cd /opt/uoj/install/judger && sh install.sh -i\n\
fi\n\
service ntp start\n\
su judger -c \"/opt/uoj/judger/judge_client start\"\n\
exec sleep infinity\n" >/opt/up && chmod +x /opt/up

ENV LANG=C.UTF-8 TZ=Asia/Shanghai
EXPOSE 2333
CMD /opt/up
