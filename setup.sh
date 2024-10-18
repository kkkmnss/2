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
echo "正在安装 Python、Clang、OpenSSL、Git、Rust 和 OpenSSL 开发库..."
pkg install python clang openssl git rust openssl-tool openssl-dev -y

# 克隆 MHDDOS 项目
echo "正在从 GitHub 克隆 MHDDOS 项目..."
git clone https://github.com/kkkmnss/1.git
cd 1

# 返回到主目录
cd ..

# 克隆包含 .whl 文件的 GitHub 仓库
echo "正在从 GitHub 克隆 wh 仓库..."
git clone https://github.com/kkkmnss/wh.git
cd wh

# 安装所有 .whl 文件
echo "正在安装 .whl 文件..."
for wheel in *.whl; do
    pip install "$wheel"
done

echo "环境设置完成，现在你可以开始你的项目工作了。"
