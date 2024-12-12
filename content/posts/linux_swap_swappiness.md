+++
title = 'Linux Swap swappiness 参数使用'
date = 2024-12-12T12:37:01Z
draft = false
tags = [
    "Linux","Swap"
]
categories = [
    "技术",
]
+++
### 前言

事情起因是我计划让一个优先级较低 Docker 容器应用使用部分 Swap 内存减小对系统的压力，重新创建容器时添加了 `-m 200M --memory-swap 500M` 参数，结果容器应用服务无法完全启动，`fre -m` 查看发现 Swap 内存空间占用也没有明显增加，查询资料才知道使用 Swap 内存不是创建挂载 Swap 分区就足够了的。

### 正文

新建挂载完 Swap 分区之后还需要设置 swappiness 参数才能更好的发挥作用。

> swappiness 的值的大小对如何使用swap分区是有着很大的联系的。先前，人们建议把 vm.swapiness 设置为0，它意味着“除非发生内存益处，否则不要进行内存交换”。直到Linux内核 3.5-rcl 版本发布，这个值的意义才发生了变化。这个变化被一直到其他的发行版本上，包括 RedHat 企业版内核 2.6.32-303。在发生变化之后，0意味着“在任何情况下都不要发生交换”。所以现在建议把这个值设置为1。swappiness＝100 的时候表示积极的使用 swap 分区，并且把内存上的数据及时的搬运到 swap 空间里面。

```bash
#查看 swappiness 参数
cat /proc/sys/vm/swappiness

#临时修改
sysctl vm.swappiness=60

#永久修改
echo "vm.swappiness=60" >> /etc/sysctl.conf
```

查看系统 swappiness 参数值，返回值为0，修改此参数后 Swap 内存占用明显增加，容器应用服务也完全启动了。

**参考文章：**

https://www.cnblogs.com/yinzhengjie/p/9994207.html