public class Effective_Culculate {
    public static void main(String[] args) {
        int a = 1, b = 2;
        // 利用位异算符实现高效交换两数的值
        a = a ^ b;
        b = a ^ b;
        a = a ^ b;
        System.out.println(a);
        System.out.println(b);
    }
}