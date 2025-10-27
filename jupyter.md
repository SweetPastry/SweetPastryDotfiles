## IJava
第零步, 建议使用 JDK11.

第一步, 克隆项目并安装内核
```zsh
git clone https://github.com/SpencerPark/IJava.git
cd IJava
./gradlew installKernel
```


## MATLAB Engine API for Python
第一步, MATLAB Engine API for Python
```zsh
cd /usr/local/MATLAB/extern/engines/python
python setup.py install
```

第二步, 激活 MATLAB 引擎, 在 MATLAB 中运行
```MATLAB
matlab.engine.shareEngine
```

第三步, 安装 jupyter 内核
```zsh
pip install matlab_kernel
python -m matlab_kernel install
```

## evcxr_jupyter
验证 Rust 和 Cargo
```zsh
rustc --version
cargo --version
```
安装 Rust 和 Cargo
```zsh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
[https://github.com/evcxr/evcxr/tree/main/evcxr_jupyter](https://github.com/evcxr/evcxr/tree/main/evcxr_jupyter)

evcxr REPL 是 Rust 的 Read-Eval-Print-Loop（交互式解释器），类似于 Python 的 ipython 或 Julia 的 julia. 安装
```zsh
cargo install evcxr_repl
```
```zsh
evcxr
# 启动了 evcxr
let x = 42;
x * 2
    84
```

## mathematica

`WolframLanguageForJupyter` 包

Wolfram Research 提供了这个包, 使用以下命令下载

```bash
git clone https://github.com/WolframResearch/WolframLanguageForJupyter.git
```

安装完成后, 运行 Wolfram 提供给我们的安装脚本

```bash
cd WolframLanguageForJupyter
./configure-jupyter.wls add
```

这里说明一下, `configure-jupyter.wls` 是 Wolfram 语言的脚本文件, 用于配置 jupyter notebook 与 Wolfram Language 之间的连接, `add` 命令表示向 jupyter 添加一个内核.


在 Mathematica 中, 手动加载包的完整路径

```wolfram
Needs["WolframLanguageForJupyter`", </your/path/to/WolframLanguageForJupyter/WolframLanguageForJupyter.m>]
```
例如
```wolfram
Needs["WolframLanguageForJupyter`", \
"/Users/Lin/Documents/GitHub/WolframLanguageForJupyter/\
WolframLanguageForJupyter/WolframLanguageForJupyter.m"]
```

`WolframLanguageForJupyter.m` 文件在刚下载的仓库里. 不出意外的话完成以上后可以在 jupyter 中找到可以用的内核.

如果还是不行就在 Mathematica 里面再运行一下

```wolfram
Needs["WolframLanguageForJupyter`"]
InstallWolframLanguageForJupyter[]
```
