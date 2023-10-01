FROM mysql:5.6

RUN echo "deb http://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'ja_JP.UTF-8 UTF-8' > /etc/locale.gen \
    && locale-gen ja_JP.UTF-8

ENV LC_ALL="ja_JP.UTF-8" \
    LANG="ja_JP.UTF-8"

# settings
COPY ${GITHUB_WORKSPACE}/mysql/56/setup/my.cnf /etc/mysql/conf.d/
