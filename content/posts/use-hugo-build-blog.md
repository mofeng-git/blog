+++
title = '使用 hugo 搭建博客'
date = 2024-10-22T11:48:30Z
draft = false
tags = [
  "blog",
]
categories = [
  "技术",
]
+++

### 新建本地站点

Hugo是由Go编写的快速现代静态网站生成器，旨在让网站创建变得有趣。

官方有详细的安装教程 [https://gohugo.io/getting-started/quick-start](https://gohugo.io/getting-started/quick-start)，这里就不赘述了。

```bash
#Ubuntu/Debain 安装 hugo
#如果仓库版本过旧可以到 Github 下载最新版本的 deb 包
sudo apt install  hugo

#检查 hugo 版本
hugo version

#创建一个新站点
hugo new site myblog

#进入站点目录
cd myblog

#创建一个新文章
hugo new posts/my-first-post.md

#启动 hugo 服务器，渲染草稿需要添加 --buildDrafts 参数
hugo server

#生成静态页面
hugo

```

### 部署到云服务器

由于 Github Pages 在大陆访问速度较慢，所以这里选择部署到云服务器上。
这里使用 Github 中转代码，在云服务器上使用 Nginx 新建静态站点，并安装 Webhook 监听 Github 代码变动，自动更新渲染站点。

这里需要在云服务上提前安装好 webhook 和 hugo，然后新建一个静态站点（这里我使用 1panel 面板操作）。

```bash
sudo apt install webhook hugo
```

webhook 配置文件实例：
```json
[
    {
        "id": "deploy-blog",
        "execute-command": "/root/deploy-blog.sh",
        "response-message": "Executing deploy script",
        "trigger-rule": {
            "and": [{
                "match": {
                    "type": "payload-hash-sha1",
                    "secret": "xxxxxxxxx",
                    "parameter": {
                        "source": "header",
                        "name": "X-Hub-Signature"
                    }
                }
            }, {
                "match": {
                    "type": "value",
                    "value": "refs/heads/main",
                    "parameter": {
                        "source": "payload",
                        "name": "ref"
                    }
                }
            }]
        }
    }
]
```
/root/deploy-blog.sh bash 脚本随便写一下就行了。
```bash
#!/bin/bash

WEBPATH=/your/blog/path
cd $WEBPATH
git pull
hugo
```

再设置允许 webhook 开机自启，最后到 Github Webhooks 添加就完成了。当本地推送文章到 Github，Github Webhooks 会自动触发 webhook，然后云服务器 webhook 就会自动更新渲染站点。
```bash
sudo systemctl enable webhook
sudo systemctl start webhook
```
![alt text](/img/image2024102202.png)