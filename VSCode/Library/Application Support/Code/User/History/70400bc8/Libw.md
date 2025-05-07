
## 安装 sdkman

curl -s "https://get.sdkman.io" | bash
source ~/.zshrc

~/.zshrc 的末尾被写入
```vim
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```