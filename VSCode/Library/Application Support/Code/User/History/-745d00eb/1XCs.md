🛠 rustc 是底层的 Rust 编译器

它是 Rust 的核心编译器，直接将 .rs 文件编译成二进制文件（.exe, .out, 等）。

✅ 用途：
	•	单独编译一个 .rs 文件（无依赖项目结构）
	•	直接学习语法或调试很小的程序

🚧 缺点：
	•	无法自动处理依赖（如 serde, rand）
	•	无法自动构建模块项目（没有自动编译 mod.rs、lib.rs 等）
	•	不会创建项目结构或管理构建配置

✅ 示例：

rustc hello.rs
./hello



⸻

📦 cargo 是 Rust 的包管理与构建工具

cargo 是官方推荐的项目管理工具，它 调用 rustc 来完成编译工作，但还包括：

✅ 优势：
	•	创建项目（cargo new, cargo init）
	•	管理依赖（通过 Cargo.toml）
	•	自动构建完整项目，包括子模块
	•	自动优化、调试构建（cargo build, cargo run, cargo test）
	•	构建多文件大型项目
	•	构建库（lib.rs）或二进制（main.rs）

✅ 示例：

cargo new my_project
cd my_project
cargo run

这会自动：
	•	下载依赖
	•	编译全部源码
	•	链接输出
	•	运行程序

⸻

✅ 总结比较：

功能	rustc	cargo
编译功能	✅ 支持	✅ 调用 rustc 编译
依赖管理	❌ 不支持	✅ 支持 crates.io，自动处理 Cargo.toml
项目结构管理	❌	✅ 自动创建目录、模块、测试目录
构建优化	❌	✅ 支持 release / debug 模式
常见用途	单文件测试、小工具	实际项目开发的标准工具



⸻

如果你在写一个正式项目，强烈建议使用 cargo。而 rustc 更适合用来：
	•	写 hello world
	•	学习新语法
	•	临时测试表达式


这个错误提示表明：

evcxr 在通过 Homebrew 安装的 shell（特别是在 Rosetta2 仿真模式下） 运行时，会因为系统资源或兼容性问题被 操作系统强行终止（Signal 9, SIGKILL）。

⸻

🔍 原因解析
	•	evcxr_jupyter 是一个为 Jupyter 提供 Rust 内核的程序（基于 evcxr_repl）。
	•	Signal 9 (SIGKILL) 是操作系统直接“杀掉”进程，通常原因是：
	•	运行环境不兼容（如 Homebrew under Rosetta2）
	•	系统资源限制（内存不够、Sandbox 限制等）
	•	非原生架构运行

⸻

✅ 推荐解决方法（官方建议）

不要使用 Homebrew 安装 rust 和 evcxr_jupyter。改用 rustup：

1. 完全卸载 Homebrew 安装的 Rust

brew uninstall rust

2. 安装 rustup（Rust 官方推荐工具链管理器）

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

你可以加一行到 ~/.zshrc 保证每次 shell 启动都生效：

export PATH="$HOME/.cargo/bin:$PATH"

3. 安装 evcxr_jupyter

cargo install evcxr_jupyter

然后注册内核：

evcxr_jupyter --install



⸻

🎯 验证是否安装成功

jupyter kernelspec list

你应该能看到：

evcxr_rust    /Users/you/Library/Jupyter/kernels/evcxr_rust

然后在 Jupyter Notebook 里选择 Rust 内核即可。

⸻