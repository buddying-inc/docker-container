FROM centos:centos6.8

# networking
RUN echo 'NETWORKING=yes' > /etc/sysconfig/network

# packages
RUN sed -i -e "s/^mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo \
    && sed -i -e "s/^#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo \
    && yum update -y \
    && rpm -ivh https://archives.fedoraproject.org/pub/archive/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && yum install -y \
           vixie-cron \
           git \
           vim \
           zsh \
    && yum clean all

# locale & timezome
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV LANG="ja_JP.utf8" \
    LC_ALL="ja_JP.utf8" \
    LANGUAGE="ja_JP:ja"
