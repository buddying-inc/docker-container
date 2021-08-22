FROM amazonlinux:2

# local
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && timedatectl set-timezone Asia/Tokyo
ENV LANG ja_JP.utf8
ENV LC_ALL ja_JP.utf8

# packages
RUN yum update -y \
    && yum install -y \
       curl \
       git \
       gcc \
       gcc-c++ \
       glibc-langpack-ja \
       gzip \
       gunzip \
       tar \
       vim \
       wget \
       which \
       zip \
       unzip \
       yum-utils \
    && yum clean all \
    && wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -ivh epel-release-latest-7.noarch.rpm
