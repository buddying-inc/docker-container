FROM centos:7.5.1804

# networking & language & local
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
#ENV LC_ALL ja_JP.UTF-8
RUN echo 'NETWORKING=yes' > /etc/sysconfig/network \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && unlink /etc/localtime \
    && ln -s /usr/share/zoneinfo/Japan /etc/localtime \
    && echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# packages
RUN yum -y update \
    && yum install -y epel-release \
    && yum reinstall -y glibc-common \
    && yum install -y \
           git \
           vim \
    && yum clean all
