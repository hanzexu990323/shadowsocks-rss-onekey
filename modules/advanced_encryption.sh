#!/bin/bash

Advanced_Encryption_ArchLinux()
{
    pacman -Syu --noconfirm
    pacman -S libsodium
    ldconfig
}

Advanced_Encryption_CentOS()
{
    yum -y groupinstall 'Development Tools'
    cd ~/
    wget -c https://github.com/jedisct1/libsodium/releases/download/1.0.8/libsodium-1.0.8.tar.gz
    tar xf libsodium-1.0.8.tar.gz && cd libsodium-1.0.8
    ./configure && make -j2 && make install
    ldconfig
}

Advanced_Encryption_Debian()
{
    apt-get install build-essential -y
    cd ~/
    wget -c https://github.com/jedisct1/libsodium/releases/download/1.0.8/libsodium-1.0.8.tar.gz
    tar xf libsodium-1.0.8.tar.gz && cd libsodium-1.0.8
    ./configure && make -j2 && make install
    ldconfig
}

Advanced_Encryption_Gentoo()
{
    emerge --sync
    emerge dev-libs/libsodium
    env-update
    ldconfig
}

Advanced_Encryption_Ubuntu()
{
    apt-get install build-essential -y
    cd ~/
    wget -c https://github.com/jedisct1/libsodium/releases/download/1.0.8/libsodium-1.0.8.tar.gz
    tar xf libsodium-1.0.8.tar.gz && cd libsodium-1.0.8
    ./configure && make -j2 && make install
    ldconfig
}
