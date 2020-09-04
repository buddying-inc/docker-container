FROM amazonlinux:2

# Packages
RUN yum -y update && yum clean all
RUN yum install -y \
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
    yum-utils
RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum clean all

# Local
ENV LANG ja_JP.utf8
ENV LC_ALL ja_JP.utf8
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime
