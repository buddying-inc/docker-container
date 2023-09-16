FROM mysql:8.0-debian

# Set debian default locale to ja_JP.UTF-8
# ref. http://qiita.com/muff1225/items/48e0753e7b745ec3ecbd

RUN apt-get update \
    && apt-get install -y locales \
    && apt-get install language-pack-ja \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'ja_JP.UTF-8 UTF-8' > /etc/locale.gen \
    && locale-gen ja_JP.UTF-8

ENV LC_ALL="ja_JP.UTF-8" \
    LANG="ja_JP.UTF-8"

# Settings
COPY ${GITHUB_WORKSPACE}/mysql/80/setup/my.cnf /etc/mysql/conf.d/
