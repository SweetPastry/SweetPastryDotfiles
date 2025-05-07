
## 安装 sdkman
```zsh
curl -s "https://get.sdkman.io" | bash
source ~/.zshrc
```
~/.zshrc 的末尾被写入
```vim
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## 安装 JDK (Java Development Kit) 11
```zsh
sdk install java 11.0.20-tem
sdk use java 11.0.20-tem
```