FROM amazonlinux:2023

# packages
RUN dnf update -y \
    && dnf install -y \
           gzip \
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
