# Docker container for development

## Dockerfiles

### ディレクトリ構成

**Dockerfile**

`[PACKAGE_NAME]/[TAG_NAME]/Dockerfile`  

**GitHub Actions**

`.github/workflows/[PACKAGE_NAME]-[TAG_NAME].yml`

---

## CentOS 6.8

### Base

| linux/amd64 | linux/arm64 |
|-------------|-------------|
| 🐳          | 🙅🏻        |

### Application server


|                      | Web Server | linux/amd64 | linux/arm64 |
|----------------------|------------|-------------|-------------|
| PHP7.0               | Apache2.2  | 🐳          | 🙅🏻        |
| PHP5.6               | Apache2.2  | 🐳          | 🙅🏻        |
| PHP5.6 with memcache | Apache2.2  | 🐳          | 🙅🏻        |

[Get images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos68)

## CentOS 7.5

### Base

| linux/amd64 | linux/arm64  |
|-----|------|
| 🐳  | 🙅🏻 |

### Application Server

|        | Web Server | linux/amd64 | linux/arm64 |
|--------|------------|-------------|-------------|
| PHP8.0 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP7.4 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP7.1 | Apache 2.4 | 🐳          | 🙅🏻        |

[Get images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos75)

## CentOS 7.9

### Base

| linux/amd64 | linux/arm64 |
|-------------|-------------|
| 🐳          | 🐳          |

### Application server

|        | Web Server | linux/amd64 | linux/arm64 |
|--------|------------|-------------|-------------|
| PHP8.0 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP7.4 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP7.3 | Apache 2.4 | 🐳          | 🙅🏻        |

[Get images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos79)

## CentOS 8.3

### Base

| linux/amd64 | linux/arm64 |
|-------------|-------------|
| 🐳          | 🐳          |

### Application server

|        | Web Server | linux/amd64 | linux/arm64 |
|--------|------------|-------------|-------------|
| PHP8.2 | Apache 2.4 | 🐳          | 🐳          |
| PHP8.1 | Apache 2.4 | 🐳          | 🐳          |
| PHP8.0 | Apache 2.4 | 🐳          | 🐳          |
| PHP7.4 | Apache 2.4 | 🐳          | 🐳          |
| PHP7.2 | Apache 2.4 | 🐳          | 🐳          |

[Get images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos83)

## AmazonLinux 2

### Base

| linux/amd64 | linux/arm64 |
|-------------|-------------|
| 🐳          | 🐳          |

### Application server

|        | Web Server | linux/amd64 | linux/arm64 |
|--------|------------|-------------|-------------|
| PHP8.2 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP8.1 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP8.0 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP7.4 | Apache 2.4 | 🐳          | 🙅🏻        |
| PHP7.2 | Apache 2.4 | 🐳          | 🙅🏻        |

※ Remi リポジトリの [CentOS 7](https://ftp.riken.jp/Linux/remi/enterprise/7/) 系に ARM 版ビルドはない。

[Get images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-amzn2)

## AmazonLinux 2023

### Base

| linux/amd64 | linux/arm64 |
|-------------|-------------|
| 🐳          | 🐳          |

### Application server


|        | Web Server | linux/amd64 | linux/arm64 |
|--------|------------|-------------|-------------|
| PHP8.2 | Apache 2.4 | 🐳          | 🐳          |
| PHP8.1 | Apache 2.4 | 🐳          | 🙅🏻        |

※ PHP8.1 向け `amazon-elasticache-cluster-client.so` がないため、PHP8.1 は ARM 版を用意していません。

[Get images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-al2023)
