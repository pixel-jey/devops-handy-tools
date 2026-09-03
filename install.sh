#!/bin/bash

# 1. 权限管理
chmod +x * opt/sh/*.sh

# 2. 目录同步
sudo cp -r opt/ /

# 3. 批量安装到 /usr/local/bin
sudo cp escp essh mem nmc port /usr/local/bin/

# 4. 批量安装到 /usr/bin
sudo cp cls dns lc replace-text wireshark-serv /usr/bin/

echo "Done."

