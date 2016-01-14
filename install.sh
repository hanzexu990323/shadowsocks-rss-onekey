#!/bin/bash

echo "One key script by AmedaGintoki@mikelei.me and ZhangYu@zhangyubaka@oao.moe"
echo "Thanks to breakwa11 and clowwindy"

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

    echo "==========================="
    echo "???????????(????? y ) y/n"
    echo "==========================="
    read many_user

. modules/advanced_encryption.sh
. modules/config.sh
. modules/init.sh
. modules/optimize.sh

if grep -Eqi "Arch Linux" /etc/issue; then
    ins="Archlinux"
elif grep -Eqi "CentOS" /etc/*-release; then
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
    pip install m2crypto
}

CentOS_Install()
{
    yum -y update
    yum -y install epel-release python-pip m2crypto git
}

Debian_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip -y
    apt-get install m2crypto git -y
}

Gentoo_Install()
{
    emerge --sync
    emerge dev-vcs/git dev-python/pip
    pip install m2crypto
}

Ubuntu_Install()
{
    apt-get update && apt-get upgrade -y
    apt-get install python-pip -y
    apt-get install m2crypto git -y
}

case "${ins}" in
    CentOS)
        CentOS_Install
        ;;
    Ubuntu)
        Ubuntu_Install
        ;;
    Archlinux)
        Archlinux_Install
        ;;
    Debian)
        Debian_Install
        ;;
    Gentoo)
        Gentoo_Install
        ;;
esac

pip install cymysql
git clone -b manyuser https://github.com/breakwa11/shadowsocks.git ~/shadowsocks

Optimize
Init_Choice
Config
