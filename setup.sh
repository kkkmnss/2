#!/bin/bash

# 使用 bash 运行此脚本
if [ -z "$BASH_VERSION" ]; then
    echo "请使用 bash 运行此脚本" >&2
    exit 1
fi

# 更新软件包列表
echo "正在更新软件包列表..."
pkg update -y

# 安装必要的软件和 Rust 编译器
echo "正在安装 Python、Clang、OpenSSL、Git 和 Rust..."
pkg install python clang openssl git rust -y

# 安装 OpenSSL 工具
pkg install openssl-tool -y

# 检查 Python 是否安装成功
if ! command -v python3 >/dev/null 2>&1; then
    echo "Python 未正确安装。" >&2
    exit 1
fi

# 创建并激活 Python 虚拟环境
echo "正在创建并激活 Python 虚拟环境..."
python3 -m venv venv
source venv/bin/activate

# 检查虚拟环境是否激活
if [ "$VIRTUAL_ENV" == "" ]; then
    echo "虚拟环境未激活。" >&2
    exit 1
fi

# 更新 pip 并安装依赖
echo "正在更新 pip 并安装依赖包..."
pip install --upgrade pip
pip install requests urllib3 charset_normalizer maturin

# 克隆 GitHub 项目并安装项目依赖
echo "正在克隆 GitHub 项目..."
git clone https://github.com/kkkmnss/1.git
cd 1

# 安装项目依赖
echo "正在安装项目依赖..."
pip install -r requirements.txt

echo "环境设置完成，现在你可以开始你的项目工作了。"
