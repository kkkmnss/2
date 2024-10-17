#!/bin/bash

# 更新软件包列表
pkg update -y

# 安装必需的软件包
pkg install python git rust clang -y

# 配置环境变量（根据实际情况调整）
export PATH=$PATH:$PREFIX/bin

# 更新pip并尝试安装需要的Python包
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade requests urllib3 charset_normalizer

# 尝试安装maturin
python3 -m pip install maturin

# 克隆GitHub项目
git clone https://github.com/kkkmnss/1.git
cd 1

# 安装项目依赖
python3 -m pip install -r requirements.txt

# 保持虚拟环境开启，不退出
echo "环境设置完成，现在你可以开始你的项目工作了。"
