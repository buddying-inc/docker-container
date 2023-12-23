# Docker container for development

## Dockerfiles

### ディレクトリ構成

**Dockerfile**

`[PACKAGE_NAME]/[TAG_NAME]/Dockerfile`  

**GitHub Actions**

`.github/workflows/[PACKAGE_NAME]-[TAG_NAME].yml`

---

## CentOS 6.8

### [Web server](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos68)

Apache 2.2

|                      | AMD | ARM   |
|----------------------|-----|-------|
| PHP5.6               | 🐳  | 🙅🏻  |
| PHP5.6 with memcache | 🐳  | 🙅🏻  |
| PHP7.0               | 🐳  | 🙅🏻  |

## CentOS 7.5

### [Web server](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos75)

Apache 2.4

|        | AMD | ARM   |
|--------|-----|-------|
| PHP7.1 | 🐳  | 🙅🏻  |
| PHP7.4 | 🐳  | 🙅🏻  |
| PHP8.0 | 🐳  | 🙅🏻  |

## CentOS 7.9

### [Web server](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos79)

Apache 2.4

|        | AMD | ARM   |
|--------|-----|-------|
| PHP7.3 | 🐳  | 🙅🏻  |
| PHP7.4 | 🐳  | 🙅🏻  |
| PHP8.0 | 🐳  | 🙅🏻  |

## CentOS 8.3

### [Web server](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos83)

Apache 2.4

|        | AMD | ARM   |
|--------|-----|-------|
| PHP7.4 | 🐳  | 🙅🏻  |
| PHP8.0 | 🐳  | 🙅🏻  |
| PHP8.1 | 🐳  | 🙅🏻  |
| PHP8.2 | 🐳  | 🙅🏻  |

## AmazonLinux 2

### [Web server](https://github.com/orgs/buddying-inc/packages/container/package/webserver-amzn2)

Apache 2.4

|        | AMD | ARM   |
|--------|-----|-------|
| PHP7.2 | 🐳  | 🙅🏻  |
| PHP7.4 | 🐳  | 🙅🏻  |
| PHP8.0 | 🐳  | 🙅🏻  |
| PHP8.1 | 🐳  | 🙅🏻  |
| PHP8.2 | 🐳  | 🙅🏻  |

## AmazonLinux 2023

### [Web server](https://github.com/orgs/buddying-inc/packages/container/package/webserver-al2023)

Apache 2.4

|        | AMD | ARM   |
|--------|-----|-------|
| PHP8.1 | 🐳  | 🙅🏻  |
| PHP8.2 | 🐳  | 🐳    |

※ PHP8.1 向け `amazon-elasticache-cluster-client.so` がないため、PHP8.1 は ARM 版を用意していません。
