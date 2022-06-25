FROM centos:centos8.3.2011

# networking
RUN echo 'NETWORKING=yes' > /etc/sysconfig/network

# packages
RUN sed -i -e "s/^mirrorlist/#mirrorlist/g" /etc/yum.repos.d/CentOS-*.repo \
    && sed -i -e "s/^#baseurl=http:\/\/mirror/baseurl=http:\/\/vault/g" /etc/yum.repos.d/CentOS-*.repo \
    && dnf update -y --exclude=kernel* --exclude=centos* \
    && dnf install -y epel-release \
    && dnf install -y \
           git \
           vim \
           glibc-locale-source \
           glibc-langpack-ja \
    && dnf clean all

# locale & timezome (depends on "glibc-langpack-ja")
# note: can't use timedatectl command in docker container.
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LC_ALL="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja"
