+++
title = '使用 hugo 搭建博客'
date = 2024-10-22T11:48:30Z
draft = true
tags = [
  "blog",
]
categories = [
  "技术",
]
+++

```bash
#Ubuntu/Debain 安装 hugo
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