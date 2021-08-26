FROM centos:centos8.3.2011

# networking
RUN echo 'NETWORKING=yes' > /etc/sysconfig/network

# packages
RUN dnf update -y --exclude=kernel* --exclude=centos* \
    && dnf install -y epel-release \
    && dnf install -y \
           git \
           vim \
           glibc-locale-source \
           glibc-langpack-ja \
    && dnf clean all

# locale & timezome (depends on "glibc-langpack-ja")
# note: can't use timedatectl command in docker container.
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.utf8" \
    LC_ALL="ja_JP.utf8" \
    LANGUAGE="ja_JP:ja"
