#!/bin/bash
# 
# 
# 

# 设置主机名
hostname $1
echo $1 > /etc/hostname
# 配置网关
sed -i '/^GATEWAY/d' /etc/sysconfig/network
echo "GATEWAY=192.168.80.1" >> /etc/sysconfig/network
# 配置DNS
sed -i '/^nameserver/d' /etc/resolv.conf
echo "nameserver 192.168.80.1" >> /etc/resolv.conf
/etc/init.d/network restart
# 配置yum源
cd /etc/yum.repos.d/;
curl http://mirrors.163.com/.help/CentOS7-Base-163.repo > CentOS7-Base-163.repo
# 安装常用包
yum install vim wget -y
