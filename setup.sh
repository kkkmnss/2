#!/bin/bash

# 使用 bash 运行此脚本
if [ -z "$BASH_VERSION" ]; then
    echo "请使用 bash 运行此脚本" >&2
    exit 1
fi

# 设置非交互模式
export DEBIAN_FRONTEND=noninteractive

# 更新软件包列表
echo "正在更新软件包列表..."
pkg update -y
pkg install openssl-tool

# 安装必要的软件和 Rust 编译器
echo "正在安装 Python、Clang、OpenSSL、Git 和 Rust..."
pkg install python clang openssl git rust binutils -y

# 检查 ar 工具是否安装
echo "检查 ar 工具是否已安装..."
which aarch64-linux-android-ar || echo "ar 工具未安装，请检查您的安装步骤！"

# 克隆包含 .whl 文件的 GitHub 仓库
echo "正在从 GitHub 克隆 wh 仓库..."
git clone https://github.com/kkkmnss/wh.git
cd wh

# 安装所有 .whl 文件
echo "正在安装 .whl 文件..."
for wheel in *.whl; do
    pip install "$wheel"
done

# 返回到上级目录
cd ..

# 克隆 MHDDOS 项目
echo "正在从 GitHub 克隆 MHDDOS 项目..."
git clone https://github.com/kkkmnss/1.git
cd 1

# 环境设置完成，可以开始项目工作
echo "环境设置完成，现在你可以开始你的项目工作了。"
