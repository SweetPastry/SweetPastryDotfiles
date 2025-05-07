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