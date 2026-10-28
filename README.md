# Docker Container for Development

## 📁 ディレクトリ構成

### Dockerfile

```
[PACKAGE_NAME]/[TAG_NAME]/Dockerfile
```

### GitHub Actions

```
.github/workflows/[PACKAGE_NAME]-[TAG_NAME].yml
```

---

## 🐧 Linux OS Support

### Ubuntu 24.04

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ✅   |

#### Application Server
| PHP Version | Web Server | linux/amd64 | linux/arm64 |
|:------------|:-----------|:-----------:|:-----------:|
| PHP 8.4     | Apache 2.4 |     ✅      |     ✅      |
| PHP 8.3     | Apache 2.4 |     ✅      |     ✅      |

👉 **[Get Ubuntu 24.04 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-ubuntu2404)**

---

### CentOS 6.8

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ❌   |

#### Application Server
| PHP Version           | Web Server | linux/amd64 | linux/arm64 |
|:----------------------|:-----------|:-----------:|:-----------:|
| PHP 7.0               | Apache 2.2 |     ✅      |     ❌      |
| PHP 5.6               | Apache 2.2 |     ✅      |     ❌      |
| PHP 5.6 with memcache | Apache 2.2 |     ✅      |     ❌      |

👉 **[Get CentOS 6.8 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos68)**

---

### CentOS 7.5

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ❌   |

#### Application Server
| PHP Version | Web Server | linux/amd64 | linux/arm64 |
|:------------|:-----------|:-----------:|:-----------:|
| PHP 8.0     | Apache 2.4 |     ✅      |     ❌      |
| PHP 7.4     | Apache 2.4 |     ✅      |     ❌      |
| PHP 7.1     | Apache 2.4 |     ✅      |     ❌      |

👉 **[Get CentOS 7.5 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos75)**

---

### CentOS 7.9

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ✅   |

#### Application Server
| PHP Version | Web Server | linux/amd64 | linux/arm64 |
|:------------|:-----------|:-----------:|:-----------:|
| PHP 8.0     | Apache 2.4 |     ✅      |     ❌      |
| PHP 7.4     | Apache 2.4 |     ✅      |     ❌      |
| PHP 7.3     | Apache 2.4 |     ✅      |     ❌      |

👉 **[Get CentOS 7.9 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos79)**

---

### CentOS 8.3

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ✅   |

#### Application Server
| PHP Version | Web Server | linux/amd64 | linux/arm64 |
|:------------|:-----------|:-----------:|:-----------:|
| PHP 8.2     | Apache 2.4 |     ✅      |     ✅      |
| PHP 8.1     | Apache 2.4 |     ✅      |     ✅      |
| PHP 8.0     | Apache 2.4 |     ✅      |     ✅      |
| PHP 7.4     | Apache 2.4 |     ✅      |     ✅      |
| PHP 7.2     | Apache 2.4 |     ✅      |     ✅      |

👉 **[Get CentOS 8.3 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-centos83)**

---

### AlmaLinux 9

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ✅   |

👉 **[Get AlmaLinux 9 Images](https://github.com/orgs/buddying-inc/packages/container/package/almalinux)**

---

## ☁️ Amazon Linux Support

### Amazon Linux 2

#### Base Images
| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ✅   |

#### Application Server
| PHP Version | Web Server | linux/amd64 | linux/arm64 |
|:------------|:-----------|:-----------:|:-----------:|
| PHP 8.2     | Apache 2.4 |     ✅      |     ❌      |
| PHP 8.1     | Apache 2.4 |     ✅      |     ❌      |
| PHP 8.0     | Apache 2.4 |     ✅      |     ❌      |
| PHP 7.4     | Apache 2.4 |     ✅      |     ❌      |
| PHP 7.2     | Apache 2.4 |     ✅      |     ❌      |

> **Note:** Remi リポジトリの [CentOS 7](https://ftp.riken.jp/Linux/remi/enterprise/7/) 系に ARM 版ビルドはありません。

👉 **[Get Amazon Linux 2 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-amzn2)**

---

### Amazon Linux 2023

#### Base Images

| Architecture | Status |
|:-------------|:------:|
| linux/amd64  |   ✅   |
| linux/arm64  |   ✅   |

#### Application Server

| PHP Version | Web Server | linux/amd64 | linux/arm64 |
|:------------|:-----------|:-----------:|:-----------:|
| PHP 8.4     | Apache 2.4 |     ✅      |     ✅      |
| PHP 8.2     | Apache 2.4 |     ✅      |     ✅      |
| PHP 8.1     | Apache 2.4 |     ✅      |     ❌      |

> **Note:** PHP8.1 向け `amazon-elasticache-cluster-client.so` がないため、PHP8.1 は ARM 版を用意していません。

👉 **[Get Amazon Linux 2023 Images](https://github.com/orgs/buddying-inc/packages/container/package/webserver-al2023)**

---

### ElastiCache for Memcached

* PHP 8.1
  * [OpenSSL 1.1 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.1/latest-64bit-X86-openssl1.1)
  * [OpenSSL 3.0 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.1/latest-64bit-X86-openssl3)
* PHP 8.2
  * [OpenSSL 1.1 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.2/latest-64bit-X86-openssl1.1)
  * [OpenSSL 3.0 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.2/latest-64bit-X86-openssl3)
  * [OpenSSL 1.1 (ARM-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.2/latest-64bit-arm-X86-openssl1.1)
  * [OpenSSL 3.0 (ARM-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.2/latest-64bit-arm-X86-openssl3)
* PHP 8.3
  * [OpenSSL 3.0 (x86-64-bit Amazon Linux 2023)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.3/latest-64bit-x86-amzlinux-openssl3)
  * [OpenSSL 3.0 (ARM-64-bit Amazon Linux 2023)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.3/latest-64bit-arm-amzlinux-openssl3)
  * [OpenSSL 1.1 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.3/latest-64bit-X86-openssl1.1)
  * [OpenSSL 3.0 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.3/latest-64bit-X86-openssl3)
  * [OpenSSL 1.1 (ARM-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.3/latest-64bit-arm-openssl1.1)
  * [OpenSSL 3.0 (ARM-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.3/latest-64bit-arm-openssl3)
* PHP 8.4
  * [OpenSSL 3.0 (x86-64-bit Amazon Linux 2023)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.4/latest-64bit-x86-amzlinux-openssl3)
  * [OpenSSL 3.0 (ARM-64-bit Amazon Linux 2023)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.4/latest-64bit-arm-amzlinux-openssl3)
  * [OpenSSL 1.1 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.4/latest-64bit-X86-openssl1.1)
  * [OpenSSL 3.0 (x86-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.4/latest-64bit-X86-openssl3)
  * [OpenSSL 1.1 (ARM-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.4/latest-64bit-arm-openssl1.1)
  * [OpenSSL 3.0 (ARM-64-bit Linux)](https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.4/latest-64bit-arm-openssl3)

---

## 🗄️ Database Support

### MySQL

| Version | linux/amd64 | linux/arm64 |
|:--------|:----------:|:----------:|
| 8.0     |     ✅     |     ✅     |
| 5.7     |     ✅     |     ❌     |
| 5.6     |     ✅     |     ❌     |

👉 **[Get MySQL Images](https://github.com/orgs/buddying-inc/packages/container/package/mysql)**

---

## 📝 Legend

| Symbol | Meaning |
|:------:|:--------|
| ✅     | Available |
| ❌     | Not Available |
