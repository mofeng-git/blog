+++
title = 'Ferora 41 日常使用和常用软件安装'
date = 2024-12-12T12:08:35Z
draft = false
tags = [
    "Linux","Ferora"
]
categories = [
    "日常",
]
+++

心血来潮（~~闲来无事~~），为自己的电脑安装了 Ferora 41 系统并在日常学习和生活中使用。个人认为 Ferora 是一个非常精致和稳定的系统，这个使用过程几乎没出现什么问题和错误。

这里记录一下 Ferora 41 系统上的相关软件使用。

### 常用软件安装

**Gnome 扩展**

```
sudo yum install gnome-tweak-tool
sudo yum install gnome-extensions-app
sudo yum install gnome-shell-extension-dash-to-dock
```

这里推荐两个扩展，Dash to Dock （应用 Dock 栏）和 Tray Icons: Reloaded （应用托盘）。

如果不安装 Tray Icons: Reloaded 应用托盘扩展，QQ 等应用关闭后会一直在在后台运行，再次打开无法在打开此前界面而是打开新实例，只能 `killall qq` 强制关闭全部后台。

![image-20241124163719813](/img/image-20241124163719813.png)

**QQ 和微信：**

QQ 和微信官网都有提供 rpm 下载，直接安装即可。

```
sudo yum install ./QQ_3.2.13_241121_x86_64_01.rpm
sudo yum install ./WeChatLinux_x86_64.rpm
#修复微信依赖库找不到的报错
sudo ln -s /usr/lib64/libbz2.so.1 /usr/lib64/libbz2.so.1.0
```

![image-20241124170219161](/img/image-20241124170219161.png)

**Microsoft Office 2016**

通过 PlayOnLinux 安装，但是不能使用 PlayOnLinux 自带的安装策略（我没成功），得按照下面这个视频教程操作。

我参照的视频教程（感谢这位大佬的的分享）：[https://www.bilibili.com/video/BV1Ey4y1e7Zf/](https://www.bilibili.com/video/BV1Ey4y1e7Zf/)

![image-2024-11-24 15-20-15](/img/image-20241124152015.png)

**安装 Appimage 应用（以 QQ 音乐为例）**

闪退解决解决办法: 增加参数 `--no-sandbox` 打开

文字显示方块解决办法: 手动安装 `google-noto-sans-cjk-fonts` 和 `google-noto-serif-cjk-fonts`

在命令行运行成功之后，可以在 `/usr/share/applications` 目录添加桌面图标。

QQ 音乐

```
[Desktop Entry]
Name=qqmusic
Exec=/home/mofeng/app/qqmusic-1.1.7.AppImage --no-sandbox %U
Terminal=false
Type=Application
Icon=/home/mofeng/app/qqmusic.png
StartupWMClass=qqmusic
X-AppImage-Version=1.1.7
Comment=Tencent QQMusic
Categories=AudioVideo;
```

**Bilibili**



Bambu_Studio

```
#Bambu_Studio_linux_fedora-v01.10.00.89.AppImage 需要手动安装 webkit2gtk4.0-devel 依赖才能运行
sudo yum install webkit2gtk4.0-devel
```

```
[Desktop Entry]
Name=BambuStudio
Exec=/home/mofeng/app/Bambu_Studio_linux_fedora-v01.10.00.89.AppImage %F
Icon=/home/mofeng/app/BambuStudio.png
Type=Application
Categories=Utility;
MimeType=model/stl;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;application/x-amf;
```

![image-20241124170401962](/img/image-20241124170401962.png)

![image-20241124213144830](/img/image-20241124213144830.png)

**PlayOnLinux**

安装运行 EXE 应用的工具。

```
sudo yum install redhat-lsb redhat-lsb-core
sudo dnf install playonlinux mono
```

**开发工具**

Edge 浏览器、Vscode 编辑器、Xdm 多线程下载工具在其官网都有提供 rpm 包下载，直接安装即可。

```
#Edge 浏览器
sudo yum install ./microsoft-edge-stable-131.0.2903.63-1.x86_64.rpm
#Vscode 编辑器
sudo yum install ./code-1.95.3-1731513157.el8.x86_64.rpm
#Xdm 多线程下载工具
sudo yum install ./xdman_gtk-8.0.25-1.fc36.x86_64.rpm
#balenaEtcher 固件烧录工具
sudo yum install ./balena-etcher-1.19.25-1.x86_64.rpm
```

![image-20241124165556092](/img/image-20241124165556092.png)

**PuTTY**

```
sudo dnf install putty
```

![image-20241124214250562](/img/image-20241124214250562.png)

**Flameshot 截图工具**

Linux 下非常好用的截图工具，功能很全。

```
sudo dnf install flameshot
```

**Blender**

全平台 2D/3D 建模工具。

```
sudo dnf install blender
```

![image-20241124213433798](/img/image-20241124213433798.png)

**Typora**

非常好用的 MarkDown 文本编辑器，可以在官网下载 Linux 可执行文件压缩包，在新建个桌面图标。

```
[Desktop Entry]
Name=typora
Exec=/home/mofeng/app/Typora-linux-x64/bin/Typora-linux-x64/Typora
Comment=The Next Document processor based on Markdown
Icon=/home/mofeng/app/Typora-linux-x64/bin/Typora-linux-x64/resources/assets/icon/icon_512x512.png
Type=Application
Terminal=false
StartupNotify=true
Encoding=UTF-8
Categories=Development;GTK;GNOME;
```

![image-20241124213546956](/img/image-20241124213546956.png)



**GIMP**

Linux 下的开源图像编辑工具。

```
sudo dnf install gimp
```

![image-20241124213757845](/img/image-20241124213757845.png)
