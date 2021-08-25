FROM mysql:8.0

# Set debian default locale to ja_JP.UTF-8
# ref. http://qiita.com/muff1225/items/48e0753e7b745ec3ecbd
ENV LC_ALL="ja_JP.UTF-8" \
    LANG="ja_JP.UTF-8"
RUN sed -i 's/\/\/archive.ubuntu.com/\/\/jp.archive.ubuntu.com/g' /etc/apt/sources.list \
    && sed -i 's/\/\/us.archive.ubuntu.com/\/\/jp.archive.ubuntu.com/g' /etc/apt/sources.list \
    && sed -i 's/\/\/fr.archive.ubuntu.com/\/\/jp.archive.ubuntu.com/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'ja_JP.UTF-8 UTF-8' > /etc/locale.gen \
    && locale-gen ja_JP.UTF-8

# Settings
COPY ${GITHUB_WORKSPACE}/mysql80/setup/my.cnf /etc/mysql/conf.d/
