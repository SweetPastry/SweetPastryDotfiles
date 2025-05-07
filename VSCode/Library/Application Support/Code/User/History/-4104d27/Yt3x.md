# Software Development Kit Manager

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
查看当前 JDK:
```zsh
java -version
```
macOS 提供了一个内置命令可以列出所有系统可识别的 JDK：
```zsh
/usr/libexec/java_home -V
```
    Matching Java Virtual Machines (2):
    21.0.3 (arm64) "Eclipse Adoptium" - "OpenJDK 21.0.3" /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
    11.0.24 (arm64) "Amazon.com Inc." - "Amazon Corretto 11" /Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
    /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
终端中临时切换到 11:
```zsh
export JAVA_HOME=$(/usr/libexec/java_home -v11)
```

sdkman 永久切换:
```zsh
curl -s "https://get.sdkman.io" | bash  # 下载 sdk 安装脚本并用 bash 执行
source ~/.zshrc
```
安装多个版本:
```zsh
sdk install java 11.0.20-tem
sdk install java 17.0.8-tem
sdk install java 21.0.2-tem
```
切换:
```zsh
sdk use java 11.0.20-tem    # use 相当于当前终端使用某个 JDK
sdk use java 17.0.8-tem
```
全局切换:
```zsh
sdk default java 17.0.8-tem     # default 相当于更改 JDK 默认值
```
