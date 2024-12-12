+++
title = 'Fedora 安装远程控制软件'
date = 2024-12-12T12:30:40Z
draft = false
tags = [
    "Linux","Ferora"
]
categories = [
    "日常",
]
+++

虽然又很多开源远程控制软件（如 RustDesk），但是在服务业你无法强迫其他用户和你使用同样的软件，最终还是用户用什么你用什么。所以这篇文章记录一下在 Ferora 41 系统上向日葵远程控制和 ToDesk 的安装方法。安装

**ToDesk**

官网可以直接下载到 Linux 版本的安装包。

```
sudo yum install libappindicator-gtk3
sudo yum install ./todesk-v4.7.2.0-x86_64.rpm
```

![image-20241128162806739](/img/image-20241128162806739.png)

**向日葵远程控制**

官网只能下载到 Centos 版本的安装包，并不兼容 Fedora，需要一些额外的操作才可以正常使用。

**强制安装**

首先到官网下载到Centos 版本的安装包，然后强制安装 rpm 安装包。

```
rpm -ivh --force --no-deps 
```

**修改脚本**

需要手动为 /usr/local/sunlogin/rpminstall.sh 文件和 /usr/local/sunlogin/scripts/start.sh 文件中共三处对 os_name 的判断加上 fedora，即 `if [ $os_name == 'centos' ] || [ "$(echo $os_name |grep redhat)" != "" ]` 替换为 `if [ $os_name == 'centos' ] || [ "$os_name" == "fedora" ] || [ "$(echo $os_name |grep redhat)" != "" ]`。

```
sudo nano /usr/local/sunlogin/rpminstall.sh
sudo nano /usr/local/sunlogin/scripts/start.shshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshshsh
sudo nano /usr/local/sunlogin/scripts/common.sh
```

然后编辑 /usr/local/sunlogin/scripts/common.sh 文件添加对 Fedora 的适配代码。

```
elif [ $os_name == 'fedora' ]; then
        os_version=`cat /etc/fedora-release | cut -d ' ' -f3`
```

![image-20241128164412203](/img/image-20241128164412203.png)

**运行启动**

首先执行之前强制安装未执行成功的安装脚本，执行完成之后就可以在桌面看到向日葵应用的图标了，也能正常启动使用。

```
cd /usr/local/sunlogin
sudo bash ./rpminstall.sh
```

![image-20241128165511344](/img/image-20241128165511344.png)