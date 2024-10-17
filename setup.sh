#!/bin/bash

# 使用 bash 运行此脚本
if [ -z "$BASH_VERSION" ]
then
    echo "请使用 bash 运行此脚本" >&2
    exit 1
fi

# 更新软件包列表
pkg update -y

# 安装必要的软件
pkg install python clang openssl git -y

# 安装 OpenSSL 工具
pkg install openssl-tool -y

# 检查 Python 是否安装成功
which python3 >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Python 未正确安装。" >&2
    exit 1
fi

# 创建并激活虚拟环境
python3 -m venv venv
source venv/bin/activate

# 检查虚拟环境是否激活
if [ "$VIRTUAL_ENV" == "" ]; then
    echo "虚拟环境未激活。" >&2
    exit 1
fi

# 更新pip并安装依赖
pip install --upgrade pip
pip install requests urllib3 charset_normalizer maturin

# 克隆GitHub项目并安装项目依赖
git clone https://github.com/kkkmnss/1.git
cd 1
pip install -r requirements.txt

echo "环境设置完成，现在你可以开始你的项目工作了。"
