#!/bin/bash

. include/optimize.sh

echo "One key script by AmedaGintoki@mikelei.me"
echo "Thanks to breakwa11 and clowwindy"

if grep -Eqi "Arch Linux" /etc/issue; then
    ins="Archlinux"
elif grep -Eqi "CentOS" /etc/issue; then
    ins="CentOS"
elif grep -Eqi "Ubuntu" /etc/issue; then
    ins="Ubuntu"
elif grep -Eqi "Debian" /etc/issue; then
    ins="Debian"
elif grep -Eqi "gentoo" /proc/version; then
    ins="Gentoo"
else
    echo "Your distribution is not supported, please use Ubuntu/Debian/CentOS/Gentoo/ArchLinux to install"
    exit 1
fi

Archlinux_Install()
{
    pacman -Syu --noconfirm
    pacman -S python-pip git --noconfirm
    pip install cymysql
    pip install m2crypto
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

Gentoo_Install()
{
    emerge --sync
    emerge dev-vcs/git dev-python/pip
    pip install cymysql
    pip install m2crypto
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

CentOS_Install()
{
    yum -y update
    yum -y install epel-release
    yum -y install python-pip
    yum -y install m2crypto git
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}


Ubuntu_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip -y
    apt-get install m2crypto git -y
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

Debian_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip -y
    apt-get install m2crypto git -y
    pip install cymysql
    cd ~/
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
}

Config()
{
    Optimize
    echo "Sorry, function does not finish"
    echo "For more infomation please go to https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup(manyuser)"
    exit 1
}

case "${ins}" in
    CentOS)
        CentOS_Install
        Config
        ;;
    Ubuntu)
        Ubuntu_Install
        Config
        ;;
    Archlinux)
        Archlinux_Install
        Config
        ;;
    Debian)
        Debian_Install
        Config
        ;;
    Gentoo)
        Gentoo_Install
        Config
        ;;
esac
