public class Hello_World {

// public class Hello_World {: 这行代码定义了一个公共类 Hello_World。在 Java 中，类名和文件名需保持一致，
// 每个 Java 程序都从一个类开始，这里类名为 Hello_World。

    public static void main(String[] args) {

// public static void main(String[] args) {: 这是 Java 程序的入口点，也就是程序的起始位置。
// 在这行中，public 表示这个方法可以被其他类访问，static 表示这个方法属于类本身而不是实例，void 表示这个方法不返回任何值，main 是方法的名称，
// 而 String[] args 是接受命令行参数的字符串数组。

        System.out.println("Hello World");

// System.out.println("Hello World");: 这行代码使用 System.out.println 方法来输出文本到控制台。
// println 是 print line 的缩写，它会输出括号内的内容，并在末尾添加换行符。在这里，它输出了字符串 "Hello World"。

    }
}