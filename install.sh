#!/bin/bash

. include/optimize.sh
. include/advanced_encryption.sh

echo "One key script by AmedaGintoki@mikelei.me and zhangyubaka@oao.moe"
echo "Thanks to breakwa11 and clowwindy"

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

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
    yum -y install epel-release python-pip m2crypto git
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
    echo "Please input your mysql user and press [Enter]"
    read user
    echo "Please input your mysql password and press [Enter]"
    read pass
    echo "Please input your mysql ip and press [Enter]"
    read ip
    echo "Please input mysql port and press [Enter]"
    read port
    echo "Please input the db name and press [Enter]"
    read db
    rm -rf ~/shadowsocks/Config.py
    cat > ~/shadowsocks/Config.py << EOF
#Config
MYSQL_HOST = '$ip'
MYSQL_PORT = $port
MYSQL_USER = '$user'
MYSQL_PASS = '$pass'
MYSQL_DB = '$db'

MANAGE_PASS = 'ss233333333'
#if you want manage in other server you should set this value to global ip
MANAGE_BIND_IP = '127.0.0.1'
#make sure this port is idle
MANAGE_PORT = 23333
EOF
    echo "Config file is create in ~/shadowsocks/Config.py"
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
