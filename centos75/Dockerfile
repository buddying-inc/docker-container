FROM centos:7.5.1804

# networking
RUN echo 'NETWORKING=yes' > /etc/sysconfig/network

# packages
RUN yum -y update \
    && yum install -y epel-release \
    && yum reinstall -y glibc-common \
    && yum install -y \
           git \
           vim \
    && yum clean all

# locale & timezome (require glibc-common)
RUN localectl set-locale LANG=ja_JP.UTF-8 \
    && timedatectl set-timezone Asia/Tokyo
#ENV LANG ja_JP.UTF-8
#ENV LANGUAGE ja_JP:ja
#ENV LC_ALL ja_JP.UTF-8
