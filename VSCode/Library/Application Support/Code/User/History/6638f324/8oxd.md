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
https://github.com/evcxr/evcxr/tree/main/evcxr_jupyter