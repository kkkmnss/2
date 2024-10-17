#!/bin/bash

# 更新软件包列表
pkg update -y

# 安装Python、Git、Clang和其它必需的依赖
pkg install python clang openssl toolchain-rust git -y

# 安装Python SSL依赖
pkg install openssl-tool -y

# 配置环境变量
export PATH="$PREFIX/bin:$PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"

# 创建并激活Python虚拟环境
python3 -m venv venv
source venv/bin/activate

# 更新pip并尝试安装需要的Python包
pip install --upgrade pip
pip install requests urllib3 charset_normalizer maturin

# 克隆GitHub项目
git clone https://github.com/kkkmnss/1.git
cd 1

# 安装项目依赖
pip install -r requirements.txt

# 输出环境设置完成的信息，保持虚拟环境开启
echo "环境设置完成，现在你可以开始你的项目工作了。"
