#!/bin/bash

Config()
{
if [ "${many_user}" = "y" ]; then
    #Config.py
    echo "==========================="
    echo "Please input your mysql IP address"
    echo "==========================="
    read ip
    
    echo "==========================="
    echo "Please input mysql port"
    echo "==========================="
    read port
    
    echo "==========================="
    echo "Please input your mysql username"
    echo "==========================="
    read user
    
    echo "==========================="
    echo "Please input your mysql password of user ${user}"
    echo "==========================="
    read pass
    
    echo "==========================="
    echo "Please input your database name"
    echo "==========================="
    read db

    #config.json
    echo "==========================="
    echo "Please input the encrypt method you want to use"
    echo "==========================="
    read encrypt
    
    echo "==========================="
    echo "Please input the protocol you want to use"
    echo "==========================="
    read protocol
    
    echo "==========================="
    echo "Please input the obfs confusion method you want to use"
    echo "==========================="
    read obfs
    
    echo "==========================="
    echo "Please input the obfs param you want to use"
    echo "==========================="
    read obfs_param

    rm -f ~/shadowsocks/Config.py
    rm -f ~/shadowsocks/config.json

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

    cat > ~/shadowsocks/config.json << EOF
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": 8388,
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "password": "m",
    "timeout": 120,
    "method": "$encrypt",
    "protocol": "$protocol",
    "obfs": "$obfs",
    "obfs_param": "$obfs_param",
    "dns_ipv6": true,
    "fast_open": true,
    "workers": 1
}
EOF
    echo "Config file is create in ~/shadowsocks/config.json"
    else
    #/etc/shadowsocks.json
    
    echo "==========================="
    echo "Please input the server port you want to use"
    echo "==========================="
    read server_port
    
    echo "==========================="
    echo "Please input the password you want to use"
    echo "==========================="
    read server_password
    
    echo "==========================="
    echo "Please input the encrypt method you want to use"
    echo "==========================="
    read encrypt
    
    echo "==========================="
    echo "Please input the protocol you want to use"
    echo "==========================="
    read protocol
    
    echo "==========================="
    echo "Please input the obfs confusion method you want to use"
    echo "==========================="
    read obfs
    
    echo "==========================="
    echo "Please input the obfs param you want to use"
    echo "==========================="
    read obfs_param
    
    echo "==========================="
    echo "Config file is create in /etc/shadowsocks.json"
    echo "==========================="
    
    cat > /etc/shadowsocks.json << EOF
    {
    "server":"0.0.0.0",
    "server_ipv6": "[::]",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
        "$server_port":"$server_password",
        "443":"password001x-2"
    },
    "timeout":120,
    "method":"$encrypt",
    "protocol": "$protocol",
    "protocol_param": "",
    "obfs": "$obfs",
    "obfs_param": "$obfs_param",
    "redirect": "",
    "dns_ipv6": true,
    "fast_open": false,
    "workers": 1
}
EOF
fi
}