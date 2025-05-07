
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
符合 IJava 项目

## 查看和切换 JDK
macOS 提供了一个内置命令可以列出所有系统可识别的 JDK：
```zsh
/usr/libexec/java_home -V
```
    Matching Java Virtual Machines (2):
    21.0.3 (arm64) "Eclipse Adoptium" - "OpenJDK 21.0.3" /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
    11.0.24 (arm64) "Amazon.com Inc." - "Amazon Corretto 11" /Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
    /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home