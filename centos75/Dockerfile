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

# locale & timezome (depends on "glibc-common")
# note: can't use timedatectl command in docker container.
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.utf8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.utf8"
