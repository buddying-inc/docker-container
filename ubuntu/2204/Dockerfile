FROM ubuntu:22.04-slim

# パッケージリストの更新と必要パッケージのインストール
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        locales \
        tzdata \
    && locale-gen ja_JP.UTF-8 \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 日本語環境の設定
ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LC_ALL="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja"
