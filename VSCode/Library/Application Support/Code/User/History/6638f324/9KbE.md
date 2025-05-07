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
