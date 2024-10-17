#!/bin/bash

# 更新包列表和已安装的包
pkg update && pkg upgrade -y

# 安装编译工具和其他必要软件
pkg install -y clang python cmake make libffi libtool autoconf automake patchelf git wget curl

# 设置Python虚拟环境
pip install --upgrade pip
pip install virtualenv
virtualenv venv
source venv/bin/activate

# 安装Python库
pip install numpy requests

# 克隆你的GitHub项目
git clone https://github.com/kkkmnss/1.git
cd 1

# 根据你的项目需要执行的命令
# 如果有具体的构建或安装步骤，可以在这里指定，例如：
# ./configure
# make
# make install

echo "安装完成！虚拟环境已激活，可以开始工作。"
