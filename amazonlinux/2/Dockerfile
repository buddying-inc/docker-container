FROM amazonlinux:2

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
    && yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum clean all

# locale & timezome (depends on "glibc-langpack-ja")
# note: can't use timedatectl command in docker container.
# note: amazonlinux2 isn't need "RUN localedef -f UTF-8 -i ja_JP.utf8"
ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LC_ALL="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja"
