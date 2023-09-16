FROM mysql:5.7

# Set debian default locale to ja_JP.UTF-8
# ref. https://qiita.com/noradogg/items/e0e09db2e548dff3b664

RUN yum update -y \
    && yum install -y glibc-langpack-ja \
    && localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8

ENV LC_ALL="ja_JP.UTF-8" \
    LANG="ja_JP.UTF-8"

# Settings
COPY ${GITHUB_WORKSPACE}/mysql/57/setup/my.cnf /etc/mysql/conf.d/
