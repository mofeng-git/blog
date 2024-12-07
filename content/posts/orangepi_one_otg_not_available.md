+++
title = '香橙派 one OTG 不可用'
date = 2024-11-18T07:02:08Z
draft = false
tags = [
    "开发板","香橙派","OTG"
]
categories = [
    "技术",
]
+++
最近入手了一块香橙派 one，一系列测试后发现官方的高 Linux 系统中无法使用 OTG，没找到 OTG 与 Docker 共存的办法，非常可惜。

![orange-pi-one-banner-img](/img/orange-pi-one-banner-img-1731912755718-2.png)



因为官方产品介绍上写明了开发板有一个 USB OTG 端口，测试前还是信心满满的。然而使用手册上 Linux 系统使用说明一节却没找到关于 OTG 的使用说明，这时候我产生了一些疑惑，心悬了起来。

![image-20241118145156089](/img/image-20241118145156089.png)

在自己安装不同系统测试后，悬着的心终于死了。

测试结果如下：

- 官方 5.4.65 内核和 Armbian 社区 6.6.44 内核无法使用 OTG，无法控制 USB 端口模式

- 官方 3.4.113 内核可以使用 OTG，但无法安装 Docker

  ```bash
  #官方 3.4.113 内核使能 OTG
  echo 2 > /sys/bus/platform/devices/sunxi_usb_udc/otg_role
  ```

![image-20241118142509993](/img/image-20241118142509993.png)