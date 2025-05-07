C++ 是一种功能强大的编程语言，不断地引入新特性以提高语言的表达能力、安全性和性能。以下是一些在 C++11、C++14、C++17 和 C++20 中引入的重要新特性：

### C++11 新特性

1. **自动类型推导 (`auto`)**
   ```cpp
   auto x = 5;  // 自动推导类型为 int
   ```

2. **范围 for 循环**
   ```cpp
   std::vector<int> vec = {1, 2, 3, 4};
   for (auto& v : vec) {
       std::cout << v << std::endl;
   }
   ```

3. **智能指针 (`std::unique_ptr`, `std::shared_ptr`)**
   ```cpp
   std::unique_ptr<int> p1(new int(10));
   std::shared_ptr<int> p2 = std::make_shared<int>(20);
   ```

4. **lambda 表达式**
   ```cpp
   auto add = [](int a, int b) { return a + b; };
   std::cout << add(2, 3) << std::endl;
   ```

5. **右值引用和移动语义**
   ```cpp
   std::vector<int> vec1 = {1, 2, 3};
   std::vector<int> vec2 = std::move(vec1);
   ```

6. **线程支持库**
   ```cpp
   std::thread t([]{ std::cout << "Hello from thread!" << std::endl; });
   t.join();
   ```

### C++14 新特性

1. **通用 lambda 表达式**
   ```cpp
   auto add = [](auto a, auto b) { return a + b; };
   std::cout << add(2, 3) << std::endl;
   std::cout << add(2.5, 3.5) << std::endl;
   ```

2. **二进制字面量**
   ```cpp
   int binary = 0b1010;  // 等同于十进制的 10
   ```

3. **返回类型推导**
   ```cpp
   auto add(int a, int b) {
       return a + b;
   }
   ```

4. **`constexpr` 的改进**
   ```cpp
   constexpr int factorial(int n) {
       return n <= 1 ? 1 : (n * factorial(n - 1));
   }
   ```

### C++17 新特性

1. **结构化绑定**
   ```cpp
   std::tuple<int, double, std::string> t(1, 2.3, "hello");
   auto [i, d, s] = t;
   ```

2. **`if` 和 `switch` 初始化语句**
   ```cpp
   if (int x = f(); x > 0) {
       std::cout << x << std::endl;
   }
   ```

3. **内联变量**
   ```cpp
   inline int x = 10;
   ```

4. **文件系统库**
   ```cpp
   #include <filesystem>
   namespace fs = std::filesystem;
   fs::create_directory("new_directory");
   ```

5. **`std::optional`**
   ```cpp
   std::optional<int> opt = 42;
   if (opt) {
       std::cout << *opt << std::endl;
   }
   ```

### C++20 新特性

1. **协程**
   ```cpp
   std::future<int> foo() {
       co_return 42;
   }
   ```

2. **范围库**
   ```cpp
   #include <ranges>
   auto vec = std::vector{1, 2, 3, 4, 5};
   auto even = vec | std::views::filter([](int i) { return i % 2 == 0; });
   ```

3. **概念**
   ```cpp
   template<typename T>
   concept Integral = std::is_integral_v<T>;

   template<Integral T>
   T add(T a, T b) {
       return a + b;
   }
   ```

4. **`std::span`**
   ```cpp
   void print_span(std::span<int> s) {
       for (int i : s) {
           std::cout << i << " ";
       }
   }
   int arr[] = {1, 2, 3, 4, 5};
   print_span(arr);
   ```

5. **三向比较（太空船操作符 `<=>`）**
   ```cpp
   auto result = 1 <=> 2;  // 结果为 std::strong_ordering::less
   ```

### 总结

C++ 标准不断引入新特性，以使编程更高效、安全和便捷。从 C++11 开始的现代 C++ 标准（C++11、C++14、C++17 和 C++20）带来了许多重要改进和增强，使得 C++ 成为一门更强大和灵活的编程语言。