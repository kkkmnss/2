#!/bin/sh

# 自动处理pkg的更新与安装
yes | pkg update
pkg install python python-pip git -y

# 创建虚拟环境并激活
python -m venv venv
. venv/bin/activate

# 克隆GitHub项目
git clone https://github.com/kkkmnss/1.git
cd 1

# 安装项目依赖
pip install -r requirements.txt

# 更新常用的包
pip install --upgrade requests urllib3 charset_normalizer

# 结束时不输出额外信息，留在虚拟环境中
