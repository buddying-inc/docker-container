FROM mysql:8.0

# Set debian default locale to ja_JP.UTF-8
# ref. https://qiita.com/noradogg/items/e0e09db2e548dff3b664

RUN microdnf update -y \
    && microdnf install -y glibc-locale-source \
    && localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8

ENV LC_ALL="ja_JP.UTF-8" \
    LANG="ja_JP.UTF-8"

# Settings
COPY ${GITHUB_WORKSPACE}/mysql/80/setup/my.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/my.conf
