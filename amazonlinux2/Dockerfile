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
    && yum clean all \
    && wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -ivh epel-release-latest-7.noarch.rpm

# locale & timezome (depends on "glibc-langpack-ja")
# note: can't use timedatectl command in docker container.
RUN localedef -f UTF-8 -i ja_JP.utf8
ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.utf8" \
    LC_ALL="ja_JP.utf8" \
    LANGUAGE="ja_JP:ja"
