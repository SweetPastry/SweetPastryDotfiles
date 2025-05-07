## IJava
第零步, 建议使用 JDK11.

第一步, 克隆项目一


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