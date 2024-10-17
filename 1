#!/bin/bash
# 确保脚本在遇到错误时停止执行
set -e

# 更新和安装必需的包
pkg update -y && pkg upgrade -y
pkg install python git clang cmake build-essential ninja -y

# 创建并激活Python虚拟环境
python -m venv venv
source venv/bin/activate

# 安装Python依赖
pip install --default-timeout=300 -i https://pypi.tuna.tsinghua.edu.cn/simple implib requests pysocks cfscrape scapy setuptools

# 克隆项目并安装项目依赖
git clone https://github.com/kkkmnss/1.git/
cd 1
CMAKE_GENERATOR="Unix Makefiles" pip install --default-timeout=300 -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
CMAKE_GENERATOR="Unix Makefiles" pip install --default-timeout=300 -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade requests urllib3 charset_normalizer

echo "安装完成！"
