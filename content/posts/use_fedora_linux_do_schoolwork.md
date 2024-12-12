+++
title = 'Linux 下进行 SQL Server 课程实验'
date = 2024-12-12T12:24:53Z
draft = false
tags = [
    "Linux","Ferora"
]
categories = [
    "日常",
]
+++

### 前言

作者最近安装了 Fedora 41 系统，体验一番后发现现在的 Linux 桌面生态比此前好了非常多，比如微信也有官方的 Linux 版本可用了。

于是想尝试将日常需求（比如计算机课程作业）迁移到 Fedora 41 试试看看能不能满足。这篇文章是将《数据库原理及应用》的 SQL Server 实验迁移到 Linux 平台上的实际体验。

### 安装 SQL Server

这里使用 Docker 容器方式一键部署，非常顺利。

微软官方教程：https://learn.microsoft.com/zh-cn/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&tabs=cli&pivots=cs1-bash

```bash
#新建 SQL Server dcoker 实例
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<YourStrong@Passw0rd>" \
   -p 1433:1433 --name sql1 --hostname sql1 \
   -d \
   mcr.microsoft.com/mssql/server:2022-latest
```

### 连接 SQL Server

可以使用 `navicat17-premium-lite` 免费软件连接数据库。这个软件为 Linux 发行版提供了 AppImage  可执行文件，界面比较美观，也能够在 Linux 上流畅稳定地运行。

首先新新建 SQL Server 连接，使用本地地址 127.0.0.1，用户名为 sa，密码为 <YourStrong@Passw0rd>，然后就可以连接刚才部署的 SQL Server 数据库实例了。

新建 SQL 查询，返回服务器上所有数据库的名称：

```sql
SELECT Name from sys.databases;
```

![image-20241126214519167](/img/image-20241126214519167.png)

### 导入课程实验数据库

通常课程实验教师都会提供提前准备好的数据文件进行操作，因此需要手动附加数据库文件，这里是 Linux 附加使用数据的命令。

```bash
#将课程需要的数据库文件传入容器内部
sudo docker exec -it --user root sql1  mkdir /data
sudo docker cp student_info.mdf  sql1:/data
sudo docker cp student_info_log.ldf  sql1:/data
sudo docker exec -it --user root sql1  chmod -R 777  /data
```

```sql
-- 手动附加数据库
EXEC sp_attach_db @dbname = 'student_info',
@filename1 = '/data/student_info.mdf',
@filename2 = '/data/student_info_log.ldf'

-- 使用数据库
USE student_info

-- 查询数据库内所有表名
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'

-- 查询指定数据表内容
USE student_info
```

![image-20241126220437464](/img/image-20241126220437464.png)
![image-20241126220437464](/img/image-20241126233947205.png)



### 实验报告

课程实验当然需要撰写实验报告了，这里使用 PlayOnLinux 安装的 Microsoft Office 2016 进行编辑也没有什么问题。

![image-20241126222641133](/img/image-20241126222641133.png)