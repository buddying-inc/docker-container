FROM amazonlinux:2

# local
ENV LANG ja_JP.utf8
ENV LC_ALL ja_JP.utf8
RUN unlink /etc/localtime \
    && ln -s /usr/share/zoneinfo/Japan /etc/localtime

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
