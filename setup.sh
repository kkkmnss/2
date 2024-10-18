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

# 克隆 GitHub 项目
echo "正在克隆 GitHub 项目..."
git clone https://github.com/kkkmnss/wh.git
cd wh

# 从您的二进制文件列表安装依赖
echo "正在安装二进制依赖文件..."
pip install *.whl

echo "环境设置完成，现在你可以开始你的项目工作了。"
