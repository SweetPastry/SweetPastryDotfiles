export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git) # Nov 9, Lin disabled this line, deleted 'git'
source $ZSH/oh-my-zsh.sh

# Cling
## 注意, 自己编译的在 ~/Documents/GitHub/cling-build/
export SDKROOT="$(xcrun --show-sdk-path)"
export PATH="/Users/Lin/Documents/GitHub/cling-build/bin:$PATH"

# Mathematica/Wolfram Engine
export WOLFRAMSCRIPT_KERNELPATH="/Applications/Wolfram/Wolfram Engine.app/Contents/MacOS/WolframKernel"
export PATH="/Applications/Wolfram/Wolfram Engine.app/Contents/Resources/Wolfram Player.app/Contents/MacOS:$PATH"

# MATLAB
## export DYLD_LIBRARY_PATH="/Applications/MATLAB_R2024b.app/bin/maca64:$DYLD_LIBRARY_PATH"     # 这部分会干扰 Anaconda 的 Qt 库导致无法启动 Anaconda
export PATH="/Applications/MATLAB_R2025a.app/bin:$PATH"

# Alacrity
export PATH="$PATH:/Applications/Alacritty.app/Contents/MacOS"

. "$HOME/.local/bin/env"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/anaconda3/bin/mamba';
export MAMBA_ROOT_PREFIX='/opt/anaconda3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval $(thefuck --alias)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Homebrew
HOMEBREW_NO_ENV_HINTS=1 # 隐藏提示, 视觉优化
# homebrew 安装的 llvm, 不要使用
# echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc
# export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
