FROM centos:6.8

# Networking & Timezone
RUN echo 'NETWORKING=yes' > /etc/sysconfig/network \
 && echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Yum
RUN sed -i -e "s/^mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo \
 && sed -i -e "s/^#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo

RUN yum update -y \
 && rpm -ivh https://archives.fedoraproject.org/pub/archive/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Cron
RUN yum install -y vixie-cron

# Tools
RUN yum install -y git vim zsh
